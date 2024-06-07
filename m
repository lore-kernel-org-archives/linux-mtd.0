Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C71F6C27C53
	for <linux-mtd@archiver.kernel.org>; Fri,  7 Jun 2024 04:33:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jS7qM8gU4mmnxvNhQ5pj1JrUDb1SMhsiTI1rpwNaM8Q=; b=LM2raGrFslri1c
	T162Jus3ki+iL6Y6f5eB+jwCFk62AgA6nTFwGiGqGFanA/TGYjXt3Tc+eGoU13FMgvHw3SyfICe+6
	KAsA/xHR9xNrihkI7uAz6UG1/niGSvkvPWO/jqJsRwBhkZrVIJLrv0SpkZqwdBi9WIp4yk+Z99OwY
	ZSMk4oPXGGx+PC5t2VVeBND+dUE6NwhvCBr/5Mrf79KUIpA+W5uI4IY/aMaO5Dciw+385rE4Cm9Zt
	UZ/i+tT4eD+tnSueAlWW9igEz+muwU3969IrT+Uu6eUryEhsGiQhQbqDx3HPWbznUK8ppGNGHoEOS
	SIxRfkKhq+pQa7GM7I9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFRHn-0000000CL2U-3fq4;
	Fri, 07 Jun 2024 04:33:07 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFRF8-0000000CIvK-1bA8
	for linux-mtd@lists.infradead.org;
	Fri, 07 Jun 2024 04:30:37 +0000
Received: from mail.maildlp.com (unknown [172.19.88.105])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4VwSrQ3wdzzdZfp;
	Fri,  7 Jun 2024 12:28:54 +0800 (CST)
Received: from kwepemm600013.china.huawei.com (unknown [7.193.23.68])
	by mail.maildlp.com (Postfix) with ESMTPS id 75CF714040F;
	Fri,  7 Jun 2024 12:30:04 +0800 (CST)
Received: from huawei.com (10.175.104.67) by kwepemm600013.china.huawei.com
 (7.193.23.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Fri, 7 Jun
 2024 12:27:42 +0800
From: Zhihao Cheng <chengzhihao1@huawei.com>
To: <richard@nod.at>, <david.oberhollenzer@sigma-star.at>,
	<miquel.raynal@bootlin.com>, <yi.zhang@huawei.com>, <xiangyang3@huawei.com>,
	<huangxiaojia2@huawei.com>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [RFC PATCH mtd-utils 102/110] tests: ubifs_tools: fsck_tests: Add powercut+fsck+mount test
Date: Fri, 7 Jun 2024 12:26:07 +0800
Message-ID: <20240607042615.2069840-103-chengzhihao1@huawei.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240607042615.2069840-1-chengzhihao1@huawei.com>
References: <20240607042615.2069840-1-chengzhihao1@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.104.67]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemm600013.china.huawei.com (7.193.23.68)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240606_213023_451299_AE1D53DF 
X-CRM114-Status: GOOD (  16.43  )
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
 .../fsck_tests/powercut_fsck_mount.sh.in           | 144 +++++++++++++++++++++
 4 files changed, 149 insertions(+), 2 deletions(-)
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
index 9d17b9ab..99ce86c8 100644
--- a/configure.ac
+++ b/configure.ac
@@ -292,7 +292,8 @@ AC_CONFIG_FILES([tests/fs-tests/fs_help_all.sh
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
index 00000000..3c7ff2dc
--- /dev/null
+++ b/tests/ubifs_tools-tests/fsck_tests/powercut_fsck_mount.sh.in
@@ -0,0 +1,144 @@
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
+		log=`cat $LOG_FILE | grep "Inconsistent properties" | grep "is_idx 1"`
+		if [[ "$log" == "" ]]; then
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
