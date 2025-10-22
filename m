Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7370CCD195
	for <linux-mtd@archiver.kernel.org>; Wed, 22 Oct 2025 10:07:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Yh5S/v+nKeDp6uMx2Z9YxbHgPwQAhTNOhzVmNZR8z5Y=; b=e6+U9pPxFMZWmw
	7SiWISl9erId1pgcUwoVTyeoE0FAH29Z9ibpOICrvJj45WukPbye2MEf5UbRuQgxy1yIc/YCeWLoR
	Z9UU/7p1s1eaVYrdKvAxPDI/qlvXeYwMyR83a4aqhwxdb5GkQ5rkCEHlQ43/e242RtCj+EposXhPv
	IqDYU+1VM3NHM7bk/ScEqSr0RxXlYlYvf6OES6h3A6mbSympLwfrn6mvsrMDuDEqpp7suXdZz4arY
	HzxP7GpgigAMmqIT6o73zNQP+pQfs+5p0Luo0FeAiiOPSIKsSzMyuLx27xMEDx8NiZLiA1pLC8tbc
	g/2PBIFmt/DLMZdunS4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBVl4-00000002PMk-3sZk;
	Wed, 22 Oct 2025 10:07:54 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBVkz-00000002PJ0-12m8
	for linux-mtd@lists.infradead.org;
	Wed, 22 Oct 2025 10:07:53 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-2907948c1d2so71195915ad.3
        for <linux-mtd@lists.infradead.org>; Wed, 22 Oct 2025 03:07:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761127668; x=1761732468; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tmV9fCMr++K8ts5w/0Bxy7I3jHnhgfz3UV/3J0ZHaWo=;
        b=iqw3OjehGJG3AFijtIa262Q9rmcvKmcr9hS4T5lMno0ZJlJRS/1DT9lDOfRvVjT84j
         krMR2tR7YdK9Q03+ueLkV1urrYX1v+st7Q65tZqnSWfPuCoRWsBo8BOmbVez//tuy056
         3GSCoCDgeDZW1OS3rA7zr1Oqtcpwnkxe8KXtNShA1vUK9xJlJywrB+qaYNUx5KGZ8yZN
         zZY+w/eD8LvClZvJiOEc+1dj8npwdKHGidlbsoWVj7cfW1fKso7+oWXzzvvTwt5cRNxG
         ktdv1Z5nFHtY3Sb6t1+1N/nbHUAU5kZTe18jO4ImI+X/40Idyy4nxDqUQOLB4lnGni1j
         DwGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761127668; x=1761732468;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tmV9fCMr++K8ts5w/0Bxy7I3jHnhgfz3UV/3J0ZHaWo=;
        b=elWcMPgY97XecSOCa8KwhUxQSrOHheZFYK1pStvsM3AZPXmqKREpmPqrs/gWYyc49e
         k48SSCiAkkY4RbAt6Tbulxz3QYdpG0FzuvZVh6qdlzN9+w7aF7+xuwNtbHLEhJN0dJJo
         jSaDAiZb6AEZimpDMpwrs3gas/jduYpk9NmOcuekJT6Rgk/tDmyORbxiO4Z/X0JGo0bD
         EfruH0mLOUNNxagmLnsh8pP5/xELNBg9e/BisJWbY68cEzk1tcj627fZsEJZIox4wh+9
         6/LkmoD3N2BYe8pM1+mo86hQNnxF/nuLsUhVeckcsHQtGGRahdwSz/aWoglEgAm/Witp
         jM7w==
X-Gm-Message-State: AOJu0Yyqxvif3TeTGVShn6/sRNXWyuv8INftdOcHRL3FUjPbGiIW/im5
	CeMpNMaaqy+8DcLPZtirvCX8IUriZw88iUckCeE4RaJswWGZRqkpRym7
X-Gm-Gg: ASbGncsJf/PUtyZG0OBgee7rDY/vadaUUv6FYWo1oLS0k9h034ByeSdd/zEUFzqDV7j
	cf+YvSPvmtAno7njR9webvKMFehdfLivLyAhF31WiAMpHzSQaTmGSQM4x404tpBmGGrngjTWOCR
	9qG+ibma7yxqV+c1n2spQ6Y7khDCynyjmOHvyUX88rQjtpCw3pfm2H49GXnR9zIHK6uALEoIJoi
	TLIT2hsMoa8/jGaQO4TNTlkwbH9fwqG2otiL1Oz7emZuIPalrUWRDgm5aq7rLjOQ2ivTgUW+1Rj
	3MXGzwo75TrQo6UfXF+Ouv1OvtvUHivMb/PitYpqUzPloBSYB6o8Png359YWwlqwZ5ZFbyiQ2bU
	7Uo+O7XiNGyNY7PAwv44sq8Ux8yI0VAI1Qoufb8/1KslDBeKaIFESWaEl0MkKJ/trGMP1/R7BFZ
	cBIEj8O/sAP+FxTDXyQiDiqF6vuZHpOhLpHkmIkISdCv4tA8xo7FLy5FrDWy5oC3tXDrAhkcLyE
	xwzTNU=
X-Google-Smtp-Source: AGHT+IGmAyoOf1blTsx9zbXEb1T36PS8OzuPvHqvqIWm+8GwFN3zHx9eDgBeC1jDzo6A+Oib9IpRiQ==
X-Received: by 2002:a17:902:ce8c:b0:267:e3af:ae67 with SMTP id d9443c01a7336-290c9ca6b29mr317088695ad.14.1761127668205;
        Wed, 22 Oct 2025 03:07:48 -0700 (PDT)
Received: from ISCN5CG2520RPD.infineon.com (KD106168128197.ppp-bb.dion.ne.jp. [106.168.128.197])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-292471fdd10sm133774585ad.83.2025.10.22.03.07.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Oct 2025 03:07:47 -0700 (PDT)
From: Takahiro Kuwano <tkuw584924@gmail.com>
X-Google-Original-From: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
Date: Wed, 22 Oct 2025 19:07:20 +0900
Subject: [PATCH 1/3] mtd: spi-nor: sfdp: introduce smpt_read_dummy fixup
 hook
MIME-Version: 1.0
Message-Id: <20251022-s25fs-s-smpt-fixup-v1-1-ce26d4084b2d@infineon.com>
References: <20251022-s25fs-s-smpt-fixup-v1-0-ce26d4084b2d@infineon.com>
In-Reply-To: <20251022-s25fs-s-smpt-fixup-v1-0-ce26d4084b2d@infineon.com>
To: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Takahiro Kuwano <Takahiro.Kuwano@infineon.com>, tkuw584924@gmail.com
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761127659; l=3092;
 i=Takahiro.Kuwano@infineon.com; s=20250227; h=from:subject:message-id;
 bh=EE+lQvhBcq8YWD8yg0KXpLqUBc6P3VmAPuUl2lPwJ4M=;
 b=fnudW1b5lbsiOhhodsmvx5JidPX2ZaZ/gj2RhsLV8gMTZhFjyYB5rlHvGy23RPN0gf3apC4r6
 8FuCpNV5RReAmciNr5pQDwPHfAGPIcbRnWBumBlSth29mu1NJPz9OZd
X-Developer-Key: i=Takahiro.Kuwano@infineon.com; a=ed25519;
 pk=aS8V9WLuMUkl0vmgD0xJU19ZajdJmuyFBnBfVj0dfDs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251022_030749_372646_B413DAF5 
X-CRM114-Status: GOOD (  16.99  )
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

SMPT contains config detection info that descibes opcode, address, and
dummy cycles to read sector map config. The dummy cycles parameter can
be 'variable' and should be determined in device specific fixup hook.

Inroduce smpt_read_dummy() in struct spi_nor_fixups. It is called when
the dummy cycle field in SMPT config detection is 'varialble'.

Signed-off-by: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
---
 drivers/mtd/spi-nor/core.h |  3 +++
 drivers/mtd/spi-nor/sfdp.c | 18 ++++++++++++++++--
 2 files changed, 19 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
index ceff412f7d65ab7b856795ca5c092cddbf598cd6..5ad46d95d09cc9d527f71579a71eed210e726f68 100644
--- a/drivers/mtd/spi-nor/core.h
+++ b/drivers/mtd/spi-nor/core.h
@@ -409,6 +409,8 @@ struct spi_nor_flash_parameter {
  *                flash parameters when information provided by the flash_info
  *                table is incomplete or wrong.
  * @post_bfpt: called after the BFPT table has been parsed
+ * @smpt_read_dummy: called during SMPT table is being parsed. Used to fix the
+ *                   number of dummy cycles in read register ops.
  * @post_sfdp: called after SFDP has been parsed (is also called for SPI NORs
  *             that do not support RDSFDP). Typically used to tweak various
  *             parameters that could not be extracted by other means (i.e.
@@ -426,6 +428,7 @@ struct spi_nor_fixups {
 	int (*post_bfpt)(struct spi_nor *nor,
 			 const struct sfdp_parameter_header *bfpt_header,
 			 const struct sfdp_bfpt *bfpt);
+	void (*smpt_read_dummy)(const struct spi_nor *nor, u8 *read_dummy);
 	int (*post_sfdp)(struct spi_nor *nor);
 	int (*late_init)(struct spi_nor *nor);
 };
diff --git a/drivers/mtd/spi-nor/sfdp.c b/drivers/mtd/spi-nor/sfdp.c
index 21727f9a4ac6926080a116e30830c9533122fdad..9a47dcaca06ae2ad85ac8503658083b1d56d8b96 100644
--- a/drivers/mtd/spi-nor/sfdp.c
+++ b/drivers/mtd/spi-nor/sfdp.c
@@ -699,6 +699,17 @@ static u8 spi_nor_smpt_addr_nbytes(const struct spi_nor *nor, const u32 settings
 	}
 }
 
+static void spi_nor_smpt_read_dummy_fixups(const struct spi_nor *nor,
+					   u8 *read_dummy)
+{
+	if (nor->manufacturer && nor->manufacturer->fixups &&
+	    nor->manufacturer->fixups->smpt_read_dummy)
+		nor->manufacturer->fixups->smpt_read_dummy(nor, read_dummy);
+
+	if (nor->info->fixups && nor->info->fixups->smpt_read_dummy)
+		nor->info->fixups->smpt_read_dummy(nor, read_dummy);
+}
+
 /**
  * spi_nor_smpt_read_dummy() - return the configuration detection command read
  *			       latency, in clock cycles.
@@ -711,8 +722,11 @@ static u8 spi_nor_smpt_read_dummy(const struct spi_nor *nor, const u32 settings)
 {
 	u8 read_dummy = SMPT_CMD_READ_DUMMY(settings);
 
-	if (read_dummy == SMPT_CMD_READ_DUMMY_IS_VARIABLE)
-		return nor->read_dummy;
+	if (read_dummy == SMPT_CMD_READ_DUMMY_IS_VARIABLE) {
+		read_dummy = nor->read_dummy;
+		spi_nor_smpt_read_dummy_fixups(nor, &read_dummy);
+	}
+
 	return read_dummy;
 }
 

-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
