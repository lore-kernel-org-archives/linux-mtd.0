Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37226C001DB
	for <linux-mtd@archiver.kernel.org>; Wed,  1 Nov 2023 09:43:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=al8JdRiXyujUj0SwIuBYJ2ZAtrm0xFE26Ppl3Gw7Dwk=; b=m8YHEYxCby/Y/5
	BiOM63m8MaHoSO4WE3lFUd8WbwqGgsi7bvSD8rCCI0J/y7mO9dixawmwI/NRPkzeVYCuOHr5Od7H5
	9xr00bhwuI7GMKykVuYADieEAQkxO7vSmU1h3pbaJFMox2jus/5/GJBa4b1AxRMefOh+wtwBNp382
	0UG8gyTx6nokIWtuciR6nU8aOieSCFHPuP1kYc/JBrc5cCQrie0EmalJgSGIx661FaTZvfnzq+KmN
	vl+jDKi/pKkJ6dABrFeNgU7tt8Y3xq0S2CzSNCEDKO2PhFyjpFRl0Gp24m8DtgaMknDAkmS86l5W8
	Z3VUi81cBVCEJHzC+nEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qy7lQ-006yGS-0F;
	Wed, 01 Nov 2023 09:43:52 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qy7lG-006y9N-1i
	for linux-mtd@lists.infradead.org;
	Wed, 01 Nov 2023 09:43:49 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-9c41e95efcbso923531366b.3
        for <linux-mtd@lists.infradead.org>; Wed, 01 Nov 2023 02:43:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698831819; x=1699436619; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sch/yDjGkv+KlDP0WKcAbxGHQSKECCTo52rJFUWz8h4=;
        b=b0PzqaOblINWBZxY9yLGWEjXN+300SgZS3mqpS2Ke7pQncfnESic74RlfvfQQxsWtQ
         ZErYauLHX6t1+lQpl5cl44KZkHM0cMzuLHdpa0jL1Cz31Glka6FS/Ed4d3/REIaGUvlA
         zYPYuGotQ64KFpOVz3JscSrQIMxsyaWH87Xr2bYLX4Pid2diIUib8GAs8FTTFnLvZzdh
         QsKAui9J1qJ0/X1vHA13rs9ooudtl5Rugu95JFUlB2V87gKx6J4lh+8dX+GYgCAxmxOS
         WR5QiX6yBGac3F2fNvo+2+LxZCtBvbvaWHy53sAw3eVnTFIo6xtxrYs1q8DCchqyAjDD
         NVhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698831819; x=1699436619;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sch/yDjGkv+KlDP0WKcAbxGHQSKECCTo52rJFUWz8h4=;
        b=j6IH5084eLcLRlFLzapHAlU2tyG6zSUw9TrIInWNFOHlmeMKP3T5JVhns8X5NuH9fy
         KQ3GQcBVA5sXx1s3i/VsWDrPWFOKE7TUjZFyGV9iwFKEHuOIVOQAKqSs4dBfPzzTEt6d
         fTXp/T2KFepyNPJfxcGMBBrv3vrvJHszZkHB556OkmPGnIRg3hTeXT1jUvdkgbidi22H
         wZ6ACCjKAEVtYUqPzSCcq4knTJonfhEG3rPh+UFucpFkOdsedj94Dosq4tSmvSppdass
         HHrZoRhCG7tL5K7cEHmdqp7PKiLlI7Ag1M6tlb4XxSQatER6gLwtYSwDbNoTRZ+uP6ZA
         6fFw==
X-Gm-Message-State: AOJu0YzcaxGAunqg4gowX1M2Zc/5fQghcUIn494ERubBjiFmaNcMoxmL
	5kcMCY7XSfH6uZHYEKs1SqGy99GQKl3GSMxUVQ0=
X-Google-Smtp-Source: AGHT+IFYsUnajlUVCIzXpWVZUuihYflRGsWT2S6kwzA+Kgaimfjt4ymF4vZSTHPMX2kuRuvCmBSpSg==
X-Received: by 2002:a17:906:fb0d:b0:9a1:c447:3c62 with SMTP id lz13-20020a170906fb0d00b009a1c4473c62mr1203718ejb.49.1698831818850;
        Wed, 01 Nov 2023 02:43:38 -0700 (PDT)
Received: from 1.. ([79.115.63.76])
        by smtp.gmail.com with ESMTPSA id gq23-20020a170906e25700b0099e12a49c8fsm2206415ejb.173.2023.11.01.02.43.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Nov 2023 02:43:38 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
To: michael@walle.cc,
	festevam@denx.de,
	takahiro.kuwano@infineon.com
Cc: miquel.raynal@bootlin.com,
	richard@nod.at,
	linux-mtd@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	bacem.daassi@infineon.com,
	Tudor Ambarus <tudor.ambarus@linaro.org>
Subject: [PATCH 6/6] mtd: spi-nor: micron-st: Add support for mt25qu01g
Date: Wed,  1 Nov 2023 11:43:25 +0200
Message-Id: <20231101094325.95851-7-tudor.ambarus@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231101094325.95851-1-tudor.ambarus@linaro.org>
References: <20231101094325.95851-1-tudor.ambarus@linaro.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2847; i=tudor.ambarus@linaro.org; h=from:subject; bh=FN95MDStU0W7lUTO984uRiZPl3auH/CwE9nBkCd1f7s=; b=owEBbQGS/pANAwAKAUtVT0eljRTpAcsmYgBlQh29Tu73VMwCQWa+iaS8s1otBhT4eRYpvt5uW 8pnLMmay6qJATMEAAEKAB0WIQQdQirKzw7IbV4d/t9LVU9HpY0U6QUCZUIdvQAKCRBLVU9HpY0U 6bJgB/9aae6lW7+7fwmO4f4dKxTFCYVv1Ng+WuqbR/MGbOH9XNls7JQIALP02AXbq9waFwyRn0O Gqjua1QcLfXptTip1ychKMMCHmrNTQuz3iQXeyc6iChNIyA666ZxSTr1TKJhsCYsNthoxl2KOkq XLFgYqj3FGVgh/rw/n/RGmHaSoPBpG4ubtNwrHuAyn3oqan3n5Xf8JJJQbJQSDFvUABt7ShNjuC bnfZfyCrgt4OfqxjK0GsCSIweU3oWnLFNVIC/0hHXkaHLcDtpq07Dzl45FofjxBHh9b4vFI0kB4 BFX56yds7XpnFMq3KvnQAW/19e//+iJxivANgSocxILTXXPB
X-Developer-Key: i=tudor.ambarus@linaro.org; a=openpgp; fpr=280B06FD4CAAD2980C46DDDF4DB1B079AD29CF3D
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231101_024342_594567_EB74AA44 
X-CRM114-Status: GOOD (  11.95  )
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

From: Fabio Estevam <festevam@denx.de>

Add support for the MT25QU01G 128MB Micron Serial NOR Flash Memory
model.

Datasheet:
https://www.micron.com/-/media/client/global/documents/products/data-sheet/nor-flash/serial-nor/mt25q/die-rev-b/mt25q_qlkt_u_01g_bbb_0.pdf

Tested on a i.MX8MP based board:

 # dmesg | grep spi-nor
spi-nor spi0.0: mt25qu01g (131072 Kbytes)

 # cat /proc/mtd
dev:    size   erasesize  name
mtd0: 08000000 00001000 "30bb0000.spi"

~# cat /sys/devices/platform/soc@0/30800000.bus/30bb0000.spi/spi_master/spi0/spi0.0/spi-nor/jedec_id
20bb21104400

~# cat /sys/devices/platform/soc@0/30800000.bus/30bb0000.spi/spi_master/spi0/spi0.0/spi-nor/manufacturer
st

~# cat /sys/devices/platform/soc@0/30800000.bus/30bb0000.spi/spi_master/spi0/spi0.0/spi-nor/partname
mt25qu01g

~# xxd -p  /sys/devices/platform/soc@0/30800000.bus/30bb0000.spi/spi_master/spi0/spi0.0/spi-nor/sfdp
53464450060101ff00060110300000ff84000102800000ffffffffffffff
ffffffffffffffffffffffffffffffffffffe520fbffffffff3f29eb276b
273b27bbffffffffffff27bbffff29eb0c2010d80f520000244a99008b8e
03e1ac0127387a757a75fbbdd55c4a0f82ff81bd3d36ffffffffffffffff
ffffffffffffffffffe7ffff21dcffff

~# md5sum  /sys/devices/platform/soc@0/30800000.bus/30bb0000.spi/spi_master/spi0/spi0.0/spi-nor/sfdp
9d28d1b11de8b15ba9152644219d9a78 /sys/devices/platform/soc@0/30800000.bus/30bb0000.spi/spi_master/spi0/spi0.0/spi-nor/sfdp

Signed-off-by: Fabio Estevam <festevam@denx.de>
[ta: introduce die erase]
Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/mtd/spi-nor/micron-st.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/mtd/spi-nor/micron-st.c b/drivers/mtd/spi-nor/micron-st.c
index 8706ef841375..6d8dd6bfbf69 100644
--- a/drivers/mtd/spi-nor/micron-st.c
+++ b/drivers/mtd/spi-nor/micron-st.c
@@ -203,10 +203,24 @@ static int st_nor_four_die_late_init(struct spi_nor *nor)
 	return 0;
 }
 
+static int st_nor_two_die_late_init(struct spi_nor *nor)
+{
+	struct spi_nor_flash_parameter *params = nor->params;
+
+	params->chip_erase_opcode = SPINOR_OP_MT_CHIP_ERASE;
+	params->n_dice = 2;
+
+	return 0;
+}
+
 static struct spi_nor_fixups n25q00_fixups = {
 	.late_init = st_nor_four_die_late_init,
 };
 
+static struct spi_nor_fixups mt25q01_fixups = {
+	.late_init = st_nor_two_die_late_init,
+};
+
 static struct spi_nor_fixups mt25q02_fixups = {
 	.late_init = st_nor_four_die_late_init,
 };
@@ -449,6 +463,11 @@ static const struct flash_info st_nor_parts[] = {
 			 SPI_NOR_BP3_SR_BIT6,
 		.no_sfdp_flags = SECT_4K | SPI_NOR_QUAD_READ,
 		.mfr_flags = USE_FSR,
+	}, {
+		.id = SNOR_ID(0x20, 0xbb, 0x21, 0x10, 0x44, 0x00),
+		.name = "mt25qu01g",
+		.mfr_flags = USE_FSR,
+		.fixups = &mt25q01_fixups,
 	}, {
 		.id = SNOR_ID(0x20, 0xbb, 0x21),
 		.name = "n25q00a",
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
