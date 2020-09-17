Return-Path: <SRS0=eAl4=C2=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5075CC43461
	for <linux-mtd@archiver.kernel.org>; Thu, 17 Sep 2020 07:53:49 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E35F221D7F
	for <linux-mtd@archiver.kernel.org>; Thu, 17 Sep 2020 07:53:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="fU/UrAXO";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="0BfBAY5Y"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E35F221D7F
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=wlmp/c3rSWfFiCSxuBhl7WjZFEUcwo+5j/cvJ1Y2U94=; b=fU/UrAXOTvjmp7wrbOYLWqB17
	q6Rn8kRCyzqkeRZwxm5vDOK67JLMJwb2mS2IqlpI8P8Yt8iIehszORJ4l2MFx7DG2XY1JZqZfvPeb
	WAH+ICmzjtosq90aSKsAKrPcO+v6A1DHjdwQWEp2b1oCPFdRtEPEFDmJLMmHrtPCX+w9byuge+tRd
	mgBheOkn5npi4tSOqi9d1pZyjVsS1hj9w4zRoKRDgz+hbrV4NIItTWi5UQ3wbvtVxFB4BDBpPet65
	tqZQK74T55eS3J+Y2ggQxUnOcF/LWZRmECbMRpekdyFkjavSqABCpeWRJyV56Bh/HIiZM5SdM17uP
	bWfG33IrQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kIojK-0002hn-7z; Thu, 17 Sep 2020 07:53:22 +0000
Received: from esa4.microchip.iphmx.com ([68.232.154.123])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kIoiz-0002Y9-55
 for linux-mtd@lists.infradead.org; Thu, 17 Sep 2020 07:53:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1600329181; x=1631865181;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=IrQd4UZiuChUOdIax3Fi7MBYLTIUT1giu8daJj3LQso=;
 b=0BfBAY5Ye+Wl3RcV5oK1wstAC/oyDttnRUY18zf6/hpNNvxd7zfxfFHx
 Tt8TAxWHMw1fCuyyQPJhqhmAAm/Sht5tdyLLBcLd1c4NizOcqHurOfAnd
 1Oaw9Aj5NVgISkJuNT5b4k1VvigczkFv5lZDlL0p5NKMG9BHYnM0YGIDX
 MFW12BaN8DnznqjHrgxPOPXpBd42aSFmsbvMIHX2tsr9vSiNh5i/34yCk
 j5FHGL8J3Jeu7BzXwdLLs/JKW982orNimUb8tdPIYgtAQhO63/z99AYbN
 kNOgLsIWgopm9JlSeWB7wKJjrUlu4sjFhjVr6Hk0jo/V2Zs5Ygvpwb4Cd w==;
IronPort-SDR: P8wRv+qE821JYXhYr7o71c0rpzN5b9CocPbCMtFP/0E/eATejwHfOV46yRgosOocBFoA+hm7et
 sMiMBbxVAjrTdt5lUQSd2ZWfV5yjLthO7+sNhMw/zxHmBS0UOCLnrNN4KPvuKdIbC2D9zU4Zrk
 nZmzUeDmtN8AhZxt2kuQ7JoqJnpQrbRurMwWRJP+5gKphi7D8QKa/rNxK+z5CbfS2Lteqt/UcU
 i/rZpXsfToUaYgo3ADEsnyU1FLaMKSRp5isJZS6ghC1gZOdiJbr+s/JgDdbZ+HzjatJh1c0IXm
 KP8=
X-IronPort-AV: E=Sophos;i="5.76,436,1592895600"; d="scan'208";a="87191519"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 17 Sep 2020 00:52:59 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Thu, 17 Sep 2020 00:52:27 -0700
Received: from atudor-ThinkPad-T470p.local (10.10.115.15) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.1979.3 via Frontend Transport; Thu, 17 Sep 2020 00:52:25 -0700
From: Tudor Ambarus <tudor.ambarus@microchip.com>
To: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
 <boris.brezillon@collabora.com>
Subject: [PATCH 3/3] mtd: rawnand: Don't overwrite the error code from
 nand_set_ecc_soft_ops()
Date: Thu, 17 Sep 2020 10:52:13 +0300
Message-ID: <20200917075213.532161-4-tudor.ambarus@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200917075213.532161-1-tudor.ambarus@microchip.com>
References: <20200917075213.532161-1-tudor.ambarus@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200917_035301_421880_BE5BA5FB 
X-CRM114-Status: UNSURE (   9.90  )
X-CRM114-Notice: Please train this message.
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
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, Tudor
 Ambarus <tudor.ambarus@microchip.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

The error code received from nand_set_ecc_soft_ops() was overwritten,
drop this redundant assignment and use the error code received from
the callee.

Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
---
 drivers/mtd/nand/raw/nand_base.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
index d3e0ca66382f..78feed59c8b5 100644
--- a/drivers/mtd/nand/raw/nand_base.c
+++ b/drivers/mtd/nand/raw/nand_base.c
@@ -5698,10 +5698,8 @@ static int nand_scan_tail(struct nand_chip *chip)
 
 	case NAND_ECC_ENGINE_TYPE_SOFT:
 		ret = nand_set_ecc_soft_ops(chip);
-		if (ret) {
-			ret = -EINVAL;
+		if (ret)
 			goto err_nand_manuf_cleanup;
-		}
 		break;
 
 	case NAND_ECC_ENGINE_TYPE_ON_DIE:
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
