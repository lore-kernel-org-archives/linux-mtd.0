Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92E59CCF9F8
	for <linux-mtd@archiver.kernel.org>; Wed,  5 Nov 2025 07:49:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Na/miVINaGI8HxZAJaZBngfjNDAKk0ypBR3Yjv9ebXs=; b=44AnoFtoRqnxY8
	6yttTAGxs7KRxn8Vx2PECOgGaokdhpKsegIrIXjXMtxZJNutdltZWV7Z0Ww/9o/ANfX742t346Zzo
	/2sTzGSzZkICk6cAX8yYv5y2i2rFqvMGmB8Gim3K3Om5a3X7Q3V7+fawVFojGs/k3ZAy7QrRopNXf
	9qzIhzreDkqXVywwuYqT8f7npXDr2LvAbygiEcI4C9crab4Pc4gw8p0jt5x1V9sUzivvEwubehZqf
	NPRVPifJZ7eaFh/Jn1CsAkr1L6JCbTzTG4aI74CMl+bIfffR7xOkfPc0nrdTfQPXLBcK0+1EaqliR
	zLhmUSh3wcCHySpsEKQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGYGD-0000000DEAl-3PA5;
	Wed, 05 Nov 2025 07:48:53 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGYGC-0000000DEA5-0R6X
	for linux-mtd@lists.infradead.org;
	Wed, 05 Nov 2025 07:48:53 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-29599f08202so40844265ad.3
        for <linux-mtd@lists.infradead.org>; Tue, 04 Nov 2025 23:48:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762328931; x=1762933731; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n2dXDMbS4ZadtFN+PyoUE4mGeEjAPz+823eSljV2/WM=;
        b=KzqcvpwC66WDPwFJN1wGNCZLwtjHqCvOA2rlXVOKwWFfs/tcZeVbUAmPZysAodyLdj
         Sm2nD68wai9d+4R7yM9G75RO93BrbyXKFr2ntLlvBRg4MRytoz58MQfm1PTib88QPseO
         PQSYtyHGmMT+smWT2f048578YfyCo9pe/+VyFxg0WEIxZesv1SQowheyxXFVsJPLo1mB
         9HU/GJWkQIuhdw4UWeZmyvtCnvVuwLNj/H9yju1hEtNea56STbF11pnBbcU95729KcOF
         /Xk6h507jTP64wr4SEm8ZLjbSIrh8CtFyQncmwYNI4fhBr6wje93Wrqz2RjdqTImw6AE
         rMQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762328931; x=1762933731;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n2dXDMbS4ZadtFN+PyoUE4mGeEjAPz+823eSljV2/WM=;
        b=RxTgdgoZPrgSpue3gk2IcIfCEtQGrMRIOl+t/C36jwmLMXYrrhunEOqU30tPqDHKxG
         piPwqZ7MUYqlIRBQVL9vlcfZyNdpWSjQa3zsYtn5cipDBWSJCHDXc428LFJaMW+rnWEd
         +dLYommH9BdOkH3JHiwEhebdweQrh6e2G7uXmgDtmf/aXkKEn24D374uvWwIL5BEExOe
         oewCDrCFeY9lKSRVGssSYrL9/tHvqs6MX23xhOc2e5iqvCsWF4Uoxhi9sXSDqzbpfOuV
         RYttcMERNlNjJ2ZeYpGeBCwjrN/n6dbH1UPB5CTS99gYhEg9QMufp2X6w7kk3rNa0fBd
         /TwQ==
X-Gm-Message-State: AOJu0YwuDVKtTWiufkWQOztlk6ktA56S9x29N6UBnBYcyeE7ZgA5unGK
	Kd+iuKn4wBtLrN8lbI6Rx0RUMA5Xc7eVLY+P6VSFCa+/kTEELM5F7UCR
X-Gm-Gg: ASbGncvEDgYF+1uD29IB/292owanQA7xOUnpbWDLttN4QudSiaoVTjAOihUw3kvdU83
	oDgRpSm3i3heqwWy4+i1A+ybhaXxS95IfhM8W5NEZMw2MzMCzBqLMJSIFYctx6JDXFc1KweJklE
	qjS0HzGamippPi1KcfjfJ/uPZDvI/vpeLZsTqKU/eCkTDM8M5zcQyFKN8aHxEbsn09qdlTJVXN+
	+Unw1i5ZyseRw9ceFbfZZ7P9msHVt+cn40ErYti4DU9TUdXw6iHfVa7UW7vk9QM8hWFxx0+t1RC
	wufcJjFZFlzo9HjDpkigypb4ZvkEw9lC2Lr+TC3k9LdaFVsKQfwgXnZRz3LSHSEalfdXUYRVzAI
	ejMMuSol8tU+40donIzpNAXEQi7ae1tmScbGRzoos9HNXKe7HXG0luZOrYEcSR4PAZcPvaA8S/4
	OuvzR+1uEtLhdzEWQp1hTan65F3atCmzKhsTlURVKUJ1/Zw2KxD1IRNXWXKHErSiRyeH6m
X-Google-Smtp-Source: AGHT+IGwjhbHCrSIYYxs5ggXUedTi5MyxYZDYcPG0zxnBQaAx/ghpOMWz8w4ztpv3bw1eLJhcf344w==
X-Received: by 2002:a17:902:d505:b0:290:c0ed:de42 with SMTP id d9443c01a7336-2962ada2117mr36675415ad.36.1762328931245;
        Tue, 04 Nov 2025 23:48:51 -0800 (PST)
Received: from ISCN5CG2520RPD.infineon.com (KD106168128197.ppp-bb.dion.ne.jp. [106.168.128.197])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29601a5d74csm52174625ad.76.2025.11.04.23.48.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Nov 2025 23:48:50 -0800 (PST)
From: Takahiro Kuwano <tkuw584924@gmail.com>
X-Google-Original-From: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
Date: Wed, 05 Nov 2025 16:47:58 +0900
Subject: [PATCH v2 1/3] mtd: spi-nor: sfdp: introduce smpt_read_dummy fixup
 hook
MIME-Version: 1.0
Message-Id: <20251105-s25fs-s-smpt-fixup-v2-1-c0fbd0f05ce7@infineon.com>
References: <20251105-s25fs-s-smpt-fixup-v2-0-c0fbd0f05ce7@infineon.com>
In-Reply-To: <20251105-s25fs-s-smpt-fixup-v2-0-c0fbd0f05ce7@infineon.com>
To: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Takahiro Kuwano <Takahiro.Kuwano@infineon.com>, tkuw584924@gmail.com
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762328922; l=3552;
 i=Takahiro.Kuwano@infineon.com; s=20250227; h=from:subject:message-id;
 bh=Y6gCu8pPNvoaaRlxS0r2zcF5cZ7AtnTriNRfIAsny+8=;
 b=qm9kpfsjYgh2IDEtyLHT7wJAwnQk/1ZlXlG16ZoG+XF99c3jgO1rzmonmxivaARRWCziFjouU
 25dlgimw7u9CumWOY3/nTkb308qOvavwoP3UoGiHKGl95jBKq3iYUZG
X-Developer-Key: i=Takahiro.Kuwano@infineon.com; a=ed25519;
 pk=aS8V9WLuMUkl0vmgD0xJU19ZajdJmuyFBnBfVj0dfDs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251104_234852_175864_72309D41 
X-CRM114-Status: GOOD (  17.46  )
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

SMPT contains config detection info that describes opcode, address, and
dummy cycles to read sector map config. The dummy cycles parameter can
be SMPT_CMD_READ_DUMMY_IS_VARIABLE and in that case nor->read_dummy
(initialized as 0) is used. In Infineon flash chips, Read Any Register
command with variable dummy cycle is defined in SMPT. S25Hx/S28Hx flash
has 0 dummy cycle by default to read volatile regiters and
nor->read_dummy can work. S25FS-S flash has 8 dummy cycles so we need a
hook that can fix dummy cycles with actually used value.

Inroduce smpt_read_dummy() in struct spi_nor_fixups. It is called when
the dummy cycle field in SMPT config detection is 'varialble'.

Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>
Tested-by: Marek Vasut <marek.vasut+renesas@mailbox.org> # S25FS512S
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
