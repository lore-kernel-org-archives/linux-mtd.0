Return-Path: <SRS0=tKtu=DM=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 559F8C46466
	for <linux-mtd@archiver.kernel.org>; Mon,  5 Oct 2020 15:33:02 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 03DF720637
	for <linux-mtd@archiver.kernel.org>; Mon,  5 Oct 2020 15:33:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="F2MC3qL8";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ti.com header.i=@ti.com header.b="R+Dh4nw4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 03DF720637
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=UXHEhOHMuXPItMwgTv6lpBXia9G4auiA8Y1zAipGLwk=; b=F2MC3qL8E4HAQAJztPpxPUHTE
	gyv3JVajCOSsDkZ5Jm4B46j5R8TXgBAr1DCxPudnuIQa0xpS6OGppM4lfWTD5L0imBmpn1AdM/IRH
	gdcKydC896N6I3LauWDu5VQw+sdvJpUALdrWqR1LZC3jTrVbbNkcesQRhk5+qOd1OghF2FC1Pr2PU
	KLvixrj78yntL3NwVoSrDv2hDx9LfxHU2OYCxJw2VcjEAb1oDxNf7e1AQQXsKowlJDWjC+0x1Q/tH
	gYMkG6kZsZIQH0S9pKxyC1ADwxQINlKe5+VLpyTrj5Rs7VPe++V46e/tlvD0pykuGi2sVUyIfuoJA
	Q+7+Ons8g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kPSTR-0005DK-DI; Mon, 05 Oct 2020 15:32:25 +0000
Received: from fllv0015.ext.ti.com ([198.47.19.141])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kPSTD-00055l-DE
 for linux-mtd@lists.infradead.org; Mon, 05 Oct 2020 15:32:12 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 095FW7W0088799;
 Mon, 5 Oct 2020 10:32:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1601911927;
 bh=tUwUim5rK6udc+lt9hQRjeZ++xksG2XibfI+Xf2FY0s=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=R+Dh4nw4l7aSxOBel1gmUK3rG78qCXkkJxbnRIk1UVPs/J1g/UNARXwFH9283QPTg
 tTe1rw/MBwcXPaLKmfdJvlG0XMhgJwKmCSyWAUf33uhAKBr2lguPjN2Kp5Ht+X3uYM
 cTRMlN0qQzEMSGureRvph0cqGq11LKqSyp9ucQLY=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 095FW7pu039536
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 5 Oct 2020 10:32:07 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Mon, 5 Oct
 2020 10:32:07 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Mon, 5 Oct 2020 10:32:07 -0500
Received: from pratyush-OptiPlex-790.dhcp.ti.com (ileax41-snat.itg.ti.com
 [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 095FVdlo052390;
 Mon, 5 Oct 2020 10:32:04 -0500
From: Pratyush Yadav <p.yadav@ti.com>
To: Tudor Ambarus <tudor.ambarus@microchip.com>, Miquel Raynal
 <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v16 08/15] mtd: spi-nor: Introduce SNOR_F_IO_MODE_EN_VOLATILE
Date: Mon, 5 Oct 2020 21:01:31 +0530
Message-ID: <20201005153138.6437-9-p.yadav@ti.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201005153138.6437-1-p.yadav@ti.com>
References: <20201005153138.6437-1-p.yadav@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201005_113211_567984_BEE29B22 
X-CRM114-Status: GOOD (  15.48  )
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
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
 Sekhar Nori <nsekhar@ti.com>, Pratyush Yadav <p.yadav@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: Tudor Ambarus <tudor.ambarus@microchip.com>

We don't want to enter a stateful mode, where a X-X-X I/O mode
is entered by setting a non-volatile bit, because in case of a
reset or a crash, once in the non-volatile mode, we may not be able
to recover in bootloaders and we may break the SPI NOR boot.

Forbid by default the I/O modes that are set via a non-volatile bit.

SPI_NOR_IO_MODE_EN_VOLATILE should be set just for the flashes that
don't define the optional SFDP SCCR Map, so that we don't pollute the
flash info flags.

Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
Signed-off-by: Pratyush Yadav <p.yadav@ti.com>
---
 drivers/mtd/spi-nor/core.c | 3 +++
 drivers/mtd/spi-nor/core.h | 6 ++++++
 2 files changed, 9 insertions(+)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index b83bf5ed2b2d..e91ddb409699 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -3387,6 +3387,9 @@ int spi_nor_scan(struct spi_nor *nor, const char *name,
 	if (info->flags & SPI_NOR_4B_OPCODES)
 		nor->flags |= SNOR_F_4B_OPCODES;
 
+	if (info->flags & SPI_NOR_IO_MODE_EN_VOLATILE)
+		nor->flags |= SNOR_F_IO_MODE_EN_VOLATILE;
+
 	ret = spi_nor_set_addr_width(nor);
 	if (ret)
 		return ret;
diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
index 9a33c8d07335..eaece1123c0b 100644
--- a/drivers/mtd/spi-nor/core.h
+++ b/drivers/mtd/spi-nor/core.h
@@ -26,6 +26,7 @@ enum spi_nor_option_flags {
 	SNOR_F_HAS_SR_TB_BIT6	= BIT(11),
 	SNOR_F_HAS_4BIT_BP      = BIT(12),
 	SNOR_F_HAS_SR_BP3_BIT6  = BIT(13),
+	SNOR_F_IO_MODE_EN_VOLATILE = BIT(14),
 };
 
 struct spi_nor_read_command {
@@ -320,6 +321,11 @@ struct flash_info {
 					 */
 #define SPI_NOR_OCTAL_DTR_READ	BIT(19) /* Flash supports octal DTR Read. */
 #define SPI_NOR_OCTAL_DTR_PP	BIT(20) /* Flash supports Octal DTR Page Program */
+#define SPI_NOR_IO_MODE_EN_VOLATILE	BIT(21) /*
+						 * Flash enables the best
+						 * available I/O mode via a
+						 * volatile bit.
+						 */
 
 	/* Part specific fixup hooks. */
 	const struct spi_nor_fixups *fixups;
-- 
2.28.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
