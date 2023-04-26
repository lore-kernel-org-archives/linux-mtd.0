Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D223FC77B78
	for <linux-mtd@archiver.kernel.org>; Wed, 26 Apr 2023 07:42:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vIYeM4Z/NICid3Gu1ImlfbAZaSF8bNDTinc+jCRzpn0=; b=q3Rpffy3p6NmHk
	CP2IbknpWOs6Ef1SiGgiaFmUVQTK4FgRDpjkyfdxKp+a12mWd+51Uvw5yXbufkQ1HHcMMFE7vsve2
	jKmgu9142Nyl+R+UHqTsFU1iPTfeKvF0Ve4yoA8B2nXE/Ws+TDI0TTnlAk2e3O1Nsxf+Eyl3/J9Mu
	Mh0xEM7pOJRnYAP+1SDECJOeauD0+UtheyCwzy8FJkmdcnFAmO7OmWAafDYqlCZ6CyjDrByq7M+oe
	6UUIXzFLqrm1UepntugS0T3ILvGeaAp3hVp9d5KDCzCYVoPv3dCcRxd36ntE9lHmfQwHlxetAJAve
	tpre2gvTR5WRyBSyM2BA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1prZmn-0034EZ-1O;
	Wed, 26 Apr 2023 07:41:57 +0000
Received: from mx.sberdevices.ru ([45.89.227.171])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1prZmG-0033qM-2a;
	Wed, 26 Apr 2023 07:41:26 +0000
Received: from s-lin-edge02.sberdevices.ru (localhost [127.0.0.1])
	by mx.sberdevices.ru (Postfix) with ESMTP id 6073F5FD6F;
	Wed, 26 Apr 2023 10:41:23 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
	s=mail; t=1682494883;
	bh=2gMo3+6yJgM1RhFv5pwf0HhZ2CqqzaenJjvpSBYPU1U=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=cVdGqoNPv6iHUtqd8oaNXO4U5yhqS+mPEh7Oo/BPDBwzFUrp6ccrxFtVtXJSrycuL
	 xrolozu6/KlN2+Gt01fzBhEfSaXtoHGu6dJl+zDOFxOxF687hYMpr8cJjI5MijHW9h
	 c/BFMuNthBV98PYG84bkK1sZi9RsZS541Fer7W0bRMs9UfHr9ozmMfoR46hIdioOE5
	 JipYeSaVdJ/orpgYV7kD96znwu0NmHhhKKjf6E45ileKOOF5QgbojKdtmOh59QbEO+
	 FqhtXT1vvcLYBCcaVeP1lHQvBxYkFBy9uV9pGtGYk+UABWPOBf3u17ZTlHKThsh7Vy
	 AvB5SAWlzIbPg==
Received: from S-MS-EXCH01.sberdevices.ru (S-MS-EXCH01.sberdevices.ru [172.16.1.4])
	by mx.sberdevices.ru (Postfix) with ESMTP;
	Wed, 26 Apr 2023 10:41:23 +0300 (MSK)
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
Subject: [PATCH v2 5/5] mtd: rawnand: meson: rename node for chip select
Date: Wed, 26 Apr 2023 10:36:31 +0300
Message-ID: <20230426073632.3905682-6-AVKrasnov@sberdevices.ru>
X-Mailer: git-send-email 2.35.0
In-Reply-To: <20230426073632.3905682-1-AVKrasnov@sberdevices.ru>
References: <20230426073632.3905682-1-AVKrasnov@sberdevices.ru>
MIME-Version: 1.0
X-Originating-IP: [172.16.1.6]
X-ClientProxiedBy: S-MS-EXCH02.sberdevices.ru (172.16.1.5) To
 S-MS-EXCH01.sberdevices.ru (172.16.1.4)
X-KSMG-Rule-ID: 4
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Status: not scanned, disabled by settings
X-KSMG-AntiSpam-Interceptor-Info: not scanned
X-KSMG-AntiPhishing: not scanned, disabled by settings
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 1.1.2.30, bases: 2023/04/26 04:45:00 #21166225
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230426_004125_192628_42D0D101 
X-CRM114-Status: GOOD (  12.51  )
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

This renames node with values for chip select from "reg" to "cs". It is
needed because when OTP access is enabled on the attached storage, MTD
subsystem registers this storage in the NVMEM subsystem. NVMEM in turn
tries to use "reg" node in its own manner, supposes that it has another
layout. All of this leads to device initialization failure.

Example:

[...] nvmem mtd0-user-otp: nvmem: invalid reg on /soc/bus@ffe00000/...
[...] mtd mtd0: Failed to register OTP NVMEM device
[...] meson-nand ffe07800.nfc: failed to register MTD device: -22
[...] meson-nand ffe07800.nfc: failed to init NAND chips
[...] meson-nand: probe of ffe07800.nfc failed with error -22

Signed-off-by: Arseniy Krasnov <AVKrasnov@sberdevices.ru>
---
 drivers/mtd/nand/raw/meson_nand.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/raw/meson_nand.c b/drivers/mtd/nand/raw/meson_nand.c
index 3737024c33d6..4ff3a3e50c4b 100644
--- a/drivers/mtd/nand/raw/meson_nand.c
+++ b/drivers/mtd/nand/raw/meson_nand.c
@@ -1537,7 +1537,7 @@ meson_nfc_nand_chip_init(struct device *dev,
 	int ret, i;
 	u32 tmp, nsels;
 
-	nsels = of_property_count_elems_of_size(np, "reg", sizeof(u32));
+	nsels = of_property_count_elems_of_size(np, "cs", sizeof(u32));
 	if (!nsels || nsels > MAX_CE_NUM) {
 		dev_err(dev, "invalid register property size\n");
 		return -EINVAL;
@@ -1551,7 +1551,7 @@ meson_nfc_nand_chip_init(struct device *dev,
 	meson_chip->nsels = nsels;
 
 	for (i = 0; i < nsels; i++) {
-		ret = of_property_read_u32_index(np, "reg", i, &tmp);
+		ret = of_property_read_u32_index(np, "cs", i, &tmp);
 		if (ret) {
 			dev_err(dev, "could not retrieve register property: %d\n",
 				ret);
-- 
2.35.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
