Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EECA606A31B
	for <linux-mtd@archiver.kernel.org>; Thu,  5 Nov 2026 18:58:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=QTOxIG85;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=fmV+1yUJ;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Gc+xyCYn
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=9alQXdI4AAMJg2BBDLgyS1sxDVD7Pl2a8A1XzD/thgg=; b=QTOxIG85N3hFxLji9YdbXbWmtm
	uRYFTrtau/0kynXcNf4y9oxnM/Gjuh+08hbI6UKAvlRefYB3qAwxgN/uQmayLPsvp9ckd/2hfcUhV
	bUK2hAvp3oknBIOvyn0IQjLtbIBPiN3trcvJGVzjxwnP9IQ6COEdupGAWg77HKiDvcMrlKizeiTAQ
	X1vMVDw6phoKbwWWM7WhvzzdXKWn+M9ZNOnBrEYg3sP1No2gwJ0NAMUeLYYPeBaY/jGXIGOvGHJXw
	i4Wki+SWAmaLwoi7hJdeHN9/bQXLifUfmCks2v05ENF75/dxpujMi8P3LsTIp6lIVFUuHCSSFSixg
	A9Dx7BQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP2fl-0000000AFAh-387r;
	Thu, 05 Nov 2026 18:58:53 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP2d4-0000000ADXk-0CxL
	for linux-mtd@bombadil.infradead.org;
	Thu, 05 Nov 2026 18:56:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=0o9Q25n23ckZBCXpljiM9GoL2XJxqzEiWbXDgW42slQ=; b=fmV+1yUJORFdc8Wxn52sit6o2R
	gBwQOUu9dYEk35APSssKAsW6keLx7V2oAQGZFKfgDN/1ieCVF+ZrjSVTSmZuQwKbSUrbZdmqOVCE+
	AYOuxKNQOqsl1YW9akT5Vwk+8b7uaLOmcLfl8bc2mOaPsyLPLh3AFmRpCRa29ttMwUr1pzfvF1XJm
	aYrsSoRXLEbrIezRKJdE+hxg/rL61MWpItuviZwWw4fnjg+z7nh8EUoN6Ax/Rc/bZsSToJQf54SVp
	i84eK2XCa+sHqWCufg18SaTeYfWlM65U7MU/EmxnGhjxXElPnUDEEo2xijj907HygoNEWp/nPWDqf
	62R5jZBA==;
Received: from mail-oo1-xc2c.google.com ([2607:f8b0:4864:20::c2c])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP2d0-00000003R49-3jEk
	for linux-mtd@lists.infradead.org;
	Thu, 05 Nov 2026 18:56:04 +0000
Received: by mail-oo1-xc2c.google.com with SMTP id 006d021491bc7-716d052dc23so686145eaf.1
        for <linux-mtd@lists.infradead.org>; Thu, 05 Nov 2026 10:56:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793904961; x=1794509761; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0o9Q25n23ckZBCXpljiM9GoL2XJxqzEiWbXDgW42slQ=;
        b=Gc+xyCYnMhv1ntwLUay8exdsXXohGCYoWdRweMmlKG+XbnCkb7G8mgTR8ZyYuz9FAY
         jIl6jJCO4KL1Nq/iWQ1mUWfHTgqHJvXr4+xRy3YWaaWPjPxgnArwNhycrr6iDIZTjmNN
         Bpd4zTL56R3ruBzM4BDa0lhtTESd+KVBKykIo37Ia782Zk9bm+FvhtKdoMMCr0YhfCPT
         sAxC+CKgX5blUbB2ocq+B5ZKfex4gVZduojyprWR9Jczk/PRRTUC74oAu939oQMya+Jd
         8VXUsMbTH26E1CE0rkh2Y+gUvMQI7GG20F69EdG9V9zkLHoDa9KJoocoxhKBd6Sc89wh
         6+tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793904961; x=1794509761;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0o9Q25n23ckZBCXpljiM9GoL2XJxqzEiWbXDgW42slQ=;
        b=zDUWd+JHbccEH7E8lVFfygXUytSqIf4sen8jyhbby2pTBXQf7MeKOidMfuMtgHOHiy
         qyTfqnKNQEQaBnV/TAlqvgHuLFuDpmJh+FlFtch/YqhNpf/v20g4QhkmKczopyAJR9P6
         1T2MH9gdTEgzG0+FFPTuwpkyE23hAM0gM5t997lFajqaGt5NbZ1GR1hpsEflKub6G8B7
         G2qK8c6w8277PQJthwyWzpKwOQ0afiRfqlCg+zoxyF8N9UxGdLTEuc1Y77QP9oYIBvH/
         TaXdLMJhiMezLTXF+Gjwvzahn2RTxM8udn8N8k7M00IugtBwWGhtEZvHitszQ8AAv2Du
         +zSg==
X-Forwarded-Encrypted: i=1; AKwUvBz/yZgMvyLaKWaacXcioIrm8gpdKVeBlPE5b27rG9F4G97OkTlhTAE/+XyFkVKwo3mhTOdyTXiY754=@lists.infradead.org
X-Gm-Message-State: APuU4Z/28gyHblovgeXbsgHYGg04HbORlvrojleQYdfncHfmFGOlKyaU
	kxYKqztYEXKxPJQ5woR93qisbhEk1j19jGrrZ/iZCqNrrFevGFtJMc5j
X-Gm-Gg: AYBFou0GaJKJQI94OxODYHwk2mDmQrirnBki3Q23FWcOnKi/HoNJDAR/Zurmvp68mT1
	fO88rzrHMVx2aMcFw4j8ubEHBM5zG0sXCwsyjBk15j4ZlkM6cBqawUq7sb4zGYDBFOzDlWLxG4B
	hZiPasIWwSzh+VuQ3Ay3JW6b8PSmw1SzhSJMlaVzwIZu3TC+YJcgJK52hb/NsgsHv1+9fZeyZcM
	i1lV2RkOA0CsWZD5seVShmC7PaaqDStWo9XDPj+Ruh+9zhdEIfxZ+0C6La2r9w9nfVIjCMUpNmd
	rE9jKsqZFKowGr4btZbR2JmRUlGdY34dtPh5/zE2MtNxpQSzEtJj+rN1pzT7YpG/7Q0YSPKjlo2
	282aHYqoDCn8mRcth6lY10gQSVmmA6CEAQHCT3H44UcjXyYe5h2ohDyjYcLOo4ICBy6t5DeP36f
	DdKAa5mzejHh/OqPGnUCyZKivPWssbgMaIw9nv9JRH8WmGu8OcxIYsCeQzNp3+VqL9GpsTXrg1S
	srAtLbg6Z8/+MUvQaqHjBcmDpX0qX0Ni5xr2UotsfFqm7xOy6gzPIRzH1/f2RdTT2/nHYYd343S
	Scrfd4CazsNeQbyVT2xWCkP5HcjJ3cXW4TzgTH21Ma7ylhvQzZDYeq99iCWQHE3RwCF9TCTEEtI
	FaJL/x+FflqLwJJ/zVfZUEyoaX2EbCZ3jdQBqAKXwo2KyWKHyQW21vzpk7/P6mOUACIN25/lO/i
	uVhW/skvQSLif8O2XPzRA7FSeXf050DHMBpDpg0/e2J2LfzUnbfPc4
X-Received: by 2002:a05:6820:4812:b0:713:da3b:901e with SMTP id 006d021491bc7-716e794cfa5mr279031eaf.48.1793904961203;
        Thu, 05 Nov 2026 10:56:01 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-716e99465dbsm115897eaf.0.2026.11.05.10.56.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 10:56:00 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 05 Nov 2026 11:55:35 -0700
Subject: [PATCH v10 19/26] mtd: rawnand: sunxi: scan all chips before
 registering MTD devices
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261105-submit-sunxi-nand-vendor-oob-layout-v1-v10-19-dca1f6ed29a8@gmail.com>
References: <20261105-submit-sunxi-nand-vendor-oob-layout-v1-v10-0-dca1f6ed29a8@gmail.com>
In-Reply-To: <20261105-submit-sunxi-nand-vendor-oob-layout-v1-v10-0-dca1f6ed29a8@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
 Clark Williams <clrkwllms@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 James Hilliard <james.hilliard1@gmail.com>
Cc: Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, 
 Richard Genoud <richard.genoud@bootlin.com>, 
 Boris Brezillon <bbrezillon@kernel.org>, 
 Masahiro Yamada <yamada.masahiro@socionext.com>, 
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-rt-devel@lists.linux.dev, 
 devicetree@vger.kernel.org
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_185603_474183_56B81C99 
X-CRM114-Status: GOOD (  20.76  )
X-Spam-Score: 0.1 (/)
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

sunxi_nand_chips_init() scans and registers each NAND child before
starting the next one. Registering the first MTD device allows users to
access it while the next child is being identified on the same NFC.

Normal NAND I/O holds the controller mutex, but nand_scan_ident() does
not take it. Its RESET and READ ID operations can therefore change the
shared chip select and timing while an operation on an already
registered chip is in progress. The normal I/O can likewise interfere
with identification.

Scan all chips before registering any MTD devices. Add each successfully
scanned chip to the controller's list and track whether its MTD has been
registered, so a scan or registration failure cleans up every scanned
chip and unregisters only the devices that were successfully registered.

Fixes: 1fef62c1423b ("mtd: nand: add sunxi NAND flash controller support")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 28 +++++++++++++++++++---------
 1 file changed, 19 insertions(+), 9 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 3de9ed6795fe..e1306d14ab3a 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -298,6 +298,7 @@ struct sunxi_nfc_oob_ops {
  * @nsels: number of CS lines required by the NAND chip
  * @sels: array of CS lines descriptions
  * @user_data_bytes: array of user data lengths for all ECC steps
+ * @registered: whether the MTD device has been registered
  */
 struct sunxi_nand_chip {
 	struct list_head node;
@@ -308,6 +309,7 @@ struct sunxi_nand_chip {
 	u32 timing_cfg;
 	u32 timing_ctl;
 	u8 *user_data_bytes;
+	bool registered;
 	int nsels;
 	struct sunxi_nand_chip_sel sels[] __counted_by(nsels);
 };
@@ -2672,8 +2674,10 @@ static void sunxi_nand_chips_cleanup(struct sunxi_nfc *nfc)
 					      struct sunxi_nand_chip,
 					      node);
 		chip = &sunxi_nand->nand;
-		ret = mtd_device_unregister(nand_to_mtd(chip));
-		WARN_ON(ret);
+		if (sunxi_nand->registered) {
+			ret = mtd_device_unregister(nand_to_mtd(chip));
+			WARN_ON(ret);
+		}
 		nand_cleanup(chip);
 		list_del(&sunxi_nand->node);
 	}
@@ -2754,13 +2758,6 @@ static int sunxi_nand_chip_init(struct device *dev, struct sunxi_nfc *nfc,
 	if (ret)
 		return ret;
 
-	ret = mtd_device_register(mtd, NULL, 0);
-	if (ret) {
-		dev_err(dev, "failed to register mtd device: %d\n", ret);
-		nand_cleanup(nand);
-		return ret;
-	}
-
 	list_add_tail(&sunxi_nand->node, &nfc->chips);
 
 	return 0;
@@ -2768,6 +2765,7 @@ static int sunxi_nand_chip_init(struct device *dev, struct sunxi_nfc *nfc,
 
 static int sunxi_nand_chips_init(struct device *dev, struct sunxi_nfc *nfc)
 {
+	struct sunxi_nand_chip *sunxi_nand;
 	struct device_node *np = dev->of_node;
 	int ret;
 
@@ -2779,6 +2777,18 @@ static int sunxi_nand_chips_init(struct device *dev, struct sunxi_nfc *nfc)
 		}
 	}
 
+	/* NAND identification must finish before MTD users can access the NFC. */
+	list_for_each_entry(sunxi_nand, &nfc->chips, node) {
+		ret = mtd_device_register(nand_to_mtd(&sunxi_nand->nand), NULL, 0);
+		if (ret) {
+			dev_err(dev, "failed to register mtd device: %d\n", ret);
+			sunxi_nand_chips_cleanup(nfc);
+			return ret;
+		}
+
+		sunxi_nand->registered = true;
+	}
+
 	return 0;
 }
 

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
