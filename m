Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5616DD2E9C8
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Nov 2024 09:11:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xDcYOOJCPEEoUP9pdEgPJpLdxlzApWQAHlB1+VNmky4=; b=g2WbKHzgs9Bxhu
	tMu2FRdL/9+Q3NqDqmv12/BDYn1gUMFJmgKnaYb5Ec3ReuTEDHGLXai2b6/t9PT2PpiTTc6Ic7SxQ
	inKDym+nbZBGtPx0J2KcTypLsl+VotntYOwfUU7y2HW9ApDso+Qq9Upe2TjFSr8LlBO9Rmeh3Z6dc
	WTW8RN0wsUvf5qlZSswSAf5z9CHoQIzBx7J2kZ1lO4VQMiZD6w1qRpC/Q7wPQfdS2OsS98nhIMVh4
	tgBysmLjJ7NgU9NJtg1rtTar7VpbED+U/Mz5fkgYqmn+z4gwJMonQ8GbO3IYtSb3N7l+6bxtWS9v0
	8pxPx+QzBpRs4HIhBmdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAQSL-0000000H1jV-063c;
	Mon, 11 Nov 2024 09:11:33 +0000
Received: from szxga06-in.huawei.com ([45.249.212.32])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAQQl-0000000H0P3-3S86
	for linux-mtd@lists.infradead.org;
	Mon, 11 Nov 2024 09:10:05 +0000
Received: from mail.maildlp.com (unknown [172.19.163.17])
	by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4Xn3fP3Qq7z1ypSj;
	Mon, 11 Nov 2024 17:10:05 +0800 (CST)
Received: from kwepemk500005.china.huawei.com (unknown [7.202.194.90])
	by mail.maildlp.com (Postfix) with ESMTPS id 5A05B1A0188;
	Mon, 11 Nov 2024 17:09:54 +0800 (CST)
Received: from huawei.com (10.175.112.188) by kwepemk500005.china.huawei.com
 (7.202.194.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Mon, 11 Nov
 2024 17:09:53 +0800
From: Zhihao Cheng <chengzhihao1@huawei.com>
To: <richard@nod.at>, <david.oberhollenzer@sigma-star.at>,
	<yi.zhang@huawei.com>
CC: <linux-mtd@lists.infradead.org>
Subject: [PATCH mtd-utils v2 RESEND 093/102] tests: ubifs_tools: fsck_tests: Add powercut+fsck+mount test
Date: Mon, 11 Nov 2024 17:08:21 +0800
Message-ID: <20241111090832.2093596-24-chengzhihao1@huawei.com>
X-Mailer: git-send-email 2.46.1
In-Reply-To: <20241111083711.1916125-1-chengzhihao1@huawei.com>
References: <20241111083711.1916125-1-chengzhihao1@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.112.188]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemk500005.china.huawei.com (7.202.194.90)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241111_010956_341872_D82CC537 
X-CRM114-Status: GOOD (  17.72  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Inject powercut while doing fsstress on mounted UBIFS for kinds of
flashes (eg. nand, nor).
This testcase mainly makes sure that fsck.ubifs can make UBIFS image
be consistent on different flashes (eg. nand, nor). Because the
min_io_size of nor flash is 1, the UBIFS image on nor flash will be
different from nand flash after doing powercut, so we need make sure
fsck.ubifs can handle these two types of flash.

Signed-off-by: Zhihao Cheng <chengzhihao1@huawei.com>
---
 .gitignore                                         |   1 +
 configure.ac                                       |   3 +-
 tests/ubifs_tools-tests/Makemodule.am              |   3 +-
 .../fsck_tests/powercut_fsck_mount.sh.in           | 148 +++++++++++++++++++++
 4 files changed, 153 insertions(+), 2 deletions(-)
 create mode 100755 tests/ubifs_tools-tests/fsck_tests/powercut_fsck_mount.sh.in

diff --git a/.gitignore b/.gitignore
index 7de38e86..b63b9868 100644
--- a/.gitignore
+++ b/.gitignore
@@ -116,6 +116,7 @@ tests/ubi-tests/ubi-stress-test.sh
 tests/ubifs_tools-tests/lib/common.sh
 tests/ubifs_tools-tests/fsck_tests/authentication_refuse.sh
 tests/ubifs_tools-tests/fsck_tests/cycle_mount_fsck_check.sh
+tests/ubifs_tools-tests/fsck_tests/powercut_fsck_mount.sh
 
 #
 # Files generated by autotools
diff --git a/configure.ac b/configure.ac
index bcd9b63a..460109e7 100644
--- a/configure.ac
+++ b/configure.ac
@@ -295,7 +295,8 @@ AC_CONFIG_FILES([tests/fs-tests/fs_help_all.sh
 	tests/ubi-tests/ubi-stress-test.sh
 	tests/ubifs_tools-tests/lib/common.sh
 	tests/ubifs_tools-tests/fsck_tests/authentication_refuse.sh
-	tests/ubifs_tools-tests/fsck_tests/cycle_mount_fsck_check.sh])
+	tests/ubifs_tools-tests/fsck_tests/cycle_mount_fsck_check.sh
+	tests/ubifs_tools-tests/fsck_tests/powercut_fsck_mount.sh])
 
 AC_OUTPUT([Makefile])
 
diff --git a/tests/ubifs_tools-tests/Makemodule.am b/tests/ubifs_tools-tests/Makemodule.am
index 68c77a62..d54514da 100644
--- a/tests/ubifs_tools-tests/Makemodule.am
+++ b/tests/ubifs_tools-tests/Makemodule.am
@@ -1,4 +1,5 @@
 test_SCRIPTS += \
 	tests/ubifs_tools-tests/lib/common.sh \
 	tests/ubifs_tools-tests/fsck_tests/authentication_refuse.sh \
-	tests/ubifs_tools-tests/fsck_tests/cycle_mount_fsck_check.sh
+	tests/ubifs_tools-tests/fsck_tests/cycle_mount_fsck_check.sh \
+	tests/ubifs_tools-tests/fsck_tests/powercut_fsck_mount.sh
diff --git a/tests/ubifs_tools-tests/fsck_tests/powercut_fsck_mount.sh.in b/tests/ubifs_tools-tests/fsck_tests/powercut_fsck_mount.sh.in
new file mode 100755
index 00000000..ac7128bd
--- /dev/null
+++ b/tests/ubifs_tools-tests/fsck_tests/powercut_fsck_mount.sh.in
@@ -0,0 +1,148 @@
+#!/bin/sh
+# Copyright (c), 2024, Huawei Technologies Co, Ltd.
+# Author: Zhihao Cheng <chengzhihao1@huawei.com>
+#
+# Test Description:
+# For many kinds of flash, do following things
+#  1. mount UBIFS
+#  2. fsstress & powercut & unmount
+#  3. fsck UBIFS
+#  4. check UBIFS mounting result
+# Running time: 1h
+
+TESTBINDIR=@TESTBINDIR@
+source $TESTBINDIR/common.sh
+
+function run_test()
+{
+	local simulator="$1";
+	local size="$2";
+	local peb_size="$3";
+	local page_size="$4";
+	local encryption=$5;
+
+	echo "======================================================================"
+	printf "%s" "$simulator: ${size}MiB PEB size ${peb_size}KiB"
+	if [ "$simulator" = "nandsim" ]; then
+		printf " %s" "page size ${page_size}Bytes"
+	fi
+	printf " $encryption\n"
+
+	if [ "$simulator" = "nandsim" ]; then
+		$TESTBINDIR/load_nandsim.sh "$size" "$peb_size" "$page_size" || echo "cannot load nandsim";
+		mtdnum="$(find_mtd_device "$nandsim_patt")"
+	elif [ "$simulator" = "mtdram" ]; then
+		load_mtdram "$size" "$peb_size" || echo "cannot load mtdram"
+		mtdnum="$(find_mtd_device "$mtdram_patt")"
+	else
+		fatal "$simulator is not supported"
+	fi
+
+	flash_eraseall /dev/mtd$mtdnum
+	modprobe ubi mtd="$mtdnum,$page_size" || fatal "modprobe ubi fail"
+	ubimkvol -N vol_test -m -n 0 /dev/ubi$UBI_NUM || fatal "mkvol fail"
+	modprobe ubifs || fatal "modprobe ubifs fail"
+	mount_ubifs $DEV $MNT || fatal "mount ubifs fail"
+	if [[ "$encryption" == "encrypted" ]]; then
+		encryption_gen_key
+		encryption_set_key $MNT
+	fi
+
+	fsstress -d $MNT -l0 -p4 -n10000 &
+	sleep $((RANDOM % 120))
+	powercut
+
+	ps -e | grep -w fsstress > /dev/null 2>&1
+	while [ $? -eq 0 ]
+	do
+		killall -9 fsstress > /dev/null 2>&1
+		sleep 1
+		ps -e | grep -w fsstress > /dev/null 2>&1
+	done
+
+	while true
+	do
+		res=`mount | grep "$MNT"`
+		if [[ "$res" == "" ]]
+		then
+			break;
+		fi
+		umount $MNT
+		sleep 0.1
+	done
+
+	fsck.ubifs -a $DEV 2>&1 > $LOG_FILE
+	res=$?
+	cat $LOG_FILE
+	if [[ $res != $FSCK_OK ]]
+	then
+		# Powercut during layout_leb_in_gaps may change index LEBs
+		# without updating LPT.
+		idx_log=`cat $LOG_FILE | grep "Inconsistent properties" | grep "is_idx 1"`
+		# The lpt nodes could be parsed incorrectly because the lpt disk
+		# layout is too simple. See details in
+		# https://lore.kernel.org/linux-mtd/97ca7fe4-4ad4-edd1-e97a-1d540aeabe2d@huawei.com/
+		lpt_log=`cat $LOG_FILE | grep "dbg_check_ltab_lnum: invalid empty space in LEB"`
+		if [[ "$idx_log" == "" ]] && [[ "$lpt_log" == "" ]]; then
+			fatal "fsck fail $res"
+		fi
+		if [[ $res != $FSCK_NONDESTRUCT ]]; then
+			fatal "fsck fail $res"
+		fi
+	fi
+
+	dmesg -c > /dev/null # powercut could reproduce error messages
+
+	enable_chkfs
+
+	mount_ubifs $DEV $MNT "noauthentication" "noatime"
+	res=$?
+	if [[ $res != 0 ]]
+	then
+		fatal "mount fail $res"
+	fi
+
+	if [[ "$encryption" == "encrypted" ]]; then
+		encryption_set_key $MNT
+	fi
+
+	du -sh $MNT > /dev/null  # Make sure all files are accessible
+	ret=$?
+	if [[ $ret != 0 ]]; then
+		fatal "Cannot access all files"
+	fi
+	check_err_msg
+
+	umount $MNT
+	res=$?
+	if [[ $res != 0 ]]
+	then
+		fatal "unmount fail $res"
+	fi
+
+	check_err_msg
+
+	modprobe -r ubifs
+	modprobe -r ubi
+	modprobe -r $simulator
+
+	echo "----------------------------------------------------------------------"
+}
+
+check_fsstress
+start_t=$(date +%s)
+echo "Do powercut+fsck+mount test in kinds of flashes"
+for simulator in "mtdram" "nandsim"; do
+	for encryption in "encrypted" "noencrypted"; do
+		run_test "$simulator" "16" "16" "512" $encryption
+		run_test "$simulator" "64" "16" "512" $encryption
+		run_test "$simulator" "128" "64" "2048" $encryption
+		run_test "$simulator" "256" "128" "2048" $encryption
+		run_test "$simulator" "512" "128" "2048" $encryption
+		run_test "$simulator" "1024" "512" "2048" $encryption
+	done
+done
+end_t=$(date +%s)
+time_cost=$(( end_t - start_t ))
+echo "Success, cost $time_cost seconds"
+exit 0
-- 
2.13.6


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
