Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 607A9EB64DA
	for <linux-mtd@archiver.kernel.org>; Thu, 15 Jun 2023 17:34:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RDvU43FbfLXu2xndLwbF96LiD2i2Q5CXcO6xP9T1x8E=; b=T/xy4CPvCIl3dE
	67BU++f8GM0qSF9bpiNbnHrvs1+NBJ6FVJjoWbWZxUWiWD2/XprhrXMLIpR3Ah0SR4XiZISJCbVsP
	/QM1D2/rdkTeS1EFwyMz4HoyOvwpmenz114vjkcO3ErPhp0WA4jyvAEBR1/v39eyTjQRYgV0LX0WF
	ToFM+wFHPXqKw0KoWIPuEQczxY6I0noFjCXlO1Yj712foiNPvjZSeVBRA/leM+NBIXVRjf2Wd0Vwl
	8RcMaFe3m98blArxy4udUj4suc/BNhrW9JOhFLbA4czPSGUoyKWMeX2Ra5HiTfUKZ0Qzggu1bGB54
	rGRmlHwmxltBLKHQqi+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q9qrj-00FbeO-0m;
	Thu, 15 Jun 2023 17:34:35 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q9qre-00Fbah-0E;
	Thu, 15 Jun 2023 17:34:34 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-98220bb31c6so327774566b.3;
        Thu, 15 Jun 2023 10:34:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686850468; x=1689442468;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6YhjaIcOgdSC4loqdzWjGFqfQ0Mx8Oy4umDdDUkZduk=;
        b=jwM1Pqg8HWVT/EJnvWaYVy3KEBqmdy1Y++omiie2N9IE8Qyoh0Lf08ez8cpR2OBQQW
         vfLYhT7fAUSZoBuz1+20EBDtxawgNkuuLBo2tzxhU+7xFy31ABGx3LRZShTVNxUSukSe
         MN+INi2UbtRiCuaNZ/WnSV2WJ3szOiGLECvIlxDJ9IBqCbtlw6C4Xpdrn91bXXv1P73l
         9he9MsGsfpyL5ljmD2lphS5vamDzmtLGF6yVL7DCW8jzkEbyoRi5pZnZGqG5YQW06KFT
         gJlaSoNEZZd3VqHgdsstWA/OD26H98tGrow2pKaPU7h+5QPKDmrc1jHSYJeTu62/z8bX
         D/+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686850468; x=1689442468;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6YhjaIcOgdSC4loqdzWjGFqfQ0Mx8Oy4umDdDUkZduk=;
        b=iYTXneDFq2wl0VIptZE14KDNC0HndfiLQRx9FR569YFtqgnSca38L/DCely+jKkL9f
         gGbH/eqDVgKtEGUankhMSmSGEog46glhypQmD721QgezJ2El24df/QptgjVejYx0h8Dp
         2HrJOrmldOWCI+4zBqEgt8ls/4nk+LIJGHmPNUaprhFxJOzyYWAI+Z/BUm1uyjqs8KD5
         fAmE/PYJyhlF0K5CL8BU5XrI00u5QGoT/GxnU7qZgXaeTrZHn+JF0j4NUmKPz4/2ydtu
         IB/RvXLpcFaz8Y7J85QUEB3fvNfKfvn2M5Y62+kfPwbnfcFaxUNnF+6o7sApJ6DnKUub
         3nKQ==
X-Gm-Message-State: AC+VfDyfmAIuP4rX90pAWKIijn7kN9Wh740tq0nXMNsYYNvzD9xpYR5/
	tNb8GhDAkPLTKDLiLy2T0VA=
X-Google-Smtp-Source: ACHHUZ40xIFgNsRe5nLaezAyQzKIlM3VHTZlanc8Pt4LyFMBoL1eEAL5r0pljbN+89GgE/wdXqvFYQ==
X-Received: by 2002:a17:907:1613:b0:96f:b58e:7e21 with SMTP id hb19-20020a170907161300b0096fb58e7e21mr23568267ejc.52.1686850467735;
        Thu, 15 Jun 2023 10:34:27 -0700 (PDT)
Received: from [192.168.2.2] (81-204-249-205.fixed.kpn.net. [81.204.249.205])
        by smtp.gmail.com with ESMTPSA id lf29-20020a170907175d00b009787062d21csm9647072ejc.77.2023.06.15.10.34.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Jun 2023 10:34:27 -0700 (PDT)
Message-ID: <457c1da7-61dc-2a56-4f86-47413795138c@gmail.com>
Date: Thu, 15 Jun 2023 19:34:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
From: Johan Jonker <jbx6244@gmail.com>
Subject: [PATCH v3 3/3] mtd: rawnand: rockchip-nand-controller: add skipbbt
 option
To: miquel.raynal@bootlin.com
Cc: richard@nod.at, vigneshr@ti.com, heiko@sntech.de,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 yifeng.zhao@rock-chips.com
References: <0047fc52-bc45-a768-8bdd-c0f12cddc17e@gmail.com>
Content-Language: en-US
In-Reply-To: <0047fc52-bc45-a768-8bdd-c0f12cddc17e@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230615_103430_120131_7A8DC2CA 
X-CRM114-Status: GOOD (  13.07  )
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

On Rockchip SoCs the first boot stages are written on NAND
with help of manufacturer software that uses a different format
then the MTD framework. Skip the automatic BBT scan with the
NAND_SKIP_BBTSCAN option so that the original content is unchanged
during the driver probe.
The NAND_NO_BBM_QUIRK option allows us to erase bad blocks with
the nand_erase_nand() function and the flash_erase command.
With these options the user has the "freedom of choice" by neutral
access mode to read and write in whatever format is needed.

Signed-off-by: Johan Jonker <jbx6244@gmail.com>
---

Changes V3:
  Change prefixes

Changed V2:
  reword

---

I'm aware that the maintainer finds it "awful",
but it's absolute necessary to:
1: read/write boot blocks in user space without touching original content
2: format a NAND for MTD either with built in or external driver module

So we keep it include in this serie.
---
 drivers/mtd/nand/raw/rockchip-nand-controller.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/mtd/nand/raw/rockchip-nand-controller.c b/drivers/mtd/nand/raw/rockchip-nand-controller.c
index 5a0468034..fcda4c760 100644
--- a/drivers/mtd/nand/raw/rockchip-nand-controller.c
+++ b/drivers/mtd/nand/raw/rockchip-nand-controller.c
@@ -188,6 +188,10 @@ struct rk_nfc {
 	unsigned long assigned_cs;
 };

+static int skipbbt;
+module_param(skipbbt, int, 0644);
+MODULE_PARM_DESC(skipbbt, "Skip BBT scan if data on the NAND chip is not in MTD format.");
+
 static inline struct rk_nfc_nand_chip *rk_nfc_to_rknand(struct nand_chip *chip)
 {
 	return container_of(chip, struct rk_nfc_nand_chip, chip);
@@ -1153,6 +1157,9 @@ static int rk_nfc_nand_chip_init(struct device *dev, struct rk_nfc *nfc,

 	nand_set_controller_data(chip, nfc);

+	if (skipbbt)
+		chip->options |= NAND_SKIP_BBTSCAN | NAND_NO_BBM_QUIRK;
+
 	chip->options |= NAND_USES_DMA | NAND_NO_SUBPAGE_WRITE;
 	chip->bbt_options = NAND_BBT_USE_FLASH | NAND_BBT_NO_OOB;

--
2.30.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
