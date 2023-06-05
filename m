Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B65E0C7EE37
	for <linux-mtd@archiver.kernel.org>; Mon,  5 Jun 2023 19:20:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=QdqpZsiJHsBqw+2aYNsbX19a2I5mqHA9FEO+2V1wEOU=; b=Y4XnHoD7T21FNf
	MTfHvVkk6UpGb9mUfrxOUhUB7y1JMToVFXYTUcHEY9EcUQiEQdg6UBqOMjtCS3CHlJZnzvPWFmxE0
	7c7KUUN58+WYOdnfjTYx7n7InT9iEE75JiUfQAndOpQfMJXP7fjycwmxhs8py5JnTMYNCwCQo/lFN
	e3oXkD3qPAHRZnrUsFZ11R6EWEgOmyaoLGuqegQgzup1iNERVqm00YNpAWEKLWpPXayC4SnX0UUZ2
	DaSriiSqlbtIkN0M9xSwrzUIPjCWpb4agcu7WaPULJUsUGc9u5ZULp6n4zJ0zprnJSolthkXqRjm2
	DDuSxSpUmPPFfnN1sl6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6FkV-00GXHg-1g;
	Mon, 05 Jun 2023 19:20:15 +0000
Received: from mx.sberdevices.ru ([45.89.227.171])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6FkR-00GXFx-2P;
	Mon, 05 Jun 2023 19:20:13 +0000
Received: from s-lin-edge02.sberdevices.ru (localhost [127.0.0.1])
	by mx.sberdevices.ru (Postfix) with ESMTP id 6BF175FD20;
	Mon,  5 Jun 2023 22:20:09 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
	s=mail; t=1685992809;
	bh=0bxcR34M60uuJQZ4Wt+CPZ8iyFTacwVg8Rt7W46V6l4=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=E2WGj9qE1hqoADU+k0pjgucB5yUQ+kCM1pQP1F1qqoaZ+6abq3lCH9BHNn78PDaAE
	 4EF5COfe5a/HiiNVBtwPhi9g2gmS38duYSv18cJeQDaCMJL6AyV8NpbbpY030SgV59
	 lgKWEo62+uqznorMrRZAbnmO/5+MPBHmRERPp2/V3E0qrJk17pkMGeCOp0JiWfMr4u
	 /92nghLeRfBcUJmpBG7xIs77iTjfvGd2sLfPZkUo7jUN9z1lEw9rcOqFAA/38ukG4I
	 SnYrwrX0HZwVuLXaT3+eohEk46Tz0oMOvHSsuDqOm026bgS8A6hj2490t4p/kqdrPc
	 iL7eP8iTAULNQ==
Received: from S-MS-EXCH01.sberdevices.ru (S-MS-EXCH01.sberdevices.ru [172.16.1.4])
	by mx.sberdevices.ru (Postfix) with ESMTP;
	Mon,  5 Jun 2023 22:20:09 +0300 (MSK)
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
Subject: [PATCH v1] mtd: rawnand: meson: remove unneeded bitwise OR with zeroes
Date: Mon, 5 Jun 2023 22:15:08 +0300
Message-ID: <20230605191508.1826853-1-AVKrasnov@sberdevices.ru>
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
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 1.1.2.30, bases: 2023/06/05 13:50:00 #21435193
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230605_122011_979763_EAD89C70 
X-CRM114-Status: GOOD (  10.63  )
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

Both operations have no effect.

Signed-off-by: Arseniy Krasnov <AVKrasnov@sberdevices.ru>
---
 drivers/mtd/nand/raw/meson_nand.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/raw/meson_nand.c b/drivers/mtd/nand/raw/meson_nand.c
index 074e14225c06..50d3110ad321 100644
--- a/drivers/mtd/nand/raw/meson_nand.c
+++ b/drivers/mtd/nand/raw/meson_nand.c
@@ -595,12 +595,12 @@ static int meson_nfc_rw_cmd_prepare_and_execute(struct nand_chip *nand,
 	cmd0 = in ? NAND_CMD_READ0 : NAND_CMD_SEQIN;
 	nfc->cmdfifo.rw.cmd0 = cs | NFC_CMD_CLE | cmd0;
 
-	addrs[0] = cs | NFC_CMD_ALE | 0;
+	addrs[0] = cs | NFC_CMD_ALE;
 	if (mtd->writesize <= 512) {
 		cmd_num--;
 		row_start = 1;
 	} else {
-		addrs[1] = cs | NFC_CMD_ALE | 0;
+		addrs[1] = cs | NFC_CMD_ALE;
 		row_start = 2;
 	}
 
-- 
2.35.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
