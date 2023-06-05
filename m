Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC965C77B73
	for <linux-mtd@archiver.kernel.org>; Mon,  5 Jun 2023 06:16:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=AC79ajFacdeW0X3EZ/kNzB69+JypiiEsfSGf4UW8HX4=; b=0nGXJZxmTWts0U
	p+ouUbvMG2QyEsPM6k0+9mShysbpg6272AAdfgZQFAeCQvxee1gsHlp3wy0wdQOcqiKgjXa7jGduV
	Eh+nhGUYR6MfwjscjGZ9z3+rf0nvYag/Ci0wfssDRC5WFc4LwHkQrBvbntzI2sw/E2pJVyy8CS7vO
	9WK5LQ7+jF3VT+mXevFIfmgOaJFrekVJQhQofJHZQSzBO/GuSUDmCfsBe6ivq7QYswwx3mUn7nw1u
	5es+zKPrteEwBzB2DqGcs2+SBmQEdaF5r4nvoLsIVXvaOJsuqdy8eK2fhuYSEwjv2KS3yWz6dm0uO
	PplfNPWeNsOBU2TqHlKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q63Vt-00EIkR-1c;
	Mon, 05 Jun 2023 06:16:21 +0000
Received: from mx.sberdevices.ru ([45.89.227.171])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q63Vn-00EIhs-2e;
	Mon, 05 Jun 2023 06:16:18 +0000
Received: from s-lin-edge02.sberdevices.ru (localhost [127.0.0.1])
	by mx.sberdevices.ru (Postfix) with ESMTP id 716BD5FD15;
	Mon,  5 Jun 2023 09:16:06 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
	s=mail; t=1685945766;
	bh=knbIn8sgeJrLUQJlKWQNrWneQ8bifk2QzuAqk/RVJh0=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=JcrASE0H46Hg6zUOeQKL8OGaNW6C5/blcsv+FXm/0orAfzL4Co6JQZsDmH95mHV55
	 QiueNtCAh8IT6wDWOz5MxaaMFUq5B13ufyRz62Xivgbx4CVmndKfTc9/72mSbAqevu
	 VTV2O5QaWc4MLBSa5kCDp/N5dihr986GalRAGaHCCayZDV+uDNxlqRL9q4Zyaaej17
	 NuId1zDeY8dVWJ4glHsATaMZW1mIz5Y+G1qZMrDAgkrNbO6zIeba/CqVpgJhtsPbHY
	 BqNVClLkpuKgbekKWOcmnQ2UV4gEhFCFeTVbL1Lh872eHhXODsHmvljX3+ucr6KAUI
	 K99vpzVuit6ow==
Received: from S-MS-EXCH01.sberdevices.ru (S-MS-EXCH01.sberdevices.ru [172.16.1.4])
	by mx.sberdevices.ru (Postfix) with ESMTP;
	Mon,  5 Jun 2023 09:16:03 +0300 (MSK)
From: Arseniy Krasnov <AVKrasnov@sberdevices.ru>
To: Liang Yang <liang.yang@amlogic.com>, Miquel Raynal
	<miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>, Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Yixun Lan
	<yixun.lan@amlogic.com>, Jianxin Pan <jianxin.pan@amlogic.com>
CC: <oxffffaa@gmail.com>, <kernel@sberdevices.ru>, Arseniy Krasnov
	<AVKrasnov@sberdevices.ru>, <stable@vger.kernel.org>,
	<linux-mtd@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-amlogic@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v1] mtd: rawnand: meson: fix ready/busy command
Date: Mon, 5 Jun 2023 09:10:48 +0300
Message-ID: <20230605061048.485622-1-AVKrasnov@sberdevices.ru>
X-Mailer: git-send-email 2.35.0
MIME-Version: 1.0
X-Originating-IP: [172.16.1.6]
X-ClientProxiedBy: S-MS-EXCH01.sberdevices.ru (172.16.1.4) To
 S-MS-EXCH01.sberdevices.ru (172.16.1.4)
X-KSMG-Rule-ID: 4
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Status: not scanned, disabled by settings
X-KSMG-AntiSpam-Interceptor-Info: not scanned
X-KSMG-AntiPhishing: not scanned, disabled by settings
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 1.1.2.30, bases: 2023/06/05 01:06:00 #21433300
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230604_231616_852355_34A389C2 
X-CRM114-Status: GOOD (  10.61  )
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

Fix the ready/busy command value.

Fixes: 8fae856c5350 ("mtd: rawnand: meson: add support for Amlogic NAND flash controller")
Cc: stable@vger.kernel.org
Suggested-by: Liang Yang <liang.yang@amlogic.com>
Signed-off-by: Arseniy Krasnov <AVKrasnov@sberdevices.ru>
---
 drivers/mtd/nand/raw/meson_nand.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/meson_nand.c b/drivers/mtd/nand/raw/meson_nand.c
index 074e14225c06..9dd4a676497b 100644
--- a/drivers/mtd/nand/raw/meson_nand.c
+++ b/drivers/mtd/nand/raw/meson_nand.c
@@ -37,7 +37,7 @@
 #define NFC_CMD_SCRAMBLER_ENABLE	BIT(19)
 #define NFC_CMD_SCRAMBLER_DISABLE	0
 #define NFC_CMD_SHORTMODE_DISABLE	0
-#define NFC_CMD_RB_INT		BIT(14)
+#define NFC_CMD_RB_INT		((0xb << 10) | BIT(18) | BIT(16))
 
 #define NFC_CMD_GET_SIZE(x)	(((x) >> 22) & GENMASK(4, 0))
 
-- 
2.35.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
