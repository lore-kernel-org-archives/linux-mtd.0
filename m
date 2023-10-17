Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DE68CDB474
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Oct 2023 07:47:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jHIQg6fB7oATCbqnnodmqHMb1yVVNdY87RaCobgEDT4=; b=H6KZcJf+poMUIU
	D1V1DKqNYbqfDNOcehIqGjpMCXZahEFQvu5M9IHPiU/x394pSAk8/EKNPsHd/jjz8YpzFiVviMflD
	anUnebETVPLJhHgCi35W+4SS1bSvVbJAhX66VaQePnODRgyKCtrhbjcXJNevQGbNqAp8kO7jBwRs7
	fIMPLFdAlT6HaEd/jVz25mgqmuBR8W59lX5CwH7Wilr5Td7htWXtSUT594VfJjCEdzRNFqxHfyeAZ
	zJ1/Cau6XXwcOkNXoyN7WOdPLZ5cqCHTeHa+15y/kUbSR8lQlxAehA9kkJuKczU2GkQY7WtOdiMHP
	vGWrncexV/ttNlzXiUtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qsenV-00BaxM-1m;
	Tue, 17 Oct 2023 07:47:25 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qsenS-00BawY-1t
	for linux-mtd@lists.infradead.org;
	Tue, 17 Oct 2023 07:47:23 +0000
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-507b18cf2e1so2090421e87.3
        for <linux-mtd@lists.infradead.org>; Tue, 17 Oct 2023 00:47:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697528841; x=1698133641; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bICu1GqEvASkF3QTCjaB9iY9vbiHktzihLzzDCRLjzo=;
        b=tZ+/rE+f9XL9PBP957Hqym8cRJvSqybuo4BsSMWKPGKnZqKcQC8SSu10aJBgO6ByZz
         85mfh/79X2pmLRwTk3cwTOCwEwlmHvX0yCDwV+MdVPlU9yfWQDj3eS4xDcTbJ0RJ911r
         jiBt+NZxshYojzpPHSbpBDOfDRJ3ZJ/xI/Ce9oHOfRPbUnmGENqcQzGqpPHViomfeV9Y
         71t3e9dzYk679L0+dbYWfX16cYOuU34VATihkDLusw1uIQAbcuZ6bDdxFzL6/j4pGwqD
         VNxff8uQGFCm9n1wx6psDnoaPRf62E4D9uX+rtpSFfG7f9BGJUwqd5zl5Unu+3/m5rft
         UY6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697528841; x=1698133641;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bICu1GqEvASkF3QTCjaB9iY9vbiHktzihLzzDCRLjzo=;
        b=AHWuuEmLeM17cxYpPlK1AVBHRa/kuGmT6rbhnkvbXUPSWfpuvwrLTrr6fFY4UP7sYk
         Be19gLHnMixoaAl+00FwxpX7IWAernY16ZhZruZGF3TzrpVReWgzh1VmKrwoywY4FYsb
         g23bxTc4pEazMSzUSJEhXXZH6RcXnYzLJ0HJ+Gs/pjx8/c6rzfuYZZOiYfGlnRJhzhe8
         Q/jWnJQm1+qRyYMiG8ze9NcGgzOpgBHBG2vpL+XeR7qUhoHnCddmo+ure71lRphql4H0
         b1s8TJDouN2jGTiLFfbT4SyxLGwc2WumkutSm4QzTC8dloUcThufByIEY5n4EzIGuP57
         Gyvg==
X-Gm-Message-State: AOJu0YwQ+fGmw3YnkTWfEfZ1SWsMB2oFxidWxBLgCDt3rfCGzDk59KSE
	mjGRrSKB03gW/mb6h6Zpb4hchQ==
X-Google-Smtp-Source: AGHT+IGFf3vvTJ2uau564lVggc/4H2caGhnGuivhtBz6PsH5Rx/6g4C/CoeFFRi5ToHprly3jDf5YA==
X-Received: by 2002:a05:6512:3ca9:b0:507:aad2:96af with SMTP id h41-20020a0565123ca900b00507aad296afmr1567303lfv.21.1697528841097;
        Tue, 17 Oct 2023 00:47:21 -0700 (PDT)
Received: from 1.. ([213.233.104.181])
        by smtp.gmail.com with ESMTPSA id i23-20020a508717000000b0053db1ca293asm718688edb.19.2023.10.17.00.47.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Oct 2023 00:47:20 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
To: michael@walle.cc
Cc: pratyush@kernel.org,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Mamta Shukla <mamta.shukla@leica-geosystems.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>
Subject: [PATCH v4 2/2] mtd: spi-nor: micron-st: use SFDP table for mt25qu512a
Date: Tue, 17 Oct 2023 10:47:11 +0300
Message-Id: <20231017074711.12167-2-tudor.ambarus@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231017074711.12167-1-tudor.ambarus@linaro.org>
References: <20231017074711.12167-1-tudor.ambarus@linaro.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2297; i=tudor.ambarus@linaro.org; h=from:subject; bh=FS2q6zrOmfpSOtiknrC9GrXWj5PLgtLxG87Opf7GBTE=; b=owEBbQGS/pANAwAKAUtVT0eljRTpAcsmYgBlLjv+EexaOpz77Pk52gOho3pNYcyalUboB4xuo u2WgCUmFLKJATMEAAEKAB0WIQQdQirKzw7IbV4d/t9LVU9HpY0U6QUCZS47/gAKCRBLVU9HpY0U 6TxJB/sEGjLjyJCMlPNiyldxpiZEBRNaZ034R4s01nusA2GUizqc1S7tOMpaY4xA0qxoZX7Kv0W kb2o24Vi7KGPP5sbumW/3x0xzuYzPjXEzSd+C+0NK7/5LJxkHfdVcCJ6H6OE82zMA7v2S/Qw7Ph U/7fBfASavWumCwa/dJ/14kZFIkAshuaYZmGhhUGpuKa5OAgHNfhTPXBiFax7RRkVFMv6TjtLWX wXELkXrQVN9Vpq7+q6iD0B13DzAwGHIIYpj06baut+V/PS7c/S41IQ3t+q1hrbtNUzhHo9YzXnf C8jcpbHXxip4m3TwNksJTBFu5zgGVxkdqeGBmjdHpurwcZ0J
X-Developer-Key: i=tudor.ambarus@linaro.org; a=openpgp; fpr=280B06FD4CAAD2980C46DDDF4DB1B079AD29CF3D
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231017_004722_627177_032C776F 
X-CRM114-Status: GOOD (  11.85  )
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

From: Mamta Shukla <mamta.shukla@leica-geosystems.com>

Parse SFDP table to get size and functions of mt25qu512a. BFPT wrongly
advertises 16bit SR support and made the locking fail. Add a post BFPT
fixup hook to clear the 16bit SR support.

cat /sys/bus/spi/devices/spi-PRP0001:00/spi-nor/jedec_id
20bb20104400

cat /sys/bus/spi/devices/spi-PRP0001:00/spi-nor/manufacturer
st

cat /sys/bus/spi/devices/spi-PRP0001:00/spi-nor/partname
mt25qu512a

xxd -p  /sys/bus/spi/devices/spi-PRP0001:00/spi-nor/sfdp
53464450060101ff00060110300000ff84000102800000ffffffffffffff
ffffffffffffffffffffffffffffffffffffe520fbffffffff1f29eb276b
273b27bbffffffffffff27bbffff29eb0c2010d80f520000244a99008b8e
03e1ac0127387a757a75fbbdd55c4a0f82ff81bd3d36ffffffffffffffff
ffffffffffffffffffe7ffff21dcffff

md5sum  /sys/bus/spi/devices/spi-PRP0001:00/spi-nor/sfdp
610efba1647e00ac6db18beb11e84c04
/sys/bus/spi/devices/spi-PRP0001:00/spi-nor/sfdp

Signed-off-by: Mamta Shukla <mamta.shukla@leica-geosystems.com>
Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/mtd/spi-nor/micron-st.c | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/spi-nor/micron-st.c b/drivers/mtd/spi-nor/micron-st.c
index 756391c906e5..8920547c12bf 100644
--- a/drivers/mtd/spi-nor/micron-st.c
+++ b/drivers/mtd/spi-nor/micron-st.c
@@ -180,6 +180,18 @@ static const struct flash_info micron_nor_parts[] = {
 	},
 };
 
+static int mt25qu512a_post_bfpt_fixup(struct spi_nor *nor,
+				      const struct sfdp_parameter_header *bfpt_header,
+				      const struct sfdp_bfpt *bfpt)
+{
+	nor->flags &= ~SNOR_F_HAS_16BIT_SR;
+	return 0;
+}
+
+static struct spi_nor_fixups mt25qu512a_fixups = {
+	.post_bfpt = mt25qu512a_post_bfpt_fixup,
+};
+
 static const struct flash_info st_nor_parts[] = {
 	{
 		.name = "m25p05-nonjedec",
@@ -407,10 +419,8 @@ static const struct flash_info st_nor_parts[] = {
 		.name = "mt25qu512a",
 		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_4BIT_BP |
 			 SPI_NOR_BP3_SR_BIT6,
-		.size = SZ_64M,
-		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
-		.fixup_flags = SPI_NOR_4B_OPCODES,
 		.mfr_flags = USE_FSR,
+		.fixups = &mt25qu512a_fixups,
 	}, {
 		.id = SNOR_ID(0x20, 0xbb, 0x20),
 		.name = "n25q512a",
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
