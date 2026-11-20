Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09C12606A333
	for <linux-mtd@archiver.kernel.org>; Fri, 20 Nov 2026 17:16:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=xRKghHYd;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=Hvbo+by9
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=bIOlsIyMS5IdpzGo3Xn/K7ZzkYo8NrdlJIxjIeR/vro=; b=xRKghHYd7N47g5s4pTm3Pk7ymA
	JndhjKQwt5BPtOp0xxZba1H3CVHtiik3tUd9LDWR8LpAOn4xJaXWl28AdmmEqSKI7dkjdnN6kKGGP
	E5dHB04i9SiIgdIMRFTLWYJh5Bj/GAvKLXLGg174T1GgB7fB88UHLAdJT4VxZ1Vo9wkpIL3B1Tgnm
	NbCET5WGgW9hw3MMTkkxs83gRHhdNlOFJ5zRttSJDcdFXkEpPwn/N42xQ+yXTHfZakNgVVrS2/B+T
	et3I6J3UzVD9AexCE0wnHQ6+xbEzANrUpqIgIH+DcfLS154MoKLRB8OWUlCgo2ZskzH2eQRBWz4pD
	8NT7Bj3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUSDX-0000000FebC-34cr;
	Fri, 20 Nov 2026 17:16:07 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUSCZ-0000000Fe9z-01ks
	for linux-mtd@lists.infradead.org;
	Fri, 20 Nov 2026 17:15:09 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 8107C1A1756;
	Fri, 20 Nov 2026 17:15:05 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 555A1601B9;
	Fri, 20 Nov 2026 17:15:05 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 35FA311BC052A;
	Fri, 20 Nov 2026 18:15:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795194903; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=LCqBoB1Pe9pUcyqNRVvDpXDDWYdn3GrEsr7pawWUEio=;
	b=Hvbo+by9OQ1Ie+2GH4ZvOUvdrb3Vn9EXeZgN6r0Dvz+e3lGbIGWRmpMwlXeQxWdOiE3/QE
	R14xZr9BjIOJklHTHQS7Xkbn0amCLX+1rlXoH+1P1jj5S9FxbBjXCcZwRXQbsy8+sKtTW8
	MeEburfDqlisRxFrLZIQdeFfzl9sMSZX7Mo4qaAJR8uRa7LwB4yTusoPyIM/zb6yOcfWSn
	g3xwv59bFrMkUtQBuPvq7SUGla1LcIC7Noo47RRJDFM9WrT7zVtwSKP8M9O/RvE7//4o5t
	+RNEe5DnSDNXsCKAsR7/U/Z6q8RWMlKT8FogljpLq4D2OuGWwGf4gLp+cC+nBw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Fri, 20 Nov 2026 18:14:37 +0100
Subject: [PATCH v4 11/11] mtd: spi-nand: winbond: Enable the DQS pin on
 W35N**JW series
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261120-winbond-nand-next-phy-tuning-v4-11-8c21e1f71f41@bootlin.com>
References: <20261120-winbond-nand-next-phy-tuning-v4-0-8c21e1f71f41@bootlin.com>
In-Reply-To: <20261120-winbond-nand-next-phy-tuning-v4-0-8c21e1f71f41@bootlin.com>
To: Mark Brown <broonie@kernel.org>, Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Pratyush Yadav <pratyush@kernel.org>, 
 Michael Walle <mwalle@kernel.org>, 
 Takahiro Kuwano <takahiro.kuwano@infineon.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, praneeth@ti.com, 
 u-kumar1@ti.com, p-mantena@ti.com, a-dutta@ti.com, s-k6@ti.com, 
 linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, 
 Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_091507_801433_16A41F7F 
X-CRM114-Status: GOOD (  11.98  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

These chips have a DQS pin. Enable its output in DTR mode when the line is
reported as available by the spi-mem layer, which means the chip has DQS,
the line is wired to the controller and the controller supports DQS. There
is apparently no issue in setting it for lower frequencies, and the extra
power consumption seems very low compared to the current drawn by the NAND
array itself while operating, but keep it disabled when the line is not
wired or the controller cannot use it to avoid useless power consumption.

This setting will be required for high speed I/O transfers (with PHY
tuning).

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/spi/winbond.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/spi/winbond.c b/drivers/mtd/nand/spi/winbond.c
index 810975808c97..336bf743778c 100644
--- a/drivers/mtd/nand/spi/winbond.c
+++ b/drivers/mtd/nand/spi/winbond.c
@@ -667,7 +667,9 @@ static int w35n0xjw_vcr_cfg(struct spinand_device *spinand,
 	else if (!single && !dtr)
 		io_mode = W35N01JW_VCR_IO_MODE_OCTAL_SDR;
 	else if (!single && dtr)
-		io_mode = W35N01JW_VCR_IO_MODE_OCTAL_DDR;
+		io_mode = spi_mem_dqs_is_usable(spinand->spimem) ?
+			  W35N01JW_VCR_IO_MODE_OCTAL_DDR_DS :
+			  W35N01JW_VCR_IO_MODE_OCTAL_DDR;
 	else
 		return -EINVAL;
 
@@ -749,7 +751,7 @@ static const struct spinand_info winbond_spinand_table[] = {
 							&write_cache_octal_variants,
 							&update_cache_octal_variants,
 							&cont_read_cache_octal_variants),
-		     0,
+		     SPINAND_HAS_DQS,
 		     SPINAND_INFO_VENDOR_OPS(&winbond_w35_ops),
 		     SPINAND_ECCINFO(&w35n01jw_ooblayout, w25w35nxxjw_ecc_get_status),
 		     SPINAND_CONFIGURE_CHIP(w35n0xjw_vcr_cfg),
@@ -804,7 +806,7 @@ static const struct spinand_info winbond_spinand_table[] = {
 							&write_cache_octal_variants,
 							&update_cache_octal_variants,
 							&cont_read_cache_octal_variants),
-		     SPINAND_ODTR_PACKED_PAGE_READ,
+		     SPINAND_ODTR_PACKED_PAGE_READ | SPINAND_HAS_DQS,
 		     SPINAND_INFO_VENDOR_OPS(&winbond_w35_ops),
 		     SPINAND_ECCINFO(&w35n01jw_ooblayout, w25w35nxxjw_ecc_get_status),
 		     SPINAND_CONFIGURE_CHIP(w35n0xjw_vcr_cfg),
@@ -845,7 +847,7 @@ static const struct spinand_info winbond_spinand_table[] = {
 							&write_cache_octal_variants,
 							&update_cache_octal_variants,
 							&cont_read_cache_octal_variants),
-		     SPINAND_ODTR_PACKED_PAGE_READ,
+		     SPINAND_ODTR_PACKED_PAGE_READ | SPINAND_HAS_DQS,
 		     SPINAND_INFO_VENDOR_OPS(&winbond_w35_ops),
 		     SPINAND_ECCINFO(&w35n01jw_ooblayout, w25w35nxxjw_ecc_get_status),
 		     SPINAND_CONFIGURE_CHIP(w35n0xjw_vcr_cfg),

-- 
2.56.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
