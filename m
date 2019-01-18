Return-Path: <SRS0=FXe4=P2=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 988ACC43387
	for <linux-mtd@archiver.kernel.org>; Fri, 18 Jan 2019 01:08:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 458AB2086D
	for <linux-mtd@archiver.kernel.org>; Fri, 18 Jan 2019 01:08:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="R/cY9VwD";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=crapouillou.net header.i=@crapouillou.net header.b="CL8FJ+Zk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 458AB2086D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=crapouillou.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=DY1RZUlX6QIGJHApix7VoRGIwCjoMRL0Rn7HYGk/MpI=; b=R/cY9VwDbY76YzDMAiE+Xi8MVO
	XbbpVhbB/RXJnrFByeB3UvcoQtjVxNxE48evXBmIoiwF7D+tpPfKNy7juP7kGweBEGyHLak6HPXq3
	9FVSLA//AzeWIEVjBxje50FNdTpgQZ0Ej7YJZcp67+MwziUwfAPi3PwxWYhh59L9oHWGAFnaKyvQ7
	eDTGLExM1BWziEn/cQkgFK2CaEA0DFOL0uyIebiONOyq3Wns08+VKuDJNVRQ7t21TK4NJec8ubVgd
	IgEZCO+q6h3wYFLcLOWnRrHP8YEQ8RzjEE+IZcvWS38gsP9WsxcoIpfGiWAFKihu7eaKHz5jS0QIg
	Y3dydVKw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gkIdc-0007tQ-2b; Fri, 18 Jan 2019 01:08:00 +0000
Received: from outils.crapouillou.net ([89.234.176.41] helo=crapouillou.net)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gkIcs-00079R-HU
 for linux-mtd@lists.infradead.org; Fri, 18 Jan 2019 01:07:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1547773632; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
 bh=MG3f0Whzo3apr/Ozy+5iOfPwXocl1tPsCT+XjhaScyg=;
 b=CL8FJ+ZkQFDfCSzLbqBM8n0Z9tXCur3CbwONW/C2SE27Hn+PPv4m4nnAmoQ6r0XqEZU+Ra
 mMg6FUGBqWyoT3oBQFHVVFaBDN+jLTQikz+r5+zWQKHcNjXbCEjrSUlywzhKmnjwoZ/QS0
 l8MCYxYXT140VBibaHy5faIS67j/D4U=
From: Paul Cercueil <paul@crapouillou.net>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <bbrezillon@kernel.org>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Ralf Baechle <ralf@linux-mips.org>, Paul Burton <paul.burton@mips.com>,
 James Hogan <jhogan@kernel.org>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Harvey Hunt <harveyhuntnexus@gmail.com>
Subject: [PATCH 5/8] mtd: rawnand: jz4780: Add ooblayout for the JZ4725B
Date: Thu, 17 Jan 2019 22:06:31 -0300
Message-Id: <20190118010634.27399-5-paul@crapouillou.net>
In-Reply-To: <20190118010634.27399-1-paul@crapouillou.net>
References: <20190118010634.27399-1-paul@crapouillou.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190117_170715_113514_C4CCD61C 
X-CRM114-Status: GOOD (  14.59  )
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
Cc: Paul Cercueil <paul@crapouillou.net>, devicetree@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mips@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

The boot ROM of the JZ4725B SoC expects a specific OOB layout on the
NAND, so it makes sense to use this OOB layout unconditionally on this
SoC.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 drivers/mtd/nand/raw/jz4780_nand.c | 40 +++++++++++++++++++++++++++++++++++++-
 1 file changed, 39 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/jz4780_nand.c b/drivers/mtd/nand/raw/jz4780_nand.c
index cf24bf12884f..073b3da5c3f7 100644
--- a/drivers/mtd/nand/raw/jz4780_nand.c
+++ b/drivers/mtd/nand/raw/jz4780_nand.c
@@ -34,6 +34,7 @@ struct jz_soc_info {
 	unsigned long data_offset;
 	unsigned long addr_offset;
 	unsigned long cmd_offset;
+	const struct mtd_ooblayout_ops *oob_layout;
 };
 
 struct jz4780_nand_cs {
@@ -208,7 +209,7 @@ static int jz4780_nand_attach_chip(struct nand_chip *chip)
 		return -EINVAL;
 	}
 
-	mtd_set_ooblayout(mtd, &nand_ooblayout_lp_ops);
+	mtd_set_ooblayout(mtd, nfc->soc_info->oob_layout);
 
 	return 0;
 }
@@ -398,16 +399,53 @@ static int jz4780_nand_remove(struct platform_device *pdev)
 	return 0;
 }
 
+static int jz4725b_ooblayout_ecc(struct mtd_info *mtd, int section,
+				 struct mtd_oob_region *oobregion)
+{
+	struct nand_chip *chip = mtd_to_nand(mtd);
+	struct nand_ecc_ctrl *ecc = &chip->ecc;
+
+	if (section || !ecc->total)
+		return -ERANGE;
+
+	oobregion->length = ecc->total;
+	oobregion->offset = 3;
+
+	return 0;
+}
+
+static int jz4725b_ooblayout_free(struct mtd_info *mtd, int section,
+				  struct mtd_oob_region *oobregion)
+{
+	struct nand_chip *chip = mtd_to_nand(mtd);
+	struct nand_ecc_ctrl *ecc = &chip->ecc;
+
+	if (section)
+		return -ERANGE;
+
+	oobregion->length = mtd->oobsize - ecc->total - 3;
+	oobregion->offset = 3 + ecc->total;
+
+	return 0;
+}
+
+const struct mtd_ooblayout_ops jz4725b_ooblayout_ops = {
+	.ecc = jz4725b_ooblayout_ecc,
+	.free = jz4725b_ooblayout_free,
+};
+
 static const struct jz_soc_info jz4725b_soc_info = {
 	.data_offset = 0x00000000,
 	.cmd_offset  = 0x00008000,
 	.addr_offset = 0x00010000,
+	.oob_layout  = &jz4725b_ooblayout_ops,
 };
 
 static const struct jz_soc_info jz4780_soc_info = {
 	.data_offset = 0x00000000,
 	.cmd_offset  = 0x00400000,
 	.addr_offset = 0x00800000,
+	.oob_layout  = &nand_ooblayout_lp_ops,
 };
 
 static const struct of_device_id jz4780_nand_dt_match[] = {
-- 
2.11.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
