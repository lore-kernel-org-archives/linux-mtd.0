Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95569C369D1
	for <linux-mtd@archiver.kernel.org>; Wed, 25 Sep 2024 11:16:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=6q1szzeZcN3IDT4LdCX31/9ciVerFtV1guy6T89SnDU=; b=j7LQXiw1lvaw9O
	ZBk68Rf8bncaI46pxDETQDGpLLvt0ItOMNvgUhlJnI9qrm1AWSaLRcLoj2sW826cMfZqvZ/0c5qnU
	SwbCPAJcXd44FQB2ZIJ26fUmiesZxuS7tIeIux/jROZwjSKvIoU2ANcFrjOnhEouJ34YJ/cvpuvE5
	NH+X5HybHUD4t71y1Bk88f+R6EWcq94oTIaUWaA/hJAoRm2K4vCA536Nh0mH+A2zBR1D5y9by0qPy
	v7G6alHqliXq7qT71LmNGqdLegcf2kufrIcZ5YELDN7OP9cips7VJbbEvtQ84Kc2aKcX45LPJe5yR
	Ldd6ZdMfNIJAF3TnWVmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1stQ0O-00000004rFE-1HRA;
	Wed, 25 Sep 2024 11:16:24 +0000
Received: from mta-64-228.siemens.flowmailer.net ([185.136.64.228])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1stQ0K-00000004rDE-1OlU
	for linux-mtd@lists.infradead.org;
	Wed, 25 Sep 2024 11:16:22 +0000
Received: by mta-64-228.siemens.flowmailer.net with ESMTPSA id 2024092511161550ce45bbd36b9249bd
        for <linux-mtd@lists.infradead.org>;
        Wed, 25 Sep 2024 13:16:15 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=alexander.sverdlin@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=opS9VSW4zyOAOo/Iq8p69WKNqum1/ZW2XaVzkSw8NBE=;
 b=Fz1IMTwcpGee6gLQcc7o1EWMlTbOs41+nf9DuEH0pHfE44CyGywUzQ9HA32rdHM47ftl+y
 YAttWtMqtufLGKpBPBGM3PmKbQf4GC75HaxkfNXo0P/MpbJTObnqKMFewWLGpOv6Y3G5tSh5
 QZj2PIZbs3JleJH1i1C9VAqeW08hqebtNjlWJa3IqTIQlQuFbGdAt8fRk9mAJ38ECyz7g77h
 wHn9TiYqQiOpHUgFSdc+cHFaFUm2iLOMzoW5L+nQKmuRbcm4+IcUpQ+TQGbKJkpTJKb5TlHY
 D9wT+wxtrtxqYeUnSnkl/4K/R4d5fB0FauWIxw2l6Un5X77e16TOr/Aw==;
From: "A. Sverdlin" <alexander.sverdlin@siemens.com>
To: linux-mtd@lists.infradead.org
Cc: Alexander Sverdlin <alexander.sverdlin@siemens.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <mwalle@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Subject: [PATCH] mtd: spi-nor: infineon: add Cypress (Ramtron) CY15B102Q F-RAM support
Date: Wed, 25 Sep 2024 13:16:06 +0200
Message-ID: <20240925111612.248219-1-alexander.sverdlin@siemens.com>
MIME-Version: 1.0
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-456497:519-21489:flowmailer
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240925_041621_028992_897FB357 
X-CRM114-Status: UNSURE (   7.97  )
X-CRM114-Notice: Please train this message.
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

From: Alexander Sverdlin <alexander.sverdlin@siemens.com>

First chip that requires 9-byte Device ID, but at least in the proper
order.

Link: https://www.infineon.com/dgdl/Infineon-CY15B102Q_2-Mbit_(256_K_8)_Serial_(SPI)_Automotive_F-RAM-DataSheet-v07_00-EN.pdf?fileId=8ac78c8c7d0d8da4017d0ecf5fe049d3
Signed-off-by: Alexander Sverdlin <alexander.sverdlin@siemens.com>
---
 drivers/mtd/spi-nor/spansion.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansion.c
index 6356da2cb0be2..38b68a62b31d9 100644
--- a/drivers/mtd/spi-nor/spansion.c
+++ b/drivers/mtd/spi-nor/spansion.c
@@ -987,6 +987,12 @@ static const struct flash_info spansion_nor_parts[] = {
 		.name = "s28hs02gt",
 		.mfr_flags = USE_CLPEF,
 		.fixups = &s28hx_t_fixups,
+	}, {
+		.id = SNOR_ID(0x7f, 0x7f, 0x7f, 0x7f, 0x7f, 0x7f, 0xc2, 0x25, 0xc8),
+		.name = "cy15b102q",
+		.size = SZ_256K,
+		.sector_size = SZ_256K,
+		.flags = SPI_NOR_NO_ERASE,
 	}, {
 		.id = SNOR_ID(0xef, 0x40, 0x13),
 		.name = "s25fl004k",
-- 
2.46.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
