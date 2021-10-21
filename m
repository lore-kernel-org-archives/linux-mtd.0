Return-Path: <SRS0=KyYR=PJ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C52AC433F5
	for <linux-mtd@archiver.kernel.org>; Thu, 21 Oct 2021 12:45:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 13EEF60F02
	for <linux-mtd@archiver.kernel.org>; Thu, 21 Oct 2021 12:45:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 13EEF60F02
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=a6vYkj3V73RCV59KBhgIga36RM0Zj6FE72djzrBuBmQ=; b=WDQzQR+ud/Xknq
	OuKVgzO/UW0MSxe+Kh/bPjWY9FoAqoVDiIofYC4/HeAcrDkxCQ8zvbIyUAifNcwQ88rvtXRi4gaUL
	33x84YUguUJzr0ndYMCOeEaaUZNNZ/MHqzFE7f50esBZyVx/U1sYKNxSkjrHl3fBMQC7uHxcKSBE1
	5Mnkj703HCNgwAJ/828p2LTkx8REe1hwUTOr0VYT0sOzW2l3QZHtLMPrgT7G4FeFhMcqU4ISHbFIv
	y815uC07i3pqkXgW2qTRKfe9IfQij/q5ykrtcv5zkT7CW6YGpjWtDNQ63Ppzlk/sHtodzkj0vWRbS
	3ihLBHiFEABRURZywUyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mdXRn-007XCB-CT; Thu, 21 Oct 2021 12:45:27 +0000
Received: from [2001:4bb8:180:8777:dd70:8011:36d9:4c23] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mdXRG-007Wyx-5f; Thu, 21 Oct 2021 12:44:54 +0000
From: Christoph Hellwig <hch@lst.de>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Jan Kara <jack@suse.cz>, linux-mtd@lists.infradead.org,
 linux-fsdevel@vger.kernel.org, linux-mm@kvack.org
Subject: [PATCH 3/5] fs: explicitly unregister per-superblock BDIs
Date: Thu, 21 Oct 2021 14:44:39 +0200
Message-Id: <20211021124441.668816-4-hch@lst.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211021124441.668816-1-hch@lst.de>
References: <20211021124441.668816-1-hch@lst.de>
MIME-Version: 1.0
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

Add a new SB_I_ flag to mark superblocks that have an ephemeral bdi
associated with them, an unregister it when the superblock is shut down.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 fs/super.c         | 3 +++
 include/linux/fs.h | 1 +
 2 files changed, 4 insertions(+)

diff --git a/fs/super.c b/fs/super.c
index bcef3a6f4c4b5..3bfc0f8fbd5bc 100644
--- a/fs/super.c
+++ b/fs/super.c
@@ -476,6 +476,8 @@ void generic_shutdown_super(struct super_block *sb)
 	spin_unlock(&sb_lock);
 	up_write(&sb->s_umount);
 	if (sb->s_bdi != &noop_backing_dev_info) {
+		if (sb->s_iflags & SB_I_PERSB_BDI)
+			bdi_unregister(sb->s_bdi);
 		bdi_put(sb->s_bdi);
 		sb->s_bdi = &noop_backing_dev_info;
 	}
@@ -1562,6 +1564,7 @@ int super_setup_bdi_name(struct super_block *sb, char *fmt, ...)
 	}
 	WARN_ON(sb->s_bdi != &noop_backing_dev_info);
 	sb->s_bdi = bdi;
+	sb->s_iflags |= SB_I_PERSB_BDI;
 
 	return 0;
 }
diff --git a/include/linux/fs.h b/include/linux/fs.h
index e7a633353fd20..226de651f52e6 100644
--- a/include/linux/fs.h
+++ b/include/linux/fs.h
@@ -1443,6 +1443,7 @@ extern int send_sigurg(struct fown_struct *fown);
 #define SB_I_UNTRUSTED_MOUNTER		0x00000040
 
 #define SB_I_SKIP_SYNC	0x00000100	/* Skip superblock at global sync */
+#define SB_I_PERSB_BDI	0x00000200	/* has a per-sb bdi */
 
 /* Possible states of 'frozen' field */
 enum {
-- 
2.30.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
