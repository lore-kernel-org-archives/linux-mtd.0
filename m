Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 558E5EE49A4
	for <linux-mtd@archiver.kernel.org>; Tue, 22 Aug 2023 12:26:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JYqpD9E3bJQQ6oJ99J+I6dlDFNTu3Mawp4aUUAyflLo=; b=KbwrwaXttarNCo
	6Qt6oIm2p8qWx4VH/EJr2yhmmp6zMjXrSgpX1HImdU87jLA3sWbcHvbSsgyrtqly8L1hK8dYxE0Si
	5wpUu0v4wwMvgtTwewgKv8gQN+xwAxnWvx3ZxPLYhHo+VdYgprgljtd6EFjUYS/AtEEohRVMozsdI
	ANIQNJL0BMLo0AW6Fe/TX3fBd/AI5/fgQt3l/ZqHhPd8/hqtePOeX9+RaJ/zQKTpv/Loyh8ADIHcf
	x/VQrSj4rY9AytgpO7dN7GpYuBJznoBsNLlm/OtK3OLrXZOJ6IHy/DgoQmpiodQa3oeBtMmGEtOI8
	psoNVdjJDWaxc+6Jx48Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qYQST-00Fti2-0B;
	Tue, 22 Aug 2023 12:26:05 +0000
Received: from mx2.sberdevices.ru ([45.89.224.132] helo=mx1.sberdevices.ru)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qYQSP-00FtfP-2s
	for linux-mtd@lists.infradead.org;
	Tue, 22 Aug 2023 12:26:03 +0000
Received: from p-infra-ksmg-sc-msk02 (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id 7983712000D;
	Tue, 22 Aug 2023 15:25:54 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 7983712000D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
	s=mail; t=1692707154;
	bh=hGLCpp8kF6fiAnZ+P/Yb76gyGxaPZI9c6OUPVuPR9xE=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=cba8YCe7I0zCib6OiN7uC7RpNlN+ExWjAM3KEAw5YMkMpTTo8pTlZHBUu1lkbloMa
	 pGEHzC37zErzP7RT4YR2Dm5xfEHZ5HIal+o/iX6fGp26quv3fKKkj1y3HsWUCFQ1YH
	 QMt0JnjA4fF12jZmQhNUsfgUSUibVMj3qP1AdvPmZWKg5nH8rfPrGpvIBdmKPm7Cdz
	 +DxHSt8pFX+EXX50YxNR5d/tMagf/igxVHtKgg4FsZ06/0GwqtAGTMYWWINlpDFMMM
	 /dGTlpcxrubccKcPgIbdzfQ3BPcLva+QQ80p9Vta7MEX2alzEiOWxGzEVNClqxqckC
	 OuQ/ExnaixcNw==
Received: from p-i-exch-sc-m01.sberdevices.ru (p-i-exch-sc-m01.sberdevices.ru [172.16.192.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Tue, 22 Aug 2023 15:25:54 +0300 (MSK)
Received: from CAB-WSD-0004828.sigma.sbrf.ru (100.64.160.123) by
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.30; Tue, 22 Aug 2023 15:25:52 +0300
From: Martin Kurbanov <mmkurbanov@sberdevices.ru>
To: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger
	<richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
CC: <linux-kernel@vger.kernel.org>, <linux-mtd@lists.infradead.org>,
	<kernel@sberdevices.ru>, Martin Kurbanov <mmkurbanov@sberdevices.ru>
Subject: [PATCH v2 1/2] mtd: spinand: micron: correct bitmask for ecc status
Date: Tue, 22 Aug 2023 15:25:33 +0300
Message-ID: <20230822122534.872646-2-mmkurbanov@sberdevices.ru>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230822122534.872646-1-mmkurbanov@sberdevices.ru>
References: <20230822122534.872646-1-mmkurbanov@sberdevices.ru>
MIME-Version: 1.0
X-Originating-IP: [100.64.160.123]
X-ClientProxiedBy: p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) To
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 179374 [Aug 22 2023]
X-KSMG-AntiSpam-Version: 5.9.59.0
X-KSMG-AntiSpam-Envelope-From: mmkurbanov@salutedevices.com
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 527 527 5bb611be2ca2baa31d984ccbf4ef4415504fc308, {Tracking_smtp_not_equal_from}, {Tracking_from_domain_doesnt_match_to}, 100.64.160.123:7.1.2;p-i-exch-sc-m01.sberdevices.ru:5.0.1,7.1.1;salutedevices.com:7.1.1;127.0.0.199:7.1.2;sberdevices.ru:5.0.1,7.1.1;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1, FromAlignment: n, {Tracking_smtp_domain_mismatch}, {Tracking_smtp_domain_2level_mismatch}, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2023/08/22 09:22:00 #21674243
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230822_052602_111852_1B60A0BB 
X-CRM114-Status: GOOD (  12.38  )
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

Valid bitmask is 0x70 in the status register.

Signed-off-by: Martin Kurbanov <mmkurbanov@sberdevices.ru>
---
 drivers/mtd/nand/spi/micron.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/spi/micron.c b/drivers/mtd/nand/spi/micron.c
index 50b7295bc922..12601bc4227a 100644
--- a/drivers/mtd/nand/spi/micron.c
+++ b/drivers/mtd/nand/spi/micron.c
@@ -12,7 +12,7 @@
 
 #define SPINAND_MFR_MICRON		0x2c
 
-#define MICRON_STATUS_ECC_MASK		GENMASK(7, 4)
+#define MICRON_STATUS_ECC_MASK		GENMASK(6, 4)
 #define MICRON_STATUS_ECC_NO_BITFLIPS	(0 << 4)
 #define MICRON_STATUS_ECC_1TO3_BITFLIPS	(1 << 4)
 #define MICRON_STATUS_ECC_4TO6_BITFLIPS	(3 << 4)
-- 
2.40.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
