Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1F72D2E9C7
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Nov 2024 09:11:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2cywIDzy9oz8th7Hrlvwf/YrAGkC2n06UvLHFh5E5Dw=; b=ekq/LP0gQxv2ca
	eQBz6gouyLC72FTp8bM1KcCGsL/pHFRYBp9PFif+lGaMSSUfoQY3n1M84EX//RxCa7Q6fW3s3rXVw
	oTtyd4b7yUhTGoUlipy5nFO07KQ2K79yzo2KAkrx1gzCuuSesRaR5vY+a2FAMzjbjInZsdgwbp5G2
	wttNksxEXlQ1KTDOa5AtNkrRtbI9D8lip/gO0bJB5NPBP77bDQpOif1A0GGdVTl4ASUM1EIOxB40q
	XFNj4EwjRPDTPRoal7xDBbBZk9bZ2Xkawp0+fQCakCgItnVbeCLDoTQ/9/uloYcY4u44M3yUnEI06
	XAzqPmZ1yu/v6T5heECg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAQSH-0000000H1gi-2WRv;
	Mon, 11 Nov 2024 09:11:29 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAQQu-0000000H0V0-2jGR
	for linux-mtd@bombadil.infradead.org;
	Mon, 11 Nov 2024 09:10:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=+FBVF95Ad6o5h3VLFaSm19aLt/TzWuL9v2R7OCZVRaw=; b=i+Y/USZAJwrzzaJ89ZOuaHOyUw
	y+TY7vgGSITZcfQHKfAIb7L7AGnlZTcKtUiWIeBLpCDOs6voRudIDAsDAlfQEG35y8UzpnZfnpX8a
	/CLH+7sIKvFAnC99siHYMZIpythOyDqPcEFNXNmRvtftPWlX0FWSmSQIthXAW1yQpTgDuByuOmamc
	LjhFv264vpquN1Nu6WXtnDggdT3B7gEW/Nq9m8qdP5nJPJVZqT1Rg/iYvJRWqvNOuQsMeOjqpddU/
	1J8BkPM1t1hrEU2+zD51nMq2N2zeOpOOcWdf0GHFq+cIzyuaaujCZTyoCQfZ0H4xeP7dA+ugq3APT
	zyaSXM0A==;
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAQQp-0000000CoYz-3EBn
	for linux-mtd@lists.infradead.org;
	Mon, 11 Nov 2024 09:10:03 +0000
Received: from mail.maildlp.com (unknown [172.19.88.105])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4Xn3c226ShzpZPV;
	Mon, 11 Nov 2024 17:08:02 +0800 (CST)
Received: from kwepemk500005.china.huawei.com (unknown [7.202.194.90])
	by mail.maildlp.com (Postfix) with ESMTPS id 65A421400DC;
	Mon, 11 Nov 2024 17:09:55 +0800 (CST)
Received: from huawei.com (10.175.112.188) by kwepemk500005.china.huawei.com
 (7.202.194.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Mon, 11 Nov
 2024 17:09:54 +0800
From: Zhihao Cheng <chengzhihao1@huawei.com>
To: <richard@nod.at>, <david.oberhollenzer@sigma-star.at>,
	<yi.zhang@huawei.com>
CC: <linux-mtd@lists.infradead.org>
Subject: [PATCH mtd-utils v2 RESEND 095/102] tests: ubifs_tools: fsck_tests: Add cycle_powercut+fsck test
Date: Mon, 11 Nov 2024 17:08:23 +0800
Message-ID: <20241111090832.2093596-26-chengzhihao1@huawei.com>
X-Mailer: git-send-email 2.46.1
In-Reply-To: <20241111083711.1916125-1-chengzhihao1@huawei.com>
References: <20241111083711.1916125-1-chengzhihao1@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.112.188]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemk500005.china.huawei.com (7.202.194.90)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241111_091001_466304_874C9901 
X-CRM114-Status: GOOD (  15.89  )
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

Inject powercut while doing fsstress on mounted UBIFS, check the
consistency of UBIFS after fsck.
This testscase mainly makes sure that fsck.ubifs can make UBIFS
image be consistent in common stress cases and powercut cases.

Signed-off-by: Zhihao Cheng <chengzhihao1@huawei.com>
---
 .gitignore                                         |   1 +
 configure.ac                                       |   3 +-
 tests/ubifs_tools-tests/Makemodule.am              |   3 +-
 .../fsck_tests/cycle_powercut_mount_fsck.sh.in     | 148 +++++++++++++++++++++
 4 files changed, 153 insertions(+), 2 deletions(-)
 create mode 100755 tests/ubifs_tools-tests/fsck_tests/cycle_powercut_mount_fsck.sh.in

diff --git a/.gitignore b/.gitignore
index ea99a614..1d150f7a 100644
--- a/.gitignore
+++ b/.gitignore
@@ -118,6 +118,7 @@ tests/ubifs_tools-tests/fsck_tests/authentication_refuse.sh
 tests/ubifs_tools-tests/fsck_tests/cycle_mount_fsck_check.sh
 tests/ubifs_tools-tests/fsck_tests/powercut_fsck_mount.sh
 tests/ubifs_tools-tests/fsck_tests/cycle_corrupted_fsck_fault_inject.sh
+tests/ubifs_tools-tests/fsck_tests/cycle_powercut_mount_fsck.sh
 
 #
 # Files generated by autotools
diff --git a/configure.ac b/configure.ac
index 47efd40c..7b929459 100644
--- a/configure.ac
+++ b/configure.ac
@@ -297,7 +297,8 @@ AC_CONFIG_FILES([tests/fs-tests/fs_help_all.sh
 	tests/ubifs_tools-tests/fsck_tests/authentication_refuse.sh
 	tests/ubifs_tools-tests/fsck_tests/cycle_mount_fsck_check.sh
 	tests/ubifs_tools-tests/fsck_tests/powercut_fsck_mount.sh
-	tests/ubifs_tools-tests/fsck_tests/cycle_corrupted_fsck_fault_inject.sh])
+	tests/ubifs_tools-tests/fsck_tests/cycle_corrupted_fsck_fault_inject.sh
+	tests/ubifs_tools-tests/fsck_tests/cycle_powercut_mount_fsck.sh])
 
 AC_OUTPUT([Makefile])
 
diff --git a/tests/ubifs_tools-tests/Makemodule.am b/tests/ubifs_tools-tests/Makemodule.am
index 932a2bcb..2c190e2b 100644
--- a/tests/ubifs_tools-tests/Makemodule.am
+++ b/tests/ubifs_tools-tests/Makemodule.am
@@ -3,4 +3,5 @@ test_SCRIPTS += \
 	tests/ubifs_tools-tests/fsck_tests/authentication_refuse.sh \
 	tests/ubifs_tools-tests/fsck_tests/cycle_mount_fsck_check.sh \
 	tests/ubifs_tools-tests/fsck_tests/powercut_fsck_mount.sh \
-	tests/ubifs_tools-tests/fsck_tests/cycle_corrupted_fsck_fault_inject.sh
+	tests/ubifs_tools-tests/fsck_tests/cycle_corrupted_fsck_fault_inject.sh \
+	tests/ubifs_tools-tests/fsck_tests/cycle_powercut_mount_fsck.sh
diff --git a/tests/ubifs_tools-tests/fsck_tests/cycle_powercut_mount_fsck.sh.in b/tests/ubifs_tools-tests/fsck_tests/cycle_powercut_mount_fsck.sh.in
new file mode 100755
index 00000000..6af1b54d
--- /dev/null
+++ b/tests/ubifs_tools-tests/fsck_tests/cycle_powercut_mount_fsck.sh.in
@@ -0,0 +1,148 @@
+#!/bin/sh
+# Copyright (c), 2024, Huawei Technologies Co, Ltd.
+# Author: Zhihao Cheng <chengzhihao1@huawei.com>
+#
+# Test Description:
+# Do many cycles of mount/fsstress/powercut/umount/fsck/mount, check whether
+# mount is successful.
+# Running time: 9h
+
+TESTBINDIR=@TESTBINDIR@
+source $TESTBINDIR/common.sh
+
+ID="0x20,0xa7,0x00,0x26" # 4G 256KB 4KB 2KB-sub-page
+
+function run_test()
+{
+	local encryption=$1
+
+	echo "Do cycle mount+powercut+fsck+umount($encryption) test"
+	modprobe nandsim id_bytes=$ID
+	mtdnum="$(find_mtd_device "$nandsim_patt")"
+	flash_eraseall /dev/mtd$mtdnum
+
+	dmesg -c > /dev/null
+
+	modprobe ubi mtd="$mtdnum,4096" || fatal "modprobe ubi fail"
+	ubimkvol -N vol_test -m -n 0 /dev/ubi$UBI_NUM || fatal "mkvol fail"
+	modprobe ubifs || fatal "modprobe ubifs fail"
+
+	if [[ "$encryption" == "encrypted" ]]; then
+		encryption_gen_key
+	fi
+
+	round=0
+	while [[ $round -lt 60 ]]
+	do
+		echo "---------------------- ROUND $round ----------------------"
+		let round=$round+1
+
+		mount_ubifs $DEV $MNT || fatal "mount ubifs fail"
+		if [[ "$encryption" == "encrypted" ]]; then
+			encryption_set_key $MNT
+		fi
+
+		if [[ $(($round % 30)) == 0 ]]
+		then
+			echo "Clean files"
+			rm -rf $MNT/*
+			check_err_msg
+		fi
+
+		fsstress -d $MNT -l0 -p4 -n10000 &
+		sleep $((RANDOM % 30))
+
+		per=`df -Th | grep ubifs | awk '{print $6}'`;
+		if [[ ${per%?} -gt 95 ]]; then
+			dmesg -c > /dev/null # The ENOSPC error messages may exist
+		else
+			check_err_msg # Make sure new operations are okay after fsck
+		fi
+		powercut
+
+		ps -e | grep -w fsstress > /dev/null 2>&1
+		while [ $? -eq 0 ]
+		do
+			killall -9 fsstress > /dev/null 2>&1
+			sleep 1
+			ps -e | grep -w fsstress > /dev/null 2>&1
+		done
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
+		fsck.ubifs -a $DEV 2>&1 > $LOG_FILE
+		res=$?
+		cat $LOG_FILE
+		if [[ $res != $FSCK_OK ]]
+		then
+			# Powercut during layout_leb_in_gaps may change index
+			# LEBs without updating LPT.
+			idx_log=`cat $LOG_FILE | grep "Inconsistent properties" | grep "is_idx 1"`
+			# The lpt nodes could be parsed incorrectly because the lpt disk
+			# layout is too simple. See details in
+			# https://lore.kernel.org/linux-mtd/97ca7fe4-4ad4-edd1-e97a-1d540aeabe2d@huawei.com/
+			lpt_log=`cat $LOG_FILE | grep "dbg_check_ltab_lnum: invalid empty space in LEB"`
+			if [[ "$idx_log" == "" ]] && [[ "$lpt_log" == "" ]]; then
+				fatal "fsck fail $res"
+			fi
+			if [[ $res != $FSCK_NONDESTRUCT ]]; then
+				fatal "fsck fail $res"
+			fi
+		fi
+
+		dmesg -c > /dev/null # powercut could reproduce error messages
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
+		du -sh $MNT > /dev/null  # Make sure all files are accessible
+		ret=$?
+		if [[ $ret != 0 ]]; then
+			fatal "Cannot access all files"
+		fi
+		check_err_msg
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
+run_test "encrypted"
+run_test "noencrypted"
+end_t=$(date +%s)
+time_cost=$(( end_t - start_t ))
+echo "Success, cost $time_cost seconds"
+exit 0
-- 
2.13.6


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
