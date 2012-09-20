<?php
/**
 *
 * ThinkUp/tests/all_PgSQL_model_tests.php
 *
 * Copyright (c) 2009-2012 Gina Trapani
 *
 * LICENSE:
 *
 * This file is part of ThinkUp (http://thinkupapp.com).
 *
 * ThinkUp is free software: you can redistribute it and/or modify it under the terms of the GNU General Public
 * License as published by the Free Software Foundation, either version 2 of the License, or (at your option) any
 * later version.
 *
 * ThinkUp is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied
 * warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more
 * details.
 *
 * You should have received a copy of the GNU General Public License along with ThinkUp.  If not, see
 * <http://www.gnu.org/licenses/>.
 *
 *
 * @author Gina Trapani <ginatrapani[at]gmail[dot]com>
 * @author Christoffer Viken <christoffer[at]viken[dot]me>
 * @license http://www.gnu.org/licenses/gpl.html
 * @copyright 2009-2012 Gina Trapani
 */
include dirname(__FILE__) . '/init.tests.php';
require_once THINKUP_WEBAPP_PATH.'_lib/extlib/simpletest/autorun.php';
require_once THINKUP_WEBAPP_PATH.'_lib/extlib/simpletest/web_tester.php';
require_once THINKUP_WEBAPP_PATH.'_lib/extlib/simpletest/mock_objects.php';

/* MODEL TESTS */
$model_tests = new TestSuite('PgSQL Model tests');
$model_tests->add(new TestOfFollowPgSQLDAO());
$model_tests->add(new TestOfFollowerCountPgSQLDAO());
$model_tests->add(new TestOfGroupPgSQLDAO());
$model_tests->add(new TestOfGroupMemberPgSQLDAO());
$model_tests->add(new TestOfGroupMembershipCountPgSQLDAO());
$model_tests->add(new TestOfInsightBaselinePgSQLDAO());
$model_tests->add(new TestOfInsightPgSQLDAO());
$model_tests->add(new TestOfInstancePgSQLDAO());
$model_tests->add(new TestOfInsightPgSQLDAO());
$model_tests->add(new TestOfInstallerPgSQLDAO());
$model_tests->add(new TestOfInvitePgSQLDAO());
$model_tests->add(new TestOfLinkPgSQLDAO());
$model_tests->add(new TestOfLocationPgSQLDAO());
$model_tests->add(new TestOfOptionPgSQLDAO());
$model_tests->add(new TestOfOwnerPgSQLDAO());
$model_tests->add(new TestOfOwnerInstancePgSQLDAO());
$model_tests->add(new TestOfPluginPgSQLDAO());
$model_tests->add(new TestOfPluginOptionPgSQLDAO());
$model_tests->add(new TestOfPostPgSQLDAO());
$model_tests->add(new TestOfExportPgSQLDAO());
$model_tests->add(new TestOfPostErrorPgSQLDAO());
$model_tests->add(new TestOfUserPgSQLDAO());
$model_tests->add(new TestOfUserErrorPgSQLDAO());
$model_tests->add(new TestOfMutexPgSQLDAO());
$model_tests->add(new TestOfBackupPgSQLDAO());
$model_tests->add(new TestOfFavoritePostPgSQLDAO());
$model_tests->add(new TestOfStreamDataPgSQLDAO());
$model_tests->add(new TestOfStreamProcPgSQLDAO());
$model_tests->add(new TestOfHashtagPgSQLDAO());
$model_tests->add(new TestOfMentionPgSQLDAO());
$model_tests->add(new TestOfPlacePgSQLDAO());
$model_tests->add(new TestOfTableStatsPgSQLDAO());
$model_tests->add(new TestOfShortLinkPgSQLDAO());

$tr = new TextReporter();
list($usec, $sec) = explode(" ", microtime());
$start =  ((float)$usec + (float)$sec);
$model_tests->run( $tr );

if (getenv("TEST_TIMING")=="1") {
    list($usec, $sec) = explode(" ", microtime());
    $finish =  ((float)$usec + (float)$sec);
    $runtime = round($finish - $start);
    printf("Tests completed run in $runtime seconds\n");
}
if (isset($RUNNING_ALL_TESTS) && $RUNNING_ALL_TESTS) {
    $TOTAL_PASSES = $TOTAL_PASSES + $tr->getPassCount();
    $TOTAL_FAILURES = $TOTAL_FAILURES + $tr->getFailCount();
}
