Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B3D2C5321E
	for <linux-mtd@archiver.kernel.org>; Wed, 21 Aug 2024 16:25:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=D8CDbIxyKX89SSLc4bIwk2mF6OnwhHQAsl+84RjYHgI=; b=zS6JF08q0pzbRC
	vDR8GNV+ffQxhUoZhXJmzDeBTezDckF53BReOFHXzxvUwGfyhGriOyfB4DPviumhH8P9YqRcyW6Za
	rDT6lVwT0gAnQEnLfAwlhvaqecxrrU9+Fevci3+aAfYUna+6x/zCmflZk8S7/ee9VLsUlT0KRxLs0
	KlXxA216a4Ih076b0TTP4fK3RdDYTQtbxh37GnGmyHDzGeEg8PXQk7+bW4BLowqeOl/OUeyAc7eh6
	nlUkeEeuaxyxXBjizvwxwF2vlkTWXoA6LoeQqu8hPBKsHTL7Vq//gE5ajdFhGNswOpXRC980U94D0
	Xkvr2oQ+ViUp0eBv30tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgo9Q-00000009kIm-2h0X;
	Wed, 21 Aug 2024 16:25:36 +0000
Received: from relay8-d.mail.gandi.net ([2001:4b98:dc4:8::228])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgo9N-00000009kFq-18hc
	for linux-mtd@lists.infradead.org;
	Wed, 21 Aug 2024 16:25:34 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 168251BF207;
	Wed, 21 Aug 2024 16:25:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1724257531;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=m6lXBSWsMrTIjzoxq3I3mrGMojqv8ixrc4I0dq9pXwk=;
	b=afuxKMa7OQRDnAvCOriSmGyIxPb904G97EzAw1SB1W7a3CY4GqpXu2ymi1ThCdajHbPENU
	q2tQVKKggDfXahfElTRRqto6K7JIxcFBWGRz2Qp0ycoFFkv6z7z3QLw2C7/SnZiK3DiHZh
	75QDzmHy1blDJqgBYCY36ZYs5AEhVUGUgpZEcpWnMaESefRLk35YusQIKEO5Z1fYODaPT5
	xl+3ZI5RtMvGUqL70wd3WEitNiU1YwX/v5UByu6RcgbrVPZ49QKs7X263J5TBTtJXRZMie
	308pAariOKg/0XIIj2a4OLRrK0NyYMm+We7dsaBLTuwuIjNr+hpoKLmzvpgh+g==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <michael@walle.cc>,
	<linux-mtd@lists.infradead.org>
Cc: Julien Su <juliensu@mxic.com.tw>,
	Alvin Zhou <alvinzhou@mxic.com.tw>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH 1/9] mtd: nand: Rename the NAND IO iteration helper
Date: Wed, 21 Aug 2024 18:25:20 +0200
Message-ID: <20240821162528.218292-2-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240821162528.218292-1-miquel.raynal@bootlin.com>
References: <20240821162528.218292-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240821_092533_649059_946B274A 
X-CRM114-Status: GOOD (  11.58  )
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

Soon a helper for iterating over blocks will be needed (for continuous
read purposes). In order to clarify the intend of this helper, let's
rename it with the "page" wording inside.

While at it, improve the doc and fix a typo.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 include/linux/mtd/nand.h | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
index b2996dc987ff..92e06ac33815 100644
--- a/include/linux/mtd/nand.h
+++ b/include/linux/mtd/nand.h
@@ -906,19 +906,19 @@ static inline void nanddev_pos_next_page(struct nand_device *nand,
 }
 
 /**
- * nand_io_iter_init - Initialize a NAND I/O iterator
+ * nand_io_page_iter_init - Initialize a NAND I/O iterator
  * @nand: NAND device
  * @offs: absolute offset
  * @req: MTD request
  * @iter: NAND I/O iterator
  *
  * Initializes a NAND iterator based on the information passed by the MTD
- * layer.
+ * layer for page jumps.
  */
-static inline void nanddev_io_iter_init(struct nand_device *nand,
-					enum nand_page_io_req_type reqtype,
-					loff_t offs, struct mtd_oob_ops *req,
-					struct nand_io_iter *iter)
+static inline void nanddev_io_page_iter_init(struct nand_device *nand,
+					     enum nand_page_io_req_type reqtype,
+					     loff_t offs, struct mtd_oob_ops *req,
+					     struct nand_io_iter *iter)
 {
 	struct mtd_info *mtd = nanddev_to_mtd(nand);
 
@@ -990,10 +990,10 @@ static inline bool nanddev_io_iter_end(struct nand_device *nand,
  * @req: MTD I/O request
  * @iter: NAND I/O iterator
  *
- * Should be used for iterate over pages that are contained in an MTD request.
+ * Should be used for iterating over pages that are contained in an MTD request.
  */
 #define nanddev_io_for_each_page(nand, type, start, req, iter)		\
-	for (nanddev_io_iter_init(nand, type, start, req, iter);	\
+	for (nanddev_io_page_iter_init(nand, type, start, req, iter);	\
 	     !nanddev_io_iter_end(nand, iter);				\
 	     nanddev_io_iter_next_page(nand, iter))
 
-- 
2.43.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
