Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAA51C7EE2E
	for <linux-mtd@archiver.kernel.org>; Thu,  8 Jun 2023 04:42:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=8k3uNoufCMb4B0cAwkYqSn6IAWeCVN4V3qWB/vWp+oo=; b=gQ/K7bSbwWN3f/
	OgbkOgyPlsPQHL7dpNxHZQWniE3t6/FfQI7IS9jAG4FyNLZbTEcQZyMObhMwCZte4kht7c/5ajqE6
	nTKZc9pKhUa3kW3NkusZht228fVISfXTqW1ZreLgrZGQNkj+zHj/hMNsivnXukRP6DCh2dpwIF4K+
	/O1axpyLJLX53h0+UwVnLuxYA5V18r2YeB3eiYjO6QITFjjuxU1jckFNvhcZua29K+a75DEeGG7hv
	jgC36ZdjlhFq2K/7i0P7Kndu4e38YDwssfNMaPSqk/MC2pyhsrGLmZ/qj8DCqo9YPDMyW9qf1HToW
	I+nQ9jsOfVFJuoSHCHLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q77TI-0083vC-0N;
	Thu, 08 Jun 2023 04:42:04 +0000
Received: from mx.sberdevices.ru ([45.89.227.171])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q77TD-0083tk-0k;
	Thu, 08 Jun 2023 04:42:01 +0000
Received: from s-lin-edge02.sberdevices.ru (localhost [127.0.0.1])
	by mx.sberdevices.ru (Postfix) with ESMTP id 468AC5FD71;
	Thu,  8 Jun 2023 07:41:52 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
	s=mail; t=1686199312;
	bh=LpIzyCBJY6jE9pEgPEdaViRUSV3QsiKuyw4HBlkJGNg=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=K+vdAbFe62te0cvVfiaxQ/F8O3UQzpWgy3aFtkskuue+TN5L6Wpe1gmkhD/aDUJOR
	 2CPi/5IXb0zfcB8UdnRjqQqyE8cJvOmW6NTKfCAOlZDv09BUox3frgMOFaklC3drOZ
	 7a/gxiXcTaK7IdD8R3XlTDsPY5iNZe03FfPVVTnFluXZXZE+xKZOVcWiuEptqiMyh1
	 jCNX5gcvaZWz6UZNJnF0OdhxRl76EqbEs8sI++4R8Svaqkmy668toXwB56AsIvDLeZ
	 +HWSoTXNQ14a65XAp73+v25KUgTE5ABlBYSxXPyhh8U2RTvlqM89SOlHLKfXGPGGR8
	 VV72eBcdllxGw==
Received: from S-MS-EXCH01.sberdevices.ru (S-MS-EXCH01.sberdevices.ru [172.16.1.4])
	by mx.sberdevices.ru (Postfix) with ESMTP;
	Thu,  8 Jun 2023 07:41:50 +0300 (MSK)
From: Arseniy Krasnov <AVKrasnov@sberdevices.ru>
To: Liang Yang <liang.yang@amlogic.com>, Miquel Raynal
	<miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>, Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
CC: <oxffffaa@gmail.com>, <kernel@sberdevices.ru>, Arseniy Krasnov
	<AVKrasnov@sberdevices.ru>, <linux-mtd@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-amlogic@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH v2] mtd: rawnand: meson: replace integer consts with proper defines
Date: Thu, 8 Jun 2023 07:36:44 +0300
Message-ID: <20230608043644.1271186-1-AVKrasnov@sberdevices.ru>
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
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 1.1.2.30, bases: 2023/06/08 00:23:00 #21457426
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230607_214159_816591_78849C2F 
X-CRM114-Status: GOOD (  10.96  )
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

Add defines for column address. It makes driver more readable, because
bitwise OR with 0 looks useless.

Suggested-by: Liang Yang <liang.yang@amlogic.com>
Signed-off-by: Arseniy Krasnov <AVKrasnov@sberdevices.ru>
---
 Changelog:
  v1 -> v2:
   * Use defines with zero values instead of dropping both operations in
     v1.

 drivers/mtd/nand/raw/meson_nand.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/raw/meson_nand.c b/drivers/mtd/nand/raw/meson_nand.c
index 0154131e1d54..9034b3ca9e5b 100644
--- a/drivers/mtd/nand/raw/meson_nand.c
+++ b/drivers/mtd/nand/raw/meson_nand.c
@@ -109,6 +109,9 @@
 
 #define PER_INFO_BYTE		8
 
+#define NFC_COLUMN_ADDR_0	0
+#define NFC_COLUMN_ADDR_1	0
+
 struct meson_nfc_nand_chip {
 	struct list_head node;
 	struct nand_chip nand;
@@ -672,12 +675,12 @@ static int meson_nfc_rw_cmd_prepare_and_execute(struct nand_chip *nand,
 	cmd0 = in ? NAND_CMD_READ0 : NAND_CMD_SEQIN;
 	nfc->cmdfifo.rw.cmd0 = cs | NFC_CMD_CLE | cmd0;
 
-	addrs[0] = cs | NFC_CMD_ALE | 0;
+	addrs[0] = cs | NFC_CMD_ALE | NFC_COLUMN_ADDR_0;
 	if (mtd->writesize <= 512) {
 		cmd_num--;
 		row_start = 1;
 	} else {
-		addrs[1] = cs | NFC_CMD_ALE | 0;
+		addrs[1] = cs | NFC_CMD_ALE | NFC_COLUMN_ADDR_1;
 		row_start = 2;
 	}
 
-- 
2.35.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
