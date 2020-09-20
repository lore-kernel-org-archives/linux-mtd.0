Return-Path: <SRS0=3Hr+=C5=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F2F4C43468
	for <linux-mtd@archiver.kernel.org>; Sun, 20 Sep 2020 09:59:00 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CD52B20866
	for <linux-mtd@archiver.kernel.org>; Sun, 20 Sep 2020 09:58:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="SgFAC+He";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="omRBhwAp"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CD52B20866
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=NrsBWkGxcFxn54X8t6qt68a2oMXDKri5DhBBpqLjs5A=; b=SgFAC+HeNFKiMLN7aoRkxuZeA
	A0mUjD5+P4XOqw9ryFh4Xx+Swx39ORGfvVpdwoHLFi8xmUv7DTvMHKtfJTbkoCNevbnceK2WdZRlK
	NvwhfEpBCBVfsbTIWcMMccM51KljbwIvOJNPWNgU04g9CLN0k7wQnZirLTRGnrxpDLQt0Fy1Fk5n3
	DhNNHLuuS6o8pkMEBQLAU+g3CV1GrIraU/NApFlh6n9o7cPr6+ApopwdXfHthpdH9anPUGkTwLrm0
	t9d00YHzXDMbkd/w/3jjf1LkhdW2rnqU9PxArEm7A7e2FaO5ch5a+sSzYrupBCA+RK8CHyU3+v4N9
	xO8L65hZQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kJw6Y-0006r1-Pz; Sun, 20 Sep 2020 09:57:58 +0000
Received: from mail-qk1-x741.google.com ([2607:f8b0:4864:20::741])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kJw6W-0006pm-8n
 for linux-mtd@lists.infradead.org; Sun, 20 Sep 2020 09:57:57 +0000
Received: by mail-qk1-x741.google.com with SMTP id g72so11857032qke.8
 for <linux-mtd@lists.infradead.org>; Sun, 20 Sep 2020 02:57:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=oGhCCUnRTCTino/zuu9ojrWRDplSxRK5bulENX/nsFs=;
 b=omRBhwApoblQetaK6wIvFMaoNbcKwE3aCrPmkQeTb6VQCcpOrBOB417EIFL4Oyr74e
 pokAqHPb8h2zWULiXuciV+de2+Mc+b9MEtIUx+57Qi7xQyYbsCab64DDMnQzykB9Iyu5
 w87ieJOYwn5g7RPFfPunQhQOcz3Gpv0Y+ppRP36wKDg8oenvP3f7J+Q1OatClKvxbYVP
 iFEUKAhVDbOSXDsqwGyvQ1/4UEHTuR5R1Sfa21IWovwpVCtYVVFvGB0Q/v30fYhyHuVI
 GGLhc89b+QP/NZTZwOD695n857m6u3OprVKfPJv5cqMBqEDPOuKgTZUQY6olaIvniv0Y
 KnQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=oGhCCUnRTCTino/zuu9ojrWRDplSxRK5bulENX/nsFs=;
 b=YbxqOfqLltXzqiVnsIW6D836e2SG6/sCtYnPvJ7Q+CAu33zUZLVn3TjhRAgqIhvh5K
 K8E0lhUjW8wmwC03ghOp6CoWN1Oc8VA/Sfe65J1zyuvL6k00ryDCFamkCiNyWpX1GT9s
 p93rdr0uejmrdC4STSV6UtzSWOxPhlgHlWvOJfPCZDojmHFFvq5YiDvedyNS270qkfMD
 41d/k7l6b7AlK/OtkEh0wyIwkxFxQuWONGT5/b0VbLTEYMKJmdLC0iAfm/7v2wvVP+7L
 MPZpuiLW5q9gMXUEOaNTc0pqIA0gukWn86BepQ4/JMmst+14rLx/0VtFMBsDga/EAMKv
 sNlQ==
X-Gm-Message-State: AOAM533TVwmVF49XZ6H1wk2a91C9KcOLxUbOuY6cjXFchEUDzP1hiayG
 fc+k7MYaAqmNzjt8NrCJlnc=
X-Google-Smtp-Source: ABdhPJwKlT3juwz36GeTH9mGGeYK75lJ/GPbrCMq4l3fs1llud3zEd+zx6EVDbFkaIP63Z7MLItNnw==
X-Received: by 2002:a05:620a:145:: with SMTP id
 e5mr39899279qkn.479.1600595874343; 
 Sun, 20 Sep 2020 02:57:54 -0700 (PDT)
Received: from Ansuel-XPS.localdomain (93-39-149-95.ip76.fastwebnet.it.
 [93.39.149.95])
 by smtp.googlemail.com with ESMTPSA id w6sm6968323qti.63.2020.09.20.02.57.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Sep 2020 02:57:53 -0700 (PDT)
From: Ansuel Smith <ansuelsmth@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH v3 3/4] of_net: add mac-address-increment support
Date: Sun, 20 Sep 2020 11:57:21 +0200
Message-Id: <20200920095724.8251-4-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200920095724.8251-1-ansuelsmth@gmail.com>
References: <20200920095724.8251-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200920_055756_365717_253102B4 
X-CRM114-Status: GOOD (  22.18  )
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
 drivers/of/of_net.c | 57 ++++++++++++++++++++++++++++++++++-----------
 1 file changed, 44 insertions(+), 13 deletions(-)

diff --git a/drivers/of/of_net.c b/drivers/of/of_net.c
index 6e411821583e..bafbc833e659 100644
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
-	const void *mac;
+	void *mac;
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
@@ -98,24 +103,50 @@ static const void *of_get_mac_addr_nvmem(struct device_node *np)
  * this case, the real MAC is in 'local-mac-address', and 'mac-address' exists
  * but is all zeros.
  *
+ * DT can tell the system to increment the mac-address after is extracted by
+ * using:
+ * - mac-address-increment-byte to decide what byte to increase
+ *   (if not defined is increased the last byte)
+ * - mac-address-increment to decide how much to increase. The value will
+ *   not overflow to other bytes if the increment is over 255.
+ *   (example 00:01:02:03:04:ff + 1 == 00:01:02:03:04:00)
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
+	if (inc_idx < 3 || inc_idx > 5)
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
