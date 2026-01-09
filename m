Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2BDDD26D6F
	for <linux-mtd@archiver.kernel.org>; Fri,  9 Jan 2026 17:25:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yAeNoCVDXeK/kb3DJ8k1moewf/wg0Wx1NFgl0VUfGsM=; b=KDxwBtytWq6IuO
	0KWx65ENu7U48ymBCUohPyZ4j9mjKZ3/y5QuvReSMylu5ayqUbxi9Cmh1XJVjVALbe7U5VIn4AovY
	DamadgS41q8poVuERapmeFNMXNRZMAWgdeeZDdjvTseXpcWt8RyHk7/uEWlZp1G4Ughz2gysJH3yU
	zp6rFF9CALFPQ9M62RN70bPMYHMtdQk3p1UQ/NSXF2L0i8S6V8Wzo+DnTDndnSo5ecezEBkOhQE6b
	DumSE0hSfhco6sOV2zVgQslnpgGiRASoUlv9Oo4EUItp+gbF3iDFX0KIUoT5z85R4xsWIICWyaQvr
	0x7vAhm+EqED6oc4Bg2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veGEW-00000002o5E-02p5;
	Fri, 09 Jan 2026 17:25:08 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veGES-00000002o2F-02qX
	for linux-mtd@lists.infradead.org;
	Fri, 09 Jan 2026 17:25:06 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 34F6F4E4202A;
	Fri,  9 Jan 2026 17:18:42 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 0426D606C6;
	Fri,  9 Jan 2026 17:18:42 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 542E4103C89BB;
	Fri,  9 Jan 2026 18:18:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1767979121; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=6HYIcnqwyFWxHq3DkqAqIbtZT7IZvCykXnPBw3eNAvA=;
	b=V8rJzHi926cmEs6Gy53noktAnngb4K3uRi6ofuWB8Sort6rU+WndQ4GbUql4ZuEhdOvnIZ
	y8u5z9GJePmW3A+ZiCM8ABQcD+dJsZkUP8BLZM2agaakpgN+xl7sMisaV9fJTd2cXImy9b
	Mdt0G8FFASpZuEKnBn9+InEVZvpAv4l2mQaeZhacHXfnKmR7nrqnvEMjzznV10QNWWJ89+
	nkEvX7DZuK3NgWDSkPNfVv6+vaxdjCOPP0sMlxA1nWo0h2xjWrKq6QuDJfbUqT1josmX8u
	lYP2M8i3FCFE55oqTSj/ADsqA/UqZjTJYJfBkcb23UAdhDVj/QGgWsq1EfMZIg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Fri, 09 Jan 2026 18:18:17 +0100
Subject: [PATCH v2 19/27] mtd: spinand: winbond: Rename IO_MODE register
 macro
MIME-Version: 1.0
Message-Id: <20260109-winbond-v6-17-rc1-oddr-v2-19-1fff6a2ddb80@bootlin.com>
References: <20260109-winbond-v6-17-rc1-oddr-v2-0-1fff6a2ddb80@bootlin.com>
In-Reply-To: <20260109-winbond-v6-17-rc1-oddr-v2-0-1fff6a2ddb80@bootlin.com>
To: Mark Brown <broonie@kernel.org>, Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Pratyush Yadav <pratyush@kernel.org>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Steam Lin <STLin2@winbond.com>, Santhosh Kumar K <s-k6@ti.com>, 
 linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260109_092504_233136_7F3B7F4C 
X-CRM114-Status: GOOD (  10.63  )
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

Suffix the macro name with *_REG to align with the rest of the driver.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/spi/winbond.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/spi/winbond.c b/drivers/mtd/nand/spi/winbond.c
index 7eade2251f7b..b16963637683 100644
--- a/drivers/mtd/nand/spi/winbond.c
+++ b/drivers/mtd/nand/spi/winbond.c
@@ -22,7 +22,7 @@
 #define W25N0XJW_SR4			0xD0
 #define W25N0XJW_SR4_HS			BIT(2)
 
-#define W35N01JW_VCR_IO_MODE			0x00
+#define W35N01JW_VCR_IO_MODE_REG	0x00
 #define W35N01JW_VCR_IO_MODE_SINGLE_SDR		0xFF
 #define W35N01JW_VCR_IO_MODE_OCTAL_SDR		0xDF
 #define W35N01JW_VCR_IO_MODE_OCTAL_DDR_DS	0xE7
@@ -392,7 +392,7 @@ static int w35n0xjw_vcr_cfg(struct spinand_device *spinand)
 	else
 		return -EINVAL;
 
-	ret = w35n0xjw_write_vcr(spinand, W35N01JW_VCR_IO_MODE, io_mode);
+	ret = w35n0xjw_write_vcr(spinand, W35N01JW_VCR_IO_MODE_REG, io_mode);
 	if (ret)
 		return ret;
 

-- 
2.51.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
