import { useBackend } from '../backend';
import {
  Box,
  Button,
  LabeledList,
  ProgressBar,
  NoticeBox,
  Section,
  Flex,
} from '../components';
import { Window } from '../layouts';

type MalfPickerData = {
  proccesing_time: number;
  module: Module[];
};

type Module = {
  name: string;
  uid: string;
  desc: string;
  cost: number;
  can_afford: boolean;
};

type ModuleProps = {
  modules: Module[];
};

export const MalfPickerMenu = (_props: unknown) => {
  const { data } = useBackend<MalfPickerData>();
  const { proccesing_time, module = [] } = data;
  return (
    <Window width={400} height={500} theme="malfunction">
      <Window.Content verticalAlign>
        <NoticeBox>
          <ProgressBar
            value={proccesing_time}
            minValue={proccesing_time - proccesing_time}
            maxValue={proccesing_time + 10}
          >
            Current level of proccesing time: {proccesing_time}
          </ProgressBar>
        </NoticeBox>
        <Flex scrollable fill>
          <Modules modules={module} />
        </Flex>
      </Window.Content>
    </Window>
  );
};

const Modules = (props: ModuleProps) => {
  const { modules } = props;
  const { act, data } = useBackend<MalfPickerData>();
  const { proccesing_time } = data;
  return modules.map((module) => {
    return (
      <Section
        key={module.uid}
        title={module.name}
        buttons={
          <Button.Confirm
            icon={module.can_afford ? 'arrow-down' : 'times'}
            tooltip={module.can_afford ? null : 'You cant afford this module'}
            tooltipPosition="left"
            color={'red'}
            onClick={() =>
              act('install', {
                uid: module.uid,
              })
            }
            disabled={!module.can_afford}
          >
            install
          </Button.Confirm>
        }
      >
        <LabeledList.Item>
          <ProgressBar
            color={module.can_afford ? 'red' : 'gray'}
            value={proccesing_time}
            minValue={-module.cost}
            maxValue={module.cost}
          >
            Cost: {proccesing_time} / {module.cost} PT
          </ProgressBar>
        </LabeledList.Item>
        <LabeledList.Item>
          <Box bold>{module.desc}</Box>
        </LabeledList.Item>
      </Section>
    );
  });
};
