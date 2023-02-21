Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56305C61DA3
	for <linux-mtd@archiver.kernel.org>; Tue, 21 Feb 2023 06:29:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=1QI6CcpjVymdqrBeqYplpLOs2RdBQ5x2A3XTb/szt0M=; b=fn8q+91KRS9Gxs
	mV4HHOPlyzH9NVRDhkrWevgyoBL6xAizoYzUj4sElVXehqJJmSyW3N/M3RNx0wUTuq+D/UIlCPkbK
	U6OGBfJveNvty0o7WoPBU2ozTIVIodmQ/F62aZmZr4RMYGvH+XmM4+sufxeXb+b0DHPv8BZtXRBlX
	ZjoF9bqE6rf57NXdSiVFT/YdPvom4q/nSzLP3kYub97eHm2gMaMKb1iYuza0V+EsUu/qLFnJeLJLQ
	JZIszjWlFyezBFZD4aUdl3NC65ydBSMAskC0yooXL9/HzihWMaZPZYtTTcSIdIiLCN/ihk29sjtVW
	pt3UHB2yPalX0lyuIIKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUM9f-006kO7-GO; Tue, 21 Feb 2023 06:29:35 +0000
Received: from mx.sberdevices.ru ([45.89.227.171])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUM9S-006kM2-7W; Tue, 21 Feb 2023 06:29:24 +0000
Received: from s-lin-edge02.sberdevices.ru (localhost [127.0.0.1])
	by mx.sberdevices.ru (Postfix) with ESMTP id B26885FD49;
	Tue, 21 Feb 2023 09:29:13 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
	s=mail; t=1676960953;
	bh=J4GGD+2l/dLrAC7SommQy5cNs2a8BqaY2AypKovMSnw=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version;
	b=d01pEWMKvO/OxR3qkpqsGI0Y6AzK34Xjh/y99ZrzKJ/CtUTXBjmk6ICO7DnISVuzV
	 7hCxRLG1MI3/iXbsCjmmTV7OaI8lunF6RaddES8RNTZ0hwLo0b1kAHPWy0gPjUxyE7
	 rizvVouo3Z/RCh1jbhz03ygk1Y4jpJFW+ZMLfe308hAW1l3WEQbjps6ZFjPDezTq/M
	 OioG7M6/sna6dQs0jE4coJ5UVzejIB2we4T6gsAkLiZQX7cx/HKjH6aY8HB0dig5JG
	 Nl+am+UQgeiznyCbFkpfZIcfDkKekb4i6PRwLHTwfLJcwF0QidFTU10AsXXb0eNlSN
	 K3pIsYKZ8ZJeA==
Received: from S-MS-EXCH01.sberdevices.ru (S-MS-EXCH01.sberdevices.ru [172.16.1.4])
	by mx.sberdevices.ru (Postfix) with ESMTP;
	Tue, 21 Feb 2023 09:29:11 +0300 (MSK)
From: Arseniy Krasnov <AVKrasnov@sberdevices.ru>
To: Liang Yang <liang.yang@amlogic.com>, Miquel Raynal
	<miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, "Vignesh
 Raghavendra" <vigneshr@ti.com>, Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
CC: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-amlogic@lists.infradead.org"
	<linux-amlogic@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: [PATCH] mtd: rawnand: meson: initialize struct with zeroes
Thread-Topic: [PATCH] mtd: rawnand: meson: initialize struct with zeroes
Thread-Index: AQHZRb3PAtJycZT9oEiE8E6P9L5Dug==
Date: Tue, 21 Feb 2023 06:29:11 +0000
Message-ID: <60729500-b6ad-6ffe-0550-80d9d61cc3ed@sberdevices.ru>
Accept-Language: en-US, ru-RU
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.16.1.12]
Content-ID: <0BA35F9B4A40D0469BBEC1BD52087B87@sberdevices.ru>
MIME-Version: 1.0
X-KSMG-Rule-ID: 4
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Status: not scanned, disabled by settings
X-KSMG-AntiSpam-Interceptor-Info: not scanned
X-KSMG-AntiPhishing: not scanned, disabled by settings
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 1.1.2.30, bases: 2023/02/21 02:56:00 #20885447
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230220_222923_004748_1DC73834 
X-CRM114-Status: GOOD (  12.46  )
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
This happens, because when this struct is not zeroed, pointer 'hw' is
"initialized" by garbage, which is valid pointer, but points to some
garbage. So 'hw' will be dereferenced, but 'core' contains some random
data which will be interpreted as pointer. The following backtrace is
result of dereference of such pointer:

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
