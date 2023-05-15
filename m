Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29FD3C77B7D
	for <linux-mtd@archiver.kernel.org>; Mon, 15 May 2023 09:50:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qTdRvjI5zzSxr6EJv7Stowq0kWeyyliYLtnDOVxLdbU=; b=t9EHsqMvHhSNNV
	Wcp80mlaOWaIXz0R10f1qQOrXLWhvY3vr4IIBuI9Rb7P/jUz399BBOjyQ9j8OS2ONk3OHZitUSGKQ
	tC2VHNWqkFns+9muDdMiXaixFd2J4hvKN24UM8fVPHsfKJd5Ae6uLWaHueoG1xp2ei8huHbCO93Rb
	Z5Ry4/efnJX1qUptoQN0soAfAqCGwsO1xi/C3ManC3eqnX83Q9gtxiQWMsQAnC22tugMnbr0Z+NNi
	o0Poo/ES0FYqVngwlgQ5O6TBvCLnwC9ku1L4fWFnO130GRDE+dwphm40Zu64Zg9TcotuDWbc4txQQ
	GiknqbCdWFivdzgWgjAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pyUqC-001cqD-0N;
	Mon, 15 May 2023 09:50:04 +0000
Received: from mx.sberdevices.ru ([45.89.227.171])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pyUpy-001chp-1H;
	Mon, 15 May 2023 09:49:54 +0000
Received: from s-lin-edge02.sberdevices.ru (localhost [127.0.0.1])
	by mx.sberdevices.ru (Postfix) with ESMTP id A1E125FD20;
	Mon, 15 May 2023 12:49:46 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
	s=mail; t=1684144186;
	bh=Vz83jCy0spHA1ZRural7ddOQ1iT++4tUqhV7Ue23lk4=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=qcn0IQfHKcGxRJrBonclWUzFGa4XbN3UU6+FFP2AsksiDymQ6qNyJELtmB+wp36eq
	 PGVeFzgUnZww1VpOhjHQc58e5YFXfAN5i8YvvR4CIUctnyZ1aY4dVrn4aGRuy0NQfd
	 m12CbKfAW7nSCh8ufHe4Hct5q1juezSISYESH0Nbt8QI243gw1FewU8wrF5fZ+YVAi
	 lTjuvjuIfvhtsNSDqqR8z+GT+Qb4/2WO/sIIfYliAHUQ9QPFWwmd5Dz09Bm1II3kbW
	 nDBgUSxU1tD1iqMAjGKSpGg4GvssvSm0RyiHy2X3nvvkVeqZqUnoQSXqFXVO08SkuM
	 +nqn2DBNfqqKQ==
Received: from S-MS-EXCH01.sberdevices.ru (S-MS-EXCH01.sberdevices.ru [172.16.1.4])
	by mx.sberdevices.ru (Postfix) with ESMTP;
	Mon, 15 May 2023 12:49:46 +0300 (MSK)
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
Subject: [PATCH v4 3/5] mtd: rawnand: meson: always read whole OOB bytes
Date: Mon, 15 May 2023 12:44:37 +0300
Message-ID: <20230515094440.3552094-4-AVKrasnov@sberdevices.ru>
X-Mailer: git-send-email 2.35.0
In-Reply-To: <20230515094440.3552094-1-AVKrasnov@sberdevices.ru>
References: <20230515094440.3552094-1-AVKrasnov@sberdevices.ru>
MIME-Version: 1.0
X-Originating-IP: [172.16.1.6]
X-ClientProxiedBy: S-MS-EXCH01.sberdevices.ru (172.16.1.4) To
 S-MS-EXCH01.sberdevices.ru (172.16.1.4)
X-KSMG-Rule-ID: 4
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Status: not scanned, disabled by settings
X-KSMG-AntiSpam-Interceptor-Info: not scanned
X-KSMG-AntiPhishing: not scanned, disabled by settings
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 1.1.2.30, bases: 2023/05/15 04:03:00 #21308474
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230515_024950_964191_55254E9C 
X-CRM114-Status: GOOD (  11.24  )
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

This changes size of read access to OOB area by reading all bytes of
OOB (free bytes + ECC engine bytes).

Signed-off-by: Arseniy Krasnov <AVKrasnov@sberdevices.ru>
---
 drivers/mtd/nand/raw/meson_nand.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/drivers/mtd/nand/raw/meson_nand.c b/drivers/mtd/nand/raw/meson_nand.c
index 8526a6b87720..a31106c943d7 100644
--- a/drivers/mtd/nand/raw/meson_nand.c
+++ b/drivers/mtd/nand/raw/meson_nand.c
@@ -755,6 +755,30 @@ static int __meson_nfc_read_oob(struct nand_chip *nand, int page,
 	u32 oob_bytes;
 	u32 page_size;
 	int ret;
+	int i;
+
+	/* Read ECC codes and user bytes. */
+	for (i = 0; i < nand->ecc.steps; i++) {
+		u32 ecc_offs = nand->ecc.size * (i + 1) +
+			       NFC_OOB_PER_ECC(nand) * i;
+
+		ret = nand_read_page_op(nand, page, 0, NULL, 0);
+		if (ret)
+			return ret;
+
+		/* Use temporary buffer, because 'nand_change_read_column_op()'
+		 * seems work with some alignment, so we can't read data to
+		 * 'oob_buf' directly.
+		 */
+		ret = nand_change_read_column_op(nand, ecc_offs, meson_chip->oob_buf,
+						 NFC_OOB_PER_ECC(nand), false);
+		if (ret)
+			return ret;
+
+		memcpy(oob_buf + i * NFC_OOB_PER_ECC(nand),
+		       meson_chip->oob_buf,
+		       NFC_OOB_PER_ECC(nand));
+	}
 
 	oob_bytes = meson_nfc_get_oob_bytes(nand);
 
-- 
2.35.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
