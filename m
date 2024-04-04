Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB195CD1284
	for <linux-mtd@archiver.kernel.org>; Thu,  4 Apr 2024 12:16:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=QpgZHfW3OG+Tk72kYl34siJSg7rxfADgBVuxGMqtkck=; b=N3/9M/fBQ1GiX4
	wobq7hLQYE8UuSJzKuCOx4K39d1AxGS+sNMvCdlybFexRaKt5vXefFZaqlln5p9T+wDtP36q0If8R
	Ku7ft/AH0LQJOY3pvvdx/6dsYyN0AxEx279zdkT4nnaQV+vEb2pyAy9MI25e5npapBySOlHyabmvY
	hWLQ+PaOwbXMeuJAmEBGQi8Qb9XWd2cJNcJeZeb/VCNq9qkoPziFtySSzovXTxfWTVJ0SKvLSfE6G
	8D8XwsDxRgVCPP2USv2leCax37094MmeVgUky9SnlFBEieAZIyTRCf8EsDBSgOsx1JCKXYwbit1La
	808J/WWjWg5cOwoJNONw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsM0a-00000002XW5-0itN;
	Thu, 04 Apr 2024 12:15:56 +0000
Received: from mx2.sberdevices.ru ([45.89.224.132] helo=mx1.sberdevices.ru)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsM0W-00000002XSa-1IDn
	for linux-mtd@lists.infradead.org;
	Thu, 04 Apr 2024 12:15:54 +0000
Received: from p-infra-ksmg-sc-msk02 (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id E7E0512000D;
	Thu,  4 Apr 2024 15:15:39 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru E7E0512000D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1712232939;
	bh=ETwhhACPGuY4BnkEtYjTCpxmGzMAX5wMpPGvtWzJOJ0=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=cqkae22nnOJqKTjS9Lp6VhJEf2QNNRAq4f7aVqH2buIB76IitunvIJ44Iwb6PtLsL
	 I2cUykRoAANFgj1t4Rh2xZWfpdnTMB8oLdn2vqW9krJmEmZkVEQ94zwyKMjGUvMM2T
	 lnfLlKg/rHTSY/uVsad5RK4aaS6KJevVoiOVJLKq/LOTtxXykCymr+uKd4Qwo1Rj7M
	 jtwGTstLm5e4zXJ10VZcrafOxnvOAr9xb9AMWz45xIZrSqCkKLRG6tP61svUBo0qtm
	 5j2mjXphjhEqE8bTCwzHo6BtKTTbZWmiPA754x60e7TY+uY2CuXTGXXSX68Xno0ca8
	 F2E0WCNNAez6A==
Received: from smtp.sberdevices.ru (p-i-exch-sc-m02.sberdevices.ru [172.16.192.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Thu,  4 Apr 2024 15:15:39 +0300 (MSK)
Received: from CAB-WSD-L081021.sberdevices.ru (100.64.160.123) by
 p-i-exch-sc-m02.sberdevices.ru (172.16.192.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Thu, 4 Apr 2024 15:15:39 +0300
From: Dmitry Rokosov <ddrokosov@salutedevices.com>
To: <quic_sridsn@quicinc.com>, <quic_mdalam@quicinc.com>, <ezra@easyb.ch>,
	<gch981213@gmail.com>, <miquel.raynal@bootlin.com>, <richard@nod.at>,
	<sashal@kernel.org>, <gregkh@linuxfoundation.org>, <vigneshr@ti.com>
CC: <kernel@salutedevices.com>, <rockosov@gmail.com>,
	<linux-kernel@vger.kernel.org>, <linux-mtd@lists.infradead.org>, Ezra Buehler
	<ezra.buehler@husqvarnagroup.com>, <stable@vger.kernel.org>, Martin Kurbanov
	<mmkurbanov@salutedevices.com>, Dmitry Rokosov <ddrokosov@salutedevices.com>
Subject: [PATCH v1] mtd: spinand: Add support for 5-byte IDs
Date: Thu, 4 Apr 2024 15:15:21 +0300
Message-ID: <20240404121532.14755-1-ddrokosov@salutedevices.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Originating-IP: [100.64.160.123]
X-ClientProxiedBy: p-i-exch-sc-m02.sberdevices.ru (172.16.192.103) To
 p-i-exch-sc-m02.sberdevices.ru (172.16.192.103)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 184579 [Apr 04 2024]
X-KSMG-AntiSpam-Version: 6.1.0.4
X-KSMG-AntiSpam-Envelope-From: ddrokosov@salutedevices.com
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 14 0.3.14 5a0c43d8a1c3c0e5b0916cc02a90d4b950c01f96, {Tracking_uf_ne_domains}, {Tracking_from_domain_doesnt_match_to}, 100.64.160.123:7.1.2;lore.kernel.org:7.1.1;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;127.0.0.199:7.1.2;salutedevices.com:7.1.1;smtp.sberdevices.ru:7.1.1,5.0.1, FromAlignment: s, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean, bases: 2024/04/04 11:24:00
X-KSMG-LinksScanning: Clean, bases: 2024/04/04 11:24:00
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2024/04/04 07:34:00 #24651931
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240404_051553_056737_73B41CE9 
X-CRM114-Status: GOOD (  16.98  )
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

From: Ezra Buehler <ezra.buehler@husqvarnagroup.com>

[ Upstream commit 34a956739d295de6010cdaafeed698ccbba87ea4 ]

E.g. ESMT chips will return an identification code with a length of 5
bytes. In order to prevent ambiguity, flash chips would actually need to
return IDs that are up to 17 or more bytes long due to JEDEC's
continuation scheme. I understand that if a manufacturer ID is located
in bank N of JEDEC's database (there are currently 16 banks), N - 1
continuation codes (7Fh) need to be added to the identification code
(comprising of manufacturer ID and device ID). However, most flash chip
manufacturers don't seem to implement this (correctly).

Cc: <stable@vger.kernel.org> # 6.6.23
Cc: <stable@vger.kernel.org> # 6.7.11
Cc: <stable@vger.kernel.org> # 6.8.2
Signed-off-by: Ezra Buehler <ezra.buehler@husqvarnagroup.com>
Reviewed-by: Martin Kurbanov <mmkurbanov@salutedevices.com>
Tested-by: Martin Kurbanov <mmkurbanov@salutedevices.com>
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
Link: https://lore.kernel.org/linux-mtd/20240125200108.24374-2-ezra@easyb.ch
Signed-off-by: Dmitry Rokosov <ddrokosov@salutedevices.com>
---

In the patch series [1] only one patch was marked with Fixes tag, that's
why the secon patch was not applied to 6.6.y, 6.7.y and 6.8y. It breaks
ESMT detection flow with logs:

[    0.770730] spi-nand spi0.0: unknown raw ID c8017f7f
[    0.772688] spi-nand: probe of spi0.0 failed with error -524

Please cherry-pick the second patch from the series to 6.6.y, 6.7.y and
6.8.y.

Links:
    [1] https://lore.kernel.org/linux-mtd/20240125200108.24374-1-ezra@easyb.ch/

---
 include/linux/mtd/spinand.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/mtd/spinand.h b/include/linux/mtd/spinand.h
index badb4c1ac079..5c19ead60499 100644
--- a/include/linux/mtd/spinand.h
+++ b/include/linux/mtd/spinand.h
@@ -169,7 +169,7 @@
 struct spinand_op;
 struct spinand_device;
 
-#define SPINAND_MAX_ID_LEN	4
+#define SPINAND_MAX_ID_LEN	5
 /*
  * For erase, write and read operation, we got the following timings :
  * tBERS (erase) 1ms to 4ms
-- 
2.43.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
