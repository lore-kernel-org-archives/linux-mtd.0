Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 424D4F30928
	for <linux-mtd@archiver.kernel.org>; Thu,  5 Mar 2026 10:02:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ad/EPRbeeRZzVBwNBz+bcyZXTFAfMS8P6Sgdu7PDGII=; b=efBg9BBuJU7Wcw
	W7ub0+tFclGG8IcLcNXQfNc42k1OXwCNeYLsu7NcPGmds2JSTarrahafTIt4TYO3fg4/zymPU3mX9
	PP4VqXSpz4CD2VjG6ndIxwTOyZlu2OwTnW6yfFkLXrOun2BSKQ8Nm1u50iqFWmp5A1PFWoJsU+khH
	qO05PpjVHftbd6jl7ZcT6TP7EyrotCVpSvegMeUB/MY94nKjFmDDLe/de+11V/yeQhbavmjegXl5U
	OFbF2oUrXsFo5kKLoRZhF4TFcmVWQZPjTpEZctLe0erCldfQTpUr/m9UkcdTXrtP+oCIl3Puo8lnp
	fmO79a8Gp2+ZfYNY9zew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy5X6-00000001URr-3gYm;
	Thu, 05 Mar 2026 10:02:16 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy5X2-00000001ULf-44Il
	for linux-mtd@lists.infradead.org;
	Thu, 05 Mar 2026 10:02:14 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 78FCA4E42575;
	Thu,  5 Mar 2026 10:02:11 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 5053C5FDEB;
	Thu,  5 Mar 2026 10:02:11 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 04C6E10369782;
	Thu,  5 Mar 2026 11:02:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1772704930; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=1UvyLJ/S/s7R/v2QWzX78RjV1H2TGB5loF5BsnWForU=;
	b=ue+w5GLAg4LDAFO5YzVna2E32vLhpSejLV+0w3WEzh3QePeJMczFzDUMeHp5UxQWeBwPfA
	a63ic1P9NsA+u1jyry0zIzVZnlkr5t7q9zb9um3ow7VbOvCK6cssAIgafPJ5C4zm0ufnXA
	ZZx4u8RgdKWgSTDacKsgRhbq7c3LRGHJAMdpuNsZ6xm6TLVIMAlMrYp5wI608XtBG4B0Vh
	wBgR3GmG7toAXQ40OzBCeQEmEiQA08+UoX+wCCy50SYHtND0+Bw/0vtqGeEwWSrJbxBcZD
	9A+rW3t7e/x5/yjt7QcKKKT+rIALqZR65eGTJQuLdCe8jTtMuHw7kDqgyeD6yw==
From: Richard Genoud <richard.genoud@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: Wentao Liang <vulab@iscas.ac.cn>,
	Maxime Ripard <mripard@kernel.org>,
	Boris Brezillon <bbrezillon@kernel.org>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	linux-mtd@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Richard Genoud <richard.genoud@bootlin.com>
Subject: [PATCH v2 4/6] mtd: rawnand: sunxi: replace hard coded value by a define - take2
Date: Thu,  5 Mar 2026 11:01:35 +0100
Message-ID: <20260305100137.2558423-5-richard.genoud@bootlin.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260305100137.2558423-1-richard.genoud@bootlin.com>
References: <20260305100137.2558423-1-richard.genoud@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_020213_143668_ABA8CAB1 
X-CRM114-Status: GOOD (  14.57  )
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

The user data length (4) has been replaced almost all over the file, but
2 places were forgotten.

The user data is placed before the ECC, for each step.
So, in sunxi_nfc_hw_ecc_read_extra_oob(), the offset of the user data in
OOB is indeed ((ecc->bytes + USER_DATA_SZ) * ecc->steps);

And in sunxi_nand_ooblayout_ecc(), the offset of the ECC chunk in OOB is
the same offset plus the current user data size:
section * (ecc->bytes + USER_DATA_SZ) + USER_DATA_SZ;

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>
Signed-off-by: Richard Genoud <richard.genoud@bootlin.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index d126dc18ef27..0b0b5349f446 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -1045,7 +1045,7 @@ static void sunxi_nfc_hw_ecc_read_extra_oob(struct nand_chip *nand,
 {
 	struct mtd_info *mtd = nand_to_mtd(nand);
 	struct nand_ecc_ctrl *ecc = &nand->ecc;
-	int offset = ((ecc->bytes + 4) * ecc->steps);
+	int offset = ((ecc->bytes + USER_DATA_SZ) * ecc->steps);
 	int len = mtd->oobsize - offset;
 
 	if (len <= 0)
@@ -1741,7 +1741,7 @@ static int sunxi_nand_ooblayout_ecc(struct mtd_info *mtd, int section,
 	if (section >= ecc->steps)
 		return -ERANGE;
 
-	oobregion->offset = section * (ecc->bytes + USER_DATA_SZ) + 4;
+	oobregion->offset = section * (ecc->bytes + USER_DATA_SZ) + USER_DATA_SZ;
 	oobregion->length = ecc->bytes;
 
 	return 0;

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
