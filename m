Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D349FC7EE22
	for <linux-mtd@archiver.kernel.org>; Wed, 10 May 2023 11:14:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=23i12Vemm+0GQ6QYaZkVCL8IWRB33DzOcrb0xTYCbRY=; b=bwOvTttgdSQtMs
	t9FVPY4Pd5Wg74E1bLZ4Z0ddtUSE/DKw4LxqgkeeSlVkKhPR8EBOARASlzSigFoZQQ+ostIbODH44
	BvRFVkL77WlcS69pQEUQNbuJgC8RBQhb9Y/xefpgAfCZJMAhikdrfqolXyKs6M4oWdEe2lF92JQUm
	9EiJUyZSzu29QIShGA3dklHTsORmoCV057xUw0hBa+Nrg4mgmLbCmBFVCpEmmwrqIJ5Pl6Ir25Vdt
	mrgFUKxbxArvLf01tdCW5RQvlecRr41mkwiIafaV4pazNaNXUv5ZbOnDxKtN7Mw7TLBAWk0Qly/In
	Z+TQAqTiRjbY9Yu44zHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pwhly-005zZh-0t;
	Wed, 10 May 2023 11:14:18 +0000
Received: from mx.sberdevices.ru ([45.89.227.171])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pwhlb-005zDd-2V;
	Wed, 10 May 2023 11:13:59 +0000
Received: from s-lin-edge02.sberdevices.ru (localhost [127.0.0.1])
	by mx.sberdevices.ru (Postfix) with ESMTP id 121B25FD27;
	Wed, 10 May 2023 14:13:54 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
	s=mail; t=1683717234;
	bh=wpnQqYLiMeJcmuuKybbquqxEgUyT5kRAw1QOCUfaxQQ=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=DeN/8RDVdwKnRQM6hFMX9b456raaqf05mrqn7EAbZJuZ5ZEjutNZSOn4Zsjh1qYNE
	 jlK1ZGFVg1dMDcBPbo1Y33YF+NgCYEb51gnGFFsUDRjZs9jedT+75tJOY1gjPP5aEo
	 DAHNp45k+TYuCBkikcyqRJ+heJZxmGgLy+y2V62SqRtc7bzyxJ2FmIHSodxMq2rfaP
	 yVJiJxbwEgVqb9n7BmPFBDgUmveJTWHylZYJTpL+fBnTAF5+yEG5wytGyAVtzcDCSV
	 rc3OF9ijrJHyqnOGcxhxqI/nWeQwEHXsXyBE9jmqBz2Hxhmim0LkH4r941b1lPBphK
	 qFrbsBVRBEerA==
Received: from S-MS-EXCH01.sberdevices.ru (S-MS-EXCH01.sberdevices.ru [172.16.1.4])
	by mx.sberdevices.ru (Postfix) with ESMTP;
	Wed, 10 May 2023 14:13:54 +0300 (MSK)
From: Arseniy Krasnov <AVKrasnov@sberdevices.ru>
To: Liang Yang <liang.yang@amlogic.com>, Miquel Raynal
	<miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>, Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Jianxin Pan
	<jianxin.pan@amlogic.com>, Yixun Lan <yixun.lan@amlogic.com>
CC: <oxffffaa@gmail.com>, <kernel@sberdevices.ru>, Arseniy Krasnov
	<AVKrasnov@sberdevices.ru>, <linux-mtd@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-amlogic@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH v3 6/6] mtd: rawnand: meson: rename node for chip select
Date: Wed, 10 May 2023 14:08:34 +0300
Message-ID: <20230510110835.26115-7-AVKrasnov@sberdevices.ru>
X-Mailer: git-send-email 2.35.0
In-Reply-To: <20230510110835.26115-1-AVKrasnov@sberdevices.ru>
References: <20230510110835.26115-1-AVKrasnov@sberdevices.ru>
MIME-Version: 1.0
X-Originating-IP: [172.16.1.6]
X-ClientProxiedBy: S-MS-EXCH01.sberdevices.ru (172.16.1.4) To
 S-MS-EXCH01.sberdevices.ru (172.16.1.4)
X-KSMG-Rule-ID: 4
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Status: not scanned, disabled by settings
X-KSMG-AntiSpam-Interceptor-Info: not scanned
X-KSMG-AntiPhishing: not scanned, disabled by settings
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 1.1.2.30, bases: 2023/05/10 09:03:00 #21252424
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230510_041356_165725_258CE03E 
X-CRM114-Status: GOOD (  12.73  )
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

This renames node with values for chip select from "reg" to "cs". It is
needed because when OTP access is enabled on the attached storage, MTD
subsystem registers this storage in the NVMEM subsystem. NVMEM in turn
tries to use "reg" node in its own manner, supposes that it has another
layout. All of this leads to device initialization failure.

Example:

[...] nvmem mtd0-user-otp: nvmem: invalid reg on /soc/bus@ffe00000/...
[...] mtd mtd0: Failed to register OTP NVMEM device
[...] meson-nand ffe07800.nfc: failed to register MTD device: -22
[...] meson-nand ffe07800.nfc: failed to init NAND chips
[...] meson-nand: probe of ffe07800.nfc failed with error -22

Signed-off-by: Arseniy Krasnov <AVKrasnov@sberdevices.ru>
---
 drivers/mtd/nand/raw/meson_nand.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/raw/meson_nand.c b/drivers/mtd/nand/raw/meson_nand.c
index bc99a098f3ca..28371919a6c5 100644
--- a/drivers/mtd/nand/raw/meson_nand.c
+++ b/drivers/mtd/nand/raw/meson_nand.c
@@ -1419,7 +1419,7 @@ meson_nfc_nand_chip_init(struct device *dev,
 	int ret, i;
 	u32 tmp, nsels;
 
-	nsels = of_property_count_elems_of_size(np, "reg", sizeof(u32));
+	nsels = of_property_count_elems_of_size(np, "cs", sizeof(u32));
 	if (!nsels || nsels > MAX_CE_NUM) {
 		dev_err(dev, "invalid register property size\n");
 		return -EINVAL;
@@ -1433,7 +1433,7 @@ meson_nfc_nand_chip_init(struct device *dev,
 	meson_chip->nsels = nsels;
 
 	for (i = 0; i < nsels; i++) {
-		ret = of_property_read_u32_index(np, "reg", i, &tmp);
+		ret = of_property_read_u32_index(np, "cs", i, &tmp);
 		if (ret) {
 			dev_err(dev, "could not retrieve register property: %d\n",
 				ret);
-- 
2.35.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
