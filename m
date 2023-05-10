Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0CBEC7EE22
	for <linux-mtd@archiver.kernel.org>; Wed, 10 May 2023 11:14:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=o1or8GGEjU9SNr7S3wJK4jhlU2zJd88mvE+7a+kDh3M=; b=w3VrNXaXDhR5jH
	m+OD0Ct/Jqfvr54nlGgJcO2v6Y9NIYdGyriEhznMY/nhkEK4tagAujveaLJXCAFPCFdJet33A0KuS
	soB7NvRrAWBrSeHH58GK1yxJYNgwILojX9QBefFDcqtqrE+MKYp2vUTe1E3/45UuaeeEvCvu73MD9
	jUI5/5ygyI894NthtOkyLP2+ptVtyr0w8xf0AhGta+pct4iv0OJoCJKoO9V6Po5sZieuYnE61kTT6
	qKlYQmukFzcQiIS+uZEG9gdIkcZOzzjLF88ajXBRBE0D89r4YhobJHVQ5g8nWz8rits+D1rcYl1BR
	zRBXCGMQXNns9urQizhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pwhle-005zGj-0A;
	Wed, 10 May 2023 11:13:58 +0000
Received: from mx.sberdevices.ru ([45.89.227.171])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pwhlR-005z7M-2O;
	Wed, 10 May 2023 11:13:47 +0000
Received: from s-lin-edge02.sberdevices.ru (localhost [127.0.0.1])
	by mx.sberdevices.ru (Postfix) with ESMTP id 1BFD45FD28;
	Wed, 10 May 2023 14:13:44 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
	s=mail; t=1683717224;
	bh=pDgBDoAKjg6vj7ErjpVUqQO/7LJNM4Rbiw1rV81IA2I=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=D5IjbeTUTO5iE1NbyyeAPb7mEeEsZufkvCkVZxiZDqxefDo3L/a7zFiqkwqFkpRV3
	 cFMsORQhsE2BaFLrYxLzEJQv7u5xhm4CIwKoPELxmLu0vrQtZPFcJSLgDAjO/VhMCB
	 Yibr7IRFnECeoUw22G3xItZzhdfeBXASZPfWZOjAr0bmg2LSwtai95gUwRo4gp8QMW
	 t2zDnEAVGXWytKjOZWmbia+dRm5H8x3MOLBHWEsd4s5LR7aRrPFLAcBcvIvWS+Rs9u
	 8GxwlupMj0WosxGC37O3d/thbwvGqIOVS6MDv+eYzXUXbtSFsBMr1L9aMDa0SLFy+T
	 pznDj5aQOmQfA==
Received: from S-MS-EXCH01.sberdevices.ru (S-MS-EXCH01.sberdevices.ru [172.16.1.4])
	by mx.sberdevices.ru (Postfix) with ESMTP;
	Wed, 10 May 2023 14:13:43 +0300 (MSK)
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
Subject: [PATCH v3 3/6] mtd: rawnand: meson: always read whole OOB bytes
Date: Wed, 10 May 2023 14:08:31 +0300
Message-ID: <20230510110835.26115-4-AVKrasnov@sberdevices.ru>
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
X-CRM114-CacheID: sfid-20230510_041345_958636_39345795 
X-CRM114-Status: GOOD (  11.84  )
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
index d7c81408cfa2..331377a2c5dc 100644
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
