Return-Path: <SRS0=zDbm=CF=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFC69C433E1
	for <linux-mtd@archiver.kernel.org>; Thu, 27 Aug 2020 08:55:38 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AED392177B
	for <linux-mtd@archiver.kernel.org>; Thu, 27 Aug 2020 08:55:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="OP9/KpN8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AED392177B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:To:From:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S8p0jleiezTvuB4njlNz4OwZLGdAek3ZVxcaMM9zyn0=; b=OP9/KpN8hT1AvazCSwF98P8qV4
	OjY+WqsPqB5M1Z2HpDOEQhsc09XA54CDT8ZMZBJHYpWa4GwP4yfRhR+/RNJDuhlil/kurcEur3B65
	A0Shqqy06+fhUNCfYRaCnCujnbHerwT7tx9cwiftBdGp5xS14JB6n9JJy1M/fLB2lcoF6l9ub/cqC
	qCLhSMUAHJOLYAjXJZvMTXfqXKKHhtKouOWMsHmk/xb/H4Sqe497DZaAg1PilqxqflCb8Lyvwf3s6
	CFyGEP13Ck8LBa8ABSTqB+n0S4puIElavly5EOaf55iFgQVrhS0B+AjukHL7izauEVfEUnGzeU1FQ
	d83BDTbA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kBDg5-0006Vc-Cv; Thu, 27 Aug 2020 08:54:37 +0000
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kBDeg-0005g3-0j
 for linux-mtd@lists.infradead.org; Thu, 27 Aug 2020 08:53:11 +0000
X-Originating-IP: 77.205.47.153
Received: from xps13.clients.t25.sncf (153.47.205.77.rev.sfr.net
 [77.205.47.153]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 2C3591C0004;
 Thu, 27 Aug 2020 08:53:05 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 <linux-mtd@lists.infradead.org>
Subject: [PATCH v13 15/20] mtd: nand: Use the new generic ECC object
Date: Thu, 27 Aug 2020 10:52:03 +0200
Message-Id: <20200827085208.16276-16-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200827085208.16276-1-miquel.raynal@bootlin.com>
References: <20200827085208.16276-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200827_045310_343013_21CE7803 
X-CRM114-Status: GOOD (  12.52  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Embed a generic NAND ECC high-level object in the nand_device
structure to carry all the ECC engine configuration/data.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 include/linux/mtd/nand.h | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
index 348fb2ad4d90..697ea2474a7c 100644
--- a/include/linux/mtd/nand.h
+++ b/include/linux/mtd/nand.h
@@ -301,7 +301,7 @@ struct nand_ecc {
  * struct nand_device - NAND device
  * @mtd: MTD instance attached to the NAND device
  * @memorg: memory layout
- * @eccreq: ECC requirements
+ * @ecc: NAND ECC object attached to the NAND device
  * @rowconv: position to row address converter
  * @bbt: bad block table info
  * @ops: NAND operations attached to the NAND device
@@ -309,8 +309,8 @@ struct nand_ecc {
  * Generic NAND object. Specialized NAND layers (raw NAND, SPI NAND, OneNAND)
  * should declare their own NAND object embedding a nand_device struct (that's
  * how inheritance is done).
- * struct_nand_device->memorg and struct_nand_device->eccreq should be filled
- * at device detection time to reflect the NAND device
+ * struct_nand_device->memorg and struct_nand_device->ecc.requirements should
+ * be filled at device detection time to reflect the NAND device
  * capabilities/requirements. Once this is done nanddev_init() can be called.
  * It will take care of converting NAND information into MTD ones, which means
  * the specialized NAND layers should never manually tweak
@@ -319,7 +319,7 @@ struct nand_ecc {
 struct nand_device {
 	struct mtd_info mtd;
 	struct nand_memory_organization memorg;
-	struct nand_ecc_props eccreq;
+	struct nand_ecc ecc;
 	struct nand_row_converter rowconv;
 	struct nand_bbt bbt;
 	const struct nand_ops *ops;
@@ -530,7 +530,7 @@ nanddev_get_memorg(struct nand_device *nand)
 static inline const struct nand_ecc_props *
 nanddev_get_ecc_conf(struct nand_device *nand)
 {
-	return &nand->eccreq;
+	return &nand->ecc.ctx.conf;
 }
 
 /**
@@ -541,7 +541,7 @@ nanddev_get_ecc_conf(struct nand_device *nand)
 static inline const struct nand_ecc_props *
 nanddev_get_ecc_requirements(struct nand_device *nand)
 {
-	return &nand->eccreq;
+	return &nand->ecc.requirements;
 }
 
 /**
@@ -554,7 +554,7 @@ static inline void
 nanddev_set_ecc_requirements(struct nand_device *nand,
 			     const struct nand_ecc_props *reqs)
 {
-	nand->eccreq = *reqs;
+	nand->ecc.requirements = *reqs;
 }
 
 int nanddev_init(struct nand_device *nand, const struct nand_ops *ops,
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
