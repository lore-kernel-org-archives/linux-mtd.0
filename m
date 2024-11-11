Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3B26D12D7E
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Nov 2024 07:10:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cCm8m6HCozW/FSuTlonvwJqrDWAD5Qmgj4NWx5sgRtI=; b=dsvRue409pyBe/
	Ne0cgygmCnv6IPKars4/UJQdxDm8OVR1I7audWZUBQ2ur5kj+mP6COpgoY09MfTCK2P/RkGLUSCcT
	gt4IWclvXGxayKdososx33TwgyD32gv6sLfDce5zd5BmqEqjL6NgU54xiFtMlIlB+t7mFJRlPAXd7
	uOJ/IFTUFqJeCdl+geWEKKl/oZfP2GfH1IIL0acmdGxbc83asURsnkN4MRXtKr5cJ6GUIfFqLXpPo
	rzZsRhqYGyH8ZkswXy2jq1E8OxJ7BgqcG2pKvoHswzMLC0gC/M8yEqTEhAj4kP7yn5CMy1s6fbSKw
	phBBlvMhgGnGV6dHQF2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAOZA-0000000Gd3Y-3IpZ;
	Mon, 11 Nov 2024 07:10:28 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAOVV-0000000GaD4-0VCU
	for linux-mtd@bombadil.infradead.org;
	Mon, 11 Nov 2024 07:06:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=EU5hK9k/3juhPp3wnKSGTCDtKG90SdozR1yYMI9y/eM=; b=JyIRlJkwAzhD9oL9+ZrNwKq7U1
	qeD4W9WBUiNJv29h6z2EWIA9US4j+pClONGYBfHnQ1xb1JTP8xtV4jXxmEw2HOI3q+SMzmf82c8Ip
	qEwnJtQl4l5OP/6qNSC2bQLuMTgVtmhAqAzlqC+eE1DvnNJE5ANVTrLGIdf3MQZvSecbdxWv5m916
	V4uOycLX4ROWWxz3XO8GmAfO+YpbcgFS4rt/tLLPDJMsIJsLO9HAH39c+ywfojZKfCwAto9QERoZ4
	5cH8OUxGOWdOIc9SafXzBMlQGtKzblh/wVgAWJFNo2/vQwXeeHuMFmla6sb233yKO0A6kObCUHg0G
	VaW/V7Fg==;
Received: from szxga08-in.huawei.com ([45.249.212.255])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAOVG-0000000CmTL-0tJL
	for linux-mtd@lists.infradead.org;
	Mon, 11 Nov 2024 07:06:39 +0000
Received: from mail.maildlp.com (unknown [172.19.162.254])
	by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4Xn0r861ppz1TB6R;
	Mon, 11 Nov 2024 15:03:20 +0800 (CST)
Received: from kwepemk500005.china.huawei.com (unknown [7.202.194.90])
	by mail.maildlp.com (Postfix) with ESMTPS id 24E2C180104;
	Mon, 11 Nov 2024 15:05:47 +0800 (CST)
Received: from huawei.com (10.175.112.188) by kwepemk500005.china.huawei.com
 (7.202.194.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Mon, 11 Nov
 2024 15:05:46 +0800
From: Zhihao Cheng <chengzhihao1@huawei.com>
To: <richard@nod.at>, <david.oberhollenzer@sigma-star.at>,
	<yi.zhang@huawei.com>
CC: <linux-mtd@lists.infradead.org>
Subject: [PATCH mtd-utils v2 091/102] tests: ubifs_tools: fsck_tests: Add authentication refusing test
Date: Mon, 11 Nov 2024 15:03:34 +0800
Message-ID: <20241111070346.1314122-92-chengzhihao1@huawei.com>
X-Mailer: git-send-email 2.46.1
In-Reply-To: <20241111070346.1314122-1-chengzhihao1@huawei.com>
References: <20241111070346.1314122-1-chengzhihao1@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.112.188]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemk500005.china.huawei.com (7.202.194.90)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241111_070629_350091_A3034FBB 
X-CRM114-Status: GOOD (  13.19  )
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

Authenticated UBIFS image is not supported in fsck, add testcase
to check that.

Signed-off-by: Zhihao Cheng <chengzhihao1@huawei.com>
---
 .gitignore                                         |  1 +
 configure.ac                                       |  3 +-
 tests/ubifs_tools-tests/Makemodule.am              |  3 +-
 .../fsck_tests/authentication_refuse.sh.in         | 66 ++++++++++++++++++++++
 4 files changed, 71 insertions(+), 2 deletions(-)
 create mode 100755 tests/ubifs_tools-tests/fsck_tests/authentication_refuse.sh.in

diff --git a/.gitignore b/.gitignore
index de0fce1f..799290a4 100644
--- a/.gitignore
+++ b/.gitignore
@@ -114,6 +114,7 @@ tests/fs-tests/stress/fs_stress01.sh
 tests/ubi-tests/runubitests.sh
 tests/ubi-tests/ubi-stress-test.sh
 tests/ubifs_tools-tests/lib/common.sh
+tests/ubifs_tools-tests/fsck_tests/authentication_refuse.sh
 
 #
 # Files generated by autotools
diff --git a/configure.ac b/configure.ac
index 7fd4b764..45f51abb 100644
--- a/configure.ac
+++ b/configure.ac
@@ -293,7 +293,8 @@ AC_CONFIG_FILES([tests/fs-tests/fs_help_all.sh
 	tests/fs-tests/stress/fs_stress01.sh
 	tests/ubi-tests/runubitests.sh
 	tests/ubi-tests/ubi-stress-test.sh
-	tests/ubifs_tools-tests/lib/common.sh])
+	tests/ubifs_tools-tests/lib/common.sh
+	tests/ubifs_tools-tests/fsck_tests/authentication_refuse.sh])
 
 AC_OUTPUT([Makefile])
 
diff --git a/tests/ubifs_tools-tests/Makemodule.am b/tests/ubifs_tools-tests/Makemodule.am
index 265c9cc7..6b533982 100644
--- a/tests/ubifs_tools-tests/Makemodule.am
+++ b/tests/ubifs_tools-tests/Makemodule.am
@@ -1,2 +1,3 @@
 test_SCRIPTS += \
-	tests/ubifs_tools-tests/lib/common.sh
+	tests/ubifs_tools-tests/lib/common.sh \
+	tests/ubifs_tools-tests/fsck_tests/authentication_refuse.sh
diff --git a/tests/ubifs_tools-tests/fsck_tests/authentication_refuse.sh.in b/tests/ubifs_tools-tests/fsck_tests/authentication_refuse.sh.in
new file mode 100755
index 00000000..268a7de1
--- /dev/null
+++ b/tests/ubifs_tools-tests/fsck_tests/authentication_refuse.sh.in
@@ -0,0 +1,66 @@
+#!/bin/sh
+# Copyright (c), 2024, Huawei Technologies Co, Ltd.
+# Author: Zhihao Cheng <chengzhihao1@huawei.com>
+#
+# Test Description:
+# Refuse checking authenticated UBIFS image
+# Running time: 10s
+
+TESTBINDIR=@TESTBINDIR@
+source $TESTBINDIR/common.sh
+
+ID="0xec,0xa1,0x00,0x15" # 128M 128KB 2KB 512-sub-page
+
+function run_test()
+{
+	echo "Do authentication_refused test"
+
+	modprobe nandsim id_bytes=$ID
+	mtdnum="$(find_mtd_device "$nandsim_patt")"
+	flash_eraseall /dev/mtd$mtdnum
+
+	modprobe ubi mtd="$mtdnum,2048" || fatal "modprobe ubi fail"
+	ubimkvol -N vol_test -m -n 0 /dev/ubi$UBI_NUM || fatal "mkvol fail"
+	modprobe ubifs || fatal "modprobe ubifs fail"
+
+	mount_ubifs $DEV $MNT "authentication" || fatal "mount ubifs failed"
+	fsstress -d $MNT/fsstress -l0 -p4 -n10000 &
+	sleep $((RANDOM % 5))
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
+	fsck.ubifs -a $DEV # 'fsck.ubifs $DEV' is fine too.
+	res=$?
+	if [[ $res == $FSCK_OK ]]
+	then
+		fatal "fsck should not be success!"
+	fi
+
+	modprobe -r ubifs
+	modprobe -r ubi
+	modprobe -r nandsim
+}
+
+start_t=$(date +%s)
+run_test
+end_t=$(date +%s)
+time_cost=$(( end_t - start_t ))
+echo "Success, cost $time_cost seconds"
+exit 0
-- 
2.13.6


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
