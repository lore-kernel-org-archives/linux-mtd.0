Return-Path: <SRS0=vxLv=FX=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34B2DC4361B
	for <linux-mtd@archiver.kernel.org>; Sat, 19 Dec 2020 08:59:05 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 941CC23B84
	for <linux-mtd@archiver.kernel.org>; Sat, 19 Dec 2020 08:59:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 941CC23B84
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=damenly.su
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=EnAxK0X9g43BwAKTBLtgICTBBoNve29k1/1PDWamxzc=; b=cQ8fBbXHOA2EueW0IMDaBx8VHW
	bOdCEq8H4lBpqDYs73RnrNafZAIctkl1yLKRIfJfBYKniHlnWHnPVr0kDQ/9pQxMZRrChSSzjII45
	jfnwNWUhVlE/RydFjcGLNI2+vRCh/HLnOr1p5NrouN+4Gl1ZoPuDrw0Dyuo2Ovp+zITdjEhBAEMVn
	J0bRF5V5oN/KaVMe27N1MkpRPjkJ3A1bmXAAPjR7o3d5OKqh56RQZtbRsSDqIcj+tOrm+TBIgNvwc
	54kRQNVWgBMtfXtdDPsG/qr9FZD1RPrvhLvUlOHNbGWcXwRBtld3d6iKqwD6HO/wFzjmY4KcOkKSg
	JsrwZQvg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kqY3j-0000Zx-S8; Sat, 19 Dec 2020 08:57:51 +0000
Received: from eu-shark1.inbox.eu ([195.216.236.81])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kqY3f-0000ZP-LR
 for linux-mtd@lists.infradead.org; Sat, 19 Dec 2020 08:57:49 +0000
Received: from eu-shark1.inbox.eu (localhost [127.0.0.1])
 by eu-shark1-out.inbox.eu (Postfix) with ESMTP id 8C0A36C00751;
 Sat, 19 Dec 2020 10:57:39 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=inbox.eu; s=20140211;
 t=1608368259; bh=bA6Opc/bHiS0/mcvzx5Q+X9Y7wqZHP7d52fIofZOCvU=;
 h=From:To:Cc:Subject:Date;
 b=MMz2pOgbH1duhU52iWbqbFzS3nVwE9BUNX0Iuaz46cFqFjwCYNfWHoqlhSN/nMTXU
 j5ma8OYDObL7Q/ZQw4YZZdEt530eXSWipB/wkIqCDx6LZ/pPyOhSzZMlx31OM6PT0J
 ff5kvrc828CRuwCxQ8YqIlLeWliOtU55l5Ghy+5M=
Received: from localhost (localhost [127.0.0.1])
 by eu-shark1-in.inbox.eu (Postfix) with ESMTP id 79A2F6C0072E;
 Sat, 19 Dec 2020 10:57:39 +0200 (EET)
Received: from eu-shark1.inbox.eu ([127.0.0.1])
 by localhost (eu-shark1.inbox.eu [127.0.0.1]) (spamfilter, port 35)
 with ESMTP id MMsrua-6x-2B; Sat, 19 Dec 2020 10:57:39 +0200 (EET)
Received: from mail.inbox.eu (eu-pop1 [127.0.0.1])
 by eu-shark1-in.inbox.eu (Postfix) with ESMTP id EA2EC6C00606;
 Sat, 19 Dec 2020 10:57:38 +0200 (EET)
Received: from localhost.localdomain (unknown [45.87.95.238])
 (Authenticated sender: l@damenly.su)
 by mail.inbox.eu (Postfix) with ESMTPA id 13EC21BE0094;
 Sat, 19 Dec 2020 10:57:34 +0200 (EET)
From: Su Yue <l@damenly.su>
To: fstests@vger.kernel.org
Subject: [PATCH] shared/032: add options for jffs2
Date: Sat, 19 Dec 2020 16:57:24 +0800
Message-Id: <20201219085724.25780-1-l@damenly.su>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
X-Virus-Scanned: OK
X-ESPOL: +d1m7upSaUCpygHhXxmtCAUr1kpEWOj78+Ck2RhHnnjyLUzwc0kLUBG1lW93SXqk
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201219_035747_938411_23E59441 
X-CRM114-Status: GOOD (  10.97  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: l@damenly.su, linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Recently I found that my disk space was eaten by results/shared/032.full
after one round of xfstests running. The file was filled with binary
bytes by the command:
`mkfs -t jffs2 /dev/mapper/test-2 >> results/shared/032.full 2>&1`

Manual of mkfs.jffs2:
========================================================================
The program mkfs.jffs2 creates a JFFS2 (Second Journalling Flash
File System) file system image and writes the resulting image to the
file specified by the -o option or by default to the standard output,
unless the standard output is a terminal device in which case mkfs.jffs2
will abort. The file system image is created using the files and
directories contained in the directory specified by the option -r or
the present directory, if the -r option is not specified.
========================================================================

So the command equals to
`mkfs -t jffs2 -r xfstests-dev /dev/mapper/test-2 \
    -o results/shared/032.full >> results/shared/032.full 2>&1`

The output image 032.full is under the directory xfstests-dev.
mkfs.jffs2 keeps reading from 032.full in page size and append bytes
to 032.full until the disk where xfstests-devel located is full.

Fix it by setting @preargs to '-r /proc/fs -o' for jffs2, now the output
is $SCRATCH_DEV. Since mkfs.jffs2 doesn't check overwrite case, just
skip overwrite attempt.

Signed-off-by: Su Yue <l@damenly.su>
---
 tests/shared/032 | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/tests/shared/032 b/tests/shared/032
index 00ae6860d9d5..5da606177440 100755
--- a/tests/shared/032
+++ b/tests/shared/032
@@ -55,6 +55,8 @@ do
 	[ $fs = ext3 ] && preargs="-F"
 	[ $fs = ext4 ] && preargs="-F"
 	[ $fs = ext4dev ] && preargs="-F"
+	# jffs2 mkfs requires '-r $directory' and '-o $image'
+	[ $fs = jffs2 ] && preargs="-r /proc/fs -o"
 
 	# overwite the first few Kb - should blow away superblocks
 	$here/src/devzero -n 20 $SCRATCH_DEV >/dev/null
@@ -66,6 +68,9 @@ do
 
 	if [ $? -eq 0 ] ; then
 		# next, ensure we don't overwrite it
+		# jffs mkfs don't check overwrite case
+		[ $fs = jffs2 ] && continue
+
 		echo "=== Attempting $FSTYP overwrite of $fs..." >>$seqres.full
 		${MKFS_PROG} -t $FSTYP $SCRATCH_DEV >>$seqres.full 2>&1
 
-- 
2.29.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
