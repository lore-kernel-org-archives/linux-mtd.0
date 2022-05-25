Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBE8FC433F5
	for <linux-mtd@archiver.kernel.org>; Wed, 25 May 2022 16:32:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eL1B2Omj6K24w7FxrtttJ4zgCS6T1xfnhujgy7wELck=; b=wKMB8GcOnVpQYA
	sijMJYR4Cd6Rt3thWJyVkEGLveDfPEP8qX9WsURdTZ5+rAWDR+/Orl0eUMtBJ/3lbuCz6aFYYCFIf
	lmTSO562Bw6ueL+q8E3kJkdqzVIT2HUlsw3GdNd+T79/7Yj/Nl//C7GLav2aTT2UpVqlN/y4Gnytm
	XVnvejNFCYoV9Mc61ETJVcsD3lT0pxosviRk+4DQCkWIzRV1gd7OsSn8QayP8fkexp0dBHEsEdlUP
	Roz2mdGCAPXmPVgfkylcj54ODlme6Lvpesh/jwMgy3Jt6HnA3ikGizKSR1ApymmdpTRcFWkGrxayo
	qLKl9MJ2Cj3k+C8aefnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nttvP-00Bpxj-OZ; Wed, 25 May 2022 16:31:56 +0000
Received: from relay4-d.mail.gandi.net ([217.70.183.196])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nttur-00BpgS-1G
	for linux-mtd@lists.infradead.org; Wed, 25 May 2022 16:31:22 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 8C908E000E;
	Wed, 25 May 2022 16:31:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1653496279;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SlVoDWTN32ySJyC58i/cvEz2QO5oQQi4aCp+ddxnJSs=;
	b=Ku9JASpbSwxPBpS1mE+bbaBUlXp8pM0UMuN6j+Qo0AdGVvuFnjwBeV0vS/0j6BgoKtmsd5
	poMignotbvXmoH1tJ8ahRMLZUClKRYt/nQ96K6g8HD6Lek0Q/n+zt1jGOogBmudaZXlyPr
	/7V8vz4AKqQvOo2wTExgzNFRWKZGBnqm/0NX70PxH9zsCT4Sf4V+ZabNiirxA/YkPXoGot
	e6VPmBdWrHjrDo0qGHkMuia6yPFrIeOQvSxzU2ioDCF+92nEFZo9Yit00h3tCrsuSz4KXS
	TDp4d3x/IRJIE1RiRGoONABUr41DEd9QxU/XTGIoFyCMmcd3putwL/6GYTI31g==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tudor Ambarus <Tudor.Ambarus@microchip.com>,
	Pratyush Yadav <p.yadav@ti.com>,
	Michael Walle <michael@walle.cc>,
	<linux-mtd@lists.infradead.org>
Cc: Julien Su <juliensu@mxic.com.tw>,
	Jaime Liao <jaimeliao@mxic.com.tw>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [RFC PATCH 7/8] mtd: spi-nor: Add a RWW flag
Date: Wed, 25 May 2022 18:31:07 +0200
Message-Id: <20220525163108.266705-8-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220525163108.266705-1-miquel.raynal@bootlin.com>
References: <20220525163108.266705-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220525_093121_259030_0EBB7FC1 
X-CRM114-Status: GOOD (  12.69  )
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

Introduce a new (no SFDP) flag for the feature that we are about to
support: Read While Write. This means, if the chip has several banks and
supports RWW, once a page of data to write has been transferred into the
chip's internal SRAM, another read operation happening on a different
bank can be performed during the tPROG delay.

Adding this new flag involves enlarging the no_sfdp_flags variable to 16
bits.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/spi-nor/core.h | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
index 5200246942da..dc29586bfed8 100644
--- a/drivers/mtd/spi-nor/core.h
+++ b/drivers/mtd/spi-nor/core.h
@@ -361,6 +361,7 @@ struct spi_nor_fixups {
  *   SPI_NOR_OCTAL_READ:      flash supports Octal Read.
  *   SPI_NOR_OCTAL_DTR_READ:  flash supports octal DTR Read.
  *   SPI_NOR_OCTAL_DTR_PP:    flash supports Octal DTR Page Program.
+ *   SPI_NOR_RWW:             flash supports reads while write.
  *
  * @fixup_flags:    flags that indicate support that can be discovered via SFDP
  *                  ideally, but can not be discovered for this particular flash
@@ -401,7 +402,7 @@ struct flash_info {
 #define NO_CHIP_ERASE			BIT(7)
 #define SPI_NOR_NO_FR			BIT(8)
 
-	u8 no_sfdp_flags;
+	u16 no_sfdp_flags;
 #define SPI_NOR_SKIP_SFDP		BIT(0)
 #define SECT_4K				BIT(1)
 #define SECT_4K_PMC			BIT(2)
@@ -410,6 +411,7 @@ struct flash_info {
 #define SPI_NOR_OCTAL_READ		BIT(5)
 #define SPI_NOR_OCTAL_DTR_READ		BIT(6)
 #define SPI_NOR_OCTAL_DTR_PP		BIT(7)
+#define SPI_NOR_RWW			BIT(8)
 
 	u8 fixup_flags;
 #define SPI_NOR_4B_OPCODES		BIT(0)
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
