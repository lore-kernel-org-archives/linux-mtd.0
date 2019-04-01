Return-Path: <SRS0=Y0kv=SD=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8929C43381
	for <linux-mtd@archiver.kernel.org>; Mon,  1 Apr 2019 14:35:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A9D9820856
	for <linux-mtd@archiver.kernel.org>; Mon,  1 Apr 2019 14:35:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="b9/aQRo3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A9D9820856
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=I5qmrqVs9L8VEN6pnDIlFEU0y6HqIrr02TjPi//sR24=; b=b9/aQRo3RcSbYG
	f+KyZhxHR493x1xC6Stqp8bFqS39WZpWVn+82vn0Qc5qr6XPDVKEgRrCRYM6JKB5Da9Axf6U9111b
	bsIQJCXBP00zM2L85TfEOvSTH0eLhnPpKTGY7w8k+aJHQafweR69u4O9K9JylqdTfUS5yBhxBuk8h
	RrYkIj+Esn0BzRHQZTAWi9/CFU4DMs6g7yEj9ahlY23BwF8l8BjewxKxGoGaCRUds3thh8V0EJkQf
	XDnTdw3zhPMN3869wbEIaOh6eVp+Mg7ozKl53MdcAUYqwN61H2j7Ez8KB1u2nhLs7XIO8gDxmcY9V
	qZ27FNe40MZD11WzaS2Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hAy21-0003Kr-7P; Mon, 01 Apr 2019 14:35:25 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hAy1r-0003Bn-GA
 for linux-mtd@lists.infradead.org; Mon, 01 Apr 2019 14:35:17 +0000
Received: from dude.hi.pengutronix.de ([2001:67c:670:100:1d::7])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <sha@pengutronix.de>)
 id 1hAy1o-0001yY-4X; Mon, 01 Apr 2019 16:35:12 +0200
Received: from sha by dude.hi.pengutronix.de with local (Exim 4.92-RC6)
 (envelope-from <sha@pengutronix.de>)
 id 1hAy1n-0000lj-R1; Mon, 01 Apr 2019 16:35:11 +0200
From: Sascha Hauer <s.hauer@pengutronix.de>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 2/3] ubifs-media: Add authentication support
Date: Mon,  1 Apr 2019 16:35:10 +0200
Message-Id: <20190401143511.309-3-s.hauer@pengutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190401143511.309-1-s.hauer@pengutronix.de>
References: <20190401143511.309-1-s.hauer@pengutronix.de>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::7
X-SA-Exim-Mail-From: sha@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190401_073516_645033_F1B421E1 
X-CRM114-Status: GOOD (  14.89  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Richard Weinberger <richard@nod.at>, Sascha Hauer <s.hauer@pengutronix.de>,
 kernel@pengutronix.de
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
---
 include/mtd/ubifs-media.h | 21 ++++++++++++++++++++-
 1 file changed, 20 insertions(+), 1 deletion(-)

diff --git a/include/mtd/ubifs-media.h b/include/mtd/ubifs-media.h
index 7c938b9..be2d890 100644
--- a/include/mtd/ubifs-media.h
+++ b/include/mtd/ubifs-media.h
@@ -289,6 +289,8 @@ enum {
 #define UBIFS_CS_NODE_SZ   sizeof(struct ubifs_cs_node)
 #define UBIFS_ORPH_NODE_SZ sizeof(struct ubifs_orph_node)
 #define UBIFS_AUTH_NODE_SZ sizeof(struct ubifs_auth_node)
+#define UBIFS_SIG_NODE_SZ  sizeof(struct ubifs_sig_node)
+
 /* Extended attribute entry nodes are identical to directory entry nodes */
 #define UBIFS_XENT_NODE_SZ UBIFS_DENT_NODE_SZ
 /* Only this does not have to be multiple of 8 bytes */
@@ -375,6 +377,7 @@ enum {
  * UBIFS_CS_NODE: commit start node
  * UBIFS_ORPH_NODE: orphan node
  * UBIFS_AUTH_NODE: authentication node
+ * UBIFS_SIG_NODE: signature node
  * UBIFS_NODE_TYPES_CNT: count of supported node types
  *
  * Note, we index arrays by these numbers, so keep them low and contiguous.
@@ -395,6 +398,7 @@ enum {
 	UBIFS_CS_NODE,
 	UBIFS_ORPH_NODE,
 	UBIFS_AUTH_NODE,
+	UBIFS_SIG_NODE,
 	UBIFS_NODE_TYPES_CNT,
 };
 
@@ -652,6 +656,8 @@ struct ubifs_pad_node {
  * @hmac_wkm: HMAC of a well known message (the string "UBIFS") as a convenience
  *            to the user to check if the correct key is passed.
  * @hash_algo: The hash algo used for this filesystem (one of enum hash_algo)
+ * @hash_mst: hash of the master node, only valid for signed images in which the
+ *            master node does not contain a hmac
  */
 struct ubifs_sb_node {
 	struct ubifs_ch ch;
@@ -682,7 +688,8 @@ struct ubifs_sb_node {
 	__u8 hmac[UBIFS_MAX_HMAC_LEN];
 	__u8 hmac_wkm[UBIFS_MAX_HMAC_LEN];
 	__le16 hash_algo;
-	__u8 padding2[3838];
+	__u8 hash_mst[UBIFS_MAX_HASH_LEN];
+	__u8 padding2[3774];
 } __attribute__ ((packed));
 
 /**
@@ -784,6 +791,18 @@ struct ubifs_auth_node {
 	__u8 hmac[];
 } __attribute__ ((packed));
 
+/**
+ * struct ubifs_sig_node - node for signing other nodes
+ * @ch: common header
+ * @len: The length of the signature data
+ * @sig: The signature data
+ */
+struct ubifs_sig_node {
+	struct ubifs_ch ch;
+	__le32 len;
+	__u8 sig[];
+} __attribute__ ((packed));
+
 /**
  * struct ubifs_branch - key/reference/length branch
  * @lnum: LEB number of the target node
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
