Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A05FC433F5
	for <linux-mtd@archiver.kernel.org>; Tue,  1 Mar 2022 12:50:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=beYs3d3lyJHD0B4J2tLCKh6sAHgKtek1wViYI/PrHVM=; b=mmAHDRNqDei5WR
	6rxoR74TU7uBfY6Mz9c3iI+o3oPaMuvaJ9XJcLu3Cubmvg2jaarDcPvn07EHA0WrcofAqNhQIyIUM
	gOcYn/SqR+8k0fsgK/hRpXJTM1qZPvOSRSQInYHgrfm1LKs0NrKN1/VES2PlWZwkSox7nDCD/uPQo
	GJBNEq+OPNYQulq5Jtbb5okl/r9D02xBbvzwv9y1ZbO1IXfg2rtwDgJdn6x0jqPULSY+I1+Lt5DIz
	fEc9bbpU+yd/dpc/T2893jZhMXcb9ZVyjy+tSCp4uVq0IpH6OuW7NyVINVzkts6uQvkSjkpjPsCQ/
	DKIv1k/yIRG7Ohjl5wHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nP1ww-00Gdu5-2r; Tue, 01 Mar 2022 12:49:54 +0000
Received: from ssl.serverraum.org ([2a01:4f8:151:8464::1:2])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nP1ws-00Gdsx-8E
 for linux-mtd@lists.infradead.org; Tue, 01 Mar 2022 12:49:52 +0000
Received: from mwalle01.kontron.local. (unknown [213.135.10.150])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 0A72022239;
 Tue,  1 Mar 2022 13:49:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1646138988;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=xGLD83FZXcedIiF55wiRZhjCh00S3oJ3SNfvYTSltI8=;
 b=QWngFlGmTYR4NOLSGfz7X7tFe78tSLLQUp46Et2Wxvp2TdMumWIZbR7dh7U0gyF/m9V9Wv
 OcwWm8MxqpGNVsRXoqBTChpZzzic0bX2tp9b86/CaEq/pHei2VJQlkPF5ItoHLc1DJHGDa
 8twyCVLr7p7/DiSGO2xyB1oLOvb6y5I=
From: Michael Walle <michael@walle.cc>
To: Tudor Ambarus <tudor.ambarus@microchip.com>,
 Pratyush Yadav <p.yadav@ti.com>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 heiko.thiery@gmail.com, Michael Walle <michael@walle.cc>
Subject: [PATCH RFC] mtd: spi-nor: unset quad_enable if SFDP doesn't specify it
Date: Tue,  1 Mar 2022 13:49:35 +0100
Message-Id: <20220301124935.2893622-1-michael@walle.cc>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220301_044950_979253_21B060A7 
X-CRM114-Status: GOOD (  14.07  )
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

For flashes which use the first JESD216 revision, we don't know
which enable method for quad mode we can use. The default one in
spi_nor_init_default_params() is wrong for at least the Macronix
MX25L12835F, thus clear the enable method. Flashes with such an
SFDP revision will have to use a flash (and SFDP revision)
specific fixup.

Signed-off-by: Michael Walle <michael@walle.cc>
---
Please note, completely, untested. Heiko, could you test this without
having the second series from Tudor applied? Then you should have at
least a working flash without quad mode.

 drivers/mtd/spi-nor/sfdp.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/sfdp.c b/drivers/mtd/spi-nor/sfdp.c
index a5211543d30d..c23e85274ff2 100644
--- a/drivers/mtd/spi-nor/sfdp.c
+++ b/drivers/mtd/spi-nor/sfdp.c
@@ -549,6 +549,14 @@ static int spi_nor_parse_bfpt(struct spi_nor *nor,
 	map->uniform_erase_type = map->uniform_region.offset &
 				  SNOR_ERASE_TYPE_MASK;
 
+	/*
+	 * The first JESD216 revision doesn't specify a method to enable
+	 * quad mode. spi_nor_init_default_params() will set a legacy
+	 * default method to enable quad mode. We have to disable it
+	 * again.
+	 */
+	params->quad_enable = NULL;
+
 	/* Stop here if not JESD216 rev A or later. */
 	if (bfpt_header->length == BFPT_DWORD_MAX_JESD216)
 		return spi_nor_post_bfpt_fixups(nor, bfpt_header, &bfpt);
@@ -562,7 +570,6 @@ static int spi_nor_parse_bfpt(struct spi_nor *nor,
 	/* Quad Enable Requirements. */
 	switch (bfpt.dwords[BFPT_DWORD(15)] & BFPT_DWORD15_QER_MASK) {
 	case BFPT_DWORD15_QER_NONE:
-		params->quad_enable = NULL;
 		break;
 
 	case BFPT_DWORD15_QER_SR2_BIT1_BUGGY:
-- 
2.30.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
