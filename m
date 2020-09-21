Return-Path: <SRS0=HVA7=C6=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 177E3C4346E
	for <linux-mtd@archiver.kernel.org>; Mon, 21 Sep 2020 18:49:17 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2F2DB20888
	for <linux-mtd@archiver.kernel.org>; Mon, 21 Sep 2020 18:49:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Z9Rb/kHI";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=linux-ipv6.be header.i=@linux-ipv6.be header.b="pVoHugoQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2F2DB20888
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-ipv6.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=MK34HldYp42/HXv9P4rd2eYapCDL5wAE7LOXy5a4O7A=; b=Z9Rb/kHIMQuGYfxGNzLQ52S5xT
	U6ZA0uIz/pPbrKGLS3FCvKugjfT1JIZUcPVdTAGzscnh6X8Qjq87Urb7p69gwNIO0DF2uLJ44X6E6
	7EHTTcurdnpcon8zyoJlf+qdELCHwCfIoWwMeLl2qBIzCNrW0Wq7Ot6t0gKBNFPVJ8GU5hqDT6v9A
	I5dXxCDOJ70CB8mpFHoPsl+67JiANJktf4IXh/ud0WqGUevOuwI8b9z+prjxaOHetvHKgoKT1kFAZ
	VazJdAEWqpVfYXDpj5pDos4ZU8vRqRgZB/EndCIZI4mo8iwg4mrjmRNjLvZsI7+7xkUMLu3kQqRNB
	HzR2dcDA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kKQrF-0005C3-MH; Mon, 21 Sep 2020 18:48:13 +0000
Received: from mail.tintel.eu ([51.83.127.189])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kKQrC-0005B1-KF
 for linux-mtd@lists.infradead.org; Mon, 21 Sep 2020 18:48:11 +0000
Received: from localhost (localhost [IPv6:::1])
 by mail.tintel.eu (Postfix) with ESMTP id 896874777E2E;
 Mon, 21 Sep 2020 20:47:55 +0200 (CEST)
Received: from mail.tintel.eu ([IPv6:::1])
 by localhost (mail.tintel.eu [IPv6:::1]) (amavisd-new, port 10032)
 with ESMTP id 6eH8s8PrWEg1; Mon, 21 Sep 2020 20:47:55 +0200 (CEST)
Received: from localhost (localhost [IPv6:::1])
 by mail.tintel.eu (Postfix) with ESMTP id 210FE4777E45;
 Mon, 21 Sep 2020 20:47:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.tintel.eu 210FE4777E45
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux-ipv6.be;
 s=502B7754-045F-11E5-BBC5-64595FD46BE8; t=1600714075;
 bh=L58tvF/hn4CJ4xOfEGy9g52xCceYrUQ22cqTOFtIZ1Y=;
 h=From:To:Date:Message-Id:MIME-Version;
 b=pVoHugoQO7H5sjEgTLDaIWIOfI+uPaagjMW8RE6M+H7r6xcwlbBK3s4bfCPuRbvdl
 1JMQuXhnoh6rOZVQo2z0WER49KlhN8kFHaF70NtoUp2BCTb96frt2sxF5GAiyaI11J
 b//OG3RyKDIJiv0dvKUYdv3E1nfPHQFRpU6ZfvYw=
X-Virus-Scanned: amavisd-new at mail.tintel.eu
Received: from mail.tintel.eu ([IPv6:::1])
 by localhost (mail.tintel.eu [IPv6:::1]) (amavisd-new, port 10026)
 with ESMTP id 017JgK4jn9-e; Mon, 21 Sep 2020 20:47:55 +0200 (CEST)
Received: from taz.sof.bg.adlevio.net (unknown
 [IPv6:2001:67c:21bc:20:52bf:b29c:6e1e:7c70])
 by mail.tintel.eu (Postfix) with SMTP id 9EC254777E2E;
 Mon, 21 Sep 2020 20:47:54 +0200 (CEST)
Received: (nullmailer pid 4010117 invoked by uid 1000);
 Mon, 21 Sep 2020 18:47:54 -0000
From: Stijn Tintel <stijn@linux-ipv6.be>
To: tudor.ambarus@microchip.com, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com, linux-mtd@lists.infradead.org
Subject: [PATCH] mtd: spi-nor: gigadevice: add GD25LQ80C
Date: Mon, 21 Sep 2020 21:47:54 +0300
Message-Id: <20200921184754.4010068-1-stijn@linux-ipv6.be>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-Rspamd-Queue-Id: 9EC254777E2E
X-Spamd-Result: default: False [0.00 / 15.00];
 ASN(0.00)[asn:200533, ipnet:2001:67c:21bc::/48, country:BG];
 IP_WHITELIST(0.00)[2001:67c:21bc:20:52bf:b29c:6e1e:7c70]
X-Rspamd-Server: skulls
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200921_144810_777845_01935C22 
X-CRM114-Status: UNSURE (   8.97  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Tested on a TP-Link OC200.

Datasheet: https://www.gigadevice.com/datasheet/gd25lq80c/

Signed-off-by: Stijn Tintel <stijn@linux-ipv6.be>
---
 drivers/mtd/spi-nor/gigadevice.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/mtd/spi-nor/gigadevice.c b/drivers/mtd/spi-nor/gigadevice.c
index 447d84bb2128..840fa9f90a67 100644
--- a/drivers/mtd/spi-nor/gigadevice.c
+++ b/drivers/mtd/spi-nor/gigadevice.c
@@ -24,6 +24,9 @@ static struct spi_nor_fixups gd25q256_fixups = {
 };
 
 static const struct flash_info gigadevice_parts[] = {
+	{ "gd25lq80c", INFO(0xc86014, 0, 64 * 1024, 16,
+			   SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
+			   SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB) },
 	{ "gd25q16", INFO(0xc84015, 0, 64 * 1024,  32,
 			  SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
 			  SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB) },
-- 
2.26.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
