Return-Path: <SRS0=HfhP=G3=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF4CCC433E9
	for <linux-mtd@archiver.kernel.org>; Sun, 24 Jan 2021 23:22:20 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 849BA22C9C
	for <linux-mtd@archiver.kernel.org>; Sun, 24 Jan 2021 23:22:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 849BA22C9C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=P4XtacZXt8NsTZAkucZrLR0HdO3l096Q+baPpcMpufA=; b=hqXqj259AOTmnQLzMIA06aHZk
	Vr8sbKVKPmhxRT6u+cy225Cbar4aih12EZvv33zdJnoQME267SVza+6vhopLTsmgHJyRrqgk6FWos
	gbS7KiZwwDDQVIQNc39/KWb8cIu9OS5X7M2CDcuD2CuwBpseQz4CaI8LYsojWtAg8+Iuc2sT3JNe+
	TpfTUV1bKKw0tHa+KtqLmS3mldXZ8AgeDih6RvgeOLpTtindcvyWp/02tGflGQF8ZmmpWYIfqyXGM
	YOax/GKXpCfyqeWF1I9W1kP2jorXBeT4iZ2FAzLAgEziSfEuYyjAgKbkcSAfBaTny00dx2pKJgMvs
	gNUpygFEA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l3oh3-00076e-Fs; Sun, 24 Jan 2021 23:21:17 +0000
Received: from lilium.sigma-star.at ([109.75.188.150])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l3ogq-00072Y-SC
 for linux-mtd@lists.infradead.org; Sun, 24 Jan 2021 23:21:07 +0000
Received: from localhost (localhost [127.0.0.1])
 by lilium.sigma-star.at (Postfix) with ESMTP id 2AF42181D91AC;
 Mon, 25 Jan 2021 00:21:01 +0100 (CET)
Received: from lilium.sigma-star.at ([127.0.0.1])
 by localhost (lilium.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id G1T-RcRj43zU; Mon, 25 Jan 2021 00:21:00 +0100 (CET)
Received: from lilium.sigma-star.at ([127.0.0.1])
 by localhost (lilium.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id 86Bd4mavDEFC; Mon, 25 Jan 2021 00:21:00 +0100 (CET)
From: Richard Weinberger <richard@nod.at>
To: miklos@szeredi.hu
Subject: [PATCH 2/8] fuse: Export IO helpers
Date: Mon, 25 Jan 2021 00:20:01 +0100
Message-Id: <20210124232007.21639-3-richard@nod.at>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210124232007.21639-1-richard@nod.at>
References: <20210124232007.21639-1-richard@nod.at>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210124_182105_181845_D7A3ABD5 
X-CRM114-Status: GOOD (  12.63  )
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
Cc: vigneshr@ti.com, fuse-devel@lists.sourceforge.net,
 Richard Weinberger <richard@nod.at>, miquel.raynal@bootlin.com,
 linux-kernel@vger.kernel.org, boris.brezillon@collabora.com,
 linux-mtd@lists.infradead.org, rminnich@google.com, sven@narfation.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

MUSE will use this functions in its IO path,
so export them.

Signed-off-by: Richard Weinberger <richard@nod.at>
---
 fs/fuse/file.c   | 16 +++-------------
 fs/fuse/fuse_i.h | 16 ++++++++++++++++
 2 files changed, 19 insertions(+), 13 deletions(-)

diff --git a/fs/fuse/file.c b/fs/fuse/file.c
index 8cccecb55fb8..d41660b7f5bc 100644
--- a/fs/fuse/file.c
+++ b/fs/fuse/file.c
@@ -20,8 +20,8 @@
 #include <linux/uio.h>
 #include <linux/fs.h>
 
-static struct page **fuse_pages_alloc(unsigned int npages, gfp_t flags,
-				      struct fuse_page_desc **desc)
+struct page **fuse_pages_alloc(unsigned int npages, gfp_t flags,
+			       struct fuse_page_desc **desc)
 {
 	struct page **pages;
 
@@ -31,6 +31,7 @@ static struct page **fuse_pages_alloc(unsigned int npages, gfp_t flags,
 
 	return pages;
 }
+EXPORT_SYMBOL_GPL(fuse_pages_alloc);
 
 static int fuse_send_open(struct fuse_mount *fm, u64 nodeid, struct file *file,
 			  int opcode, struct fuse_open_out *outargp)
@@ -1356,17 +1357,6 @@ static inline void fuse_page_descs_length_init(struct fuse_page_desc *descs,
 		descs[i].length = PAGE_SIZE - descs[i].offset;
 }
 
-static inline unsigned long fuse_get_user_addr(const struct iov_iter *ii)
-{
-	return (unsigned long)ii->iov->iov_base + ii->iov_offset;
-}
-
-static inline size_t fuse_get_frag_size(const struct iov_iter *ii,
-					size_t max_size)
-{
-	return min(iov_iter_single_seg_count(ii), max_size);
-}
-
 static int fuse_get_user_pages(struct fuse_args_pages *ap, struct iov_iter *ii,
 			       size_t *nbytesp, int write,
 			       unsigned int max_pages)
diff --git a/fs/fuse/fuse_i.h b/fs/fuse/fuse_i.h
index 7c4b8cb93f9f..8c56a3fd2c4e 100644
--- a/fs/fuse/fuse_i.h
+++ b/fs/fuse/fuse_i.h
@@ -31,6 +31,7 @@
 #include <linux/pid_namespace.h>
 #include <linux/refcount.h>
 #include <linux/user_namespace.h>
+#include <linux/uio.h>
 
 /** Default max number of pages that can be used in a single read request */
 #define FUSE_DEFAULT_MAX_PAGES_PER_REQ 32
@@ -871,6 +872,17 @@ static inline bool fuse_is_bad(struct inode *inode)
 	return unlikely(test_bit(FUSE_I_BAD, &get_fuse_inode(inode)->state));
 }
 
+static inline unsigned long fuse_get_user_addr(const struct iov_iter *ii)
+{
+	return (unsigned long)ii->iov->iov_base + ii->iov_offset;
+}
+
+static inline size_t fuse_get_frag_size(const struct iov_iter *ii,
+					size_t max_size)
+{
+	return min(iov_iter_single_seg_count(ii), max_size);
+}
+
 /** Device operations */
 extern const struct file_operations fuse_dev_operations;
 
@@ -1213,4 +1225,8 @@ void fuse_dax_inode_cleanup(struct inode *inode);
 bool fuse_dax_check_alignment(struct fuse_conn *fc, unsigned int map_alignment);
 void fuse_dax_cancel_work(struct fuse_conn *fc);
 
+/* file.c */
+struct page **fuse_pages_alloc(unsigned int npages, gfp_t flags,
+			       struct fuse_page_desc **desc);
+
 #endif /* _FS_FUSE_I_H */
-- 
2.26.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
