Return-Path: <SRS0=PI1R=FA=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8198C63798
	for <linux-mtd@archiver.kernel.org>; Thu, 26 Nov 2020 23:35:24 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8B93721D7E
	for <linux-mtd@archiver.kernel.org>; Thu, 26 Nov 2020 23:35:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="P7rRW/IL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8B93721D7E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=9YHh9CklJbZKj1v1cduRTU4bcKt+nAm0er6NWEjkvg0=; b=P7rRW/ILMhIi9BO+B1XSrBeLf
	tR4Xn0altYWejLD3brwLXVeBlasiZyp4LDPQO0zQrbth1qGk/0PI8Zy6L+xwG+jjBfhePzG0tc3ac
	uC7qrnhQIWwy9DMzXZfugaLBzicVbUEvf1Nn2Ak6tWOEW4V/c8G6czRqSV1TWketlOIio/QltGNOj
	O1j23s6jfqlrayAueH7SYdpVe4SFLkdKR77+LBD6bysZI2Csz6QgIqcElbxOlsCEIHxghkft5Kvvs
	gFUBFqL3Am2sMOfTa5TTfg6dcK4YmSBd6VqlJOlI7v3GiqocGzZC2TJGBGP05MdaFd5howqahI5Sw
	YBoGlubKA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kiQmZ-00082E-Ty; Thu, 26 Nov 2020 23:34:36 +0000
Received: from lilium.sigma-star.at ([109.75.188.150])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kiQls-0007pE-NQ
 for linux-mtd@lists.infradead.org; Thu, 26 Nov 2020 23:33:54 +0000
Received: from localhost (localhost [127.0.0.1])
 by lilium.sigma-star.at (Postfix) with ESMTP id EC98D181C88E5;
 Fri, 27 Nov 2020 00:33:39 +0100 (CET)
Received: from lilium.sigma-star.at ([127.0.0.1])
 by localhost (lilium.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id NUbqF_zWrq22; Fri, 27 Nov 2020 00:33:39 +0100 (CET)
Received: from lilium.sigma-star.at ([127.0.0.1])
 by localhost (lilium.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id QEwXlqxG2Uc3; Fri, 27 Nov 2020 00:33:39 +0100 (CET)
From: Richard Weinberger <richard@nod.at>
To: miklos@szeredi.hu
Subject: [PATCH 5/7] fuse: Add MUSE specific defines FUSE interface
Date: Fri, 27 Nov 2020 00:32:58 +0100
Message-Id: <20201126233300.10714-6-richard@nod.at>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201126233300.10714-1-richard@nod.at>
References: <20201126233300.10714-1-richard@nod.at>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201126_183352_955116_4C6A4BD8 
X-CRM114-Status: GOOD (  13.60  )
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

Raise the FUSE API minor version to 33 and add all
MUSE specific operations and data structures.

MUSE_INIT: Initialize a new connection and install the MTD
MUSE_ERASE: Erase a block
MUSE_READ: Read a page
MUSE_WRITE: Write a page
MUSE_MARKBAD: Mark a block as bad
MUSE_ISBAD: Check whether a block is bad
MUSE_SYNC: Flush all cached data

Signed-off-by: Richard Weinberger <richard@nod.at>
---
 include/uapi/linux/fuse.h | 73 ++++++++++++++++++++++++++++++++++++++-
 1 file changed, 72 insertions(+), 1 deletion(-)

diff --git a/include/uapi/linux/fuse.h b/include/uapi/linux/fuse.h
index 7233502ea991..2f7cbe5ce434 100644
--- a/include/uapi/linux/fuse.h
+++ b/include/uapi/linux/fuse.h
@@ -175,6 +175,10 @@
  *
  *  7.32
  *  - add flags to fuse_attr, add FUSE_ATTR_SUBMOUNT, add FUSE_SUBMOUNTS
+ *
+ *  7.33
+ *  - add support for MUSE: MUSE_INIT, MUSE_ERASE, MUSE_READ, MUSE_WRITE,
+ *    MUSE_MARKBAD, MUSE_ISBAD and MUSE_SYNC
  */
 
 #ifndef _LINUX_FUSE_H
@@ -210,7 +214,7 @@
 #define FUSE_KERNEL_VERSION 7
 
 /** Minor version number of this interface */
-#define FUSE_KERNEL_MINOR_VERSION 32
+#define FUSE_KERNEL_MINOR_VERSION 33
 
 /** The node ID of the root inode */
 #define FUSE_ROOT_ID 1
@@ -483,6 +487,15 @@ enum fuse_opcode {
 	/* CUSE specific operations */
 	CUSE_INIT		= 4096,
 
+	/* MUSE specific operations */
+	MUSE_INIT		= 8192,
+	MUSE_ERASE		= 8193,
+	MUSE_READ		= 8194,
+	MUSE_WRITE		= 8195,
+	MUSE_MARKBAD		= 8196,
+	MUSE_ISBAD		= 8197,
+	MUSE_SYNC		= 8198,
+
 	/* Reserved opcodes: helpful to detect structure endian-ness */
 	CUSE_INIT_BSWAP_RESERVED	= 1048576,	/* CUSE_INIT << 8 */
 	FUSE_INIT_BSWAP_RESERVED	= 436207616,	/* FUSE_INIT << 24 */
@@ -936,4 +949,62 @@ struct fuse_removemapping_one {
 #define FUSE_REMOVEMAPPING_MAX_ENTRY   \
 		(PAGE_SIZE / sizeof(struct fuse_removemapping_one))
 
+#define MUSE_INIT_INFO_MAX 4096
+
+struct muse_init_in {
+	uint32_t	fuse_major;
+	uint32_t	fuse_minor;
+};
+
+struct muse_init_out {
+	uint32_t	fuse_major;
+	uint32_t	fuse_minor;
+	uint32_t	max_read;
+	uint32_t	max_write;
+};
+
+struct muse_erase_in {
+	uint64_t	addr;
+	uint64_t	len;
+};
+
+struct muse_read_in {
+	uint64_t	dataaddr;
+	uint64_t	datalen;
+	uint32_t	flags;
+	uint32_t	padding;
+};
+
+struct muse_read_out {
+	uint64_t	datalen;
+	uint32_t	soft_error;
+	uint32_t	padding;
+};
+
+struct muse_write_in {
+	uint64_t	dataaddr;
+	uint64_t	datalen;
+	uint32_t	flags;
+	uint32_t	padding;
+};
+
+struct muse_write_out {
+	uint64_t	datalen;
+	uint32_t	soft_error;
+	uint32_t	padding;
+};
+
+struct muse_markbad_in {
+	uint64_t	addr;
+};
+
+struct muse_isbad_in {
+	uint64_t	addr;
+};
+
+struct muse_isbad_out {
+	uint32_t	result;
+	uint32_t	padding;
+};
+
 #endif /* _LINUX_FUSE_H */
-- 
2.26.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
