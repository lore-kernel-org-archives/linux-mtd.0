Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B313C27C53
	for <linux-mtd@archiver.kernel.org>; Fri,  7 Jun 2024 04:33:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Xm19+XtDPeNFFSnRVOGxs1fJJ1zSodi47FmS0pCNzi0=; b=x9kwhtLBQSGwGj
	DNzc1TfFvUOWpS5+29vlqj7sFndhD5QK3BYY6CzVxAsStqZDEXP8Cfc4bif8+fxKksadNBuqY03rl
	0lXmIEH8My9L7HGWNiyfep7v+H+mlMb881NDNbDZoSTe8tLY1DFxc4F6kifJgLGi4bTCldwbTcSRy
	E7zjHJnIv/6diEM9Z0EvFa8MhOQ68nasRQUxvWUbWzZbxE6mEmQ3F5cFM8QynTWFs8KhP+BMfnMwy
	4qTB0ZawnHnHK0cwbxaqiL4epTMN/20BHfTvS0ioTOciWntv0XtDK1B0vJWDsuCN+x/+NP9jJABKu
	elGFCcWcR1IMOVwLpdFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFRHg-0000000CKxL-44an;
	Fri, 07 Jun 2024 04:33:00 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFRFC-0000000CIyr-03E1
	for linux-mtd@bombadil.infradead.org;
	Fri, 07 Jun 2024 04:30:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=2Ol/lSE0In1t0B+RRzhXJPXjnsTGNjR/iJG2GVvALvk=; b=vs/Npfayk2VT09hhnTDuAQ8oSN
	oRw9F46+jvWTLJ+FNR8q3wRSCIRKnABoRK3DHDgnyvIHciUiP5F5Ts48jlG/sXHmabxVMpcLxV4sg
	+mAavpH5LUxE8vSZb/KCZx1n9gCRHiyhPh2HyeeDwE9RXCLF2kor9nX9UsOZO7nMRdBfk6ze26epo
	YOvvjNJowxDngr/YflgIQ+FRT/NwokUAM+TOuSM6cLyEkEfnUQfSVNyUsXObs1/CKCv0ikHZY/2+d
	04haSwcehe3DCQAKSaHtGXbckuE798bxcB5Eg2YJmWF7PmOfMJ/uhPqRM/TFUbONU/EC+H0/ksolO
	41tcwGCw==;
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by casper.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFRF8-00000004USC-1RVo
	for linux-mtd@lists.infradead.org;
	Fri, 07 Jun 2024 04:30:24 +0000
Received: from mail.maildlp.com (unknown [172.19.88.105])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4VwSmt38L9zwRql;
	Fri,  7 Jun 2024 12:25:50 +0800 (CST)
Received: from kwepemm600013.china.huawei.com (unknown [7.193.23.68])
	by mail.maildlp.com (Postfix) with ESMTPS id 5C561140124;
	Fri,  7 Jun 2024 12:29:34 +0800 (CST)
Received: from huawei.com (10.175.104.67) by kwepemm600013.china.huawei.com
 (7.193.23.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Fri, 7 Jun
 2024 12:27:40 +0800
From: Zhihao Cheng <chengzhihao1@huawei.com>
To: <richard@nod.at>, <david.oberhollenzer@sigma-star.at>,
	<miquel.raynal@bootlin.com>, <yi.zhang@huawei.com>, <xiangyang3@huawei.com>,
	<huangxiaojia2@huawei.com>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [RFC PATCH mtd-utils 100/110] tests: ubifs_tools: fsck_tests: Add authentication refusing test
Date: Fri, 7 Jun 2024 12:26:05 +0800
Message-ID: <20240607042615.2069840-101-chengzhihao1@huawei.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240607042615.2069840-1-chengzhihao1@huawei.com>
References: <20240607042615.2069840-1-chengzhihao1@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.104.67]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemm600013.china.huawei.com (7.193.23.68)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240607_053023_005419_ECCA7E88 
X-CRM114-Status: GOOD (  10.97  )
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
index d32541a1..160fa812 100644
--- a/configure.ac
+++ b/configure.ac
@@ -290,7 +290,8 @@ AC_CONFIG_FILES([tests/fs-tests/fs_help_all.sh
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
