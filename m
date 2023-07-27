Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3653C001DC
	for <linux-mtd@archiver.kernel.org>; Thu, 27 Jul 2023 09:16:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xz07OcaB8fh3Vz6+Wx5zrWQ4tPLe4q0kA32KBcvtMy0=; b=xMC/2FRldbsnb1
	eIKfa7XeOIRsKwoKNdtB3BE2vQqheUFS1d1Vb66QpWlY38/qkIv0OzQDprrsAio/wTNIsKS8Bsdvn
	D2MQi+qiAQytAXMBN5O97noaHfV67xN1rtjNz5UoPTSlN1x2tbE5JIu6JmH50Iz1cEMNHvuDdS9MD
	AZE86byL46CchpRcKysOPZbbttw5/bYWxfFnbxHPtrw6JMlzvoQMR8T9Gh+SPbb8YLFpJVcD3Rp8C
	ORcHSHCOzPGSTCq2snN6jf4aRzW7lOuG32T9xHTdxfkMRtljqgbZgtKwbKR6ONZJ5XjC2Ck1WrQng
	Nf+Kr0I1AsOO3qB2nwAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qOx7A-00CoOY-0H;
	Thu, 27 Jul 2023 09:16:56 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qOx73-00CoJK-2v
	for linux-mtd@lists.infradead.org;
	Thu, 27 Jul 2023 09:16:52 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-1bbc06f830aso4598125ad.0
        for <linux-mtd@lists.infradead.org>; Thu, 27 Jul 2023 02:16:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690449407; x=1691054207;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ggAVU9dwJAOqP2d1kR+mcHN6aKuENQR4u2BNasyhV4c=;
        b=hVHJHihC4KL26V667sEaqpXXB1iISZJFzEAGLWzi4bmHwIw4onO55juBZTgesZlaLB
         4c/gEeBBJCeRVtkQlb1+0Z4nduYZQy+3MkI+3sV5cY+sLHIlgh0G+aVosTrBQXaf9qdb
         YjKOfdjh/UdAPgrssHtYjDQB45JZb4ilYNFzInIfbMLg7h/gTizvh9lrf4NmNxWbxXI+
         2VUC/bZISri7sgCT8SnhxxTE//TroW23v6uxaVeGyiV2SuJW7MHbROFmYgm6qyUaaKPr
         kLyBuXV1lHHsLjcvBOt1Xk/YZoXPzRaUSl4GwrM/rUD2rBVVYwrJRlYbaKlQ8OygD7YC
         sMJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690449407; x=1691054207;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ggAVU9dwJAOqP2d1kR+mcHN6aKuENQR4u2BNasyhV4c=;
        b=SDV9DJzpizg8USvJngWGhxD8IL3XY7vfMfbD1scOnm2GR7BMWKB/br/mMDr/fa0E+e
         qthumShLH32nkX/FtfOZoMeVaK0Dpf4bf3kRktBmYPzTJF/73QWHXbA4YXCYVlytMU7/
         UxfOf4nkFav9m9NnQjQOMO63xtv0FLBOFAIB3DcxlZnMKMjjm2K4II9umaELmyFwp59U
         Toe9OcgwijT2SUDebBTLqlXG62CC3So0DH0tJLOxHVuiGjMyHT0kWQAxnRIiKknOjSIZ
         hbMet5iNLBEkP8ZbcSHCaGUamNDbLz8VeiOz2FU5ocwH1nNDgOhO7dS/zst2RYXkSZFl
         8A1g==
X-Gm-Message-State: ABy/qLaETIHmw9nnb/6Cpmtk33ni/yB0LuENSsnU/xFhf895ExzY+/m7
	7Z73P3u+7RRpQoObEJRZIAZl43QwGVA=
X-Google-Smtp-Source: APBJJlHFq+ug/tUGQQqm5PBJIblJI7qVc4BgO+EXjhtbvIxaGRa/muUirEiaa6nACkfPBRnhjuRSQQ==
X-Received: by 2002:a17:902:ea09:b0:1b0:3d03:4179 with SMTP id s9-20020a170902ea0900b001b03d034179mr2562570plg.6.1690449406883;
        Thu, 27 Jul 2023 02:16:46 -0700 (PDT)
Received: from twhmp6px (mxsmtp211.mxic.com.tw. [211.75.127.162])
        by smtp.gmail.com with ESMTPSA id v8-20020a1709028d8800b001b8b26fa6c1sm1093654plo.115.2023.07.27.02.16.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jul 2023 02:16:46 -0700 (PDT)
Received: from linux-patcher.mp600.macronix.com (linux-patcher [172.17.236.35])
	by twhmp6px (Postfix) with ESMTPS id BE457808AC;
	Thu, 27 Jul 2023 17:15:47 +0800 (CST)
From: Jaime Liao <jaimeliao.tw@gmail.com>
To: linux-mtd@lists.infradead.org,
	tudor.ambarus@linaro.org,
	pratyush@kernel.org,
	michael@walle.cc,
	miquel.raynal@bootlin.com
Cc: leoyu@mxic.com.tw,
	JaimeLiao <jaimeliao@mxic.com.tw>
Subject: [PATCH v2 2/2] mtd: spi-nor: add support for Macronix Octal flash
Date: Thu, 27 Jul 2023 17:16:10 +0800
Message-Id: <20230727091610.234132-3-jaimeliao.tw@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230727091610.234132-1-jaimeliao.tw@gmail.com>
References: <20230727091610.234132-1-jaimeliao.tw@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230727_021649_981378_C43D026F 
X-CRM114-Status: GOOD (  12.29  )
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

From: JaimeLiao <jaimeliao@mxic.com.tw>

Adding Macronix Octal flash for Octal DTR support.

The octaflash series can be divided into the following types:

MX25 series : Serial NOR Flash.
MX66 series : Serial NOR Flash with stacked die.(Size larger than 1Gb)
LM/UM series : Up to 250MHz clock frequency with both DTR/STR operation.
LW/UW series : Support simultaneous Read-while-Write operation in multiple
               bank architecture. Read-while-write feature which means read
               data one bank while another bank is programing or erasing.

MX25LM : 3.0V Octal I/O
 -https://www.mxic.com.tw/Lists/Datasheet/Attachments/8729/MX25LM51245G,%203V,%20512Mb,%20v1.1.pdf

MX25UM : 1.8V Octal I/O
 -https://www.mxic.com.tw/Lists/Datasheet/Attachments/8967/MX25UM51245G,%201.8V,%20512Mb,%20v1.5.pdf

MX66LM : 3.0V Octal I/O with stacked die
 -https://www.mxic.com.tw/Lists/Datasheet/Attachments/8748/MX66LM1G45G,%203V,%201Gb,%20v1.1.pdf

MX66UM : 1.8V Octal I/O with stacked die
 -https://www.mxic.com.tw/Lists/Datasheet/Attachments/8711/MX66UM1G45G,%201.8V,%201Gb,%20v1.1.pdf

MX25LW : 3.0V Octal I/O with Read-while-Write
MX25UW : 1.8V Octal I/O with Read-while-Write
MX66LW : 3.0V Octal I/O with Read-while-Write and stack die
MX66UW : 1.8V Octal I/O with Read-while-Write and stack die

MX25UM51245G : 512Mb flash, with Word mode data output format when Octal DTR read
MX25UM51345G : 512Mb flash, with Byte mode data output format when Octal DTR read

Macronix Octal flash with two types, "byte mode" and "word mode".
Because of word mode flash with byte swap issue when Octal DTR read,
adding byte mode flash in this patchset only.

About LW/UW series, please contact us freely if you have any
questions. For adding Octal NOR Flash IDs, we have validated
each Flash on plateform zynq-picozed.

As below are the SFDP table dump.

zynq> cat jedec_id
c2943c
zynq> cat manufacturer
macronix
zynq> cat partname
mx66uw2g345gx0
zynq> xxd -p sfdp
53464450080104fd00070114400000ff8701011c900000ff0a0001080001
00ff05000105200100ff84000102340100ff0000000000000000ffffffff
ffffffffe5208affffffff7f00ff00ff00ff00ffeeffffffffff00ffffff
00ff0c2010d800ff00ff87790100841200e2cc04674630b030b0f4bdd55c
000000ff101000200000000000007c234800000000008888000000000000
00400fd1fff30fd1fff300050090000500b1002b0095002b0096727103b8
727103b80000000090a3188200c069960000000000000000727100987271
00b8727100990000000072710098727100f872710099727100f900000000
00000000011501d0727106d8000086500000060100000000020001030002
00000000060100000000000072060002000000eec0697272717100d8f7f6
000a00001445988043061f0021dcffff
zynq> md5sum sfdp
839ad44d1e758bea30bd9917ba763ba6  sfdp

zynq> cat jedec_id
c2843c
zynq> cat manufacturer
macronix
zynq> cat partname
mx66uw2g345g
zynq> xxd -p sfdp
53464450080104fd00070114400000ff8701011c900000ff0a0001080001
00ff05000105200100ff84000102340100ff0000000000000000ffffffff
ffffffffe5208affffffff7f00ff00ff00ff00ffeeffffffffff00ffffff
00ff0c2010d800ff00ff87790100841200e2cc04674630b030b0f4bdd55c
000000ff101000200000147c00007c234800000000007777000000000000
00400fd1fff30fd1fff300050090000500b1002b0095002b0096727103b8
727103b80000000090a3188200c069960000000000000000727100987271
00b8727100990000000072710098727100f872710099727100f900000000
00000000011501d0727106d8000086500000060100000000020001030002
00000000060100000000000072060002000000eec0697272717100d8f7f6
000000001445988043061f0021dcffff
zynq> md5sum sfdp
00447475e039e67c256a8d75d5885ae8  sfdp

zynq> cat jedec_id
c2843a
zynq> cat manufacturer
macronix
zynq> cat partname
mx25uw51345g
zynq> xxd -p sfdp
53464450080104fd00070114400000ff8701011c900000ff0a0001080001
00ff05000105200100ff84000102340100ff0000000000000000ffffffff
ffffffffe5208affffffff1f00ff00ff00ff00ffeeffffffffff00ffffff
00ff0c2010d800ff00ff8b7901008f1200e2cc04674630b030b0f4bdd55c
000000ff101000200000000000007c234800000000008888000000000000
00400fd1fff30fd1fff300050090000500b1002b0095002b0096727103b8
727103b80000000090a3188200c069960000000000000000727100987271
00b8727100990000000072710098727100f872710099727100f900000000
00000000011501d0727106d8000086500000060100000000020001030002
00000000060100000000000072060002000000eec0697272717100d8f7f6
000a00001445988043060f0021dcffff
zynq> md5sum sfdp
cdccbfad3c384e77f3a5f7847b57b148  sfdp

zynq> cat jedec_id
c28439
zynq> cat manufacturer
macronix
zynq> cat partname
mx25uw25345g
zynq> xxd -p sfdp
53464450080104fd00070114400000ff8701011c900000ff0a0001080001
00ff05000105200100ff84000102340100ff0000000000000000ffffffff
ffffffffe5208affffffff0f00ff00ff00ff00ffeeffffffffff00ffffff
00ff0c2010d800ff00ff87790100841200d2cc04674630b030b0f4bdd55c
000000ff101000200000000000007c234800000000008888000000000000
00400fd1fff30fd1fff300050090000500b1002b0095002b0096727103b8
727103b80000000090a3188200c069960000000000000000727100987271
00b8727100990000000072710098727100f872710099727100f900000000
00000000011501d0727106d8000086500000060100000000020001030002
00000000060100000000000072060002000000eec0697272717100d8f7f6
000a00001445988043060f0021dcffff
zynq> md5sum sfdp
f7712440f8ce0adb538dfa0c10579c79  sfdp

zynq> cat jedec_id
c28339
zynq> cat manufacturer
macronix
zynq> cat partname
mx25um25345g
zynq> xxd -p sfdp
53464450080104fd00070114400000ff8701011c900000ff0a0001080001
00ff05000105200100ff84000102340100ff0000000000000000ffffffff
ffffffffe5208affffffff0f00ff00ff00ff00ffeeffffffffff00ffffff
00ff0c2010d800ff00ff87690100821200d2cc02673830b030b0f4bdd55c
000000ff101000200000000000007c234800000000008888000000000000
00400fd1fff30fd1fff300050090000500b1002b0095002b0096727103b8
727103b80000000090a3188200c069960000000000000000727100987271
00b8727100990000000072710098727100f872710099727100f900000000
00000000011501d0727106d8000086500000060100000000020001030002
00000000060100000000000072060002000000eec0697272717100d8f7f6
040900001445988043060f0021dcffff
zynq> md5sum sfdp
950e623745a002e1747008592e6dbdf9  sfdp

zynq> cat manufacturer
macronix
zynq> cat partname
mx25uw12345g
zynq> xxd -p sfdp
53464450080104fd00070114400000ff8701011c900000ff0a0001080001
00ff05000105200100ff84000102340100ff0000000000000000ffffffff
ffffffffe5208affffffff0700ff00ff00ff00ffeeffffffffff00ffffff
00ff0c2010d800ff00ff8b7901008f1200c9cc04674630b030b0f4bdd55c
000000ff101000200000000000007c234800000000008888000000000000
00400fd1fff30fd1fff300050090000500b1002b0095002b0096727103b8
727103b80000000090a3188200c069960000000000000000727100987271
00b8727100990000000072710098727100f872710099727100f900000000
00000000011501d0727106d8000086500000060100000000020001030002
00000000060100000000000072060002000000eec0697272717100d8f7f6
000a00001445988043060f0021dcffff
zynq> md5sum sfdp
a3eb609c08894c84270ad06efc03766c  sfdp

zynq> cat jedec_id
c28437
zynq> cat manufacturer
macronix
zynq> cat partname
mx25uw6345g
zynq> xxd -p sfdp
53464450080104fd00070114400000ff8701011c900000ff0a0001080001
00ff05000105200100ff84000102340100ff0000000000000000ffffffff
ffffffffe5208affffffff0300ff00ff00ff00ffeeffffffffff00ffffff
00ff0c2010d800ff00ff8b7901008f1200c4cc04674630b030b0f4bdd55c
000000ff101000200000000000007c234800000000008888000000000000
00400fd1fff30fd1fff300050090000500b1002b0095002b0096727103b8
727103b80000000090a3188200c069960000000000000000727100987271
00b8727100990000000072710098727100f872710099727100f900000000
00000000011501d0727106d8000086500000060100000000020001030002
00000000060100000000000072060002000000eec0697272717100d8f7f6
000a00001445988043060f0021dcffff
zynq> md5sum sfdp
c6fb57b8fdd4c35b5f0dacc4a1f7d4f4  sfdp

Signed-off-by: JaimeLiao <jaimeliao@mxic.com.tw>
---
 drivers/mtd/spi-nor/macronix.c | 26 ++++++++++++++++++++++++--
 1 file changed, 24 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/spi-nor/macronix.c b/drivers/mtd/spi-nor/macronix.c
index b397fd274868..a5aee10590b8 100644
--- a/drivers/mtd/spi-nor/macronix.c
+++ b/drivers/mtd/spi-nor/macronix.c
@@ -99,8 +99,8 @@ static const struct flash_info macronix_nor_parts[] = {
 		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
 		FIXUP_FLAGS(SPI_NOR_4B_OPCODES) },
 	{ "mx25uw51245g", INFOB(0xc2813a, 0, 0, 0, 4)
-		PARSE_SFDP
-		FLAGS(SPI_NOR_RWW) },
+		FLAGS(SPI_NOR_RWW)
+		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_OCTAL_DTR_READ | SPI_NOR_OCTAL_DTR_PP) },
 	{ "mx25v8035f",  INFO(0xc22314, 0, 64 * 1024,  16)
 		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ |
 			      SPI_NOR_QUAD_READ) },
@@ -119,6 +119,28 @@ static const struct flash_info macronix_nor_parts[] = {
 	{ "mx66u2g45g",	 INFO(0xc2253c, 0, 64 * 1024, 4096)
 		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
 		FIXUP_FLAGS(SPI_NOR_4B_OPCODES) },
+	{ "mx66uw2g345g", INFOB(0xc2843c, 0, 0, 0, 4)
+		FLAGS(SPI_NOR_RWW)
+		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_OCTAL_READ | SPI_NOR_OCTAL_DTR_READ |
+			      SPI_NOR_OCTAL_DTR_PP) },
+	{ "mx66uw2g345gx0", INFOB(0xc2943c, 0, 0, 0, 4)
+		FLAGS(SPI_NOR_RWW)
+		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_OCTAL_READ | SPI_NOR_OCTAL_DTR_READ |
+			      SPI_NOR_OCTAL_DTR_PP) },
+	{ "mx25uw51345g", INFOB(0xc2843a, 0, 0, 0, 4)
+		FLAGS(SPI_NOR_RWW)
+		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_OCTAL_DTR_READ | SPI_NOR_OCTAL_DTR_PP) },
+	{ "mx25um25345g", INFO(0xc28339, 0, 0, 0)
+		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_OCTAL_DTR_READ | SPI_NOR_OCTAL_DTR_PP) },
+	{ "mx25uw25345g", INFOB(0xc28439, 0, 0, 0, 4)
+		FLAGS(SPI_NOR_RWW)
+		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_OCTAL_DTR_READ | SPI_NOR_OCTAL_DTR_PP) },
+	{ "mx25uw12345g", INFOB(0xc28438, 0, 0, 0, 4)
+		FLAGS(SPI_NOR_RWW)
+		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_OCTAL_DTR_READ | SPI_NOR_OCTAL_DTR_PP) },
+	{ "mx25uw6345g", INFOB(0xc28437, 0, 0, 0, 4)
+		FLAGS(SPI_NOR_RWW)
+		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_OCTAL_DTR_READ | SPI_NOR_OCTAL_DTR_PP) },
 };
 
 static int macronix_nor_octal_dtr_en(struct spi_nor *nor)
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
