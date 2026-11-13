Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9417D606A881
	for <linux-mtd@archiver.kernel.org>; Fri, 13 Nov 2026 18:16:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=17McsCXU;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=FfWEru0j;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bqjDT7Sj
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Jsasm4Zv3HMlavjOBYtJaIgiDoxa+1u1sOMpM+hN+/Q=; b=17McsCXU798Rjpv1mykG60yeb3
	yezWocmeyNHOXTM62Op0+aeS5zMcn5IRJ5FU5TnYcUjx/g9hUOyAxc+b41t5IDO9U8SQKZuX9yy+g
	h79M/IxdTpyFMsT/M+DhAR7k6i2Pag4gEX0SnHo5Ph9VUgqdMcleQavkt23hcT0F4aeuLt5W62XIU
	W8lfIcgChbSJSdWlRc6h2B0wuy1x08h/nDzOTwkdBeROodVEhESjckjcN3lzxP/QrNjGqO/FiyMZw
	nifs7e+dlppqjmGbCdrmIHgNe0bQludVBbqCfv/sbP5F00BJuA0qeUl3jn8u3vSkPaGI0I/F2dKDf
	kyE7QxmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRvpP-0000000Dss7-1yoB;
	Fri, 13 Nov 2026 18:16:47 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRvoz-0000000Ds9M-0kb1
	for linux-mtd@bombadil.infradead.org;
	Fri, 13 Nov 2026 18:16:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=/RbITScvmyfE/Fkxqbl633jAaoI3LnbBlJcMHpQ8T4s=; b=FfWEru0j1j5iERKy1YA/rW8iwb
	gLuiDm9dujucMDPJ9WY8CF56XGJkDvmT5iwjFAsc63+DuM7nQA91lBnYWkqNYiL3PyM38QnKam2/v
	jWS0/+rxMyceF1XEQXZVyZguaKV1vP7tfvPiXF4U0ViqrT/fTgIzAZy/zVhOPpjuU9h39vOZJLCCB
	YeJJRMbRLH7kAN8nwFJCF6Pdd9hcQIX5yKnYQHdM6tZAqbBZaF+Zj34NQ17GLTyjj0rtkpy+qKDfs
	8o5D2w6/Lkl9UpgmhO4lFHE1CXp7y0+ZhuTUAd9TPfw5dWQxiVJ050qFE3lFFS62n7dNnplJ5F1sV
	bVcuHXeg==;
Received: from mail-ot1-x330.google.com ([2607:f8b0:4864:20::330])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRvow-0000000Bdpd-1Ubt
	for linux-mtd@lists.infradead.org;
	Fri, 13 Nov 2026 18:16:19 +0000
Received: by mail-ot1-x330.google.com with SMTP id 46e09a7af769-845788309b4so1163752a34.1
        for <linux-mtd@lists.infradead.org>; Fri, 13 Nov 2026 10:16:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794593776; x=1795198576; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/RbITScvmyfE/Fkxqbl633jAaoI3LnbBlJcMHpQ8T4s=;
        b=bqjDT7SjMqlHY/svex4o2THYWJgAHSovxZgJdhYnhwN+CBQZKAVUi0+cInGAKC/UTG
         2D3XZldIdO/NYcvZueR8X+7KXbM5+YrOxIhMjbW0jFdZcB1dtAh/1uuNCCSSArTLyM86
         FJpCkkHs2oXE8rNfeLtUucYdhSwXxf8s4K0/ZWpb1bNfl/OWxIPOECWp/Mvj83iyOzCH
         g55pO9o9d+N+/2hDM7IEFgSJZaeRjcYS/U6u0J3HeCL1u8dH0rYNp7qcVTZDw30oO/OC
         Ag2ShlcbJdTAlspAJdzSevDseJbEo/sl2o1aowqUOEJC82A9cFDDDBuDTiD2LmYiR3fQ
         aXPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794593776; x=1795198576;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/RbITScvmyfE/Fkxqbl633jAaoI3LnbBlJcMHpQ8T4s=;
        b=kN9PUpeS9ss4HJ+Vazi5a96G7sidMLMIrXUgHqd+qUZCQs771RijoKgt4ojwepxdik
         P8kPC6g9JXiSeRP9PZGL4m33mL1/d3dUyRaS9SJ/cl0aGw8K01Ls9SlrnPNqlvgM89E7
         jn+71oJEuGReC8sx5cM0de1c0wpFT3OMNmgZWJbMVJVk6ZnzMN72m9MCBppN0d431q6j
         ln782kcY2v7PLZXLAi/pSygSVHi+smR1KUGXAkXa7toilrVk46zFmE+YqPAXKHHvA7sv
         F+GPg8UMUWCxcdGtidKHjBkdd+2AZqUxqVnU2jWaXgEI7tPGztzUnqKrllbhMBEKM27B
         ke9A==
X-Gm-Message-State: APuU4Z+jdl3RKVZ9G30TR9knxmMNROQdSjPMvsPldcGJKtieLnOOg9CW
	eSCp6CrCumZ2e4ipZ1PrWhcvLnr/Bxbw+r5QlTvfHVC+CvUX93aQr0I2mwxgZteR
X-Gm-Gg: AYBFou0xVJV6g3K4FVpSMWJHF5qHqXJK0a5QHR0mEUUsOXSoe7Qv+YK8Z24QbkHfK8q
	UjSWS2KrjumKldUKtyBpAtncN+XXy04lG+MGOxt8yeFm1cXQ6mih2I3Xx/s6OGSMxSyU7daQuwr
	5Iqh6iOc4os5GSxXm6CPv8TlHJIIduN1ciuRPQS3jZlkqVmGo5vf7Q2B7bh6/bUDCRWgGxTwVOr
	2jdmouXR/t/CEQdwhqSz68xzP+FBgDRIHFaVxHcWc5ZD2wZHwxYZL2aXpViX58hRrX6mO7g5SQ5
	F9qIKBb0n4tqlbToT+w+7M67H7hPNAsmA3ZHF4HBYMGnOvKHP4eyRLvJBmtOxN+IkIdVLks9P81
	NNhgQUA6BiLcNBdJOjqj4p8z4iu/GHc3j5xE6JWKb08lr7YeRFgyZnl2SjMRzvEipLM02sd9Gkp
	S2tCZKglOK99aeiFSIQ8t6wOexkLpQzaidlEa4eFhAC/hwfjeg9c0564J7WFh4uyD9C1vpz4RS8
	s/ENecqNG5QLjKzZDQi8kUGcIHhrcG4+TOrGBy/KSlRc0aDdN5WxGs3WsWsuqRRQyKkwfJqta1e
	Jsxd7Lv3QxvtrUozQqVASzIbTRQTQZXqvwmurw/9c9uQln1I9noClnuZrZtNOdygp6ADUxue0cv
	5UarXWXGetJqHVdFvjgG2vHsWAi7Nr78Nz6OxK0tkW6COv/6N7s/uvy6degbqLxadgwgO0wP/eV
	0ZkRpCUrzuAiz1gshWo3A8fxbpLd08SV30acNmx7rFCmJ/oflvrGY=
X-Received: by 2002:a05:6830:640e:b0:82a:bf47:a080 with SMTP id 46e09a7af769-862898b702cmr3155900a34.27.1794593775898;
        Fri, 13 Nov 2026 10:16:15 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-8628817d979sm3253414a34.22.2026.11.13.10.16.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 10:16:15 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 13 Nov 2026 11:14:54 -0700
Subject: [PATCH v4 38/58] mtd: rawnand: cadence: retain open-handle state
 on removal
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-38-556b1d7c6221@gmail.com>
References: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-0-556b1d7c6221@gmail.com>
In-Reply-To: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-0-556b1d7c6221@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_181618_272500_F09A1BD3 
X-CRM114-Status: GOOD (  16.40  )
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

Keep chip metadata and controller storage alive until the final MTD
reference is released. Unregister and disconnect each published chip
before releasing the resources used by its hardware operations.

Allocate the final shared buffer before publishing any chip.

Run NAND cleanup during disconnection; the final core-owned put only
releases retained allocation and layout data.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/cadence-nand-controller.c | 49 +++++++++++++++++---------
 1 file changed, 33 insertions(+), 16 deletions(-)

diff --git a/drivers/mtd/nand/raw/cadence-nand-controller.c b/drivers/mtd/nand/raw/cadence-nand-controller.c
index 05d0659e6527..4e365ffdf905 100644
--- a/drivers/mtd/nand/raw/cadence-nand-controller.c
+++ b/drivers/mtd/nand/raw/cadence-nand-controller.c
@@ -562,6 +562,7 @@ struct cdns_nand_chip {
 	struct cadence_nand_timings timings;
 	struct nand_chip chip;
 	u8 nsels;
+	bool registered;
 	struct list_head node;
 
 	/*
@@ -3007,9 +3008,7 @@ static int cadence_nand_chip_init(struct cdns_nand_ctrl *cdns_ctrl,
 	}
 
 	/* Allocate the nand chip structure. */
-	cdns_chip = devm_kzalloc(cdns_ctrl->dev, sizeof(*cdns_chip) +
-				 (nsels * sizeof(u8)),
-				 GFP_KERNEL);
+	cdns_chip = kzalloc(struct_size(cdns_chip, cs, nsels), GFP_KERNEL);
 	if (!cdns_chip) {
 		dev_err(cdns_ctrl->dev, "could not allocate chip structure\n");
 		return -ENOMEM;
@@ -3024,20 +3023,22 @@ static int cadence_nand_chip_init(struct cdns_nand_ctrl *cdns_ctrl,
 			dev_err(cdns_ctrl->dev,
 				"could not retrieve reg property: %d\n",
 				ret);
-			return ret;
+			goto free_chip;
 		}
 
 		if (cs >= cdns_ctrl->caps2.max_banks) {
 			dev_err(cdns_ctrl->dev,
 				"invalid reg value: %u (max CS = %d)\n",
 				cs, cdns_ctrl->caps2.max_banks);
-			return -EINVAL;
+			ret = -EINVAL;
+			goto free_chip;
 		}
 
 		if (test_and_set_bit(cs, &cdns_ctrl->assigned_cs)) {
 			dev_err(cdns_ctrl->dev,
 				"CS %d already assigned\n", cs);
-			return -EINVAL;
+			ret = -EINVAL;
+			goto free_chip;
 		}
 
 		cdns_chip->cs[i] = cs;
@@ -3059,20 +3060,22 @@ static int cadence_nand_chip_init(struct cdns_nand_ctrl *cdns_ctrl,
 	ret = nand_scan(chip, cdns_chip->nsels);
 	if (ret) {
 		dev_err(cdns_ctrl->dev, "could not scan the nand chip\n");
-		return ret;
+		goto free_chip;
 	}
 
-	ret = mtd_device_register(mtd, NULL, 0);
+	ret = nand_set_lifetime(chip, cdns_chip);
 	if (ret) {
-		dev_err(cdns_ctrl->dev,
-			"failed to register mtd device: %d\n", ret);
 		nand_cleanup(chip);
-		return ret;
+		goto free_chip;
 	}
 
 	list_add_tail(&cdns_chip->node, &cdns_ctrl->chips);
 
 	return 0;
+
+free_chip:
+	kfree(cdns_chip);
+	return ret;
 }
 
 static void cadence_nand_chips_cleanup(struct cdns_nand_ctrl *cdns_ctrl)
@@ -3083,10 +3086,13 @@ static void cadence_nand_chips_cleanup(struct cdns_nand_ctrl *cdns_ctrl)
 
 	list_for_each_entry_safe(entry, temp, &cdns_ctrl->chips, node) {
 		chip = &entry->chip;
-		ret = mtd_device_unregister(nand_to_mtd(chip));
-		WARN_ON(ret);
-		nand_cleanup(chip);
+		if (entry->registered) {
+			ret = mtd_device_unregister(nand_to_mtd(chip));
+			WARN_ON(ret);
+		}
+		nand_disconnect(chip);
 		list_del(&entry->node);
+		mtd_put_master(nand_to_mtd(chip));
 	}
 }
 
@@ -3127,6 +3133,7 @@ static int cadence_nand_init(struct cdns_nand_ctrl *cdns_ctrl)
 {
 	dma_cap_mask_t mask;
 	struct dma_device *dma_dev;
+	struct cdns_nand_chip *entry;
 	int ret;
 
 	cdns_ctrl->cdma_desc = dma_alloc_coherent(cdns_ctrl->dev,
@@ -3181,7 +3188,6 @@ static int cadence_nand_init(struct cdns_nand_ctrl *cdns_ctrl)
 		goto dma_release_chnl;
 	}
 
-	nand_controller_init(&cdns_ctrl->controller);
 	INIT_LIST_HEAD(&cdns_ctrl->chips);
 
 	cdns_ctrl->controller.ops = &cadence_nand_controller_ops;
@@ -3201,9 +3207,17 @@ static int cadence_nand_init(struct cdns_nand_ctrl *cdns_ctrl)
 		goto unmap_dma_resource;
 	}
 
+	list_for_each_entry(entry, &cdns_ctrl->chips, node) {
+		ret = mtd_device_register(nand_to_mtd(&entry->chip), NULL, 0);
+		if (ret)
+			goto unmap_dma_resource;
+		entry->registered = true;
+	}
+
 	return 0;
 
 unmap_dma_resource:
+	cadence_nand_chips_cleanup(cdns_ctrl);
 	dma_unmap_resource(dma_dev->dev, cdns_ctrl->io.iova_dma,
 			   cdns_ctrl->io.size, DMA_BIDIRECTIONAL, 0);
 
@@ -3275,11 +3289,14 @@ static int cadence_nand_dt_probe(struct platform_device *ofdev)
 		return -ENOMEM;
 	}
 
-	dt = devm_kzalloc(&ofdev->dev, sizeof(*dt), GFP_KERNEL);
+	dt = kzalloc_obj(*dt);
 	if (!dt)
 		return -ENOMEM;
 
 	cdns_ctrl = &dt->cdns_ctrl;
+	ret = devm_nand_controller_init(&ofdev->dev, &cdns_ctrl->controller, dt);
+	if (ret)
+		return ret;
 	cdns_ctrl->caps1 = devdata;
 
 	cdns_ctrl->dev = &ofdev->dev;

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
