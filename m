Return-Path: <SRS0=Jpfl=PR=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0EB3C433EF
	for <linux-mtd@archiver.kernel.org>; Fri, 29 Oct 2021 18:31:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BB86F61037
	for <linux-mtd@archiver.kernel.org>; Fri, 29 Oct 2021 18:31:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BB86F61037
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2j2Zs9F0odTr5QuyY1sQov1B3WgJW+gs6tnXd5G48qM=; b=kEUF1+QAHX0E6h
	FISsK4UY6gTP1Ks1930zyMx5zzPgSevctcGb4FbVolW4tRbhgAOKX/7vpMm4DBHpVzv0NPA0145uO
	uyADYZzfuyX3r9srqUbTKCfXLDhcQXKmvjyk2FlNQm+oXt3n/EwIQM7cPzfi8wPOVHlLhxLsrBQmw
	PZqy803rlbq6clWHEgq0ky53zINxQ6CNb4Gbh8EC2REM5KjOvMVnh/AQJO76kMt1Iz4sz6agtRiVv
	ipo3RRfxWKE5EhoYOH/ZJ1DVbnRP0rf2ZtDFwcZD1x9A1kBSClLfPZlKqQI3pOcSV5ii2XP849qs/
	ZE0xui97C1NxvGIbGIAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mgWeJ-00Bn9e-9q; Fri, 29 Oct 2021 18:30:44 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mgVg8-00BZb7-2a; Fri, 29 Oct 2021 17:28:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1635528511; x=1667064511;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=II4aRvdIY10MgKdD+UmU0rrNCOQLJCEYd4WuGDUm644=;
 b=Jqwyft8KsaZxFJd9zp8LnFkWDqM/HEhV/paIjzAghdbZV0ntj3aAUpiS
 P9wVD1/N8t+48JIAXFdiBaV+lq7ijggJLqx6OmN0kMYbryC9Hma7jftHg
 MI0Arm5SJ+cijxZvleSwuqjjFdlKRWgCuVvX3LIKnEJKW7vSJ0H0P9RrR
 gtlg7x0PAqvwqyK9awcQ4B7LubTrYUeS7MIsyzCMXTdrg30FEDJDza+iN
 6bpj6lRtUI6Md99Ir/geY6vu9yM/wtoycL5AS/rtigNiSzZ4YQC+ktPCr
 YdJ/Uu8C8HiTDwi2kwlViV1qXj7cquA5ALULuJxULbif9522ElUy+VSib Q==;
IronPort-SDR: jCaUId4wyYwvDzg5sCHjs0TuMWlLkoIkZqYijF4v8hfNficaTXZw+duCzCqjUaOOg9DsKT5eQe
 1uz/IqOyYJdA5+CxNyOdyyw0Wb2Lebl4ZMVyyE5dDIRlBmodU+Nb8GCfqVAcNm0kSstdZ4DNfn
 TinCZz4xIrgck0sLIlHrrzTZqf4/zNs/+VrXZu7ArRj2OVoVB3aQATM+5GMd8Jb374m//YD4pp
 XRB5GDN21LwuJg8xq5gv3UTqPiZdMgSlclt14MfqicOP6JEKrHX6DtaZepln5jmOfjLuIUYw2C
 UjVInMEANZQhp4/FbZP2XPfD
X-IronPort-AV: E=Sophos;i="5.87,193,1631602800"; d="scan'208";a="150063528"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 29 Oct 2021 10:28:31 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Fri, 29 Oct 2021 10:28:30 -0700
Received: from ROB-ULT-M18064N.mchp-main.com (10.10.115.15) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Fri, 29 Oct 2021 10:28:25 -0700
From: Tudor Ambarus <tudor.ambarus@microchip.com>
To: <michael@walle.cc>, <vigneshr@ti.com>, <p.yadav@ti.com>
Subject: [PATCH v3 22/25] mtd: spi-nor: spansion: s25fl256s0: Skip SFDP parsing
Date: Fri, 29 Oct 2021 20:26:30 +0300
Message-ID: <20211029172633.886453-23-tudor.ambarus@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211029172633.886453-1-tudor.ambarus@microchip.com>
References: <20211029172633.886453-1-tudor.ambarus@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211029_102832_193363_7991F393 
X-CRM114-Status: GOOD (  10.36  )
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
Cc: macromorgan@hotmail.com, jaimeliao@mxic.com.tw, Tudor
 Ambarus <tudor.ambarus@microchip.com>, richard@nod.at, esben@geanix.com,
 linux@rasmusvillemoes.dk, knaerzche@gmail.com, nicolas.ferre@microchip.com,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 code@reto-schneider.ch, miquel.raynal@bootlin.com, heiko.thiery@gmail.com,
 sr@denx.de, mail@david-bauer.net, zhengxunli@mxic.com.tw
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

s25fl256s0 does not define the SFDP tables nor implements the
RDSFDP 0x5a command. Skip the SFDP parsing in order to avoid
issuing an unsupported command to the flash.

Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
---
 drivers/mtd/spi-nor/spansion.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansion.c
index 3ee1cd3b8fb5..463ddd0776ec 100644
--- a/drivers/mtd/spi-nor/spansion.c
+++ b/drivers/mtd/spi-nor/spansion.c
@@ -209,8 +209,9 @@ static const struct flash_info spansion_parts[] = {
 			      SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
 			      USE_CLSR) },
 	{ "s25fl256s0", INFO6(0x010219, 0x4d0080, 256 * 1024, 128,
-			      SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
-			      USE_CLSR) },
+			      SPI_NOR_SKIP_SFDP |
+			      SFDP_FLAGS(SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
+					 USE_CLSR)) },
 	{ "s25fl256s1", INFO6(0x010219, 0x4d0180, 64 * 1024, 512,
 			      SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
 			      USE_CLSR) },
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
