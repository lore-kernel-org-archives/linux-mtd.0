Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2ECC7C27C53
	for <linux-mtd@archiver.kernel.org>; Fri,  7 Jun 2024 04:33:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bLmx1cfp2lnJpgghqsBcp27l4leeCFT63NwcP8DeUqI=; b=sj1l3+srwjF6pA
	oqOdWz5dSVNO3Ntz/M1m4p6dlsssNgpXp8UR24DRHaEs028plHQSk52p3W9nIU/9clI+1TP508pgz
	GD+Q/Rtt7bsj18+gzLZzUET8YcwcVDf09OdSx6DPyOs9pG26qaDYEfWWSEUGcQSKLfTh5ZVtVgrjz
	ztkXRgzSfUs2GqWoPfvpvEnY0aS5lGy2DSDjTg1Lu2WAnYZ6Dlr0Y51ldHAavPjLPLklf+c/ZbsFR
	hN9VaNlMUFVitO14bzgN34N1N0rBiwaM6mYLSxbiV2gGOUZo1uz6RcMvNEnr+ZeiUOdPftrKJCCH+
	O+0Y6KYDUXyNVu7RIKKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFRHl-0000000CL0d-1RlD;
	Fri, 07 Jun 2024 04:33:05 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFREs-0000000CIjL-2w3h
	for linux-mtd@lists.infradead.org;
	Fri, 07 Jun 2024 04:30:26 +0000
Received: from mail.maildlp.com (unknown [172.19.88.105])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4VwSmS45qGzmYJM;
	Fri,  7 Jun 2024 12:25:28 +0800 (CST)
Received: from kwepemm600013.china.huawei.com (unknown [7.193.23.68])
	by mail.maildlp.com (Postfix) with ESMTPS id 68CDE140336;
	Fri,  7 Jun 2024 12:29:49 +0800 (CST)
Received: from huawei.com (10.175.104.67) by kwepemm600013.china.huawei.com
 (7.193.23.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Fri, 7 Jun
 2024 12:27:41 +0800
From: Zhihao Cheng <chengzhihao1@huawei.com>
To: <richard@nod.at>, <david.oberhollenzer@sigma-star.at>,
	<miquel.raynal@bootlin.com>, <yi.zhang@huawei.com>, <xiangyang3@huawei.com>,
	<huangxiaojia2@huawei.com>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [RFC PATCH mtd-utils 101/110] tests: ubifs_tools: fsck_tests: Add cycle mount+fsck test
Date: Fri, 7 Jun 2024 12:26:06 +0800
Message-ID: <20240607042615.2069840-102-chengzhihao1@huawei.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240607042615.2069840-1-chengzhihao1@huawei.com>
References: <20240607042615.2069840-1-chengzhihao1@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.104.67]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemm600013.china.huawei.com (7.193.23.68)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240606_213008_344255_FD9C0E51 
X-CRM114-Status: GOOD (  14.93  )
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

Do fsstress and fsck, check whether there are any files(and their data)
are lost after fsck. This testcase mainly checks whether fsck.ubifs could
corrupt the filesystem content in common case.

Signed-off-by: Zhihao Cheng <chengzhihao1@huawei.com>
---
 .gitignore                                         |   1 +
 configure.ac                                       |   3 +-
 tests/ubifs_tools-tests/Makemodule.am              |   3 +-
 .../fsck_tests/cycle_mount_fsck_check.sh.in        | 144 +++++++++++++++++++++
 4 files changed, 149 insertions(+), 2 deletions(-)
 create mode 100755 tests/ubifs_tools-tests/fsck_tests/cycle_mount_fsck_check.sh.in

diff --git a/.gitignore b/.gitignore
index 799290a4..7de38e86 100644
--- a/.gitignore
+++ b/.gitignore
@@ -115,6 +115,7 @@ tests/ubi-tests/runubitests.sh
 tests/ubi-tests/ubi-stress-test.sh
 tests/ubifs_tools-tests/lib/common.sh
 tests/ubifs_tools-tests/fsck_tests/authentication_refuse.sh
+tests/ubifs_tools-tests/fsck_tests/cycle_mount_fsck_check.sh
 
 #
 # Files generated by autotools
diff --git a/configure.ac b/configure.ac
index 160fa812..9d17b9ab 100644
--- a/configure.ac
+++ b/configure.ac
@@ -291,7 +291,8 @@ AC_CONFIG_FILES([tests/fs-tests/fs_help_all.sh
 	tests/ubi-tests/runubitests.sh
 	tests/ubi-tests/ubi-stress-test.sh
 	tests/ubifs_tools-tests/lib/common.sh
-	tests/ubifs_tools-tests/fsck_tests/authentication_refuse.sh])
+	tests/ubifs_tools-tests/fsck_tests/authentication_refuse.sh
+	tests/ubifs_tools-tests/fsck_tests/cycle_mount_fsck_check.sh])
 
 AC_OUTPUT([Makefile])
 
diff --git a/tests/ubifs_tools-tests/Makemodule.am b/tests/ubifs_tools-tests/Makemodule.am
index 6b533982..68c77a62 100644
--- a/tests/ubifs_tools-tests/Makemodule.am
+++ b/tests/ubifs_tools-tests/Makemodule.am
@@ -1,3 +1,4 @@
 test_SCRIPTS += \
 	tests/ubifs_tools-tests/lib/common.sh \
-	tests/ubifs_tools-tests/fsck_tests/authentication_refuse.sh
+	tests/ubifs_tools-tests/fsck_tests/authentication_refuse.sh \
+	tests/ubifs_tools-tests/fsck_tests/cycle_mount_fsck_check.sh
diff --git a/tests/ubifs_tools-tests/fsck_tests/cycle_mount_fsck_check.sh.in b/tests/ubifs_tools-tests/fsck_tests/cycle_mount_fsck_check.sh.in
new file mode 100755
index 00000000..06e480b8
--- /dev/null
+++ b/tests/ubifs_tools-tests/fsck_tests/cycle_mount_fsck_check.sh.in
@@ -0,0 +1,144 @@
+#!/bin/sh
+# Copyright (c), 2024, Huawei Technologies Co, Ltd.
+# Author: Zhihao Cheng <chengzhihao1@huawei.com>
+#
+# Test Description:
+# Do many cycles of mount/fsstress/umount/fsck/mount, check whether the
+# filesystem content before fsck and after fsck are consistent.
+# Running time: 10h
+
+TESTBINDIR=@TESTBINDIR@
+source $TESTBINDIR/common.sh
+
+ID="0xec,0xa1,0x00,0x15" # 128M 128KB 2KB 512-sub-page
+
+function run_test()
+{
+	encryption=$1
+	modprobe nandsim id_bytes=$ID
+	mtdnum="$(find_mtd_device "$nandsim_patt")"
+	flash_eraseall /dev/mtd$mtdnum
+
+	dmesg -c > /dev/null
+
+	modprobe ubi mtd="$mtdnum,2048" || fatal "modprobe ubi fail"
+	ubimkvol -N vol_test -m -n 0 /dev/ubi$UBI_NUM || fatal "mkvol fail"
+	modprobe ubifs || fatal "modprobe ubifs fail"
+
+	echo "Do cycle mount+umount+fsck+check_fs_content test ($encryption)"
+
+	if [[ "$encryption" == "encrypted" ]]; then
+		encryption_gen_key
+	fi
+
+	round=0
+	while [[ $round -lt 20 ]]
+	do
+		echo "---------------------- ROUND $round ----------------------"
+		let round=$round+1
+
+		mount_ubifs $DEV $MNT "noauthentication" "noatime" || fatal "mount ubifs fail"
+		if [[ "$encryption" == "encrypted" ]]; then
+			encryption_set_key $MNT
+		fi
+
+		per=`df -Th | grep ubifs | awk '{print $6}'`;
+		if [[ ${per%?} -gt 95 ]]; then
+			# Used > 95%
+			echo "Clean files"
+			rm -rf $MNT/*
+			check_err_msg
+		fi
+
+		fsstress -d $MNT -l0 -p4 -n10000 &
+
+		sleep $((RANDOM % 30))
+
+		ps -e | grep -w fsstress > /dev/null 2>&1
+		while [ $? -eq 0 ]
+		do
+			killall -9 fsstress > /dev/null 2>&1
+			sleep 1
+			ps -e | grep -w fsstress > /dev/null 2>&1
+		done
+
+		per=`df -Th | grep ubifs | awk '{print $6}'`;
+		if [[ ${per%?} -gt 95 ]]; then
+			dmesg -c > /dev/null # The ENOSPC error messages may exist
+		else
+			check_err_msg # Make sure new operations are okay after fsck
+		fi
+		sync
+
+		# Record filesystem information
+		rm -f $TMP_FILE 2>/dev/null
+		read_dir $MNT "md5sum"
+
+		while true
+		do
+			res=`mount | grep "$MNT"`
+			if [[ "$res" == "" ]]
+			then
+				break;
+			fi
+			umount $MNT
+			sleep 0.1
+		done
+
+		fsck.ubifs -a $DEV # 'fsck.ubifs $DEV' is fine too.
+		res=$?
+		if [[ $res != $FSCK_OK ]]
+		then
+			fatal "fsck expects result $FSCK_OK, but $res is returned"
+		fi
+
+		enable_chkfs
+
+		mount_ubifs $DEV $MNT "noauthentication" "noatime"
+		res=$?
+		if [[ $res != 0 ]]
+		then
+			fatal "mount fail $res"
+		fi
+
+		if [[ "$encryption" == "encrypted" ]]; then
+			encryption_set_key $MNT
+		fi
+
+		du -sh $MNT > /dev/null  # Ensure that all files are accessible
+		ret=$?
+		if [[ $ret != 0 ]]; then
+			fatal "Cannot access all files"
+		fi
+		check_err_msg
+
+		# Check filesystem information
+		parse_dir "md5sum"
+		rm -f $TMP_FILE 2>/dev/null
+
+		umount $MNT
+		res=$?
+		if [[ $res != 0 ]]
+		then
+			fatal "unmount fail $res"
+		fi
+
+		check_err_msg
+
+		disable_chkfs
+	done
+
+	modprobe -r ubifs
+	modprobe -r ubi
+	modprobe -r nandsim
+}
+
+check_fsstress
+start_t=$(date +%s)
+for encryption in "encrypted" "noencrypted"; do
+	run_test $encryption
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
