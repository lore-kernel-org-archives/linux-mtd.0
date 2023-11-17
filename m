Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99E01C072A2
	for <linux-mtd@archiver.kernel.org>; Fri, 17 Nov 2023 08:39:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hhnkuSw35hDSXL9P017py3T9ry1vM+v350cWHMzjO60=; b=e5njroSFu3OsAg
	dEtJkvn/gIHvSQyZ52NQUsoNmT8x2qtPJ40lzdad4qK52fkQsOAR8FGxHc1scIinWXo82Gifn/iZx
	yTerO2eMvrs96qxdBL7ay30pl+uk4MqDvHgSRvx8wPVtLHoAGZMXcd4MQktkFi4fcCk5NPL+3iprZ
	bNylgaqyqilS+mw1SRwx7GOJJJIFuebpF06sDhKlMl+uQKA2iz5t/pMpcq1dU3sN0sZmTK7jIsFqk
	hRwcNLdCFjxpo1lR1HHcyMYS76uKW2nOT3sB9Ae1m3vebkKy3ydb9FQkfIhYSqFQ8/YagCYfVaUWO
	aFl2OBfDF4nYkMrIuOSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r3uNc-005xG2-1p;
	Fri, 17 Nov 2023 08:39:12 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r3uNW-005xD4-1f
	for linux-mtd@lists.infradead.org;
	Fri, 17 Nov 2023 08:39:09 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-6c33ab26dddso1645176b3a.0
        for <linux-mtd@lists.infradead.org>; Fri, 17 Nov 2023 00:39:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700210344; x=1700815144; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KfpKKuiLaDnTxZ3V8+t73YhNE4SmRDuTqTI9yMXDTb4=;
        b=YsiCkewzBjqT0MZ49nTYgOOvjBSZSGGYpOmy9kgCggtQy5ucYtLXIyetBZbjwF/J+v
         /Xn3Dxv98LMdnINUxsDU1ne53WQJpUv0vWmmT8oPodhPZlceBfQ5KF5ZDQwxfBgtoFpZ
         AS5r/RevglzQOseD2BrO26n5F3/29p/PGHnbCvPEr21pi0fg/nEAnnHknaIY6DQy8/bd
         JiER7Kscdc42rVJKZReqxitMcHT1lvuB44fVoeBDjEMS92h+4LlXR9c5mLAv5y9QbvPt
         6y2+vNiNiQQEDuMSrE+/ZfyFfgSHBDArGkKy/DvmnTjECj3paVK6YypL9VbPim0vqnE2
         bohQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700210344; x=1700815144;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KfpKKuiLaDnTxZ3V8+t73YhNE4SmRDuTqTI9yMXDTb4=;
        b=cx794IA45RjqH9U5Q71jHYO0ZI35aO45ZzlIjBN0IQCmFtGVFs8aTG4z2bT9DlKuKn
         cTFTakV8qE4odIBamrBgNV6pbk23qaZzlLA/170jCLW7TfO5ep4llc/b1X+kvrYFOAtQ
         9bTCTnXZH1RzpMEoaCmjZ3GoiC/bO5ATy2dTwdmAOoa1vImogUTKXw4cXfcijO8qrTpd
         +ZcvILAb59aRe6SSKZjk1C11YvtKgXfvFhugsgAtnAteqaUIsgbJh3JuMJ8VWkWjpKI1
         RTL/qI/M2kiIiP6zaT9bR2Ci1KiFV6zmkw+jhPOzUFBHzw8bxW7QsjFBgT02az+j3AOe
         EkeA==
X-Gm-Message-State: AOJu0YzkPOkaMGH2z5M/CELVKNTAPHc5fgiMRbqZuUiuYm9ObMCfd86U
	Q97a8DXx2J7bJDdffnIjsto=
X-Google-Smtp-Source: AGHT+IFEMvVF8V2EY3J4DlqyYt5K0XjJITHBRg/OoN/AcWSPe6NmLAZnz6CVAYqqFY1WUzjxTKf3Mw==
X-Received: by 2002:aa7:8807:0:b0:692:af9c:d96a with SMTP id c7-20020aa78807000000b00692af9cd96amr14545437pfo.5.1700210343677;
        Fri, 17 Nov 2023 00:39:03 -0800 (PST)
Received: from twhmp6px (mxsmtp211.mxic.com.tw. [211.75.127.162])
        by smtp.gmail.com with ESMTPSA id l23-20020a63ba57000000b005bdf596164fsm783178pgu.94.2023.11.17.00.39.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Nov 2023 00:39:03 -0800 (PST)
Received: from hqs-appsw-appswa2.mp600.macronix.com (linux-patcher [172.17.236.35])
	by twhmp6px (Postfix) with ESMTPS id D5EDE8050E;
	Fri, 17 Nov 2023 16:39:02 +0800 (CST)
From: Jaime Liao <jaimeliao.tw@gmail.com>
To: linux-mtd@lists.infradead.org,
	tudor.ambarus@linaro.org,
	pratyush@kernel.org,
	michael@walle.cc,
	miquel.raynal@bootlin.com
Cc: leoyu@mxic.com.tw,
	jaimeliao@mxic.com.tw
Subject: [PATCH v5 6/6] mtd: spi-nor: add support for Macronix Octal flash
Date: Fri, 17 Nov 2023 16:38:53 +0800
Message-Id: <20231117083853.33329-7-jaimeliao.tw@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231117083853.33329-1-jaimeliao.tw@gmail.com>
References: <20231117083853.33329-1-jaimeliao.tw@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231117_003906_611254_AB4D20B4 
X-CRM114-Status: GOOD (  10.14  )
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

As below are the SFDP table dump.

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
zynq> mtd_debug info /dev/mtd0
mtd.type = MTD_NORFLASH
mtd.flags = MTD_CAP_NORFLASH
mtd.size = 33554432 (32M)
mtd.erasesize = 4096 (4K)
mtd.writesize = 1
mtd.oobsize = 0
regions = 0

zynq> cat jedec_id
c28039
zynq> cat manufacturer
macronix
zynq> cat partname
mx25um25645g
zynq> xxd -p sfdp
53464450080104fd00070114400000ff8701011c900000ff0a0001080001
00ff05000105200100ff84000102340100ff0000000000000000ffffffff
ffffffffe5208affffffff0f00ff00ff00ff00ffeeffffffffff00ffffff
00ff0c2010d800ff00ff87790100841200d2cc02673830b030b0f4bdd55c
000000ff101000200000000000007ca34800000000008888000000000000
00400fd1fff30fd1fff300050090000500b1002b0095002b0096727103b8
727103b80000000090a3188200c069960000000000000000727100987271
00b8727100990000000072710098727100f872710099727100f900000000
00000000011501d0727106d8000086500000060100000000020001030002
00000000060100000000000072060002000000eec0697272717100d8f7f6
000a000014359c8043060f0021dcffff
zynq> md5sum sfdp
d652779f17770dc833cd96262cb2a620  sfdp
zynq> mtd_debug info /dev/mtd0
mtd.type = MTD_NORFLASH
mtd.flags = MTD_CAP_NORFLASH
mtd.size = 33554432 (32M)
mtd.erasesize = 4096 (4K)
mtd.writesize = 1
mtd.oobsize = 0
regions = 0

zynq> cat jedec_id
c28539
zynq> cat manufacturer
macronix
zynq> cat partname
mx25lm25645g
zynq> xxd -p sfdp
53464450080104fd00070114400000ff8701011c900000ff0a0001080001
00ff05000105200100ff84000102340100ff0000000000000000ffffffff
ffffffffe5208affffffff0f00ff00ff00ff00ffeeffffffffff00ffffff
00ff0c2010d800ff00ff87690100821200d2cc02673830b030b0f4bdd55c
000000ff101000200000000000007ca34800000000006666000000000000
00400fd1fff30fd1fff300050090000500b1002b0095002b0096727103b8
727103b80000000090a3188200c069960000000000000000727100987271
00b8727100990000000072710098727100f872710099727100f900000000
00000000011501d0727106d8000086500000060100000000020001030002
00000000060100000000000072060002000000eec0697272717100d8f7f6
0000000014351c0043060f0021dcffff
zynq> md5sum sfdp
ec258f831ac737454c7eb9f6a8a4495a  sfdp
zynq> mtd_debug info /dev/mtd0
mtd.type = MTD_NORFLASH
mtd.flags = MTD_CAP_NORFLASH
mtd.size = 33554432 (32M)
mtd.erasesize = 4096 (4K)
mtd.writesize = 1
mtd.oobsize = 0
regions = 0

zynq> cat jedec_id
c2803a
zynq> cat manufacturer
macronix
zynq> cat partname
mx25um51245g
zynq> xxd -p sfdp
53464450080104fd00070114400000ff8701011c900000ff0a0001080001
00ff05000105200100ff84000102340100ff0000000000000000ffffffff
ffffffffe5208affffffff1f00ff00ff00ff00ffeeffffffffff00ffffff
00ff0c2010d800ff00ff8b7901008f1200e2cc04674630b030b0f4bdd55c
000000ff101000200000000000007ca34800000000008888000000000000
00400fd1fff30fd1fff300050090000500b1002b0095002b0096727103b8
727103b80000000090a3188200c069960000000000000000727100987271
00b8727100990000000072710098727100f872710099727100f900000000
00000000011501d0727106d8000086500000060100000000020001030002
00000000060100000000000072060002000000eec0697272717100d8f7f6
000a000014359c8043060f0021dcffff
zynq> md5sum sfdp
75d81c1eb2fd2767634f1d0dfbb3be35  sfdp
zynq> mtd_debug info /dev/mtd0
mtd.type = MTD_NORFLASH
mtd.flags = MTD_CAP_NORFLASH
mtd.size = 67108864 (64M)
mtd.erasesize = 4096 (4K)
mtd.writesize = 1
mtd.oobsize = 0
regions = 0

zynq> cat jedec_id
c2853a
zynq> cat manufacturer
macronix
zynq> cat partname
mx25lm51245g
zynq> xxd -p sfdp
53464450080104fd00070114400000ff8701011c900000ff0a0001080001
00ff05000105200100ff84000102340100ff0000000000000000ffffffff
ffffffffe5208affffffff1f00ff00ff00ff00ffeeffffffffff00ffffff
00ff0c2010d800ff00ff897901008d1200e2cc02674430b030b0f4bdd55c
000000ff101000200000000000007ca34800000000006666000000000000
00400fd1fff30fd1fff300050090000500b1002b0095002b0096727103b8
727103b80000000090a3188200c069960000000000000000727100987271
00b8727100990000000072710098727100f872710099727100f900000000
00000000011501d0727106d8000086500000060100000000020001030002
00000000060100000000000072060002000000eec0697272717100d8f7f6
0000000014351c0043060f0021dcffff
zynq> md5sum sfdp
214868617d74e6bfb2c45444d5d6fff0  sfdp
zynq> mtd_debug info /dev/mtd0
mtd.type = MTD_NORFLASH
mtd.flags = MTD_CAP_NORFLASH
mtd.size = 67108864 (64M)
mtd.erasesize = 4096 (4K)
mtd.writesize = 1
mtd.oobsize = 0
regions = 0

zynq> cat jedec_id
c2803b
zynq> cat manufacturer
macronix
zynq> cat partname
mx66um1g45g
zynq> xxd -p sfdp
53464450080104fd00070114400000ff8701011c900000ff0a0001080001
00ff05000105200100ff84000102340100ff0000000000000000ffffffff
ffffffffe5208affffffff3f00ff00ff00ff00ffeeffffffffff00ffffff
00ff0c2010d800ff00ff897901008d1200e2cc02674430b030b0f4bdd55c
000000ff101000200000000000007ca34800000000008888000000000000
00400fd1fff30fd1fff300050090000500b1002b0095002b0096727103b8
727103b80000000090a3188200c069960000000000000000727100987271
00b8727100990000000072710098727100f872710099727100f900000000
00000000011501d0727106d8000086500000060100000000020001030002
00000000060100000000000072060002000000eec0697272717100d8f7f6
000a000014359c8043060f0021dcffff
zynq> md5sum sfdp
eea09d64679e64f627402b39a177e356  sfdp
zynq> mtd_debug info /dev/mtd0
mtd.type = MTD_NORFLASH
mtd.flags = MTD_CAP_NORFLASH
mtd.size = 134217728 (128M)
mtd.erasesize = 4096 (4K)
mtd.writesize = 1
mtd.oobsize = 0
regions = 0

zynq> cat jedec_id
c2853b
zynq> cat manufacturer
macronix
zynq> cat partname
mx66lm1g45g
zynq> xxd -p sfdp
53464450080104fd00070114400000ff8701011c900000ff0a0001080001
00ff05000105200100ff84000102340100ff0000000000000000ffffffff
ffffffffe5208affffffff3f00ff00ff00ff00ffeeffffffffff00ffffff
00ff0c2010d800ff00ff87690100821200e2cc02673830b030b0f4bdd55c
000000ff101000200000000000007ca34800000000006666000000000000
00400fd1fff30fd1fff300050090000500b1002b0095002b0096727103b8
727103b80000000090a3188200c069960000000000000000727100987271
00b8727100990000000072710098727100f872710099727100f900000000
00000000011501d0727106d8000086500000060100000000020001030002
00000000060100000000000072060002000000eec0697272717100d8f7f6
0000000014351c0043060f0021dcffff
zynq> md5sum sfdp
7b46113b529d58a6335531a10f14a76e  sfdp
zynq> mtd_debug info /dev/mtd0
mtd.type = MTD_NORFLASH
mtd.flags = MTD_CAP_NORFLASH
mtd.size = 134217728 (128M)
mtd.erasesize = 4096 (4K)
mtd.writesize = 1
mtd.oobsize = 0
regions = 0

Signed-off-by: JaimeLiao <jaimeliao@mxic.com.tw>
---
 drivers/mtd/spi-nor/macronix.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/drivers/mtd/spi-nor/macronix.c b/drivers/mtd/spi-nor/macronix.c
index 48e570c04ad9..2115a25b21ce 100644
--- a/drivers/mtd/spi-nor/macronix.c
+++ b/drivers/mtd/spi-nor/macronix.c
@@ -260,6 +260,27 @@ static const struct flash_info macronix_nor_parts[] = {
 		.name = "mx66uw2g345gx0",
 		.n_banks = 4,
 		.flags = SPI_NOR_RWW,
+	}, {
+		.id = SNOR_ID(0xc2, 0x83, 0x39),
+		.name = "mx25um25345g",
+	}, {
+		.id = SNOR_ID(0xc2, 0x80, 0x39),
+		.name = "mx25um25645g",
+	}, {
+		.id = SNOR_ID(0xc2, 0x85, 0x39),
+		.name = "mx25lm25645g",
+	}, {
+		.id = SNOR_ID(0xc2, 0x80, 0x3a),
+		.name = "mx25um51245g",
+	}, {
+		.id = SNOR_ID(0xc2, 0x85, 0x3a),
+		.name = "mx25lm51245g",
+	}, {
+		.id = SNOR_ID(0xc2, 0x80, 0x3b),
+		.name = "mx66um1g45g",
+	}, {
+		.id = SNOR_ID(0xc2, 0x85, 0x3b),
+		.name = "mx66lm1g45g",
 	}
 };
 
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
