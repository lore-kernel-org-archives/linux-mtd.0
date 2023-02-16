Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F222DC636CC
	for <linux-mtd@archiver.kernel.org>; Thu, 16 Feb 2023 17:58:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=L/lAG3i6RO9V5NVIPjZVGHSiaxkILieOeijn2XFIrmc=; b=efS9J7nHmz/0YX
	AAWOht2qx6mhuUfEP6WwTHi4dqApbxMrZUoNEbkEh8aOn+Dq2UTMRAkU0XpchiQVumAl7QznPT7jJ
	IJ8pVObnIqatcPkGY8subQOOIcBXRSRjEjF/QbYS6nOr7fs5SFnAlblr6AOOyfut5KKoyq9hTKKZ7
	gwgiu21Ua89NgOQf7Z1LICpOiNSoxz+hA1YWNMwJt8ppRXSCmJy+dC9qhgXTNVGPpFtshQ+MUA1Dl
	5GQdo7byb20L6G7JQIlqvzW+I9k4L1y51bYDbVEc9ziD6eCUEm9nXzc2eFetsE96v8we9LBPGla2v
	QeBauOD9YwbS7r7oqX/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSiW6-00BPc4-Dd; Thu, 16 Feb 2023 17:57:58 +0000
Received: from mx.sberdevices.ru ([45.89.227.171])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSiVs-00BPWq-LF; Thu, 16 Feb 2023 17:57:46 +0000
Received: from s-lin-edge02.sberdevices.ru (localhost [127.0.0.1])
	by mx.sberdevices.ru (Postfix) with ESMTP id 8E9FD5FD10;
	Thu, 16 Feb 2023 20:57:35 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
	s=mail; t=1676570255;
	bh=SduSeqOwVL90O9MEgDTlHkV2YuE15AjLaWPjyDCCbvQ=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version;
	b=kFmCVb1rxHNm8v5I0wrODLKy6oWi5DrJVjX3n8ylfuqC+mgu2vSVFodi/xRTa5lY4
	 2fT6+47r/IzlJvv4YbX0jwJPTGo+9JPMORi3+eEaFqLqsYoHSvI+1FFQuTwGwV3naM
	 hV01t8DBIQdoZW6ecsJ5hb8hDZQzzwLB+YWdvr0bkxhrlwCdwYJ/+o79NxK1YyVgas
	 jiD85t+P389oy8WjJo8IpxT7Rh7SCr0ul22l57qP9lrmTdzifKHrA3PioaTya0H24+
	 id7ng3Sqjty+eEOzpb0vrzy9oZNg+LiZ+iYI/aA8ONo3aVsoQrsSyO65BazcTQZt90
	 jNh5GZjJ2pAKw==
Received: from S-MS-EXCH02.sberdevices.ru (S-MS-EXCH02.sberdevices.ru [172.16.1.5])
	by mx.sberdevices.ru (Postfix) with ESMTP;
	Thu, 16 Feb 2023 20:57:32 +0300 (MSK)
From: =?utf-8?B?0JrRgNCw0YHQvdC+0LIg0JDRgNGB0LXQvdC40Lk=?=
	<AVKrasnov@sberdevices.ru>
To: Liang Yang <liang.yang@amlogic.com>, Miquel Raynal
	<miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, "Vignesh
 Raghavendra" <vigneshr@ti.com>, Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	=?utf-8?B?0JrRgNCw0YHQvdC+0LIg0JDRgNGB0LXQvdC40Lk=?=
	<AVKrasnov@sberdevices.ru>, Krasnov Arseniy <oxffffaa@gmail.com>
CC: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-amlogic@lists.infradead.org"
	<linux-amlogic@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, kernel <kernel@sberdevices.ru>
Subject: [PATCH] mtd: rawnand: meson: initialize struct with zeroes
Thread-Topic: [PATCH] mtd: rawnand: meson: initialize struct with zeroes
Thread-Index: AQHZQjAk8W+Ow1LN4Uavv419Ihk4sA==
Date: Thu, 16 Feb 2023 17:57:32 +0000
Message-ID: <8881a365-e218-916a-e68d-d889797279be@sberdevices.ru>
Accept-Language: en-US, ru-RU
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.16.1.12]
Content-ID: <67C80C4B08BF6441AA617A43FDA00DA0@sberdevices.ru>
MIME-Version: 1.0
X-KSMG-Rule-ID: 4
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Status: not scanned, disabled by settings
X-KSMG-AntiSpam-Interceptor-Info: not scanned
X-KSMG-AntiPhishing: not scanned, disabled by settings
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 1.1.2.30, bases: 2023/02/16 08:39:00 #20868660
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230216_095745_447947_18A627C0 
X-CRM114-Status: GOOD (  11.48  )
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

This structure must be zeroed, because it's field 'hw->core' is used as
'parent' in 'clk_core_fill_parent_index()', but it will be uninitialized.
The following backtrace is result of the dereference of such pointer:

[    1.081319]  __clk_register+0x414/0x820
[    1.085113]  devm_clk_register+0x64/0xd0
[    1.088995]  meson_nfc_probe+0x258/0x6ec
[    1.092875]  platform_probe+0x70/0xf0
[    1.096498]  really_probe+0xc8/0x3e0
[    1.100034]  __driver_probe_device+0x84/0x190
[    1.104346]  driver_probe_device+0x44/0x120
[    1.108487]  __driver_attach+0xb4/0x220
[    1.112282]  bus_for_each_dev+0x78/0xd0
[    1.116077]  driver_attach+0x2c/0x40
[    1.119613]  bus_add_driver+0x184/0x240
[    1.123408]  driver_register+0x80/0x140
[    1.127203]  __platform_driver_register+0x30/0x40
[    1.131860]  meson_nfc_driver_init+0x24/0x30

Signed-off-by: Arseniy Krasnov <AVKrasnov@sberdevices.ru>
---
 drivers/mtd/nand/raw/meson_nand.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/meson_nand.c b/drivers/mtd/nand/raw/meson_nand.c
index 5ee01231ac4c..30e326adabfc 100644
--- a/drivers/mtd/nand/raw/meson_nand.c
+++ b/drivers/mtd/nand/raw/meson_nand.c
@@ -991,7 +991,7 @@ static const struct mtd_ooblayout_ops meson_ooblayout_ops = {
 
 static int meson_nfc_clk_init(struct meson_nfc *nfc)
 {
-	struct clk_parent_data nfc_divider_parent_data[1];
+	struct clk_parent_data nfc_divider_parent_data[1] = {0};
 	struct clk_init_data init = {0};
 	int ret;
 
-- 
2.35.0
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
