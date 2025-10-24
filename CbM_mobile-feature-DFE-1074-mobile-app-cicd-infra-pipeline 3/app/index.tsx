import { Text, View } from 'react-native';
import { SafeAreaView } from 'react-native-safe-area-context';
import { useTranslation } from 'react-i18next';
import { Button } from '@/components/ui/Button';
import { useTheme } from '@/contexts/ThemeContext';

export default function Home() {
  const { t } = useTranslation();
  const { toggleTheme, isDark } = useTheme();
  return (
    <View className="flex flex-1 bg-primary-light dark:bg-primary-dark">
      <SafeAreaView>
        <Text className="p-3 text-center text-xl font-bold text-foreground">
          {t('welcomeToApp')}
        </Text>
        <Button
          title={isDark ? 'Switch to Light Mode' : 'Switch to Dark Mode'}
          onPress={toggleTheme}
        />
      </SafeAreaView>
    </View>
  );
}
