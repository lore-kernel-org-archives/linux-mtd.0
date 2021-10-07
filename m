Return-Path: <SRS0=3zw0=O3=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7FA6C4332F
	for <linux-mtd@archiver.kernel.org>; Thu,  7 Oct 2021 12:15:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A9A7E6137F
	for <linux-mtd@archiver.kernel.org>; Thu,  7 Oct 2021 12:15:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A9A7E6137F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LsKK3Yh3AzrsDH97NLbbr7/tpzi1TaXB9yVLFGdtLzA=; b=tNRYfbUXqt8SHw
	W+skPhbZF7qWXEhEZ+s06bpnzonGNjDjh3MSrnE8NLuKpP6YVbL53vGeu8/3TfzBt2irr7/b6n6O+
	tEjNYnrhDcie6+12RGY0emWMpzL2GoCrIUhRS2z6JgKaq3HID1KYsFeFBy5PbVj1/SZQ7hxuXECT4
	PpitDJtZt0P0oALeUsRXnFo5LnCfgcmbrIvj2duempSyDyn3sxDVzws96y81AwFOdWtpSMOPs4D90
	gX3mPvkTjho7MuixRX3F/zvmK6GSlHY/6l0rXHvnW4vckQWXG1BC/i20nOSXN2HGrvqS/G6zfvtz1
	aG4h6mRFMTlXFw2qqPNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mYSII-00HDe5-6s; Thu, 07 Oct 2021 12:14:38 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mYSDJ-00HC1O-QF
 for linux-mtd@lists.infradead.org; Thu, 07 Oct 2021 12:09:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1633608569; x=1665144569;
 h=from:to:cc:subject:date:message-id;
 bh=7w27w8BwmpEXztoWO/m+fRD1rLpJNdh3W4ZaUKWsinE=;
 b=Sy5p4kLmldODLtIP+bZRNkPqoWnolXTNWAT8OFiKay9J4LfsWRj9zFj0
 juqnJCk80HorT0pxdA+v/7BkZw6oHrm2FuYcSxNrg62dzlGGsxjn+sf35
 WloquNCbsthfqd4fSKnuz6H3deteRTaiZDqs1Au3DHjhQw2Zs/OQYCHfJ
 cfcs6OpAs7wJiRV7WmP1nTjeOVY1RUr6EHwLw7zcChdSzvTPa6k7+nHY9
 g9E7hynC4h5PIOmp2MuUqg3OCi//aAiiFZqSWjJn8xQ2XRVuqT4mtlIwu
 OMAE/XvdZgOkJR76vwX6PP/FNKKbaTbQ2PJlMVxWzdAByUnNBPSv6NOjY w==;
X-IronPort-AV: E=Sophos;i="5.85,354,1624312800"; d="scan'208";a="19920238"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
 by mx1-pgp.tq-group.com with ESMTP; 07 Oct 2021 14:09:25 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
 by tq-pgp-pr1.tq-net.de (PGP Universal service);
 Thu, 07 Oct 2021 14:09:25 +0200
X-PGP-Universal: processed;
 by tq-pgp-pr1.tq-net.de on Thu, 07 Oct 2021 14:09:25 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1633608565; x=1665144565;
 h=from:to:cc:subject:date:message-id;
 bh=7w27w8BwmpEXztoWO/m+fRD1rLpJNdh3W4ZaUKWsinE=;
 b=RfgtTIe8JPr8Wr15X/N9m+bqWvC6SlFrscrTRU1FeCxRJla/ZBO6PdJU
 ya/RWtwOGVMljgJuxQxAl/TT33BdAALmVc6qPksVfIVJGoFL8kLCDWfMo
 fVn7rMJBl2ltQPouNqhd0+G912OgtTaZgb/a2KTfuta4eJZjDBU159D91
 LSRDo5Ts0cGKn1GA1NK5Krndtkb3vJ3q41Rg4cxwCN5EcBaJqobhRyqSn
 jDxUsHqaVE6OOwvJNvTNLP88BkYovlGhdID5JlY0z8WHnkubbsSBPZ1WP
 ZwVnyeB7or0Kzgt5C7IQ4BSAJBTVWlRbdQZXWyHpD5sVaA/f5cwAWqFFa g==;
X-IronPort-AV: E=Sophos;i="5.85,354,1624312800"; d="scan'208";a="19920237"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
 by mx1.tq-group.com with ESMTP; 07 Oct 2021 14:09:25 +0200
Received: from schifferm-ubuntu4.tq-net.de (schifferm-ubuntu4.tq-net.de
 [10.121.48.12])
 by vtuxmail01.tq-net.de (Postfix) with ESMTPA id 0DE61280075;
 Thu,  7 Oct 2021 14:09:25 +0200 (CEST)
From: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
To: Tudor Ambarus <tudor.ambarus@microchip.com>,
 Michael Walle <michael@walle.cc>, Pratyush Yadav <p.yadav@ti.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
Subject: [PATCH v2 2/2] mtd: spi-nor: micron-st: add support for mt25ql01g and
 mt25qu01g
Date: Thu,  7 Oct 2021 14:08:12 +0200
Message-Id: <c347908fd453fadf673000144cdbdf63c51db303.1633607826.git.matthias.schiffer@ew.tq-group.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <a69181ccf225424a8bd11349aad0df7face9715e.1633607826.git.matthias.schiffer@ew.tq-group.com>
References: <a69181ccf225424a8bd11349aad0df7face9715e.1633607826.git.matthias.schiffer@ew.tq-group.com>
In-Reply-To: <a69181ccf225424a8bd11349aad0df7face9715e.1633607826.git.matthias.schiffer@ew.tq-group.com>
References: <a69181ccf225424a8bd11349aad0df7face9715e.1633607826.git.matthias.schiffer@ew.tq-group.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211007_050930_201174_75AE5C97 
X-CRM114-Status: GOOD (  10.87  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Split these mt25q models from the older n25q models by matching their
extended IDs to allow adding support for 4byte opcodes.

Signed-off-by: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
---

v2: add NO_CHIP_ERASE

 drivers/mtd/spi-nor/micron-st.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/mtd/spi-nor/micron-st.c b/drivers/mtd/spi-nor/micron-st.c
index a000a0790ecd..6593b6ebe0da 100644
--- a/drivers/mtd/spi-nor/micron-st.c
+++ b/drivers/mtd/spi-nor/micron-st.c
@@ -172,11 +172,19 @@ static const struct flash_info st_parts[] = {
 			      SECT_4K | USE_FSR | SPI_NOR_QUAD_READ |
 			      SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB |
 			      SPI_NOR_4BIT_BP | SPI_NOR_BP3_SR_BIT6) },
+	{ "mt25ql01g",   INFO6(0x20ba21, 0x104400, 64 * 1024, 2048,
+			       SECT_4K | USE_FSR | SPI_NOR_DUAL_READ |
+			       SPI_NOR_QUAD_READ | SPI_NOR_4B_OPCODES |
+			       NO_CHIP_ERASE) },
 	{ "n25q00",      INFO(0x20ba21, 0, 64 * 1024, 2048,
 			      SECT_4K | USE_FSR | SPI_NOR_QUAD_READ |
 			      SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB |
 			      SPI_NOR_4BIT_BP | SPI_NOR_BP3_SR_BIT6 |
 			      NO_CHIP_ERASE) },
+	{ "mt25qu01g",   INFO6(0x20bb21, 0x104400, 64 * 1024, 2048,
+			       SECT_4K | USE_FSR | SPI_NOR_DUAL_READ |
+			       SPI_NOR_QUAD_READ | SPI_NOR_4B_OPCODES |
+			       NO_CHIP_ERASE) },
 	{ "n25q00a",     INFO(0x20bb21, 0, 64 * 1024, 2048,
 			      SECT_4K | USE_FSR | SPI_NOR_QUAD_READ |
 			      NO_CHIP_ERASE) },
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
