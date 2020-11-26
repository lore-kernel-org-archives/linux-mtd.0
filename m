Return-Path: <SRS0=PI1R=FA=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6217DC63777
	for <linux-mtd@archiver.kernel.org>; Thu, 26 Nov 2020 23:35:05 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EB37E21D7E
	for <linux-mtd@archiver.kernel.org>; Thu, 26 Nov 2020 23:35:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="iMwliP7i"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EB37E21D7E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=IfNssH8yFZq5Ne18ONwaOZb+10JLwbz2PzCmU2yfwfE=; b=iMwliP7itGfYqTMItcU9F5dHS
	Xc8U0aWSsuCYLboZZ8Mmjn31tGYXm/qY7/7MkeMIizp/UNQoGY1DCb3jqf0GOJTSx4px+BTKRic/U
	MP26dmpv64jQk0S89H+nYeqSpb8isMEKcvPGo2vDVA/q/EMDPBfbXoMH8XXSIsfFz8zKPaDVWQbI0
	L8eMgOE319kH91qM/YsnJeYgSsiOmf//dSzeUFURKr6SC8CfsbjauDeisTIZ/CTewYvs+pvOVXxPZ
	4cFS3juTciaOPX3H6BzhEF8erl8iJ8FfLXu9VWaE7zSTTWQN7SVdh2mtCv63S/tlrd8HXhg9EfoMx
	/E1i4Wq1w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kiQm7-0007tT-W9; Thu, 26 Nov 2020 23:34:08 +0000
Received: from lilium.sigma-star.at ([109.75.188.150])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kiQlq-0007lL-DL
 for linux-mtd@lists.infradead.org; Thu, 26 Nov 2020 23:33:54 +0000
Received: from localhost (localhost [127.0.0.1])
 by lilium.sigma-star.at (Postfix) with ESMTP id DBD311816C728;
 Fri, 27 Nov 2020 00:33:38 +0100 (CET)
Received: from lilium.sigma-star.at ([127.0.0.1])
 by localhost (lilium.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id 1vN-nVJd0zxn; Fri, 27 Nov 2020 00:33:38 +0100 (CET)
Received: from lilium.sigma-star.at ([127.0.0.1])
 by localhost (lilium.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id vmeUVo1kcicr; Fri, 27 Nov 2020 00:33:38 +0100 (CET)
From: Richard Weinberger <richard@nod.at>
To: miklos@szeredi.hu
Subject: [PATCH 2/7] fuse: Export IO helpers
Date: Fri, 27 Nov 2020 00:32:55 +0100
Message-Id: <20201126233300.10714-3-richard@nod.at>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201126233300.10714-1-richard@nod.at>
References: <20201126233300.10714-1-richard@nod.at>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201126_183350_731144_405C3DAF 
X-CRM114-Status: GOOD (  13.82  )
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

MUSE will use this functions in its IO path,
so export them.

Signed-off-by: Richard Weinberger <richard@nod.at>
---
 fs/fuse/file.c   | 16 +++-------------
 fs/fuse/fuse_i.h | 16 ++++++++++++++++
 2 files changed, 19 insertions(+), 13 deletions(-)

diff --git a/fs/fuse/file.c b/fs/fuse/file.c
index c03034e8c152..ed91ca8b1203 100644
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
@@ -1338,17 +1339,6 @@ static inline void fuse_page_descs_length_init(struct fuse_page_desc *descs,
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
index d51598017d13..d23954908610 100644
--- a/fs/fuse/fuse_i.h
+++ b/fs/fuse/fuse_i.h
@@ -31,6 +31,7 @@
 #include <linux/pid_namespace.h>
 #include <linux/refcount.h>
 #include <linux/user_namespace.h>
+#include <linux/uio.h>
 
 /** Default max number of pages that can be used in a single read request */
 #define FUSE_DEFAULT_MAX_PAGES_PER_REQ 32
@@ -858,6 +859,17 @@ static inline u64 fuse_get_attr_version(struct fuse_conn *fc)
 	return atomic64_read(&fc->attr_version);
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
 
@@ -1210,4 +1222,8 @@ void fuse_dax_inode_cleanup(struct inode *inode);
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
