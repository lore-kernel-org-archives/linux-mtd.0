Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29051C352A1
	for <linux-mtd@archiver.kernel.org>; Tue,  6 Dec 2022 11:11:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=A4wELXSnVEyu2uZfeZF5Z+ICewPMKIqLFvl2hEww28A=; b=MVPEJsKG+ovx+k
	Di8U44Y9EF8lNg2nKkI7bEMI3BT5lU8q8lVlaI/VVcvukUuwOOahKFRm1JozAYDczclPSL4wY/hj+
	KEDbxP2c5m04yy5aUrhrYao5bmTcjL8vq/hWYL61AcCUJM/sUsaexvJCUe7qaI2ZhA1r4Ji42pmB4
	Ktgka0Ma0gLvCBOOB6FAsOnLi5DK5cP7ZZRviyV4gzidCcnsRDr3yYADEdVFstikUxLpKRWalHSLZ
	kXc4mwZTk3udju1yJCq1b180t9F8XdcF5kFt09SPLKWmUnzj6HNexaRTFtsjPQ63szsQ8cvyJnD2C
	IR/2IbpsoshqsjitqRrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2Vqs-008CgQ-N2; Tue, 06 Dec 2022 11:11:06 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2VqZ-008C9B-59
	for linux-mtd@lists.infradead.org; Tue, 06 Dec 2022 11:10:48 +0000
Received: by mail-pf1-x42d.google.com with SMTP id 21so14209221pfw.4
        for <linux-mtd@lists.infradead.org>; Tue, 06 Dec 2022 03:10:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=F5w2zEM8EXKIkF385aRGie8u0O3eCGxHYZ/xpr8+2GE=;
        b=KQcctkZcro++RfetAlHhe950vKjREL1k9+bGqhYOThOwFhuVqYY16nt19bH954BfVy
         mH9Vsw4ydR5Vn7r4JrvfdLLIwT+g8T+ybZZcYP8/j9p7Ypie2SmhqQ4HTdgtpiYvPE4D
         Xq6XZt6ge+n0u02IMwRbUiib84mEbhUTpiG6n0cXNpc197mZxKCFqg7bMFsSrcqy2fFX
         K9y+1zgMU0CzsOhT+z567+Q3X8O+NVAb8FwtG76l7PValWDpFdO6LuAdjwgKYAzNiH5G
         AjSI+k4/kTUya61gRgegQ7/WTnF3mDzsKGi7SVPbdHupDEeSgeGvwpFROL5+Hw1E0lSV
         ZoUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F5w2zEM8EXKIkF385aRGie8u0O3eCGxHYZ/xpr8+2GE=;
        b=Y70GQ0bX53kuc77PguO3WDLNux2RhBBj5ykwwkxPQUzrP28TKN887Cu7/Dz4vsays7
         kJH9nSqIaLoYUWcM/5S0fppyNrpm0tcSqmPXid0q22hV6sEKsRF3dibsS9T1wVjW3+az
         UpC6QbanJ4jtldC8OMFh9REVaWeuhRSMgJB3b04FLW9q9FS79sGRaufuBeKiJMgIRxof
         ormDuyvzvpWR4P+03C8rB3bjIJ1V27NQUDIa/ClUFsbkJL8jLKPyEVaYaIvX6RBP9Vwx
         1NfBuJLUp/xBOnuJt9R4tmB16UnRwjFIHsJ6dWPU9189GgckHU+HXAsKK8mH1YVVqfdT
         ndPQ==
X-Gm-Message-State: ANoB5pnNba2dhc3pvUZwsGNBDWGuype+IQTWcqp3/s8CI6gPcktSn4X+
	xZp0y2tbJhnXWiIdI4dqBFo1UIrTC6AvPrLN
X-Google-Smtp-Source: AA0mqf7vk5qJ5C2EhK83YgDc7Brmif8GJKtY81sZ61o448V6n52m3FOnKJB73WI2cag9yrS1Oq6N/Q==
X-Received: by 2002:a62:b501:0:b0:563:771d:417f with SMTP id y1-20020a62b501000000b00563771d417fmr70248777pfe.45.1670325044897;
        Tue, 06 Dec 2022 03:10:44 -0800 (PST)
Received: from victor-17Z990-R-AAC9U1.attlocal.net ([183.171.191.59])
        by smtp.gmail.com with ESMTPSA id k1-20020a170902c40100b001895b2c4cf6sm12342293plk.297.2022.12.06.03.10.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Dec 2022 03:10:44 -0800 (PST)
From: Victor Lim <victorswlim@gmail.com>
X-Google-Original-From: Victor Lim <vlim@gigadevice.com>
To: tudor.ambarus@microchip.com,
	michael@walle.cc,
	p.yadav@ti.com,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	linux-mtd@lists.infradead.org,
	alejandro.carmona@amd.com,
	amit.kumar-mahapatra@amd.com,
	vikhyat.goyal@amd.com
Cc: Victor Lim <vlim@gigadevice.com>
Subject: [PATCH] Linux: SPI NOR flash: adding parts to gigadevice.c
Date: Tue,  6 Dec 2022 19:10:37 +0800
Message-Id: <20221206111037.8999-1-vlim@gigadevice.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221206_031047_267177_82FFD4BE 
X-CRM114-Status: UNSURE (   8.84  )
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

Please find the part #s added below the line
/* adding these parts */

Signed-off-by: Victor Lim <vlim@gigadevice.com>
---
 drivers/mtd/spi-nor/gigadevice.c | 73 ++++++++++++++++++++++++++++++++
 1 file changed, 73 insertions(+)

diff --git a/drivers/mtd/spi-nor/gigadevice.c b/drivers/mtd/spi-nor/gigadevice.c
index 66c2e75023fc..73f13684291c 100644
--- a/drivers/mtd/spi-nor/gigadevice.c
+++ b/drivers/mtd/spi-nor/gigadevice.c
@@ -186,6 +186,79 @@ static const struct flash_info gigadevice_parts[] = {
 			      SPI_NOR_OCTAL_DTR_PP |
 			      SPI_NOR_IO_MODE_EN_VOLATILE)
 		.fixups = &gd25lx256e_fixups },
+/* adding these parts */
+	{"gd25b512", INFO(0xc8471A, 0, 64 * 1024, 1024,	SECT_4K |
+	SPI_NOR_QUAD_READ | SPI_NOR_HAS_LOCK | SPI_NOR_4B_OPCODES)},
+	{"gd55b01g", INFO(0xc8471B, 0, 64 * 1024, 2048,	SECT_4K |
+	SPI_NOR_QUAD_READ | SPI_NOR_HAS_LOCK | SPI_NOR_4B_OPCODES)},
+	{"gd55b02g", INFO(0xc8471C, 0, 64 * 1024, 4096,	SECT_4K |
+	SPI_NOR_QUAD_READ | SPI_NOR_HAS_LOCK | SPI_NOR_4B_OPCODES)},
+	{"gd25f64", INFO(0xc84317, 0, 64 * 1024, 128,	SECT_4K |
+	SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | SPI_NOR_HAS_LOCK)},
+	{"gd25f128", INFO(0xc84318, 0, 64 * 1024, 256,	SECT_4K	|
+	SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | SPI_NOR_HAS_LOCK)},
+	{"gd25f256", INFO(0xc84319, 0, 64 * 1024, 512,	SECT_4K |
+	SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | SPI_NOR_HAS_LOCK | SPI_NOR_4B_OPCODES)},
+	{"gd55f512", INFO(0xc8431A, 0, 64 * 1024, 1024,	SECT_4K |
+	SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | SPI_NOR_HAS_LOCK | SPI_NOR_4B_OPCODES)},
+	{"gd25t512", INFO(0xc8461A, 0, 64 * 1024, 1024,	SECT_4K |
+	SPI_NOR_QUAD_READ | SPI_NOR_HAS_LOCK | SPI_NOR_4B_OPCODES)},
+	{"gd55t01g", INFO(0xc8461B, 0, 64 * 1024, 2048,	SECT_4K |
+	SPI_NOR_QUAD_READ | SPI_NOR_HAS_LOCK | SPI_NOR_4B_OPCODES)},
+	{"gd55t02ge", INFO(0xc8461C, 0, 64 * 1024, 4096,	SECT_4K |
+	SPI_NOR_QUAD_READ | SPI_NOR_HAS_LOCK | SPI_NOR_4B_OPCODES)},
+	{"gd25x512", INFO(0xc8481A, 0, 64 * 1024, 1024,	SECT_4K |
+	SPI_NOR_OCTAL_READ | SPI_NOR_4B_OPCODES)},
+	{"gd55x01g", INFO(0xc8481B, 0, 64 * 1024, 2048,	SECT_4K |
+	SPI_NOR_OCTAL_READ | SPI_NOR_4B_OPCODES)},
+	{"gd55x02g", INFO(0xc8481C, 0, 64 * 1024, 4096,	SECT_4K |
+	SPI_NOR_OCTAL_READ | SPI_NOR_4B_OPCODES)},
+	{"gd25lb16", INFO(0xc86015, 0, 64 * 1024, 32,	SECT_4K |
+	SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | SPI_NOR_HAS_LOCK)},
+	{"gd25lb32", INFO(0xc86016, 0, 64 * 1024, 64,	SECT_4K |
+	SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | SPI_NOR_HAS_LOCK)	},
+	{"gd25lb64", INFO(0xc86017, 0, 64 * 1024, 128,	SECT_4K |
+	SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | SPI_NOR_HAS_LOCK)	},
+	{"gd25lb128", INFO(0xc86018, 0, 64 * 1024, 256,	SECT_4K |
+	SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | SPI_NOR_HAS_LOCK)},
+	{"gd25lb256", INFO(0xc86019, 0, 64 * 1024, 512,	SECT_4K |
+	SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | SPI_NOR_HAS_LOCK | SPI_NOR_4B_OPCODES)},
+	{"gd25lb256", INFO(0xc86719, 0, 64 * 1024, 512,	SECT_4K |
+	SPI_NOR_QUAD_READ | SPI_NOR_HAS_LOCK | SPI_NOR_4B_OPCODES)},
+	{"gd25lb512", INFO(0xc8671A, 0, 64 * 1024, 1024,	SECT_4K |
+	SPI_NOR_QUAD_READ | SPI_NOR_HAS_LOCK | SPI_NOR_4B_OPCODES)},
+	{"gd55lb01g", INFO(0xc8671B, 0, 64 * 1024, 2048,	SECT_4K |
+	SPI_NOR_QUAD_READ | SPI_NOR_HAS_LOCK | SPI_NOR_4B_OPCODES)},
+	{"gd55lb02g", INFO(0xc8671C, 0, 64 * 1024, 4096,	SECT_4K |
+	SPI_NOR_QUAD_READ | SPI_NOR_HAS_LOCK | SPI_NOR_4B_OPCODES)},
+	{"gd25lf80", INFO(0xc86314, 0, 64 * 1024, 16,	SECT_4K |
+	SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | SPI_NOR_HAS_LOCK)},
+	{"gd25lf16", INFO(0xc86315, 0, 64 * 1024, 32,	SECT_4K |
+	SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | SPI_NOR_HAS_LOCK)},
+	{"gd25lf32", INFO(0xc86316, 0, 64 * 1024, 64,	SECT_4K |
+	SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | SPI_NOR_HAS_LOCK)	},
+	{"gd25lf64", INFO(0xc86317, 0, 64 * 1024, 128,	SECT_4K |
+	SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | SPI_NOR_HAS_LOCK)	},
+	{"gd25lf128", INFO(0xc86318, 0, 64 * 1024, 256,	SECT_4K |
+	SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | SPI_NOR_HAS_LOCK)	},
+	{"gd25lf255", INFO(0xc86319, 0, 64 * 1024, 512,	SECT_4K |
+	SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | SPI_NOR_HAS_LOCK | SPI_NOR_4B_OPCODES)},
+	{"gd25lf511", INFO(0xc8631A, 0, 64 * 1024, 1024,	SECT_4K |
+	SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | SPI_NOR_HAS_LOCK | SPI_NOR_4B_OPCODES)},
+	{"gd25lt256e", INFO(0xc86619, 0, 64 * 1024, 512,	SECT_4K |
+	SPI_NOR_QUAD_READ | SPI_NOR_HAS_LOCK | SPI_NOR_4B_OPCODES)},
+	{"gd25lt512", INFO(0xc8661A, 0, 64 * 1024, 1024,	SECT_4K |
+	SPI_NOR_QUAD_READ | SPI_NOR_HAS_LOCK | SPI_NOR_4B_OPCODES)},
+	{"gd55lt01g", INFO(0xc8661B, 0, 64 * 1024, 2048,	SECT_4K |
+	SPI_NOR_QUAD_READ | SPI_NOR_HAS_LOCK | SPI_NOR_4B_OPCODES)},
+	{"gd55lt02g", INFO(0xc8661C, 0, 64 * 1024, 4096,	SECT_4K |
+	SPI_NOR_QUAD_READ | SPI_NOR_HAS_LOCK | SPI_NOR_4B_OPCODES)},
+	{"gd25lx512", INFO(0xc8681A, 0, 64 * 1024, 1024,	SECT_4K |
+	SPI_NOR_OCTAL_READ | SPI_NOR_4B_OPCODES)},
+	{"gd55lx01g", INFO(0xc8681B, 0, 64 * 1024, 2048,	SECT_4K |
+	SPI_NOR_OCTAL_READ | SPI_NOR_4B_OPCODES)},
+	{"gd55lx02g", INFO(0xc8681C, 0, 64 * 1024, 4096,	SECT_4K |
+	SPI_NOR_OCTAL_READ | SPI_NOR_4B_OPCODES)},
 };
 
 const struct spi_nor_manufacturer spi_nor_gigadevice = {
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
