Return-Path: <SRS0=HfhP=G3=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 989A4C433E6
	for <linux-mtd@archiver.kernel.org>; Sun, 24 Jan 2021 23:22:20 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4C213229C7
	for <linux-mtd@archiver.kernel.org>; Sun, 24 Jan 2021 23:22:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4C213229C7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=tYSghudK/QOXCT5Vyp/uSeQhfwmNGuf5MxBHiC8GakM=; b=2ATXMg5zsqJiFpRKoKfWG1vKQ
	h/m7v4Ev6iQDRhHaAhDWFLUAZ+5f9GNYjFo+VoqtCD4HwZ/LAxgXuSlNaXb/j8rbQrYvxxtGlcmd4
	a+8ZwaOlen7BmWqPbBLWEf2CnATVDcREGiPleRtOpuUjhsqFshqtE1ug7rbJPqxekUoEnAVW3k17X
	a5dmGPJ0MOr+g1uIrDWP/vmsqzHjsbhdBpc8gc7k6G811bxzbE0Ms26ZXjZTQJ7Rig5IPvymKf6Qg
	4SjVjmMfTzNoGG9GfMYDofyRdxbI3go+YVQ39LcyVWh4RPlQXoQ2X0IjiTnkXhZOSOq4IA9hQ4ph6
	jZFobA6uA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l3oh7-00077M-CH; Sun, 24 Jan 2021 23:21:21 +0000
Received: from lilium.sigma-star.at ([109.75.188.150])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l3ogt-00074G-7e
 for linux-mtd@lists.infradead.org; Sun, 24 Jan 2021 23:21:09 +0000
Received: from localhost (localhost [127.0.0.1])
 by lilium.sigma-star.at (Postfix) with ESMTP id C27B2180FCFCB;
 Mon, 25 Jan 2021 00:21:02 +0100 (CET)
Received: from lilium.sigma-star.at ([127.0.0.1])
 by localhost (lilium.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id 0zSQ5wgsYSEQ; Mon, 25 Jan 2021 00:21:02 +0100 (CET)
Received: from lilium.sigma-star.at ([127.0.0.1])
 by localhost (lilium.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id 2bhaQ0vUSK7X; Mon, 25 Jan 2021 00:21:02 +0100 (CET)
From: Richard Weinberger <richard@nod.at>
To: miklos@szeredi.hu
Subject: [PATCH 6/8] fuse: Add MUSE specific defines FUSE interface
Date: Mon, 25 Jan 2021 00:20:05 +0100
Message-Id: <20210124232007.21639-7-richard@nod.at>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210124232007.21639-1-richard@nod.at>
References: <20210124232007.21639-1-richard@nod.at>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210124_182107_411173_25876CB1 
X-CRM114-Status: GOOD (  10.86  )
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

Raise the FUSE API minor version to 34 and add all
MUSE specific operations and data structures.

MUSE_INIT: Initialize a new connection and installs the MTD
MUSE_ERASE: Erases a block
MUSE_READ: Reads a page with or without OOB
MUSE_WRITE: Writes a page with or without OOB
MUSE_MARKBAD: Marks a block as bad
MUSE_ISBAD: Checks whether a block is bad
MUSE_SYNC: Flushes all cached data

Signed-off-by: Richard Weinberger <richard@nod.at>
---
 include/uapi/linux/fuse.h | 76 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 76 insertions(+)

diff --git a/include/uapi/linux/fuse.h b/include/uapi/linux/fuse.h
index 98ca64d1beb6..1c8fa9e42e73 100644
--- a/include/uapi/linux/fuse.h
+++ b/include/uapi/linux/fuse.h
@@ -179,6 +179,10 @@
  *  7.33
  *  - add FUSE_HANDLE_KILLPRIV_V2, FUSE_WRITE_KILL_SUIDGID, FATTR_KILL_SUIDGID
  *  - add FUSE_OPEN_KILL_SUIDGID
+ *
+ *  7.34
+ *  - add support for MUSE: MUSE_INIT, MUSE_ERASE, MUSE_READ, MUSE_WRITE,
+ *    MUSE_MARKBAD, MUSE_ISBAD and MUSE_SYNC
  */
 
 #ifndef _LINUX_FUSE_H
@@ -503,6 +507,15 @@ enum fuse_opcode {
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
@@ -956,4 +969,67 @@ struct fuse_removemapping_one {
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
+#define MUSE_IO_INBAND		(1 << 0)
+#define MUSE_IO_OOB_AUTO	(1 << 1)
+#define MUSE_IO_OOB_PLACE	(1 << 2)
+#define MUSE_IO_RAW		(1 << 3)
+
+struct muse_read_in {
+	uint64_t	addr;
+	uint64_t	len;
+	uint32_t	flags;
+	uint32_t	padding;
+};
+
+struct muse_read_out {
+	uint64_t	len;
+	uint32_t	soft_error;
+	uint32_t	padding;
+};
+
+struct muse_write_in {
+	uint64_t	addr;
+	uint64_t	len;
+	uint32_t	flags;
+	uint32_t	padding;
+};
+
+struct muse_write_out {
+	uint64_t	len;
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
