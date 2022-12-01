Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F37BC4321E
	for <linux-mtd@archiver.kernel.org>; Thu,  1 Dec 2022 21:31:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YYKDN9IkP7RRk02DeL7o7pD1ug8MVos1dPb6PfsmYZc=; b=mIsmM3HeV69yoG
	uoqmK4lr+vFCpr2hI9yPqsnkJMxDPJyAOSvujT74Z2kyDZ8krv2cuiG1ejG/Lp+qdS8OlIJJ++yNE
	59IiowiAIorCigne6eqW2fJSeoePs3jYo+NWjciTAJFs+X00yVILL9j2y5Z1RFfgGRb5bsT8OuGKl
	Q6LzNtfJV/MsTthckdjSUjO0qIMTiWwk2iyNQ8v7VuJC82mJzdhOZMke3C/aPjTnHl0m1Kthchu6E
	r06KVRmeuBvsP/DYXQlJ2Y50hyumQx3bNirar3/muxabLLH5EgXRDrbr/9PdvGf4YnPB8CG+Tzenn
	vuL+xSheYRMP+xUZwoKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0r9J-00B9Ae-Mt; Thu, 01 Dec 2022 21:31:17 +0000
Received: from mail-qt1-x835.google.com ([2607:f8b0:4864:20::835])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0r66-00B8h3-2w
	for linux-mtd@lists.infradead.org; Thu, 01 Dec 2022 21:27:59 +0000
Received: by mail-qt1-x835.google.com with SMTP id x28so1557193qtv.13
        for <linux-mtd@lists.infradead.org>; Thu, 01 Dec 2022 13:27:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=timesys-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=li+eohcDsrqZE5thNT9n12zEt/TyQONsMqyuNuEAzg4=;
        b=PjVzQkoENto/e487Z27Cxxpm4kMorb2W7vhofH1USRr3gHeMGX7xgxidNv6FvEoRUv
         K3syUnaPBXdo28aVd+NnOf5D1NiOKyH8lKuIfhKRQLmcZo43RXPp5e/XR2jfPs7Q0/xi
         3rYByZ/zu1DikWacoISBNi07ebXBx/H95oysyXr8MDuC9LY3uRncMC8MmVMUWc1dSfSv
         P4p3im5osoIRnplNXe8WHd8OK4IUSkUMNIlymWtLgPzkJ2SSF4BPiLZ3427ZTZlYAy3O
         KSZYMaePC29JfVkG93xmOjJ87Bb7ZnmqA8QX1i3xkEBuzwWVK1a2Ks9cpl9IPaDo3gXz
         ho0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=li+eohcDsrqZE5thNT9n12zEt/TyQONsMqyuNuEAzg4=;
        b=xgNrbcRcHP2pFhpMnKW02zpLph26zKdnluxnPtN5D6CkIRuel/7WdxN7Tm3zZJAGy7
         PevOJrPZcJN3uDHmkU/LGVM8tohuKl4tZaFSveOleMDSP/lZ8sNCNSf0sG8ctqZxjRA8
         5q8ywkbs1YgmQBKNuGFKYtUlFIB78WueJXT/I4gFLh5OwXAS1M32uqvYIir7HPJDOg5I
         3Su/CX8Zu6MNrnmXQrnnjGVRSJjvmNHa0XZIuXfLXcQYpb5HDDCxa0wPB2I31f1snfG/
         4d96+V5+LZqqFw/5EUeVLzF73ofl9rEFbGFCbfBl8edf2mU/KNxOI1ncNdWZ+7FwLCkS
         +luA==
X-Gm-Message-State: ANoB5pm/POhRud+ipGqiAqSJxFQ91tbvy9fO8t5V103cTIpO6PD4lNwi
	2rXAQj0LS/IoJwSnhUWctpLqYA==
X-Google-Smtp-Source: AA0mqf5uQGlphPSs2yylD15tO00XUorm7g61qOodpzOyei9cn/5JblGPq2nwJQ0mmcgvA21co+GUzg==
X-Received: by 2002:ac8:714a:0:b0:3a6:8aa9:3b85 with SMTP id h10-20020ac8714a000000b003a68aa93b85mr10168073qtp.144.1669930076851;
        Thu, 01 Dec 2022 13:27:56 -0800 (PST)
Received: from nathan-ideapad.. (d-75-76-18-234.oh.cpe.breezeline.net. [75.76.18.234])
        by smtp.gmail.com with ESMTPSA id l15-20020a37f90f000000b006fc447eebe5sm4071321qkj.27.2022.12.01.13.27.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Dec 2022 13:27:56 -0800 (PST)
From: Nathan Barrett-Morrison <nathan.morrison@timesys.com>
To: 
Cc: nathan.morrison@timesys.com,
	greg.malysa@timesys.com,
	Tudor Ambarus <tudor.ambarus@microchip.com>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <michael@walle.cc>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-mtd@lists.infradead.org (open list:SPI NOR SUBSYSTEM),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v3 3/3] mtd: spi-nor: Add support for IS25LX256 operating in 1S-8S-8S octal read mode
Date: Thu,  1 Dec 2022 16:27:50 -0500
Message-Id: <20221201212750.267721-4-nathan.morrison@timesys.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221201212750.267721-1-nathan.morrison@timesys.com>
References: <20221201212750.267721-1-nathan.morrison@timesys.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221201_132758_141573_CB9D504E 
X-CRM114-Status: GOOD (  10.55  )
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

This adds the IS25LX256 chip into the ISSI flash_info parts table

Signed-off-by: Nathan Barrett-Morrison <nathan.morrison@timesys.com>
---
 drivers/mtd/spi-nor/issi.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/mtd/spi-nor/issi.c b/drivers/mtd/spi-nor/issi.c
index 89a66a19d754..98cc5e1d9c18 100644
--- a/drivers/mtd/spi-nor/issi.c
+++ b/drivers/mtd/spi-nor/issi.c
@@ -74,6 +74,9 @@ static const struct flash_info issi_nor_parts[] = {
 		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
 		FIXUP_FLAGS(SPI_NOR_4B_OPCODES)
 		.fixups = &is25lp256_fixups },
+	{ "is25lx256", INFO(0x9d5a19, 0, 128 * 1024, 256)
+		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_4B_OPCODES |
+			      SPI_NOR_OCTAL_READ_1_8_8) },
 
 	/* PMC */
 	{ "pm25lv512",   INFO(0,        0, 32 * 1024,    2)
-- 
2.30.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
