Return-Path: <SRS0=PNEu=GI=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49DFFC4332B
	for <linux-mtd@archiver.kernel.org>; Tue,  5 Jan 2021 14:05:41 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F0B6822B2C
	for <linux-mtd@archiver.kernel.org>; Tue,  5 Jan 2021 14:05:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F0B6822B2C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:To:From:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=603LUKlnaWJWzmQFVThQPcaWL7bcUS0db1GlIZAo9FU=; b=lljzfQM8jxe6YJ6sowqw8mG5gB
	xYP2FeYCROtnBeyLAWNc5FU9TMDw30Rk+c7YkDrs2nZ1rchWklEebLiMfhZNR6HSe0C6rvURD+h34
	NJONhfRo9WDVe1ZMl143kau6Cpiot7Dj0mgx4OEx4TnhkskX6NCsyvPy6zx8qKH4lVduIzLIaY16d
	OGVS+GD6197NXQxPsevGqL3+t+RpVb8fLamhznc/kjBJRdIY6mHaDlD4MZiWwbltTgT5wFxmQlvwT
	VLIAend5Ze85/gtinTZTex+KWEVHe6wuapF5dfqNn5dVuXG3SqEg8GmrU6oQFf206CrwrygbTXYWc
	iKY/JQ6Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kwmw4-0002SM-LM; Tue, 05 Jan 2021 14:03:44 +0000
Received: from mx2.suse.de ([195.135.220.15])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kwmw2-0002RI-7U
 for linux-mtd@lists.infradead.org; Tue, 05 Jan 2021 14:03:42 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 34C54AD57;
 Tue,  5 Jan 2021 14:03:41 +0000 (UTC)
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Matt Mackall <mpm@selenic.com>, Herbert Xu <herbert@gondor.apana.org.au>,
 Dan Williams <dan.j.williams@intel.com>, Vinod Koul <vkoul@kernel.org>,
 "David S. Miller" <davem@davemloft.net>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Jakub Kicinski <kuba@kernel.org>, Alessandro Zummo <a.zummo@towertech.it>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Mark Brown <broonie@kernel.org>, Wim Van Sebroeck <wim@linux-watchdog.org>,
 Guenter Roeck <linux@roeck-us.net>, Liam Girdwood <lgirdwood@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-crypto@vger.kernel.org, dmaengine@vger.kernel.org,
 linux-ide@vger.kernel.org, linux-mtd@lists.infradead.org,
 netdev@vger.kernel.org, linux-rtc@vger.kernel.org,
 linux-spi@vger.kernel.org, linux-watchdog@vger.kernel.org,
 alsa-devel@alsa-project.org
Subject: [PATCH 02/10] net: tc35815: Drop support for TX49XX boards
Date: Tue,  5 Jan 2021 15:02:47 +0100
Message-Id: <20210105140305.141401-3-tsbogend@alpha.franken.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210105140305.141401-1-tsbogend@alpha.franken.de>
References: <20210105140305.141401-1-tsbogend@alpha.franken.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210105_090342_386662_D7973AB9 
X-CRM114-Status: GOOD (  16.26  )
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

CPU support for TX49xx is getting removed, so remove support in network
drivers for it.

Signed-off-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
---
 drivers/net/ethernet/toshiba/tc35815.c | 29 --------------------------
 1 file changed, 29 deletions(-)

diff --git a/drivers/net/ethernet/toshiba/tc35815.c b/drivers/net/ethernet/toshiba/tc35815.c
index 7a6e5ff8e5d4..d4712cd2e28c 100644
--- a/drivers/net/ethernet/toshiba/tc35815.c
+++ b/drivers/net/ethernet/toshiba/tc35815.c
@@ -687,39 +687,10 @@ static int tc_mii_init(struct net_device *dev)
 	return err;
 }
 
-#ifdef CONFIG_CPU_TX49XX
-/*
- * Find a platform_device providing a MAC address.  The platform code
- * should provide a "tc35815-mac" device with a MAC address in its
- * platform_data.
- */
-static int tc35815_mac_match(struct device *dev, const void *data)
-{
-	struct platform_device *plat_dev = to_platform_device(dev);
-	const struct pci_dev *pci_dev = data;
-	unsigned int id = pci_dev->irq;
-	return !strcmp(plat_dev->name, "tc35815-mac") && plat_dev->id == id;
-}
-
 static int tc35815_read_plat_dev_addr(struct net_device *dev)
 {
-	struct tc35815_local *lp = netdev_priv(dev);
-	struct device *pd = bus_find_device(&platform_bus_type, NULL,
-					    lp->pci_dev, tc35815_mac_match);
-	if (pd) {
-		if (pd->platform_data)
-			memcpy(dev->dev_addr, pd->platform_data, ETH_ALEN);
-		put_device(pd);
-		return is_valid_ether_addr(dev->dev_addr) ? 0 : -ENODEV;
-	}
 	return -ENODEV;
 }
-#else
-static int tc35815_read_plat_dev_addr(struct net_device *dev)
-{
-	return -ENODEV;
-}
-#endif
 
 static int tc35815_init_dev_addr(struct net_device *dev)
 {
-- 
2.29.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
