Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FA7A60A2616
	for <linux-mtd@archiver.kernel.org>; Mon, 16 Nov 2026 06:31:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=l01Qyprk;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nRMuDAdu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=wlcWYNYPMG/Xz38SUxP9T+b6SvNGWW0K+9+sgCU4ytQ=; b=l01Qyprks48FLUlCZ/FYTxlIjt
	JjYh59uBYz3FUoFu9ao+/CmgB5pfHZJr0/2kkhPoZSzY/L/T638UPzuFThakLExeRI85n4TAlFAEa
	bL8L8KIXjh9Dw08KCnVaWc4kCLUnpAhu37Ogy/aGoHt6A7SxsBuBMx6cInpPP0KGqRL7YMTrnjDFI
	nNW6cRSJRlo0R6PPFYo+QRccOtvErc/CJeL9/jQc0sa76+4ODY9IBBHjArQaNWhPlAT7eQHDsIj2Y
	9MJJsOgFgZWHAnlQawpu+1vWgnYIb+FleWvAdogAXb6dJPkvJf8dViQw7KaV+C8U1yy1nkHLYBmiH
	v1n7fLXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSqFF-00000001H3o-424Z;
	Mon, 16 Nov 2026 06:31:13 +0000
Received: from mail-oo1-f51.google.com ([209.85.161.51])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSqEZ-00000001FoN-1BJl
	for linux-mtd@lists.infradead.org;
	Mon, 16 Nov 2026 06:30:40 +0000
Received: by mail-oo1-f51.google.com with SMTP id 006d021491bc7-71ad099391dso578093eaf.3
        for <linux-mtd@lists.infradead.org>; Sun, 15 Nov 2026 22:30:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794810630; x=1795415430; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uVPWWKmrrXj8p9e5vViITMKgzrJGNIhKtx82JngydDw=;
        b=nRMuDAdukib7/5xXZON5u7bYvVZQkNhz+dH+EDU537GmV1cwdvllPI4fC1yifv5Y1f
         AoqL+rqMRU7JlQsMjaN6KUCk0SPfYu/xv+ciqUZejYg6bCWeWyCCr2IT96daR/zVi1In
         zzL4j7qtUBp3CAKWtzv1qDzGeLY+qH7BujI2Kk3y/MCfMae7fhA1qHk+t3t2SEz4bAxG
         DZ+5kokIILAiasjAQOELM4yoWtBlaviEJoA+6FbAZvR5yIoqcli6jfnP8FrAiKll0kmZ
         X4NAJfoEt2rhz7MuxyV3gg2ODjLiBMdhNorQDWTxdWF5tVzXKrYuHJr3lG+xLnu0PVL1
         /v3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794810630; x=1795415430;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uVPWWKmrrXj8p9e5vViITMKgzrJGNIhKtx82JngydDw=;
        b=dBHyz+GWVNhmj2n4feKbZ1loi7TKK1BAO8sCkpm6/TXBLPzs6dJ+aYHeyTzvUsBh6X
         xvZ00P5DuGCfyNOvxv5swNPXyITL+MGl/Lve8//3G0F6wjhdW/B4ZDSvTgWuueUhcWdb
         16X7G2BkW4IbMfFzUqSksQ5fvIJxn5aLN/kSzbQZ8F5W2OLgshNGBhMwrb8OBD4Bx0A9
         /v7xNiftISGyucQkkNrZDsgxigt1HbWkNMaf4xpwrHe0Er/atF4SytpgcTv6LIxGXg8H
         STprFuka5YOGVvTcub1AXwWdbWR6GXJyAV49rbGlu6CrlBlep3At6TehUggoxpNdORqE
         l1ww==
X-Gm-Message-State: APuU4Z+219Mty0rKJvhLv5RzUPp8chbsZexV1W18nONjdEIL4KqPfqYV
	79eKk/VfHp5ZK0TiV2IzbU79RWMgwndWJrA1FxhKykQpQ0XgoTUpUVdH
X-Gm-Gg: AYBFou1ujOoEcf56Lcdr50SL4pmSzAWEv4IZaWqPPQoCBgxztmq6gXIwDcfHAzDKi4F
	moDddZ2cnsHBNhhITiKTUHZC0tHzTX2Pmb9SPKsl4edZusfSNrcv6GR9sx2bBaw+ZmTKDFUahCh
	tRGbdzAxsHu+v3Y/72iWA3LHEw7fuPHsxf8M8E1nfLZtRfLm9EoJbUDGjnJVyzADqmz90h49BRT
	YcOqINfHjSFOIhPXV20gex1fKojIflfZydELTlCkLB4nzBwt6lJMlLVOXoRGcfRGdE2UgW/niSH
	XBs6vPw56nVBJ38/pvnOug+QuoFHLSBQGfpQYvPkMR9KGhZFHpx9pglpQfgHDtELD425vv6VTm5
	jAQsjUqvGSqN/qpjzgcq2f0prvcabvjh1s9aB5IC6o2e+wxj83y5zWS3IXeLmxTDXWNI3bqm2eh
	gP1wF/dpCP3xUiBfvi9qGky864nbUXB2bYcpmScIPeRbK3EvM9F0s3tuhO8kFWwgPymvoXirQHV
	imt9AVJCVm5v8hl79u+vgXHk0lcsPPaf4eg6MSqnN6/lF0PU2/FwxTb8OWrRwW+dnnd6QyGukeO
	6Q93pKPxXlBqiVcz7pum1dEbE2e9et4HTcuIAp5HRl8V+JFHs+Ns4BYRj6/yTieO7V0RAeBvCM/
	eN4Yjn6Fk5Rpe89Map2TxjvlRsnCup6sEOKn0QPwLWgGT4Ihuj+e3G/s5sPE6HWDhfecK9wjIcq
	Q0hEZ3aYYoYWucwJH2AGtLCB/qJMd/nB+3HJkMpW/5cCmNxNCBUWo=
X-Received: by 2002:a05:6820:4607:b0:716:cb30:8a47 with SMTP id 006d021491bc7-71ab526fb1dmr4759602eaf.77.1794810629906;
        Sun, 15 Nov 2026 22:30:29 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71ab42c41e9sm7994558eaf.6.2026.11.15.22.30.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 22:30:29 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 15 Nov 2026 23:29:51 -0700
Subject: [PATCH v5 36/58] mtd: rawnand: renesas: retain open-handle state
 on removal
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-36-cbc49c5c5e74@gmail.com>
References: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-0-cbc49c5c5e74@gmail.com>
In-Reply-To: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-0-cbc49c5c5e74@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 James Hilliard <james.hilliard1@gmail.com>, 
 linux-renesas-soc@vger.kernel.org, 
 Wolfram Sang <wsa+renesas@sang-engineering.com>
X-Mailer: b4 0.17-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261115_223034_337027_F252455B 
X-CRM114-Status: GOOD (  14.81  )
X-Spam-Score: -1.8 (-)
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

Disconnect all chips before dropping runtime PM and transfer buffers.

Run NAND cleanup during disconnection; the final core-owned put only
releases retained allocation and layout data.

Cc: linux-renesas-soc@vger.kernel.org
Acked-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/renesas-nand-controller.c | 35 +++++++++++++++++---------
 1 file changed, 23 insertions(+), 12 deletions(-)

diff --git a/drivers/mtd/nand/raw/renesas-nand-controller.c b/drivers/mtd/nand/raw/renesas-nand-controller.c
index 135cdb67a472..8a2a55007148 100644
--- a/drivers/mtd/nand/raw/renesas-nand-controller.c
+++ b/drivers/mtd/nand/raw/renesas-nand-controller.c
@@ -1217,8 +1217,7 @@ static int rnandc_chip_init(struct rnandc *rnandc, struct device_node *np)
 	}
 
 	/* Alloc the driver's NAND chip structure */
-	rnand = devm_kzalloc(rnandc->dev, struct_size(rnand, sels, nsels),
-			     GFP_KERNEL);
+	rnand = kzalloc(struct_size(rnand, sels, nsels), GFP_KERNEL);
 	if (!rnand)
 		return -ENOMEM;
 
@@ -1229,17 +1228,19 @@ static int rnandc_chip_init(struct rnandc *rnandc, struct device_node *np)
 		ret = of_property_read_u32_index(np, "reg", i, &cs);
 		if (ret) {
 			dev_err(rnandc->dev, "Incomplete reg property (%d)\n", ret);
-			return ret;
+			goto free_chip;
 		}
 
 		if (cs >= RNANDC_CS_NUM) {
 			dev_err(rnandc->dev, "Invalid reg property (%d)\n", cs);
-			return -EINVAL;
+			ret = -EINVAL;
+			goto free_chip;
 		}
 
 		if (test_and_set_bit(cs, &rnandc->assigned_cs)) {
 			dev_err(rnandc->dev, "CS %d already assigned\n", cs);
-			return -EINVAL;
+			ret = -EINVAL;
+			goto free_chip;
 		}
 
 		/*
@@ -1257,23 +1258,29 @@ static int rnandc_chip_init(struct rnandc *rnandc, struct device_node *np)
 	mtd->parent_dev = rnandc->dev;
 	if (!mtd->name) {
 		dev_err(rnandc->dev, "Missing MTD label\n");
-		return -EINVAL;
+		ret = -EINVAL;
+		goto free_chip;
 	}
 
 	ret = nand_scan(chip, rnand->nsels);
 	if (ret) {
 		dev_err(rnandc->dev, "Failed to scan the NAND chip (%d)\n", ret);
-		return ret;
+		goto free_chip;
 	}
 
 	ret = rnandc_alloc_dma_buf(rnandc, mtd);
 	if (ret)
 		goto cleanup_nand;
 
+	ret = nand_set_lifetime(chip, container_of(chip, struct rnand_chip, chip));
+	if (ret)
+		goto cleanup_nand;
 	ret = mtd_device_register(mtd, NULL, 0);
 	if (ret) {
 		dev_err(rnandc->dev, "Failed to register MTD device (%d)\n", ret);
-		goto cleanup_nand;
+		nand_disconnect(chip);
+		mtd_put_master(mtd);
+		return ret;
 	}
 
 	list_add_tail(&rnand->node, &rnandc->chips);
@@ -1282,7 +1289,8 @@ static int rnandc_chip_init(struct rnandc *rnandc, struct device_node *np)
 
 cleanup_nand:
 	nand_cleanup(chip);
-
+free_chip:
+	kfree(rnand);
 	return ret;
 }
 
@@ -1296,8 +1304,9 @@ static void rnandc_chips_cleanup(struct rnandc *rnandc)
 		chip = &entry->chip;
 		ret = mtd_device_unregister(nand_to_mtd(chip));
 		WARN_ON(ret);
-		nand_cleanup(chip);
+		nand_disconnect(chip);
 		list_del(&entry->node);
+		mtd_put_master(nand_to_mtd(chip));
 	}
 }
 
@@ -1322,12 +1331,14 @@ static int rnandc_probe(struct platform_device *pdev)
 	struct clk *eclk;
 	int irq, ret;
 
-	rnandc = devm_kzalloc(&pdev->dev, sizeof(*rnandc), GFP_KERNEL);
+	rnandc = kzalloc_obj(*rnandc);
 	if (!rnandc)
 		return -ENOMEM;
+	ret = devm_nand_controller_init(&pdev->dev, &rnandc->controller, rnandc);
+	if (ret)
+		return ret;
 
 	rnandc->dev = &pdev->dev;
-	nand_controller_init(&rnandc->controller);
 	rnandc->controller.ops = &rnandc_ops;
 	INIT_LIST_HEAD(&rnandc->chips);
 	init_completion(&rnandc->complete);

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
