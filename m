Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD94CC46CD2
	for <linux-mtd@archiver.kernel.org>; Thu, 28 Dec 2023 01:34:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4Sl95dSQWdPK7l2L/bishV+jhFZ6f2aKEe6pBGMSL4g=; b=wepNga+B7vzHSp
	ylikJn0A11uWNBtmRg33KRPzi3Dq5p3tBqoLptjm597vWh2HSZ/0LfUvAeI+y0oR3ymZ6HRdleZSX
	exnh9wUgdXzxse1WkQxWN602Rdj12JYyumhhe4+tBeVv1p8aBTup+6D9s0PDC3NZ2/yzdBuwN1Mw0
	ACq5UJJf+gE9dwfKrMSIvBGXmOPVNF+W1Aixi74cxP4tHvm+Z1qUZvd8EWs2WB2Aufbyqu0KsyaTS
	gq7PirR9nsOlSWwl3xXa00PtG+MSIXR+IPxrITfyLLu/bLqQtNV43vtpAoW9fiSt5LrhkWbU9Z+SY
	ublE0rU+j8EJOCYqeAFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rIfHr-00FoCM-2d;
	Thu, 28 Dec 2023 01:34:15 +0000
Received: from szxga05-in.huawei.com ([45.249.212.191])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rIfHo-00Fo9z-2p
	for linux-mtd@lists.infradead.org;
	Thu, 28 Dec 2023 01:34:14 +0000
Received: from mail.maildlp.com (unknown [172.19.88.214])
	by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4T0rby129Mz1g0DD;
	Thu, 28 Dec 2023 09:32:46 +0800 (CST)
Received: from kwepemm000013.china.huawei.com (unknown [7.193.23.81])
	by mail.maildlp.com (Postfix) with ESMTPS id 2F2161A0196;
	Thu, 28 Dec 2023 09:33:51 +0800 (CST)
Received: from huawei.com (10.175.127.227) by kwepemm000013.china.huawei.com
 (7.193.23.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 28 Dec
 2023 09:33:35 +0800
From: Zhihao Cheng <chengzhihao1@huawei.com>
To: <david.oberhollenzer@sigma-star.at>, <richard@nod.at>,
	<miquel.raynal@bootlin.com>, <s.hauer@pengutronix.de>,
	<Tudor.Ambarus@linaro.org>
CC: <linux-kernel@vger.kernel.org>, <linux-mtd@lists.infradead.org>
Subject: [PATCH mtd-utils 06/11] tests: ubifs_repair: Add cycle_powercut+repair test
Date: Thu, 28 Dec 2023 09:36:34 +0800
Message-ID: <20231228013639.2827205-7-chengzhihao1@huawei.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20231228013639.2827205-1-chengzhihao1@huawei.com>
References: <20231228013639.2827205-1-chengzhihao1@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.127.227]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemm000013.china.huawei.com (7.193.23.81)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231227_173413_290047_D3E349D7 
X-CRM114-Status: GOOD (  13.64  )
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
consistency of UBIFS after repairing.
This testscase mainly makes sure that ubifs_repair can make UBIFS
image be consistent in common stress cases and powercut cases.

Signed-off-by: Zhihao Cheng <chengzhihao1@huawei.com>
---
 .gitignore                                         |   1 +
 configure.ac                                       |   3 +-
 tests/ubifs_repair-tests/Makemodule.am             |   3 +-
 .../tests/cycle_powercut_mount_repair.sh.in        | 132 +++++++++++++++++++++
 4 files changed, 137 insertions(+), 2 deletions(-)
 create mode 100755 tests/ubifs_repair-tests/tests/cycle_powercut_mount_repair.sh.in

diff --git a/.gitignore b/.gitignore
index 52396e6..7077b8d 100644
--- a/.gitignore
+++ b/.gitignore
@@ -117,6 +117,7 @@ tests/ubifs_repair-tests/tests/authentication_refuse.sh
 tests/ubifs_repair-tests/tests/cycle_mount_repair_check.sh
 tests/ubifs_repair-tests/tests/powercut_repair_mount.sh
 tests/ubifs_repair-tests/tests/cycle_corrupted_repair_fault_inject.sh
+tests/ubifs_repair-tests/tests/cycle_powercut_mount_repair.sh
 
 #
 # Files generated by autotools
diff --git a/configure.ac b/configure.ac
index 31a7184..b3dd453 100644
--- a/configure.ac
+++ b/configure.ac
@@ -359,6 +359,7 @@ AC_CONFIG_FILES([tests/fs-tests/fs_help_all.sh
 	tests/ubifs_repair-tests/tests/authentication_refuse.sh
 	tests/ubifs_repair-tests/tests/cycle_mount_repair_check.sh
 	tests/ubifs_repair-tests/tests/powercut_repair_mount.sh
-	tests/ubifs_repair-tests/tests/cycle_corrupted_repair_fault_inject.sh])
+	tests/ubifs_repair-tests/tests/cycle_corrupted_repair_fault_inject.sh
+	tests/ubifs_repair-tests/tests/cycle_powercut_mount_repair.sh])
 
 AC_OUTPUT([Makefile])
diff --git a/tests/ubifs_repair-tests/Makemodule.am b/tests/ubifs_repair-tests/Makemodule.am
index 0a9fb48..4a7f5ed 100644
--- a/tests/ubifs_repair-tests/Makemodule.am
+++ b/tests/ubifs_repair-tests/Makemodule.am
@@ -3,4 +3,5 @@ test_SCRIPTS += \
 	tests/ubifs_repair-tests/tests/authentication_refuse.sh \
 	tests/ubifs_repair-tests/tests/cycle_mount_repair_check.sh \
 	tests/ubifs_repair-tests/tests/powercut_repair_mount.sh \
-	tests/ubifs_repair-tests/tests/cycle_corrupted_repair_fault_inject.sh
+	tests/ubifs_repair-tests/tests/cycle_corrupted_repair_fault_inject.sh \
+	tests/ubifs_repair-tests/tests/cycle_powercut_mount_repair.sh
diff --git a/tests/ubifs_repair-tests/tests/cycle_powercut_mount_repair.sh.in b/tests/ubifs_repair-tests/tests/cycle_powercut_mount_repair.sh.in
new file mode 100755
index 0000000..792f360
--- /dev/null
+++ b/tests/ubifs_repair-tests/tests/cycle_powercut_mount_repair.sh.in
@@ -0,0 +1,132 @@
+#!/bin/sh
+# Copyright (c), 2023-2024, Huawei Technologies Co, Ltd.
+# Author: Zhihao Cheng <chengzhihao1@huawei.com>
+#
+# Test Description:
+# Do many cycles of mount/fsstress/powercut/umount/repair/mount, check whether
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
+	echo "Do cycle mount+powercut+repair+umount($encryption) test"
+	modprobe nandsim id_bytes=$ID
+	mtdnum="$(find_mtd_device "$nandsim_patt")"
+	flash_eraseall /dev/mtd$mtdnum
+
+	dmesg -c > /dev/null
+
+	modprobe ubi mtd="$mtdnum,4096,0,0,1" fm_autoconvert || fatal "modprobe ubi fail"
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
+		check_err_msg # Make sure new operations are okay after repairing UBIFS
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
+		echo 'format "UBIFS DBG repair" +pflmt' > /sys/kernel/debug/dynamic_debug/control
+		echo "$DEV" > /sys/kernel/debug/ubifs/repair_fs
+		res=$?
+		if [[ $res != 0 ]]
+		then
+			fatal "repair fail $res"
+		fi
+
+		check_memleak
+
+		dmesg -c > /dev/null # powercut and repairing could reproduce error messages
+
+		enable_chkfs
+
+		mount_ubifs $DEV $MNT
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
