Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78F07C54ED0
	for <linux-mtd@archiver.kernel.org>; Fri, 23 May 2025 12:08:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RAP33+j88wkI72gQoAsps6qar2yC0fhREqisXFhRPnk=; b=rSVzsjksIenrLc
	leJt0PpvhfNrRm4LyBlhnb+NvP0XriliTBvFv76T3vgiohKJjZwoOl0rw+4UgPKYqE+j+osYd+6TP
	xL5QkJgAaJ07VUiqoO7rG8aatPUAe9+rkg0Iw1/bOmN85RmxhD0Ti2JJp+3OLtcpyeKvjgLB1FAkk
	L6SKlQ3swnxU+h11hGOur5hjxZsNhiTpHVpO256BRTApb3H/u8A84uhUQldUug+dcQ1g4cPBFSXuf
	YPlgCqQ0UkhP74MR+UtUbmo4Pt2AyLi1NZ4PW3+sSysFsB7he9dkf37j+SOQFpbIV+hOhz/qmoBfO
	7HXofhSVDMfQaawASlHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIRCK-00000003m6I-38Ns;
	Fri, 23 May 2025 12:08:24 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIQ3S-00000003eNe-48xj;
	Fri, 23 May 2025 10:55:12 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-742c9563fafso5116441b3a.0;
        Fri, 23 May 2025 03:55:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747997710; x=1748602510; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Af/z8wwyeFXwEhzwxCix9R1kShAhXfBPAEq0I6jGtUU=;
        b=Zfvlqd7WIhW++7MMCgsE7vgowO8tV/u+NCZZBA6GcDS3evSl1gHfha8pmEwQrPd2Gv
         BlLCLs+dcdatY2LfMASq1cyDAqIqiGMofUbYV7mxWOoSICfW5C+px9/9PeaH7Ry4k5ML
         QbCBXB7PJvKflIzYNjAn+eOR+iq3H+d/FzjOzefbTGFGoXBdxa2FDBTaASrRFEWlkbqO
         NcMwXo1u2pzDPkTQEoC9DEUEY7YEAbbQVUKZcGiJsbve1DB3Wd272Od3ups1TXQIS7KC
         R1sQ6b1h6QyVp2waOJN1ZaX8v1NycC2exa9r0DSno2cn6cKEZyVAdq0ndL29jU8ip8gM
         zfEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747997710; x=1748602510;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Af/z8wwyeFXwEhzwxCix9R1kShAhXfBPAEq0I6jGtUU=;
        b=PtCtebJf03tmmI966d3WmP0oyZVwdZz9w7jBxUb03W6G5okLlVO7RbBUw4K84W7CSP
         cRISm+KNtxRcZES8DfGtc+wG8pBI27nio6Q0rzznnKCTfViA9GnSkUG3uZgKWD1cHPJd
         cVLfs8d8xqCjXxxl1O9WEiePoDkWpTN0qUIVU8BMnIH6lEpKFcUt+e4MgI0TF+kBcbv3
         YXnSADjnaWFM/PjJmMbw3xiimiVgwKTRa+1oF1Ipyplo0KRMLo0/cwC6QckFftqlrSDD
         nzwKNQVwqyGDH3Y7goeB/72BeeMgbwFBR6y5//VSIraSk617pbyQ6xOlEENAA/d2OpjO
         gORQ==
X-Forwarded-Encrypted: i=1; AJvYcCVEtg07wuq3CE8nA53WCUB4R46yt1bCANT9xBPm1GLmCz6R9IbqjW7MnZSp7mGlWCgE44Q+ZzCQUGKOvg==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywm26d2DUZ78uPJCofiVUd8KAv8j/3szLJ7vLMLidtVA2DSjhf7
	ZsmyWwJbM01BTrUmo3lazcTesxUxHlzXO+DUXNekVsYt6BAMKkytIKDE
X-Gm-Gg: ASbGncu14mNWpyDEFLs0vjph/+jJ2VGYUsk6zE9HU/5AGM3Z1oIyKXkGpr4cAEABQlW
	G24evtSmvtAmqguDVFWS3xCNYP1coLNIPelcND0gwTK62AvU+xFOFHo+PrjBDOKuZpuJlmQTNDP
	dlmJVcAqfjviwliTtsswrHXaTAAvkYR2nTkWkr0NmLjRJWy1uznmCN83s+OUSe88H2vPE2fxWC8
	c921xEG97s0Wgy51lP7tGyrQzrlE2bsIFI3i4ALYZnqXOz9ors4Wo81LtE5ERW8LxtztYLEonWR
	lrf/PA6YXZXkFWNk4+C+mNIp/Ug1U92kHSWZ9Yu9wg8ICtwnmRi77Q==
X-Google-Smtp-Source: AGHT+IGI5aXReklpV2gCBTwNnneLjIs6n0VThj40N2VQD3R5/p0nmLA2VAhcsgNJkaCXO4niO0rEVA==
X-Received: by 2002:a05:6a00:4606:b0:736:7270:4d18 with SMTP id d2e1a72fcca58-742a9803dc5mr35780529b3a.14.1747997709877;
        Fri, 23 May 2025 03:55:09 -0700 (PDT)
Received: from [127.0.0.1] ([2001:250:5800:1000::3fc8])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a9739cdesm12623687b3a.82.2025.05.23.03.55.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 May 2025 03:55:09 -0700 (PDT)
From: Zixian Zeng <sycamoremoon376@gmail.com>
Date: Fri, 23 May 2025 18:54:50 +0800
Subject: [PATCH 2/3] mtd: spi-nor: Add GD25LB512ME GigaDevice flash_info
MIME-Version: 1.0
Message-Id: <20250523-sfg-spifmc-v1-2-4cf16cf3fd2a@gmail.com>
References: <20250523-sfg-spifmc-v1-0-4cf16cf3fd2a@gmail.com>
In-Reply-To: <20250523-sfg-spifmc-v1-0-4cf16cf3fd2a@gmail.com>
To: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>, 
 Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Longbin Li <looong.bin@gmail.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 sophgo@lists.linux.dev, linux-spi@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 dlan@gentoo.org, ziyao@disroot.org, Zixian Zeng <sycamoremoon376@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747997691; l=1434;
 i=sycamoremoon376@gmail.com; s=20250113; h=from:subject:message-id;
 bh=wrfl3Lk72HbCltyE08DEiiUBoQE22JPWb7p1k6l72Jw=;
 b=hEwSLbpfM82rWJyMwosPQxvp3UoOlvxmIw3Db3NJlc83C7FuL8x91nrHYfnh2aHM1+AdkmrJL
 in29ql7OAPmCqgpQ3hK85RbC3cC8OF8MyPFP4WKiB+/WzK2VR/TadCn
X-Developer-Key: i=sycamoremoon376@gmail.com; a=ed25519;
 pk=OYfH6Z2Nx3aU1r0UZdvhskmddV6KC6V1nyFjsQQt4J8=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250523_035511_031444_FA68C2F1 
X-CRM114-Status: UNSURE (   9.46  )
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

Add GD25LB512ME SPI-NOR flash information

Signed-off-by: Zixian Zeng <sycamoremoon376@gmail.com>
---
 drivers/mtd/spi-nor/gigadevice.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/mtd/spi-nor/gigadevice.c b/drivers/mtd/spi-nor/gigadevice.c
index ef1edd0add70e6ca501620798a779d621d6bb00d..223b2f598ecd651ce8df6789dfbaf938c534f94f 100644
--- a/drivers/mtd/spi-nor/gigadevice.c
+++ b/drivers/mtd/spi-nor/gigadevice.c
@@ -33,6 +33,15 @@ static const struct spi_nor_fixups gd25q256_fixups = {
 	.post_bfpt = gd25q256_post_bfpt,
 };
 
+static void gd25lb512me_default_init(struct spi_nor *nor)
+{
+	nor->params->quad_enable = spi_nor_sr1_bit6_quad_enable;
+}
+
+static const struct spi_nor_fixups gd25lb512me_fixups = {
+	.default_init = gd25lb512me_default_init,
+};
+
 static const struct flash_info gigadevice_nor_parts[] = {
 	{
 		.id = SNOR_ID(0xc8, 0x40, 0x15),
@@ -82,6 +91,14 @@ static const struct flash_info gigadevice_nor_parts[] = {
 		.size = SZ_16M,
 		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB,
 		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
+	}, {
+		.id = SNOR_ID(0xc8, 0x67, 0x1a),
+		.name = "gd25lb512me",
+		.size = SZ_64M,
+		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB,
+		.no_sfdp_flags = SECT_4K | SPI_NOR_QUAD_READ,
+		.fixups = &gd25lb512me_fixups,
+		.fixup_flags = SPI_NOR_4B_OPCODES,
 	},
 };
 

-- 
2.49.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
