Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F613C47079
	for <linux-mtd@archiver.kernel.org>; Thu, 28 Dec 2023 01:34:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TgqNdU0wGfozV6sAr2vHw9AEQaeUGaPamYouj4j4Ut0=; b=P+f00m6ctwUN/8
	2xolz0TwIL7dfSoF0TCoKb4uu8U1l/iS5dhlqYTvdexuh60sCjiujTrjIk8Nul8rrAMlSDIfRVHZk
	ozugWfhpT28jrV36TO6h5b5AbdgBE7BoMLJv6kDpEkPZMdlTAMFm2LmOhJalBLrTO1AB/RBfXdySz
	yEiNoj998VEJFXgXyu+r+V0YhmYJt1V1MeFSBujm3iLfnUjlj2QmlKUVCFaBNIiUtespBPZPtJ7O1
	OUkyH6gXML2PfY1TAvueE4kHyKFOhnmhCC2kvdjBI3oEy53qMKFw3HEz/7XvGoEsNcWVaNOPVlBHU
	Eef6Q4JHrJP9xC57jCag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rIfHZ-00Fo3d-0J;
	Thu, 28 Dec 2023 01:33:57 +0000
Received: from szxga04-in.huawei.com ([45.249.212.190])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rIfHQ-00Fnzm-0E
	for linux-mtd@lists.infradead.org;
	Thu, 28 Dec 2023 01:33:52 +0000
Received: from mail.maildlp.com (unknown [172.19.163.44])
	by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4T0rbK2BGFz29dNf;
	Thu, 28 Dec 2023 09:32:13 +0800 (CST)
Received: from kwepemm000013.china.huawei.com (unknown [7.193.23.81])
	by mail.maildlp.com (Postfix) with ESMTPS id 82ABD140120;
	Thu, 28 Dec 2023 09:33:33 +0800 (CST)
Received: from huawei.com (10.175.127.227) by kwepemm000013.china.huawei.com
 (7.193.23.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 28 Dec
 2023 09:33:32 +0800
From: Zhihao Cheng <chengzhihao1@huawei.com>
To: <david.oberhollenzer@sigma-star.at>, <richard@nod.at>,
	<miquel.raynal@bootlin.com>, <s.hauer@pengutronix.de>,
	<Tudor.Ambarus@linaro.org>
CC: <linux-kernel@vger.kernel.org>, <linux-mtd@lists.infradead.org>
Subject: [PATCH mtd-utils 01/11] tests: Add common libs for ubifs_repair test
Date: Thu, 28 Dec 2023 09:36:29 +0800
Message-ID: <20231228013639.2827205-2-chengzhihao1@huawei.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20231228013639.2827205-1-chengzhihao1@huawei.com>
References: <20231228013639.2827205-1-chengzhihao1@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.127.227]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemm000013.china.huawei.com (7.193.23.81)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231227_173348_504416_1D249511 
X-CRM114-Status: GOOD (  17.93  )
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

This is a preparation for adding ubifs_repair testcases. Add some common
functions, for example: powercut, load_mtdram, mount_ubifs, encryption
operations, etc.

Signed-off-by: Zhihao Cheng <chengzhihao1@huawei.com>
---
 .gitignore                                |   1 +
 Makefile.am                               |   1 +
 configure.ac                              |   3 +-
 tests/ubifs_repair-tests/Makemodule.am    |   2 +
 tests/ubifs_repair-tests/lib/common.sh.in | 347 ++++++++++++++++++++++++++++++
 5 files changed, 353 insertions(+), 1 deletion(-)
 create mode 100644 tests/ubifs_repair-tests/Makemodule.am
 create mode 100755 tests/ubifs_repair-tests/lib/common.sh.in

diff --git a/.gitignore b/.gitignore
index 8c51ee5..c811883 100644
--- a/.gitignore
+++ b/.gitignore
@@ -112,6 +112,7 @@ tests/fs-tests/stress/fs_stress00.sh
 tests/fs-tests/stress/fs_stress01.sh
 tests/ubi-tests/runubitests.sh
 tests/ubi-tests/ubi-stress-test.sh
+tests/ubifs_repair-tests/lib/common.sh
 
 #
 # Files generated by autotools
diff --git a/Makefile.am b/Makefile.am
index dd14d96..1454233 100644
--- a/Makefile.am
+++ b/Makefile.am
@@ -63,6 +63,7 @@ include tests/jittertest/Makemodule.am
 include tests/checkfs/Makemodule.am
 include tests/fs-tests/Makemodule.am
 include tests/mtd-tests/Makemodule.am
+include tests/ubifs_repair-tests/Makemodule.am
 endif
 
 if UNIT_TESTS
diff --git a/configure.ac b/configure.ac
index cd48bb0..d3d3589 100644
--- a/configure.ac
+++ b/configure.ac
@@ -354,6 +354,7 @@ AC_CONFIG_FILES([tests/fs-tests/fs_help_all.sh
 	tests/fs-tests/stress/fs_stress00.sh
 	tests/fs-tests/stress/fs_stress01.sh
 	tests/ubi-tests/runubitests.sh
-	tests/ubi-tests/ubi-stress-test.sh])
+	tests/ubi-tests/ubi-stress-test.sh
+	tests/ubifs_repair-tests/lib/common.sh])
 
 AC_OUTPUT([Makefile])
diff --git a/tests/ubifs_repair-tests/Makemodule.am b/tests/ubifs_repair-tests/Makemodule.am
new file mode 100644
index 0000000..caa503d
--- /dev/null
+++ b/tests/ubifs_repair-tests/Makemodule.am
@@ -0,0 +1,2 @@
+test_SCRIPTS += \
+	tests/ubifs_repair-tests/lib/common.sh
diff --git a/tests/ubifs_repair-tests/lib/common.sh.in b/tests/ubifs_repair-tests/lib/common.sh.in
new file mode 100755
index 0000000..656b609
--- /dev/null
+++ b/tests/ubifs_repair-tests/lib/common.sh.in
@@ -0,0 +1,347 @@
+#!/bin/sh
+# Copyright (c), 2023-2024, Huawei Technologies Co, Ltd.
+# Author: Zhihao Cheng <chengzhihao1@huawei.com>
+#
+# Provide basic functions.
+# Notice, all loaded modules(mtdram/nandsim/ubi/ubifs) won't be removed
+# if errors occur, it is useful to debug on problem ubifs image.
+
+UBI_NUM=0
+DEV=/dev/ubi0_0
+MNT=/mnt/test_file_system
+TMP_FILE=/tmp/ubi_test_file
+KEY_FILE=/tmp/key
+nandsim_patt="NAND simulator"
+mtdram_patt="mtdram test device"
+
+function fatal()
+{
+	echo "Error: $1" 1>&2
+	exit 1
+}
+
+function cleanup_handler()
+{
+	local ret="$1"
+
+	# Below is magic to exit with correct exit code
+	if [ "$ret" == "0" ]; then
+		umount $MNT >/dev/null 2>&1 ||:
+		modprobe -r ubifs >/dev/null 2>&1 ||:
+		modprobe -r ubi >/dev/null 2>&1 ||:
+		modprobe -r nandsim >/dev/null 2>&1 ||:
+		modprobe -r mtdram >/dev/null 2>&1  ||:
+		exit 0
+	else
+		exit 1
+	fi
+}
+trap 'cleanup_handler $?' EXIT
+trap 'cleanup_handler 1' HUP PIPE INT QUIT TERM
+
+function find_mtd_device()
+{
+	printf "%s" "$(grep "$1" /proc/mtd | sed -e "s/^mtd\([0-9]\+\):.*$/\1/")"
+}
+
+function powercut()
+{
+	dmesg -c > /dev/null
+	echo 1 > /sys/kernel/debug/ubifs/tst_recovery;
+	while true;
+	do
+		msg=`dmesg -c | grep "Power cut emulated"`;
+		if [[ "$msg" != "" ]];
+		then
+			break;
+		fi
+	done
+	echo 0 > /sys/kernel/debug/ubifs/tst_recovery
+}
+
+# Load mtdram with specified size and PEB size
+# Usage: load_mtdram <flash size> <PEB size>
+# 1. Flash size is specified in MiB
+# 2. PEB size is specified in KiB
+function load_mtdram()
+{
+	local size="$1";     shift
+	local peb_size="$1"; shift
+
+	size="$(($size * 1024))"
+	modprobe mtdram total_size="$size" erase_size="$peb_size"
+}
+
+function check_fsstress()
+{
+	cmd=`fsstress | grep "op_name"`
+	if ! [[ "$cmd" =~ "op_name" ]]; then
+		fatal "fsstress is not found"
+	fi
+}
+
+# Check error messages
+function check_err_msg()
+{
+	msg=`dmesg | grep -E "dump_stack|UBIFS error|switched to read-only mode"`;
+	if [[ "$msg" != "" ]]
+	then
+		dmesg
+		fatal "error message detected!"
+	fi
+	dmesg -c > /dev/null
+}
+
+# Check memleak
+function check_memleak()
+{
+	# CONFIG_DEBUG_KMEMLEAK=y
+	if ! [ -f /sys/kernel/debug/kmemleak ]; then
+		echo "kmemleak is not enabled, skip checking"
+		return;
+	fi
+
+	echo scan > /sys/kernel/debug/kmemleak
+	memleak=`cat /sys/kernel/debug/kmemleak`
+	if [[ "$memleak" != "" ]]; then
+		echo $memleak
+		fatal "kmemleak detected!"
+	fi
+}
+
+# Iterate all files under certain dir
+# $1: dir
+# $2: "md5sum" means that need record md5 for regular file, otherwise don't record md5 for regular file
+function read_dir() {
+	for file in `ls -a $1`
+	do
+		cur_f=$1"/"$file
+		if [ -b $cur_f ]
+		then
+			major=`stat -c %t $cur_f`
+			minor=`stat -c %T $cur_f`
+			echo "block $cur_f $major $minor" >> $TMP_FILE
+		elif [ -c $cur_f ]
+		then
+			major=`stat -c %t $cur_f`
+			minor=`stat -c %T $cur_f`
+			echo "char $cur_f $major $minor" >> $TMP_FILE
+		elif [ -L $cur_f ]
+		then
+			link=`stat -c %N $cur_f`
+			echo "symlink $cur_f $link" >> $TMP_FILE
+		elif [ -S $cur_f ]
+		then
+			echo "sock $cur_f" >> $TMP_FILE
+		elif [ -p $cur_f ]
+		then
+			echo "fifo $cur_f" >> $TMP_FILE
+		elif [ -f $cur_f ]
+		then
+			sz=`stat -c %s $cur_f`
+			if [[ "$2" != "md5sum" ]]; then
+				echo "reg $cur_f $sz" >> $TMP_FILE
+			else
+				md5=`md5sum $cur_f | awk '{print $1}'`
+				echo "reg $cur_f $md5 $sz" >> $TMP_FILE
+			fi
+		elif [ -d $cur_f ]
+		then
+			if [[ $file != '.' && $file != '..' ]]
+			then
+				echo "dir $cur_f" >> $TMP_FILE
+				read_dir $1"/"$file $2
+			fi
+		else
+			fatal "record unknown file type $cur_f"
+		fi
+	done
+}
+
+# Check whether there are files lost after repairing UBIFS
+# $1: "md5sum" means need record md5 for regular file, otherwise don't record md5 for regular file
+function parse_dir()
+{
+	while read line
+	do
+		array=(${line//\ / });
+		f_type=${array[0]};
+		cur_f=${array[1]};
+		cur_info=""
+		if [[ "$f_type" =~ "block" ]]
+		then
+			major=`stat -c %t $cur_f`
+			minor=`stat -c %T $cur_f`
+			cur_info="block $cur_f $major $minor"
+		elif [[ "$f_type" =~ "char" ]]
+		then
+			major=`stat -c %t $cur_f`
+			minor=`stat -c %T $cur_f`
+			cur_info="char $cur_f $major $minor"
+		elif [[ "$f_type" =~ "symlink" ]]
+		then
+			link=`stat -c %N $cur_f`
+			cur_info="symlink $cur_f $link"
+		elif [[ "$f_type" =~ "sock" ]]
+		then
+			cur_info="sock $cur_f"
+		elif [[ "$f_type" =~ "fifo" ]]
+		then
+			cur_info="fifo $cur_f"
+		elif [[ "$f_type" =~ "reg" ]]
+		then
+			sz=`stat -c %s $cur_f`
+			if [[ "$1" != "md5sum" ]]; then
+				cur_info="reg $cur_f $sz"
+			else
+				md5=`md5sum $cur_f | awk '{print $1}'`
+				cur_info="reg $cur_f $md5 $sz"
+			fi
+		elif [[ "$f_type" =~ "dir" ]]
+		then
+			cur_info="dir $cur_f"
+		else
+			fatal "parse unknown file type $cur_f"
+		fi
+		if [[ "$cur_info" != "$line" ]]
+		then
+			fatal "current info $cur_info, but expect $line"
+		fi
+	done < $TMP_FILE
+}
+
+function authentication()
+{
+	keyctl clear @s
+	res=$?
+	if [[ $res != 0 ]]; then
+		fatal "keyctl is not found"
+	fi
+	keyctl add logon ubifs:foo 12345678901234567890123456789012 @s
+}
+
+function encryption_gen_key()
+{
+	# CONFIG_FS_ENCRYPTION=y
+	head -c 64 /dev/urandom > $KEY_FILE
+	cmd=`fscryptctl -h | grep "set_policy"`
+	if ! [[ "$cmd" =~ "set_policy" ]]; then
+		fatal "fscryptctl is not found"
+	fi
+}
+
+function encryption_set_key()
+{
+	mnt=$1
+	# https://github.com/google/fscryptctl
+	key=$(fscryptctl add_key $mnt < $KEY_FILE)
+	fscryptctl set_policy $key $mnt
+	#fscryptctl get_policy $mnt
+	ret=$?
+	if [[ $ret != 0 ]]; then
+		fatal "set encryption policy failed"
+	fi
+}
+
+function mount_ubifs()
+{
+	dev=$1
+	mnt=$2
+	auth=$3
+	if [[ "$auth" == "authentication" ]]; then
+		authentication
+		mount -t ubifs -o auth_key=ubifs:foo,auth_hash_name=sha256 $dev $mnt
+	else
+		mount -t ubifs $dev $mnt
+	fi
+}
+
+function enable_chkfs()
+{
+	echo 1 > /sys/kernel/debug/ubifs/chk_fs
+	echo 1 > /sys/kernel/debug/ubifs/chk_general
+	echo 1 > /sys/kernel/debug/ubifs/chk_index
+	echo 1 > /sys/kernel/debug/ubifs/chk_lprops
+	echo 1 > /sys/kernel/debug/ubifs/chk_orphans
+}
+
+function disable_chkfs()
+{
+	echo 0 > /sys/kernel/debug/ubifs/chk_fs
+	echo 0 > /sys/kernel/debug/ubifs/chk_general
+	echo 0 > /sys/kernel/debug/ubifs/chk_index
+	echo 0 > /sys/kernel/debug/ubifs/chk_lprops
+	echo 0 > /sys/kernel/debug/ubifs/chk_orphans
+}
+
+function inject_mem_err()
+{
+	# CONFIG_FAILSLAB=y
+	# CONFIG_FAIL_PAGE_ALLOC=y
+	local pid=$1;
+
+	if ! [ -f /sys/kernel/debug/failslab/probability ]; then
+		fatal "failslab is not enabled, injection failed"
+	fi
+	if ! [ -f /sys/kernel/debug/fail_page_alloc/probability ]; then
+		fatal "fail_page_alloc is not enabled, injection failed"
+	fi
+
+	echo 1 > /proc/$pid/make-it-fail
+
+	echo Y > /sys/kernel/debug/failslab/task-filter
+	echo 1 > /sys/kernel/debug/failslab/probability # 1% failure
+	echo 10000 > /sys/kernel/debug/failslab/times
+	echo 1 > /sys/kernel/debug/failslab/verbose
+	echo N > /sys/kernel/debug/failslab/ignore-gfp-wait
+
+	echo Y > /sys/kernel/debug/fail_page_alloc/task-filter
+	echo 1 > /sys/kernel/debug/fail_page_alloc/probability
+	echo 10000 > /sys/kernel/debug/fail_page_alloc/times
+	echo 0 > /sys/kernel/debug/fail_page_alloc/verbose
+	echo N > /sys/kernel/debug/fail_page_alloc/ignore-gfp-wait
+}
+
+function cancel_mem_err()
+{
+	echo 0 > /sys/kernel/debug/failslab/probability
+	echo 0 > /sys/kernel/debug/failslab/times
+	echo 0 > /sys/kernel/debug/failslab/verbose
+	echo N > /sys/kernel/debug/failslab/task-filter
+	echo Y > /sys/kernel/debug/failslab/ignore-gfp-wait
+
+	echo 0 > /sys/kernel/debug/fail_page_alloc/probability
+	echo 0 > /sys/kernel/debug/fail_page_alloc/times
+	echo 1 > /sys/kernel/debug/fail_page_alloc/verbose
+	echo N > /sys/kernel/debug/fail_page_alloc/task-filter
+	echo Y > /sys/kernel/debug/fail_page_alloc/ignore-gfp-wait
+}
+
+function inject_io_err()
+{
+	if ! [ -f /sys/kernel/debug/ubi/ubi$UBI_NUM/tst_emulate_io_failures ]; then
+		fatal "tst_emulate_io_failures is not enabled, skip injection"
+	fi
+
+	echo 1 > /sys/kernel/debug/ubi/ubi$UBI_NUM/tst_emulate_io_failures
+}
+
+function cancel_io_err()
+{
+	echo 0 > /sys/kernel/debug/ubi/ubi$UBI_NUM/tst_emulate_io_failures
+}
+
+sysctl -w kernel.panic_on_warn=1
+sysctl -w kernel.panic_on_oops=1
+
+if ! [ -d $MNT ]; then
+	mkdir -p $MNT
+fi
+
+modprobe ubi || fatal "common.sh: cannot load ubi"
+modprobe ubifs || fatal "common.sh: cannot load ubifs"
+if ! [ -f /sys/kernel/debug/ubifs/repair_fs ]; then
+	fatal "common.sh: ubifs_repair is not supported"
+fi
+modprobe -r ubifs
+modprobe -r ubi
-- 
2.13.6


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
