Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D15CC64ED6
	for <linux-mtd@archiver.kernel.org>; Mon, 27 Feb 2023 10:03:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=SyV+7QMM4fjwFRqzPehqxa4Jp2tzEZg2Yv3ZRjm8Ky4=; b=IKInWkgxc/apfi
	OgJzaOG/AKwnsbxHHmt0vaVaEnqRg85FfpTasvwmfvq+Odc3HgmNax8Syxmd4IrrUNc6+pmqdPF5a
	tKdyZrSAB1erJ7IiccS6MHymqnodj9bQxuwJD/JLcbctiyWtXpK2N5lsamOw1MFis4gtRzSKLu5Qe
	rTOwAYUU2pgbarC9/YmgoL+NP6jd7R2hEYb83nJUsyCAt4mVcT1HmHj/D2LwV9hKamG8SYM/UDJTo
	+QNzr72o9ZEPZ+gPz+BMHB2hOw07TL03HfaCz+RJiELXRyTgjBoPgNHGoVNE0NwHzUDM8IPh/8aH7
	CvfnpMpYOIcgi0aiGZZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWaL9-0099Td-I7; Mon, 27 Feb 2023 10:02:39 +0000
Received: from mx.sberdevices.ru ([45.89.227.171])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWaKt-0099JM-TE; Mon, 27 Feb 2023 10:02:27 +0000
Received: from s-lin-edge02.sberdevices.ru (localhost [127.0.0.1])
	by mx.sberdevices.ru (Postfix) with ESMTP id 188BF5FD0F;
	Mon, 27 Feb 2023 13:02:11 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
	s=mail; t=1677492131;
	bh=axrOpWB/kuIlrKTiLcvF3MNd02fLp8Up4hYxSNkDI0c=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=N1RWFGCNLDx3Pox8xSdW2ZjEJ6WpX63vnFyxQQN0e9B/iClmsxXthz+3sr/tsU4e6
	 q6Vn/5hYxsJqClo4+obCkfLK/CPqNgtswgdOvbnbv/k93O69OmqaJbxKvqxhNJGqd4
	 g/4R6+98APJgvAWJtH4HWNdICjXdkzcHvLt2lo0ZjLQlyzgy3HkpyAfDjz6A9MagVf
	 TlsN+0bCNCE0dl3fhU/XaAhyOWn7pNAGEVSufuvn83Mzux6cguJNa4Usgu+38TQycb
	 v4gWcPY67wRcz+hqB8wwiz315H3A3XgZxKFcAiu2LvRmPhHqoknHoC+hIeZb+gV5K6
	 gGXUPZBnthJUQ==
Received: from S-MS-EXCH01.sberdevices.ru (S-MS-EXCH01.sberdevices.ru [172.16.1.4])
	by mx.sberdevices.ru (Postfix) with ESMTP;
	Mon, 27 Feb 2023 13:02:08 +0300 (MSK)
From: Arseniy Krasnov <AVKrasnov@sberdevices.ru>
To: Liang Yang <liang.yang@amlogic.com>, Miquel Raynal
	<miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>, Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
CC: <linux-mtd@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-amlogic@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<kernel@sberdevices.ru>, <oxffffaa@gmail.com>, Arseniy Krasnov
	<AVKrasnov@sberdevices.ru>
Subject: [PATCH v3] mtd: rawnand: meson: initialize struct with zeroes
Date: Mon, 27 Feb 2023 12:59:06 +0300
Message-ID: <20230227095906.754178-1-AVKrasnov@sberdevices.ru>
X-Mailer: git-send-email 2.35.0
MIME-Version: 1.0
X-Originating-IP: [172.16.1.6]
X-ClientProxiedBy: S-MS-EXCH02.sberdevices.ru (172.16.1.5) To
 S-MS-EXCH01.sberdevices.ru (172.16.1.4)
X-KSMG-Rule-ID: 4
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Status: not scanned, disabled by settings
X-KSMG-AntiSpam-Interceptor-Info: not scanned
X-KSMG-AntiPhishing: not scanned, disabled by settings
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 1.1.2.30, bases: 2023/02/27 03:40:00 #20900191
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230227_020224_327319_9EF1AE8E 
X-CRM114-Status: GOOD (  11.51  )
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
data which will be interpreted as a pointer. The following backtrace is
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

Fixes: 1e4d3ba66888 ("mtd: rawnand: meson: fix the clock")
Signed-off-by: Arseniy Krasnov <AVKrasnov@sberdevices.ru>
Acked-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
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
