Return-Path: <SRS0=vxLv=FX=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F02B5C0018C
	for <linux-mtd@archiver.kernel.org>; Sat, 19 Dec 2020 09:12:14 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A42C623BE2
	for <linux-mtd@archiver.kernel.org>; Sat, 19 Dec 2020 09:12:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A42C623BE2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=damenly.su
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=2HRHsUMLAMz0OQ6w+WeOn4n49QY6x2I+e6SMIuywB74=; b=cAkqKIp7HgKvln9D1wtoEj0vf6
	xOnRklj34dXgmU62AjHwkowQiTyEDE7vc5C6XS2n+KcEUej4uk5RWz6vqitAeoIf56qz3ALrhFOkw
	KEFyysJNicH/mfiGxZ8Mo0QijD7XcVqjHe2al909No+ECYLmDDsV1GcY0jy5LE5osr7wrlWGwL3Zf
	5Xy9YD2yk2e8L2rb013E1Gegr8M59E6glx0ms0/Ag/MFaVsLpFNYHFsacpRBu/HhbEoBQGSJKQWHI
	nmKy/J0hqN4rTJRQj2L7C3gYEuO6CMu7FDaho6PVHQlK7ox600IUAaEHfbfUj6OrRSjNocmIh1sqm
	30ImQ5kg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kqYGg-0001Kw-Mj; Sat, 19 Dec 2020 09:11:14 +0000
Received: from eu-shark1.inbox.eu ([195.216.236.81])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kqYGe-0001Kb-GO
 for linux-mtd@lists.infradead.org; Sat, 19 Dec 2020 09:11:13 +0000
Received: from eu-shark1.inbox.eu (localhost [127.0.0.1])
 by eu-shark1-out.inbox.eu (Postfix) with ESMTP id 5EAB66C00781;
 Sat, 19 Dec 2020 11:11:11 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=inbox.eu; s=20140211;
 t=1608369071; bh=9Qiuyis32ZgrNgXBpCGhfBqxbOpZ+gNJ9BfYCkqdJcw=;
 h=From:To:Cc:Subject:Date;
 b=Kp1JluowjQ5t08A0B/WbcLHfgnpM8VEazWpoyUtJ2QTnCM1ti6I1yrpck+iqu9pjF
 YlujZBrszjC4ozk6XjoAvSsnDHZ5oc/GKfGMPTfufk9BQIUqp/4LNV+RDEI9zI8bfe
 vSWusHf0VgxXcxIWX/ucnOJaJI3+DNde4V5oij2c=
Received: from localhost (localhost [127.0.0.1])
 by eu-shark1-in.inbox.eu (Postfix) with ESMTP id 50DD36C00772;
 Sat, 19 Dec 2020 11:11:11 +0200 (EET)
Received: from eu-shark1.inbox.eu ([127.0.0.1])
 by localhost (eu-shark1.inbox.eu [127.0.0.1]) (spamfilter, port 35)
 with ESMTP id MabOrzD9QT-M; Sat, 19 Dec 2020 11:11:11 +0200 (EET)
Received: from mail.inbox.eu (eu-pop1 [127.0.0.1])
 by eu-shark1-in.inbox.eu (Postfix) with ESMTP id D9F2B6C00770;
 Sat, 19 Dec 2020 11:11:10 +0200 (EET)
Received: from localhost.localdomain (unknown [45.87.95.238])
 (Authenticated sender: l@damenly.su)
 by mail.inbox.eu (Postfix) with ESMTPA id 90DA91BE0094;
 Sat, 19 Dec 2020 11:11:08 +0200 (EET)
From: Su Yue <l@damenly.su>
To: fstests@vger.kernel.org
Subject: [PATCH v2] shared/032: add options for jffs2
Date: Sat, 19 Dec 2020 17:10:58 +0800
Message-Id: <20201219091058.26422-1-l@damenly.su>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
X-Virus-Scanned: OK
X-ESPOL: 6NpmlYxOGzysiV+lRWetdgtNzzY6IuClpKemqX1UmH7kOSmad00TUhO/gQ4FQH+k
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201219_041112_681546_62B19DAF 
X-CRM114-Status: GOOD (  11.15  )
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
    -o xfstests-dev/results/shared/032.full \
    >>xfstests-dev/results/shared/032.full 2>&1`

The output image 032.full is under the directory xfstests-dev.
mkfs.jffs2 keeps reading from 032.full in page size and append bytes
to 032.full until the disk where xfstests-devel located is full.

Fix it by setting @preargs to '-r /proc/fs -o' for jffs2, now the output
is $SCRATCH_DEV. Since mkfs.jffs2 doesn't check overwrite case, just
skip overwrite attempt.

Signed-off-by: Su Yue <l@damenly.su>
---
v2:
  Fix typos in comment.
  Fix path of results/shared/032.full in commit message.
---
 tests/shared/032 | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/tests/shared/032 b/tests/shared/032
index 00ae6860d9d5..9836f13a691b 100755
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
+		# jffs2 mkfs doesn't check overwrite case
+		[ $fs = jffs2 ] && continue
+
 		echo "=== Attempting $FSTYP overwrite of $fs..." >>$seqres.full
 		${MKFS_PROG} -t $FSTYP $SCRATCH_DEV >>$seqres.full 2>&1
 
-- 
2.29.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
