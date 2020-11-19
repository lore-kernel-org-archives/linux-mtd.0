Return-Path: <SRS0=mdPP=EZ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6191FC2D0E4
	for <linux-mtd@archiver.kernel.org>; Thu, 19 Nov 2020 14:20:06 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DFB6F22256
	for <linux-mtd@archiver.kernel.org>; Thu, 19 Nov 2020 14:20:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="N+krOvFT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DFB6F22256
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=k5he5PyOuykgWozF+yQ3GRRXtHmsHyj4a61OKdhgUaE=; b=N+krOvFTPHDx64a08UlpMF57E
	uK4mTggAKS13yIFaK/xe4q0G8V4tB8i1SgFfM9hbEu9oPGapRKR4BHxP1VmY/tPBzJd8FDSuO+1Ng
	LezBu34y540/A/n/ks5Jlvm5INrPAZPmBzurOd7W0FGe+yLLoatRMV08cJlngXGbQ0uZa4Ny6sqTN
	ndr8ICvaiIimOvYPtgU8Feh/F0mkL8yhOii/jxvJ1FiXuBFYobzoGktKMlDf4kDlqnJNs130bQXdB
	+7ei1BjiKLO2WHhqogz9WHVSEkH1Wp5+pP2nyl9vKAYEQYlWOIGi2A3VQzeLXFODg3PrQoW3Q9AZv
	OFROfGXMQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kfkly-0003PQ-Jv; Thu, 19 Nov 2020 14:18:54 +0000
Received: from lilium.sigma-star.at ([109.75.188.150])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kfklh-0003JH-0M
 for linux-mtd@lists.infradead.org; Thu, 19 Nov 2020 14:18:39 +0000
Received: from localhost (localhost [127.0.0.1])
 by lilium.sigma-star.at (Postfix) with ESMTP id 898CF181C8900;
 Thu, 19 Nov 2020 15:18:26 +0100 (CET)
Received: from lilium.sigma-star.at ([127.0.0.1])
 by localhost (lilium.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id 7yQ7veX_WR98; Thu, 19 Nov 2020 15:18:26 +0100 (CET)
Received: from lilium.sigma-star.at ([127.0.0.1])
 by localhost (lilium.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id Dx73T873WR7e; Thu, 19 Nov 2020 15:18:26 +0100 (CET)
From: Richard Weinberger <richard@nod.at>
To: miklos@szeredi.hu
Subject: [PATCH 1/5] fuse: Rename FUSE_DIO_CUSE
Date: Thu, 19 Nov 2020 15:16:55 +0100
Message-Id: <20201119141659.26176-2-richard@nod.at>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201119141659.26176-1-richard@nod.at>
References: <20201119141659.26176-1-richard@nod.at>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201119_091837_350123_337BA268 
X-CRM114-Status: GOOD (  13.02  )
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
Cc: vigneshr@ti.com, Richard Weinberger <richard@nod.at>,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 miquel.raynal@bootlin.com, linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

MUSE needs to use this flag too, rename it to
FUSE_DIO_NOFS to denote that the DIO operation has no FUSE backed
inode.

Signed-off-by: Richard Weinberger <richard@nod.at>
---
 fs/fuse/cuse.c   | 4 ++--
 fs/fuse/file.c   | 4 ++--
 fs/fuse/fuse_i.h | 4 ++--
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/fs/fuse/cuse.c b/fs/fuse/cuse.c
index 45082269e698..55744430b0f0 100644
--- a/fs/fuse/cuse.c
+++ b/fs/fuse/cuse.c
@@ -96,7 +96,7 @@ static ssize_t cuse_read_iter(struct kiocb *kiocb, struct iov_iter *to)
 	struct fuse_io_priv io = FUSE_IO_PRIV_SYNC(kiocb);
 	loff_t pos = 0;
 
-	return fuse_direct_io(&io, to, &pos, FUSE_DIO_CUSE);
+	return fuse_direct_io(&io, to, &pos, FUSE_DIO_NOFS);
 }
 
 static ssize_t cuse_write_iter(struct kiocb *kiocb, struct iov_iter *from)
@@ -108,7 +108,7 @@ static ssize_t cuse_write_iter(struct kiocb *kiocb, struct iov_iter *from)
 	 * responsible for locking and sanity checks.
 	 */
 	return fuse_direct_io(&io, from, &pos,
-			      FUSE_DIO_WRITE | FUSE_DIO_CUSE);
+			      FUSE_DIO_WRITE | FUSE_DIO_NOFS);
 }
 
 static int cuse_open(struct inode *inode, struct file *file)
diff --git a/fs/fuse/file.c b/fs/fuse/file.c
index c03034e8c152..697e79032c73 100644
--- a/fs/fuse/file.c
+++ b/fs/fuse/file.c
@@ -1409,7 +1409,7 @@ ssize_t fuse_direct_io(struct fuse_io_priv *io, struct iov_iter *iter,
 		       loff_t *ppos, int flags)
 {
 	int write = flags & FUSE_DIO_WRITE;
-	int cuse = flags & FUSE_DIO_CUSE;
+	int nofs = flags & FUSE_DIO_NOFS;
 	struct file *file = io->iocb->ki_filp;
 	struct inode *inode = file->f_mapping->host;
 	struct fuse_file *ff = file->private_data;
@@ -1430,7 +1430,7 @@ ssize_t fuse_direct_io(struct fuse_io_priv *io, struct iov_iter *iter,
 		return -ENOMEM;
 
 	ia->io = io;
-	if (!cuse && fuse_range_is_writeback(inode, idx_from, idx_to)) {
+	if (!nofs && fuse_range_is_writeback(inode, idx_from, idx_to)) {
 		if (!write)
 			inode_lock(inode);
 		fuse_sync_writes(inode);
diff --git a/fs/fuse/fuse_i.h b/fs/fuse/fuse_i.h
index d51598017d13..637caddff2a8 100644
--- a/fs/fuse/fuse_i.h
+++ b/fs/fuse/fuse_i.h
@@ -1140,8 +1140,8 @@ int fuse_do_open(struct fuse_mount *fm, u64 nodeid, struct file *file,
 /** If set, it is WRITE; otherwise - READ */
 #define FUSE_DIO_WRITE (1 << 0)
 
-/** CUSE pass fuse_direct_io() a file which f_mapping->host is not from FUSE */
-#define FUSE_DIO_CUSE  (1 << 1)
+/** CUSE and MUSE pass fuse_direct_io() a file which f_mapping->host is not from FUSE */
+#define FUSE_DIO_NOFS  (1 << 1)
 
 ssize_t fuse_direct_io(struct fuse_io_priv *io, struct iov_iter *iter,
 		       loff_t *ppos, int flags);
-- 
2.26.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
