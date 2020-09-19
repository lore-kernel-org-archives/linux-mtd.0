Return-Path: <SRS0=MJr3=C4=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9528FC43463
	for <linux-mtd@archiver.kernel.org>; Sat, 19 Sep 2020 22:31:40 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4C3D120E65
	for <linux-mtd@archiver.kernel.org>; Sat, 19 Sep 2020 22:31:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="GbGRT0pG";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oZQRGbmZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4C3D120E65
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=CduxL7fTSO4Mmj9b+rYzUmNSq8ldsFVl0cbP7T5SvEs=; b=GbGRT0pGE25oj2poqYZedIbCN
	WQI7BiXoIFm/8p8VVQpq59Ijmx2wxUIpvQ52/gVaOBSx/Ezr3kmWae98v0biX0caAMx8tb5JcAFmF
	ECWPzr3lwfbkIAd0ADdlE3/EtSiD/I8TJrvyevFGfBbhg0brrcGRd4vEHLNN2Wwy4ulgbQCAm8Zc0
	2EYFIPny37Q511z954DXmsawIiKyJfsKDCEvE16A37To40ePzFs0b3IHB4pfm131kxiaKaZlTlPSE
	vswQj7Pk0nLabCrD6LRCeBldjani4y+lwjrejxO9ZNVHbneQHNmSe1flg8aOBb0XvnSzyXgM67uk4
	9SdZR53/w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kJlNq-0004Zz-Kx; Sat, 19 Sep 2020 22:31:06 +0000
Received: from mail-qk1-x742.google.com ([2607:f8b0:4864:20::742])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kJlNo-0004Yj-0U
 for linux-mtd@lists.infradead.org; Sat, 19 Sep 2020 22:31:04 +0000
Received: by mail-qk1-x742.google.com with SMTP id d20so10889798qka.5
 for <linux-mtd@lists.infradead.org>; Sat, 19 Sep 2020 15:31:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=k1VC0bLlr113eP4lGbVnwgieBOJkCTeFf8AM/n1gCow=;
 b=oZQRGbmZNIP8xDhXxJXwaTHJ6TcfISf9HwgXXIBR6DVh+PJJWuz4+zS3vF+mv09p/k
 dWXDWjyj8OxpIkMTs4q7d/u4ChjoMpK0IQItLzWJLPJUW4GacQh3+CBqoAlY+XRHEKXM
 Hg8TMPy0//QJk2KfPPfYOXW9ZPyjOiJG767+7rddNrhGhiL33hu8d0mivBq8bAgrX4DA
 FiLr3BI0b+xLGdqp1g4VJTamg1PmqcHORbHWFAlYd8CHz/vieWUhVS54/SiT2ZYC+54T
 OWCP2WTWZKJ5n4fbhNqTMXzVDQQld2zosW5/MO3Cjj6GL1HmHrRt2W0XZpVXSrXPd54v
 bAlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=k1VC0bLlr113eP4lGbVnwgieBOJkCTeFf8AM/n1gCow=;
 b=aU9Z9dY4p3B4Q1GEim4VuAskLpCNJoMUkB5JHHOhv8LmKKWjz0X0gjXSUjCnsoj+Un
 Qg39gT/CNudRbPAVEr+CebVevcBoYRuHK2VGx9DpdObvnZ+y3kainYxq0MSSSzkph+B+
 4gEC4HA1SRLIG1e3E381G+A2PAAJzXI83fUHZmRpB2pLoQ6Ao/gTxY0lPjau6Bxv7Zp3
 hXDAlTRKIs6aoRs5RkfYat6Q80y8Owo+ZoADiI+mTwtzNtrEuooa1I9N9NxBblcshtuL
 lprrrwQ1YjrgzbzK/QTGWi4oTseleRJGXbofxc2POXqT+u+waZzx3x35H2JYE7xchT7x
 cmuA==
X-Gm-Message-State: AOAM5336WzwIWKuGNxuLLhi53VtYqGu1KTpcUp7h01KHbDpDOyw9YE/t
 r4488DTWamk9eBy7yscwdgk=
X-Google-Smtp-Source: ABdhPJxJXbn9HdM+MNqZCyPh8BZb9Hy6VajZ2BR5r+QbZYC7YHCD81iTR8ZRs+LEUGggk18nm5j/Wg==
X-Received: by 2002:a37:51d5:: with SMTP id
 f204mr38304587qkb.145.1600554662256; 
 Sat, 19 Sep 2020 15:31:02 -0700 (PDT)
Received: from Ansuel-XPS.localdomain (93-39-149-95.ip76.fastwebnet.it.
 [93.39.149.95])
 by smtp.googlemail.com with ESMTPSA id f24sm2581139qkk.136.2020.09.19.15.30.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 19 Sep 2020 15:31:01 -0700 (PDT)
From: Ansuel Smith <ansuelsmth@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH v2 3/4] of_net: add mac-address-increment support
Date: Sun, 20 Sep 2020 00:30:22 +0200
Message-Id: <20200919223026.20803-4-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200919223026.20803-1-ansuelsmth@gmail.com>
References: <20200919223026.20803-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200919_183104_072405_E7C8651D 
X-CRM114-Status: GOOD (  22.54  )
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
Cc: Andrew Lunn <andrew@lunn.ch>, Vignesh Raghavendra <vigneshr@ti.com>,
 Boris Brezillon <bbrezillon@kernel.org>, Richard Weinberger <richard@nod.at>,
 Russell King <linux@armlinux.org.uk>, Ansuel Smith <ansuelsmth@gmail.com>,
 devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-mtd@lists.infradead.org, netdev@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>, Frank Rowand <frowand.list@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, linux-kernel@vger.kernel.org,
 Heiner Kallweit <hkallweit1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Lots of embedded devices use the mac-address of other interface
extracted from nvmem cells and increments it by one or two. Add two
bindings to integrate this and directly use the right mac-address for
the interface. Some example are some routers that use the gmac
mac-address stored in the art partition and increments it by one for the
wifi. mac-address-increment-byte bindings is used to tell what byte of
the mac-address has to be increased (if not defined the last byte is
increased) and mac-address-increment tells how much the byte decided
early has to be increased.

Signed-off-by: Ansuel Smith <ansuelsmth@gmail.com>
---
 drivers/of/of_net.c | 53 +++++++++++++++++++++++++++++++++++----------
 1 file changed, 41 insertions(+), 12 deletions(-)

diff --git a/drivers/of/of_net.c b/drivers/of/of_net.c
index 6e411821583e..171f5ea6f371 100644
--- a/drivers/of/of_net.c
+++ b/drivers/of/of_net.c
@@ -45,7 +45,7 @@ int of_get_phy_mode(struct device_node *np, phy_interface_t *interface)
 }
 EXPORT_SYMBOL_GPL(of_get_phy_mode);
 
-static const void *of_get_mac_addr(struct device_node *np, const char *name)
+static void *of_get_mac_addr(struct device_node *np, const char *name)
 {
 	struct property *pp = of_find_property(np, name, NULL);
 
@@ -54,26 +54,31 @@ static const void *of_get_mac_addr(struct device_node *np, const char *name)
 	return NULL;
 }
 
-static const void *of_get_mac_addr_nvmem(struct device_node *np)
+static void *of_get_mac_addr_nvmem(struct device_node *np, int *err)
 {
 	int ret;
 	const void *mac;
 	u8 nvmem_mac[ETH_ALEN];
 	struct platform_device *pdev = of_find_device_by_node(np);
 
-	if (!pdev)
-		return ERR_PTR(-ENODEV);
+	if (!pdev) {
+		*err = -ENODEV;
+		return NULL;
+	}
 
 	ret = nvmem_get_mac_address(&pdev->dev, &nvmem_mac);
 	if (ret) {
 		put_device(&pdev->dev);
-		return ERR_PTR(ret);
+		*err = ret;
+		return NULL;
 	}
 
 	mac = devm_kmemdup(&pdev->dev, nvmem_mac, ETH_ALEN, GFP_KERNEL);
 	put_device(&pdev->dev);
-	if (!mac)
-		return ERR_PTR(-ENOMEM);
+	if (!mac) {
+		*err = -ENOMEM;
+		return NULL;
+	}
 
 	return mac;
 }
@@ -98,24 +103,48 @@ static const void *of_get_mac_addr_nvmem(struct device_node *np)
  * this case, the real MAC is in 'local-mac-address', and 'mac-address' exists
  * but is all zeros.
  *
+ * DT can tell the system to increment the mac-address after is extracted by
+ * using:
+ * - mac-address-increment-byte to decide what byte to increase
+ *   (if not defined is increased the last byte)
+ * - mac-address-increment to decide how much to increase
+ *
  * Return: Will be a valid pointer on success and ERR_PTR in case of error.
 */
 const void *of_get_mac_address(struct device_node *np)
 {
-	const void *addr;
+	u32 inc_idx, mac_inc;
+	int ret = 0;
+	u8 *addr;
+
+	/* Check first if the increment byte is present and valid.
+	 * If not set assume to increment the last byte if found.
+	 */
+	if (of_property_read_u32(np, "mac-address-increment-byte", &inc_idx))
+		inc_idx = 5;
+	if (inc_idx > 5)
+		return ERR_PTR(-EINVAL);
 
 	addr = of_get_mac_addr(np, "mac-address");
 	if (addr)
-		return addr;
+		goto found;
 
 	addr = of_get_mac_addr(np, "local-mac-address");
 	if (addr)
-		return addr;
+		goto found;
 
 	addr = of_get_mac_addr(np, "address");
 	if (addr)
-		return addr;
+		goto found;
+
+	addr = of_get_mac_addr_nvmem(np, &ret);
+	if (ret)
+		return ERR_PTR(ret);
+
+found:
+	if (!of_property_read_u32(np, "mac-address-increment", &mac_inc))
+		addr[inc_idx] += mac_inc;
 
-	return of_get_mac_addr_nvmem(np);
+	return addr;
 }
 EXPORT_SYMBOL(of_get_mac_address);
-- 
2.27.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
