Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33B40C4332F
	for <linux-mtd@archiver.kernel.org>; Thu,  9 Nov 2023 05:48:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=6F0O/pu399T5UvlNEUrSzUtWaSjBYNGvzLRNtIc9vSs=; b=09y2+Z4ZhlHHhe
	naSco6mjYI1IeJ+N4FbMqty6wKmi+ESaeNARxJTh6ud8mUIPT+Tj+VAoDnzh22jxRQGgqnC5ULIIv
	kfdw5W4Xb50lofV0va89LXZkZMd7USBJu+rnAJm6hC1DCYTv3ket6x6PrEOX3F/QccNhbf5SBcxSv
	Acbv68/BA6lu65D/LoTUkp7h2W32YZ0fDMc+yBI2STN6vnl1PReJMbaOKJjp2aEPLuAN700rTLSFr
	k0ExGizCLAmVnH7KmnLfooj77cJI1l2HgjoXNpTWNU3UXnJuged3DGi728H0FSRCOf88K3WkhQqoy
	dnRzN38caMIycpzlnV4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r0xtW-005LcN-2R;
	Thu, 09 Nov 2023 05:47:58 +0000
Received: from mx1.sberdevices.ru ([37.18.73.165])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r0xtS-005Lb5-1v;
	Thu, 09 Nov 2023 05:47:56 +0000
Received: from p-infra-ksmg-sc-msk01 (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id 2471910003B;
	Thu,  9 Nov 2023 08:47:51 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 2471910003B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1699508871;
	bh=iEPGOwwFpiz4fNsEZ5A9kxrGYqz51ztVWpwbPLPuTaU=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=Gi+rME1yqP8TWRgKUOiVsTNmRCx+ucxbPYrXjc8BCv4a8sKmlvxZosiAsSjC0RwVU
	 e8L3owLEYPUOm7t/xB13m17l6ihEetWUZRKFYdTpwMT9Ob4vHWBTq/gNCIjf9+5wkt
	 gXvF3tFlUTewjFTjCqciP2Fwd0s9odbL4ydYSxrYs1+j2E5rE3xbjbTQiIijicmLm9
	 NPXNYg6U+cZqgAlTqUirtmZwWd+oFY5SbNNsaBJFxxrfwcgkasjnUbygklQMDzsXqd
	 GvqZ5yleCBHGBXrWrLAp1bILGgwI3Op9iVjcRH2JF4m3gP+rAV6yknEKHCtEtsAjn6
	 IDLfeyyMNpJjg==
Received: from p-i-exch-sc-m01.sberdevices.ru (p-i-exch-sc-m01.sberdevices.ru [172.16.192.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Thu,  9 Nov 2023 08:47:50 +0300 (MSK)
Received: from localhost.localdomain (100.64.160.123) by
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.37; Thu, 9 Nov 2023 08:47:50 +0300
From: Arseniy Krasnov <avkrasnov@salutedevices.com>
To: Liang Yang <liang.yang@amlogic.com>, Miquel Raynal
	<miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>, Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
CC: <oxffffaa@gmail.com>, <kernel@sberdevices.ru>, Arseniy Krasnov
	<avkrasnov@salutedevices.com>, <linux-mtd@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-amlogic@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH v1] mtd: rawnand: meson: handle OOB buffer according OOB layout
Date: Thu, 9 Nov 2023 08:39:53 +0300
Message-ID: <20231109053953.3863664-1-avkrasnov@salutedevices.com>
X-Mailer: git-send-email 2.35.0
MIME-Version: 1.0
X-Originating-IP: [100.64.160.123]
X-ClientProxiedBy: p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) To
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 181222 [Nov 09 2023]
X-KSMG-AntiSpam-Version: 6.0.0.2
X-KSMG-AntiSpam-Envelope-From: avkrasnov@salutedevices.com
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 543 543 1e3516af5cdd92079dfeb0e292c8747a62cb1ee4, {Tracking_from_domain_doesnt_match_to}, salutedevices.com:7.1.1;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;100.64.160.123:7.1.2;p-i-exch-sc-m01.sberdevices.ru:5.0.1,7.1.1;127.0.0.199:7.1.2, FromAlignment: s, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2023/11/09 02:48:00 #22434346
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231108_214754_981005_4860DB86 
X-CRM114-Status: GOOD (  13.94  )
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

In case of MTD_OPS_AUTO_OOB mode, MTD/NAND layer fills/reads OOB buffer
according current OOB layout so we need to follow it in the driver.

Signed-off-by: Arseniy Krasnov <avkrasnov@salutedevices.com>
---
 drivers/mtd/nand/raw/meson_nand.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/raw/meson_nand.c b/drivers/mtd/nand/raw/meson_nand.c
index 561d46d860b7..0d4d358152d7 100644
--- a/drivers/mtd/nand/raw/meson_nand.c
+++ b/drivers/mtd/nand/raw/meson_nand.c
@@ -510,7 +510,7 @@ static void meson_nfc_set_user_byte(struct nand_chip *nand, u8 *oob_buf)
 	__le64 *info;
 	int i, count;
 
-	for (i = 0, count = 0; i < nand->ecc.steps; i++, count += 2) {
+	for (i = 0, count = 0; i < nand->ecc.steps; i++, count += (2 + nand->ecc.bytes)) {
 		info = &meson_chip->info_buf[i];
 		*info |= oob_buf[count];
 		*info |= oob_buf[count + 1] << 8;
@@ -523,7 +523,7 @@ static void meson_nfc_get_user_byte(struct nand_chip *nand, u8 *oob_buf)
 	__le64 *info;
 	int i, count;
 
-	for (i = 0, count = 0; i < nand->ecc.steps; i++, count += 2) {
+	for (i = 0, count = 0; i < nand->ecc.steps; i++, count += (2 + nand->ecc.bytes)) {
 		info = &meson_chip->info_buf[i];
 		oob_buf[count] = *info;
 		oob_buf[count + 1] = *info >> 8;
-- 
2.35.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
