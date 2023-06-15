Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4F84EB64DC
	for <linux-mtd@archiver.kernel.org>; Thu, 15 Jun 2023 08:13:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=tsOADcLQO8M6kVtxi63z63UF378kg5hzxfEglJqdgJ8=; b=r6Ph2P6WaCei6H
	LQdi62T7oYms+26gyIgpPJ2+1lDdi8+ewml3btvvnLQM+Q5dLNZlwPylAMg+1NoCIizQGJ1j1i/N3
	SOox4p9N3tdlsGRbIzpwKFXhQPcDz8ApmU1cvANyyzQ2Pm6grwi9aHAk07X5sCRi3LjzB2Z4kWtZ5
	gTgQDXnXlVnPEzLRuCNgsxKBX/Em7mPFZYnxv0dpkSEyOOg2nYCA9jBsnnAh4HWg+X5LPnUD4oHM9
	WzQjfhqFoOkThcF/h+g4wlnpvqQlPDF/+Ryn1Ou7k57oPjhtuSSKaU2NGlEygV6uHmGdbQsFxSjlw
	pmHe4kNXjU4rMNt/BvZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q9i6f-00E8E3-2x;
	Thu, 15 Jun 2023 08:13:25 +0000
Received: from mx.sberdevices.ru ([45.89.227.171])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q9i6b-00E8Cu-1i;
	Thu, 15 Jun 2023 08:13:23 +0000
Received: from s-lin-edge02.sberdevices.ru (localhost [127.0.0.1])
	by mx.sberdevices.ru (Postfix) with ESMTP id 68ED95FD03;
	Thu, 15 Jun 2023 11:13:14 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
	s=mail; t=1686816794;
	bh=GBnQWGCpveCmHdPQY/TjNI8gfHlI0L3tYi9rnXILou8=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=lBczXaDzv17chSATJKsingHks6742x8wGEMdGFVLG1XPOqD2wzQM+UE0FihDzmGeO
	 2GXW74Fu4+8iiSzBljsiSMBrJUERZpllOOEErBkjx9fCw3DHAUqi+9ELe6399I2M2H
	 1KfX/kb7gOIL6CkHyJo3U2gTa8XZfNjSBPGR0C+owxZu5vZpdhfJHiRGTFS/Yax/jh
	 7XEidqMgNwSepry8OFLOrOjmDeCzJTtm5GzUpYpWg1RsIP3Le0RNyVc4LHceIQKtgb
	 WAefYtGyjZsgmrRsK3VXyh0iCxa/tQ1s6NVOAbl89GLBRWd+WedkzLoWtmpXAPE7oS
	 YOt2dSZRKV4EA==
Received: from p-i-exch-sc-m01.sberdevices.ru (p-i-exch-sc-m01.sberdevices.ru [172.16.192.107])
	by mx.sberdevices.ru (Postfix) with ESMTP;
	Thu, 15 Jun 2023 11:13:12 +0300 (MSK)
From: Arseniy Krasnov <AVKrasnov@sberdevices.ru>
To: Liang Yang <liang.yang@amlogic.com>, Miquel Raynal
	<miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>, Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Yixun Lan
	<yixun.lan@amlogic.com>, Jianxin Pan <jianxin.pan@amlogic.com>
CC: <oxffffaa@gmail.com>, <kernel@sberdevices.ru>, Arseniy Krasnov
	<AVKrasnov@sberdevices.ru>, <Stable@vger.kernel.org>,
	<linux-mtd@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-amlogic@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v1] mtd: rawnand: meson: fix unaligned DMA buffers handling
Date: Thu, 15 Jun 2023 11:08:15 +0300
Message-ID: <20230615080815.3291006-1-AVKrasnov@sberdevices.ru>
X-Mailer: git-send-email 2.35.0
MIME-Version: 1.0
X-Originating-IP: [172.16.1.6]
X-ClientProxiedBy: S-MS-EXCH02.sberdevices.ru (172.16.1.5) To
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107)
X-KSMG-Rule-ID: 4
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Status: not scanned, disabled by settings
X-KSMG-AntiSpam-Interceptor-Info: not scanned
X-KSMG-AntiPhishing: not scanned, disabled by settings
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 1.1.2.30, bases: 2023/06/15 01:19:00 #21506022
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230615_011322_083522_FF73C9D1 
X-CRM114-Status: GOOD (  10.04  )
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

Meson NAND controller requires 8 bytes alignment for DMA addresses,
otherwise it "aligns" passed address by itself thus accessing invalid
location in the provided buffer. This patch makes unaligned buffers to
be reallocated to become valid.

Fixes: 8fae856c5350 ("mtd: rawnand: meson: add support for Amlogic NAND flash controller")
Cc: <Stable@vger.kernel.org>
Signed-off-by: Arseniy Krasnov <AVKrasnov@sberdevices.ru>
---
 drivers/mtd/nand/raw/meson_nand.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/mtd/nand/raw/meson_nand.c b/drivers/mtd/nand/raw/meson_nand.c
index c5628f7ac3b1..aa2b64dde74b 100644
--- a/drivers/mtd/nand/raw/meson_nand.c
+++ b/drivers/mtd/nand/raw/meson_nand.c
@@ -77,6 +77,7 @@
 #define GENCMDIADDRH(aih, addr)		((aih) | (((addr) >> 16) & 0xffff))
 
 #define DMA_DIR(dir)		((dir) ? NFC_CMD_N2M : NFC_CMD_M2N)
+#define DMA_ADDR_ALIGN		8
 
 #define ECC_CHECK_RETURN_FF	(-1)
 
@@ -1001,6 +1002,9 @@ static int meson_nfc_read_page_hwecc(struct nand_chip *nand, u8 *buf,
 
 static bool meson_nfc_is_buffer_dma_safe(const void *buffer)
 {
+	if ((uintptr_t)buffer % DMA_ADDR_ALIGN)
+		return false;
+
 	if (virt_addr_valid(buffer) && (!object_is_on_stack(buffer)))
 		return true;
 	return false;
-- 
2.35.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
