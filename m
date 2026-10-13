Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A84CCC6B21
	for <linux-mtd@archiver.kernel.org>; Tue, 13 Oct 2026 16:34:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hdhvBywpYT+o+jqs0+7siHMCHoxc8Qnn1SyzPETdtUE=; b=3xwbYv3flaUfWI
	jdO+CLxcVoX6B9Wqvs/6cLRmw6HI7Av5MxsSSZuPZSAjjcEe2/tEv4Drjy0itec+wmL4vXfKGB7ka
	B9h08H5GqiMq/N86z2gB8ynq6mXSczAoZDtTBDCbGKQF/aqiynQePzzYQJSoTfA8U98kKP45W/xa/
	Rr/ITeEgUMObCBDxrZmClrm9njLYTD9poVtAmtCLxP/ezxusZfGxD8KqdtRp0xN8wVX0U8i1f3JB/
	tS1dSOjADvjNFV+msyYMQbKfmD+x+4JUmRzL4rnd446S5hrZsKuNe/Isie0P1fetfWwRVs47d4EbR
	U/uUk4U/E368d10uCcHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGfSl-0000000DX8R-32b9;
	Tue, 13 Oct 2026 16:34:51 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGfSg-0000000DX1d-0tRh
	for linux-mtd@lists.infradead.org;
	Tue, 13 Oct 2026 16:34:50 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id C13EB1A121A;
	Tue, 13 Oct 2026 16:34:44 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8FD3060362;
	Tue, 13 Oct 2026 16:34:44 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id EE31711D71811;
	Tue, 13 Oct 2026 18:34:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1791909283; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=+GgPuz0YdNsBR/myCURF0hQWe66/L4vrv2i9zi9lDVI=;
	b=NwTPnb1yLc/+fK+cLp2lTxgVPx8+RXEyadr6RTM/km/O/ljp6rsc9pjFmy1znk9QMAM18t
	MV2WngDrOtS+cOVTI6WifHq87xZ0fG2ri3sTR1KBz4e+ZB7C4trd6ztlKZgv5RxHyoVuGH
	GRYg4I777XnmX1Jhb3Is3IZE613FxGCealV6RhLv4Hggh/STnqsQpYv682b3APdPMy1CdW
	J+rFsYN1QRaDOf/qv96ElXW7THDHQrny4m5+e2bM7XN9quhss1SPsozuXsuSI1Hhq637Mt
	1x9rS7zzqUzRA9KbHN/Uls6HLX+Q6XMkiTKpb+M9kS3A4jVTS1dHpFtud233fQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Tue, 13 Oct 2026 18:33:58 +0200
Subject: [PATCH v3 08/17] mtd: spi-nor: Fix WRSR with ODTR chips
MIME-Version: 1.0
Message-Id: <20261013-winbond-master-spi-nor-w35t-v3-8-6dde1d513df8@bootlin.com>
References: <20261013-winbond-master-spi-nor-w35t-v3-0-6dde1d513df8@bootlin.com>
In-Reply-To: <20261013-winbond-master-spi-nor-w35t-v3-0-6dde1d513df8@bootlin.com>
To: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Takahiro Kuwano <takahiro.kuwano@infineon.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Steam Lin <STLin2@winbond.com>, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_093447_972930_D132D3D6 
X-CRM114-Status: GOOD (  12.36  )
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

The ODTR interface requires an even number of bytes in each section of
the operation. spi_nor_spimem_setup_op() takes care of the opcode phase,
but we have to adapt the rest of the operation ourself.

Inspiration comes from the spi_nor_read_sr_ll() helper which faces a
similar case.

Make sure we don't face the sr1_and_sr2 case, which does not exist with
ODTR devices (this is a legacy behaviour on certain quad capable chips).

Fixes: 63489002d397 ("mtd: spi-nor: Refactor Read Status/Write Status support")
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/spi-nor/core.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index bc11c8cbb234..8e55f12161d1 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -778,7 +778,8 @@ static int spi_nor_write_sr_ll(struct spi_nor *nor, u8 opcode, const u8 *sr,
 {
 	int ret, i;
 
-	if (len > 2)
+	/* There is no sr1_and_sr2 in ODTR mode: this is a quad-only corner case */
+	if (len > 2  || (nor->reg_proto == SNOR_PROTO_8_8_8_DTR && len > 1))
 		return -EINVAL;
 
 	ret = spi_nor_write_enable(nor);
@@ -791,6 +792,14 @@ static int spi_nor_write_sr_ll(struct spi_nor *nor, u8 opcode, const u8 *sr,
 	if (nor->spimem) {
 		struct spi_mem_op op = SPI_NOR_WRSR_OP(opcode,
 						       nor->bouncebuf, len);
+		/*
+		 * We don't want to write only one byte in DTR mode, so
+		 * duplicate the buffer and write 2.
+		 */
+		if (nor->reg_proto == SNOR_PROTO_8_8_8_DTR) {
+			op.data.nbytes = 2;
+			nor->bouncebuf[1] = nor->bouncebuf[0];
+		}
 
 		spi_nor_spimem_setup_op(nor, &op, nor->reg_proto);
 

-- 
2.55.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
