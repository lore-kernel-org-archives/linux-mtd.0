Return-Path: <SRS0=QbZc=CZ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95D91C43461
	for <linux-mtd@archiver.kernel.org>; Wed, 16 Sep 2020 19:42:21 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 10F73208E4
	for <linux-mtd@archiver.kernel.org>; Wed, 16 Sep 2020 19:42:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="wskn1u0i"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 10F73208E4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=ispras.ru
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=cxcQHtHel7SFmVIwsdyF75/TyJtSKrU+JylRDcSgHRc=; b=wskn1u0ivBp0H99gDlifd/ZrFw
	OXzLiJLUnvj87511qd/N5rBUq72HLcttHW11FCjExwgh4UUD4wfIReH37VpbHFHXD07DUmjy39I+y
	tgrdYAexyz0iV/L7iOTAkLdHuf+BZxQQTw40cmVRti6n5kEJit6bd5MOyZ27KK/MZlL+ZB5fm6CoV
	KIGHQrvRB+hsr3H0UgI/my34dY2Oc4orDURu3p0tnnnjB5UlthKS6hWkBra09vsX8W5KQqF5Z6h1y
	dmZE9o+8wfWe/sRNWjsJS84BYwXDUBVDCGGAty56+Kn8iVHxrDZ7hSugf8IzINru2CVnn7hrTIIhs
	pUlzVxzw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kIdIv-0002YA-JH; Wed, 16 Sep 2020 19:41:21 +0000
Received: from mail.ispras.ru ([83.149.199.84])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kIdIp-0002WB-9q; Wed, 16 Sep 2020 19:41:16 +0000
Received: from hellwig.intra.ispras.ru (unknown [10.10.2.182])
 by mail.ispras.ru (Postfix) with ESMTPS id 0F47A40D403E;
 Wed, 16 Sep 2020 19:41:10 +0000 (UTC)
From: Evgeny Novikov <novikov@ispras.ru>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH] mtd: rawnand: mtk: avoid underflow in mtk_nfc_nand_chip_init()
Date: Wed, 16 Sep 2020 22:40:45 +0300
Message-Id: <20200916194045.6378-1-novikov@ispras.ru>
X-Mailer: git-send-email 2.16.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200916_154115_480066_7AE2DEA1 
X-CRM114-Status: GOOD (  11.79  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: ldv-project@linuxtesting.org, Vignesh Raghavendra <vigneshr@ti.com>,
 "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
 Evgeny Novikov <novikov@ispras.ru>, Richard Weinberger <richard@nod.at>,
 linux-kernel@vger.kernel.org, Stephen Boyd <swboyd@chromium.org>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Boris Brezillon <boris.brezillon@collabora.com>, linux-mtd@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

If of_get_property() will set nsels to negative values the driver may
allocate insufficient memory for chip. Moreover, there may be underflow
for devm_kzalloc(). This can result in various bad consequences later.
The patch causes mtk_nfc_nand_chip_init() to fail for negative values of
nsels.

Found by Linux Driver Verification project (linuxtesting.org).

Signed-off-by: Evgeny Novikov <novikov@ispras.ru>
---
 drivers/mtd/nand/raw/mtk_nand.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/mtk_nand.c b/drivers/mtd/nand/raw/mtk_nand.c
index ad1b55dab211..df98a2eec240 100644
--- a/drivers/mtd/nand/raw/mtk_nand.c
+++ b/drivers/mtd/nand/raw/mtk_nand.c
@@ -1376,7 +1376,7 @@ static int mtk_nfc_nand_chip_init(struct device *dev, struct mtk_nfc *nfc,
 		return -ENODEV;
 
 	nsels /= sizeof(u32);
-	if (!nsels || nsels > MTK_NAND_MAX_NSELS) {
+	if (nsels <= 0 || nsels > MTK_NAND_MAX_NSELS) {
 		dev_err(dev, "invalid reg property size %d\n", nsels);
 		return -EINVAL;
 	}
-- 
2.26.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
