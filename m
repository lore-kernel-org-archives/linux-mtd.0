Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C9D7606C22B
	for <linux-mtd@archiver.kernel.org>; Mon, 16 Nov 2026 06:30:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=u9MTgYw4;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lL8o1QhV
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=hkVS84VALebSsWrcwy0Y+teSboEUtYtBUavhRqqq2AM=; b=u9MTgYw4g6QoHHhcg5n/IckHB9
	ZEwXJqNDp910kAXnJlWjwDc3QIP5kddidX88MY35+jrPvybpCRFiYAO3fBvyjpp4C/OY0GGQHYVLj
	5L51GR/cGhmwTo6hI1XDW2evrSP5N9P7AdwaHvqeyxfPJO2Ekpt8+72k040TKpi4PQlzuuzzMYfeY
	KaWszTAoMtswNqLXHgPyrNQclJ6mT6jyzlKa1g2OVgicFHY8j8SFTUjaPLW0VyWK2pE9CgPIi8EyD
	RiFSmG7rdMPk44P/FpQRGLoQoJY4/BbizN6Gkaqw0x1SmGu19pQAeUkU0GRIHtqcCn4FCMh+NWVyZ
	pF70mtxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSqEj-00000001G5D-05rY;
	Mon, 16 Nov 2026 06:30:41 +0000
Received: from mail-oo1-xc2d.google.com ([2607:f8b0:4864:20::c2d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSqET-00000001FgC-45uv
	for linux-mtd@lists.infradead.org;
	Mon, 16 Nov 2026 06:30:28 +0000
Received: by mail-oo1-xc2d.google.com with SMTP id 006d021491bc7-71ab5e64742so2622439eaf.3
        for <linux-mtd@lists.infradead.org>; Sun, 15 Nov 2026 22:30:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794810625; x=1795415425; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iw1mhyLO5cIUeTXqdeey1RMguJ4HKMr0GKk4FweavX4=;
        b=lL8o1QhVruZYA/jfIf4bRkrYYFJ5jL9M/Lq2wqWK7kPpkZ4epnk9VMz9B6yBCoqBSU
         kN5m6+PQkbhH7qgm6kZk+U0bJcCQEeLM8z0rh7LawQDCOshf3yVSioJSjUtRt9SMKH5B
         jF2Z0y0wwHBRaqNVM2A8Gi5cVE1UOqOEhX7n1DHi2aEkb7gqo+YywOIrQegmF9dzhxNy
         HFs1tGS2EnYxE6+JnA7NzkTSd782g9MgM5Hr58DqA67kM/WMeM3icGFJY/7aJX88Yihi
         stUelPc0ss6ee+xDMFVrcSD4gm81z99Y8SI6a1kYfgM4KVWQqDIqu12M2GI1wxL8DnNP
         3Vpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794810625; x=1795415425;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iw1mhyLO5cIUeTXqdeey1RMguJ4HKMr0GKk4FweavX4=;
        b=YyHzrgx74m/CqVOVeYpAZCsgM0hMobwUHwR1mF/x8w5nHFh5kDT/IDECaqW8hm9ifh
         sysh8EOXFfn4z8/6sD53ERK3yhRFjL+o+q9HhNpRrSAV98XTpaN9x/864JQlPrafN60S
         SiVl7C3IU9ixUDNGXedAAPGZQYUnywNPpVOLJD5456Sdqkhe+FHfwLGUr+M3KAZ1x/si
         OMknCeXAy85Npb/iBADUTDqi2EupsjDaJxEA0YNkYUyQ5C3QLdLzv6b6h9ZV4nYQNLcJ
         7p4wCRGuNkC3wG3jVFRo1uA45upcaeg+Gk4P/wEvNfRZBDuegrNEmYd15s8jSL5renzA
         byeA==
X-Gm-Message-State: APuU4Z84VkQM4lv1Pv6oFT9HxeN2msMZ8qhBpYQUmEvIwRSA7rTTeQHS
	2X346P0WrD3+9BXKEIke/Q5TQkOhPms5TL1TPu/WOesrlI4qUrexmGvnStLmVni1
X-Gm-Gg: AYBFou0MEacgvmLuyvgLr3DUCq6dV76SVcfkx925bO8D4JYDGzNhTTHkSCPhDmgClMS
	r4Nx/aD71RQYOg7Faz3MteQCzdySBwAEHe3VRVC8F8itqSMlrR2HwttdNc3y/MEOfH0hTbHyi3a
	+6DqR+Lrl4wg0XGNMuI0ULd7XfAY7OVhq6Db9BnhNEbqTjZZ25Y8wSqgJCRziItnmA9FpbkLCKg
	mfoMuGF3aezN1yQ3XRN+bgyPX3pwTqhka55AK2FBsMIqWUxCpgb/OgkdQoBGL0kC+7q0e+DK3Jf
	WuC5aBtmArIA31LlNNFca6Piya7WPHIGsTx2+Vug1ifixJHtqLCT3pq7KoZufYrE4WQwLnv60t6
	HHwZqDO1LOX7hmfSFKSl5tXA8n9MbrA67Zhj47rYP0kD5f2bornaa3z525xshrdpNBtxOfdOVPy
	1fdrs0syqfEU+A1i0pejSAKpDe6RSMfAbhNiKzaeHZlsfMr6eKBtICdodJTB8PLrdHzifEU3tAe
	KvHhYzbLOIoKZMHx3PFUt/w0zKTxq60ZFdenUCexvAt4UoPwKF3oJpO9+2nojOoJ8oAzAWl8da5
	t0W1e7Y3AhAQrUrph9sOuZN2+iWRNJhPHkNBl3bDofiWpvLqtIqqJQjltheBoJLObHYYv551fFo
	+1wZStyKe3WJanRaKlVYfHKeSFMX99dXS9i9oIlMq1dk/HfBezRIBVVax4nG4MxXuEDZF+Avmji
	lBvDXAr8lbSxLXPSOW3eQ7pzp9Y6NqpjmmXzOvRF3Zaq4cqWwq5dY=
X-Received: by 2002:a05:6820:f02a:b0:702:31a1:9049 with SMTP id 006d021491bc7-71ab50136camr6205367eaf.36.1794810625042;
        Sun, 15 Nov 2026 22:30:25 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71ab42c41e9sm7994558eaf.6.2026.11.15.22.30.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 22:30:24 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 15 Nov 2026 23:29:47 -0700
Subject: [PATCH v5 32/58] mtd: rawnand: fsmc: retain open-handle state on
 removal
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-32-cbc49c5c5e74@gmail.com>
References: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-0-cbc49c5c5e74@gmail.com>
In-Reply-To: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-0-cbc49c5c5e74@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.17-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261115_223027_396465_83E1796C 
X-CRM114-Status: GOOD (  14.39  )
X-Spam-Score: -1.9 (-)
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

Keep chip metadata and controller storage alive until the final MTD
reference is released. Unregister and disconnect each published chip
before releasing the resources used by its hardware operations.

Disconnect before controller disable and DMA channel release.

Run NAND cleanup during disconnection; the final core-owned put only
releases retained allocation and layout data.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/fsmc_nand.c | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/raw/fsmc_nand.c b/drivers/mtd/nand/raw/fsmc_nand.c
index 3cd25395d791..264a2570f40c 100644
--- a/drivers/mtd/nand/raw/fsmc_nand.c
+++ b/drivers/mtd/nand/raw/fsmc_nand.c
@@ -1037,9 +1037,12 @@ static int __init fsmc_nand_probe(struct platform_device *pdev)
 	int i;
 
 	/* Allocate memory for the device structure (and zero it) */
-	host = devm_kzalloc(&pdev->dev, sizeof(*host), GFP_KERNEL);
+	host = kzalloc_obj(*host);
 	if (!host)
 		return -ENOMEM;
+	ret = devm_nand_controller_init(&pdev->dev, &host->base, host);
+	if (ret)
+		return ret;
 
 	nand = &host->nand;
 
@@ -1128,7 +1131,6 @@ static int __init fsmc_nand_probe(struct platform_device *pdev)
 		nand->options |= NAND_KEEP_TIMINGS;
 	}
 
-	nand_controller_init(&host->base);
 	host->base.ops = &fsmc_nand_controller_ops;
 	nand->controller = &host->base;
 
@@ -1140,9 +1142,15 @@ static int __init fsmc_nand_probe(struct platform_device *pdev)
 		goto release_dma_write_chan;
 
 	mtd->name = "nand";
-	ret = mtd_device_register(mtd, NULL, 0);
+	ret = nand_set_lifetime(nand, NULL);
 	if (ret)
 		goto cleanup_nand;
+	ret = mtd_device_register(mtd, NULL, 0);
+	if (ret) {
+		nand_disconnect(nand);
+		mtd_put_master(mtd);
+		goto release_dma_write_chan;
+	}
 
 	platform_set_drvdata(pdev, host);
 	dev_info(&pdev->dev, "FSMC NAND driver registration successful\n");
@@ -1176,13 +1184,14 @@ static void fsmc_nand_remove(struct platform_device *pdev)
 
 		ret = mtd_device_unregister(nand_to_mtd(chip));
 		WARN_ON(ret);
-		nand_cleanup(chip);
+		nand_disconnect(chip);
 		fsmc_nand_disable(host);
 
 		if (host->mode == USE_DMA_ACCESS) {
 			dma_release_channel(host->write_dma_chan);
 			dma_release_channel(host->read_dma_chan);
 		}
+		mtd_put_master(nand_to_mtd(chip));
 	}
 }
 

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
