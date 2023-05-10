Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88DEBC7EE22
	for <linux-mtd@archiver.kernel.org>; Wed, 10 May 2023 11:14:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aNloHGcFpRiDLVomsMvJG3ArIzFoezBAy9wmW9ZBvbM=; b=F3tzam4dibSIY1
	eP3CL7bWIvGh1BDTq9UNa0OmM7OXLKQBzKftIN0e6XJD8UMIATh0ygALcqebFss4PAQX76sqlZZqS
	/Yzal9orPCdN0rcUpj8oA9CK3rs8qJkOWzwFLx8MFD2jnqsyz7A9wGUUZMlQRWyVJowsBKNlUCccu
	BiX0z2bmemN0sC/Y9mnd7aghDdrKyNkm2PesUlegYVIQEjJxUCURLMBFw03CLoM4R+va67ypPBpxD
	e1JIRTeAzjy2RIQVPDSSaK+E8W4DQjCOeabx8wzBt9Es/qKuxJNLOhe2hHPLYHgdWpmgBxSe6E6lw
	6CJdKFlqmYplOd1s9PyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pwhlj-005zLc-2v;
	Wed, 10 May 2023 11:14:03 +0000
Received: from mx.sberdevices.ru ([45.89.227.171])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pwhlX-005zBI-32;
	Wed, 10 May 2023 11:13:53 +0000
Received: from s-lin-edge02.sberdevices.ru (localhost [127.0.0.1])
	by mx.sberdevices.ru (Postfix) with ESMTP id 7164C5FD26;
	Wed, 10 May 2023 14:13:50 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
	s=mail; t=1683717230;
	bh=ts8L8EufclojNwHjAYYqvEX+8MMKKOVoJ4Q4/8XgsZE=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=FI2zCxOb2+Ryxs5ppqJ8RDmPTBvmnIHgEfBED9UWdnuuxkmqg/5zJ0x3kiT/iIepi
	 feDEVUzoV4KjjYKv9e0QqF6VQ/3tSYA3pXi25zhRpRV7Gi6GbSi3AuynJvtHcoIzAr
	 Xctd09ihAryVOsxeI5bWJaLrzmBoAly2y8l6VhcY1QlhWoZSp5zGjqNqdkCKu+Nr/X
	 wN1FcQ4XXhXwp6u9dPJf0k0Ukd56RYPdmdG17ygcHEaMcVNYZy6Dqx5Ywu/DEv7Qmj
	 3sE6NXLWFFOE4NZy0S1IeIy7Ulsa66M+XhHg1ZTLfpXyTqt4ZnGw94uz4YHjUoBQ+h
	 u4QnJfenUr3bw==
Received: from S-MS-EXCH01.sberdevices.ru (S-MS-EXCH01.sberdevices.ru [172.16.1.4])
	by mx.sberdevices.ru (Postfix) with ESMTP;
	Wed, 10 May 2023 14:13:50 +0300 (MSK)
From: Arseniy Krasnov <AVKrasnov@sberdevices.ru>
To: Liang Yang <liang.yang@amlogic.com>, Miquel Raynal
	<miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>, Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Yixun Lan
	<yixun.lan@amlogic.com>, Jianxin Pan <jianxin.pan@amlogic.com>
CC: <oxffffaa@gmail.com>, <kernel@sberdevices.ru>, Arseniy Krasnov
	<AVKrasnov@sberdevices.ru>, <linux-mtd@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-amlogic@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH v3 5/6] mtd: rawnand: meson: remove unneeded bitwise OR with zeroes
Date: Wed, 10 May 2023 14:08:33 +0300
Message-ID: <20230510110835.26115-6-AVKrasnov@sberdevices.ru>
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
X-CRM114-CacheID: sfid-20230510_041352_181584_BF3144A0 
X-CRM114-Status: GOOD (  11.25  )
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
index ed7ec1bfd07e..bc99a098f3ca 100644
--- a/drivers/mtd/nand/raw/meson_nand.c
+++ b/drivers/mtd/nand/raw/meson_nand.c
@@ -630,12 +630,12 @@ static int meson_nfc_rw_cmd_prepare_and_execute(struct nand_chip *nand,
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
