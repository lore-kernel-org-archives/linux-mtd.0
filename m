Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90C83606A335
	for <linux-mtd@archiver.kernel.org>; Mon, 16 Nov 2026 06:31:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=yIbBU01i;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iDJG4Bvg
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=wbfC38cx5xZfVrAvJI8IOR7OyImKc+Mf1TPvHLc0vak=; b=yIbBU01i+Kn8YQz7tLa5YFHnhN
	46omNARgvdw8WO1nVYKURm+PCMNxAqJkkfF/+Nw9us0yjBqMXZ9bUt3QDZoo1LjTbTfqP7vmF375A
	fMrT7rlBzhHUIqKEyOyH/7RPOCk9KVPkl1cRH358uYof90XO+ndJkF9uKJSpwi+Lh5W0uPblLEhPE
	nOhzjOAP7yEXZCziU/YEwVWyfaCBNOt01W8PiKdkFXNRus6F07zjvS0+gmG75cHWGAySvoHhuyYyd
	H+CcW1KlnhbxTj8ua2lSKmI4QuWPS+Jmeb3BJT6HhDiwf/uC9iC9aAZYlVAgfezOsFxl+I64qZ1aE
	8kLy8jTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSqFM-00000001HHg-0mHm;
	Mon, 16 Nov 2026 06:31:20 +0000
Received: from mail-oo1-f44.google.com ([209.85.161.44])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSqEl-00000001G8x-1Bvp
	for linux-mtd@lists.infradead.org;
	Mon, 16 Nov 2026 06:30:50 +0000
Received: by mail-oo1-f44.google.com with SMTP id 006d021491bc7-6b8e2d8df4fso2693212eaf.1
        for <linux-mtd@lists.infradead.org>; Sun, 15 Nov 2026 22:30:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794810641; x=1795415441; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bjOPI+nS6OY4/J1CJwhYrkDcrP31GfwK700MsRJ05II=;
        b=iDJG4BvgsV68gLzk2EaqMIyD8yGMXgYZyW+k9kX34Ps2RQf15clF+FNb1ioqDmvsYC
         ZeJ7dBpUcCXjv+Un1/64zQzGoN7XfIVvIFNm3+0Urkmh56dLOv/PQmR99I3nYK1cRU0f
         xguRrlVYmsqYdh4rIYC27KU8SYTC5gPnHelnId5oV4uicdvMDd+6MWe3TSrcZpfUtlTh
         EI+Tgf4ytl4HOsHr/PaXH/jqR5HRN6BT64ZXex4McPjCtcYdGeC9Bp+SzmWO30kUR3qy
         6Wnrv7EvMM7/YhFN52Oh0ivusHI3mMEnnVU9v1KLwRmW894F8Ml0LlQk9ptMFwdggmDK
         k6Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794810641; x=1795415441;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bjOPI+nS6OY4/J1CJwhYrkDcrP31GfwK700MsRJ05II=;
        b=aV6v8LQMaXy/QwJwkzeYfq6eOspPpVoy0cautiO4NWw0p80QTA9yvT41/0z9AQcLZB
         yxCprH9EoI1cw7aQIabmQ7fujmRHGhZp7TP/dOisdaHNfU1lrpjUk1KwLgkTve9HFi/k
         /TMKSsejOCAlHAG/cEPhIdcKyJuBYQ91ZDGA0vQY77cL/k+bKkKSCHv2IQ+v+yMwGNyo
         Z1hU1rsrmOJwVaNLPaXm316P+k65LMA+cXhk6mjwB4eVxJOa63ERYv7EcJRswAKjHN4v
         P8HWFMqmm2sstMq9E7bSfWlzbzz6TVFym1Zi1TTPIZzOuBHdqSY3D/2VaYG9vN2aQl53
         0mTw==
X-Gm-Message-State: APuU4Z+4aP/nNgKHVJKk4o2npXjCCEhTXdZRLQsvaLrypwp7JlMLoNvp
	tEwi2OY95BaDOJvoX7wojrj+NUcp9qNy9zviLCCvCX5heH0lpRWfD5+W
X-Gm-Gg: AYBFou0lZUHDgGbUO8WR/hnjMhH7kYvnnknxvESq1D294McFh6M//xBYz7UpB7rs8PW
	W+e/QrOtePZLk6Sp+8dg0lNYE8Zr01usZFGGUZMOg+SYFS/6Iw3lNv4RXpthyTZjbEv+NgcFkp0
	NOJvEsFeTnyI7JdF/t71Z/Lyi1XsO7JkiME4Zoe1xtZVMmscP0qdgpKelIa/fMPE5QA2uC4CJJ8
	cUnH49phhw4P2BJQn1oJdZP32UhWfz6Dr5pN3H6ik+UeZyTZOjrssYdSXXwPD4FT7msSP/iCG7M
	5UnrqUmZ+VSPl8Nxq+HCmM5rSFvY2IUtJFAXpnM1kNxfbUHkeyeoeMQ7OwQknrNkiF8b4uBM7Ve
	USYtFj3PjHLQARngzYj3q7PZGm7jdexe9f9lwJqjl0Ud/5Hp/vBx4S+YqM3wK/SJ4DiQEDK2RF/
	RFaugEvdBmxFRlkjSntPG7op7vFeQBY10jb+3tBtBS3BVCi36avI3uWWvvAOljLZKVCzfdp5eiE
	ww0P1KcANuAEmB+IahOL7M3sExEMJoxUA47/lMXo4a04wYx9mbLzIb9mJ7VIZoJsTaZwMZQxbsE
	TQkAew4m8A6wGFdOiJaNwaS7+gQd8Io6tUkmHnEza94+sCMOxG3RNEAjusYMamARkcSkO4psb4W
	Zc80yhgvwMYRg4v/88fkx6nENUSmUCZhNv/csIh1wOO7jOi1SL1mgGtJ3wFYmX0PwHxhhRWT5CG
	rG59xYt2FLgs4N12jekkJJoyzjnOvoUsZEgtQVynaZqMAv9HfsiYE=
X-Received: by 2002:a05:6820:7081:10b0:713:da3b:938f with SMTP id 006d021491bc7-71ab510964fmr5048738eaf.50.1794810641546;
        Sun, 15 Nov 2026 22:30:41 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71ab42c41e9sm7994558eaf.6.2026.11.15.22.30.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 22:30:41 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 15 Nov 2026 23:30:01 -0700
Subject: [PATCH v5 46/58] mtd: rawnand: lpc32xx_slc: retain chip state
 across removal
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-46-cbc49c5c5e74@gmail.com>
References: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-0-cbc49c5c5e74@gmail.com>
In-Reply-To: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-0-cbc49c5c5e74@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 James Hilliard <james.hilliard1@gmail.com>, 
 linux-arm-kernel@lists.infradead.org, 
 Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>, 
 Vladimir Zapolskiy <vz@mleia.com>
X-Mailer: b4 0.17-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261115_223043_481191_77BCC5E1 
X-CRM114-Status: GOOD (  15.28  )
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

Drain chip operations before releasing DMA and changing the controller
and write-protect signals. Retain the embedded NAND chip and controller
until the final MTD reference releases their metadata.

Run NAND cleanup during disconnection; the final core-owned put only
releases retained allocation and layout data.

Cc: linux-arm-kernel@lists.infradead.org
Cc: Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
Cc: Vladimir Zapolskiy <vz@mleia.com>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/lpc32xx_slc.c | 22 +++++++++++++++++-----
 1 file changed, 17 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/nand/raw/lpc32xx_slc.c b/drivers/mtd/nand/raw/lpc32xx_slc.c
index f75ae484ce86..85472c3d4a40 100644
--- a/drivers/mtd/nand/raw/lpc32xx_slc.c
+++ b/drivers/mtd/nand/raw/lpc32xx_slc.c
@@ -829,9 +829,14 @@ static int lpc32xx_nand_probe(struct platform_device *pdev)
 	int res;
 
 	/* Allocate memory for the device structure (and zero it) */
-	host = devm_kzalloc(&pdev->dev, sizeof(*host), GFP_KERNEL);
+	host = kzalloc_obj(*host);
 	if (!host)
 		return -ENOMEM;
+	chip = &host->nand_chip;
+	chip->controller = &chip->legacy.dummy_controller;
+	res = devm_nand_controller_init(&pdev->dev, chip->controller, host);
+	if (res)
+		return res;
 
 	host->io_base = devm_platform_get_and_ioremap_resource(pdev, 0, &rc);
 	if (IS_ERR(host->io_base))
@@ -862,7 +867,7 @@ static int lpc32xx_nand_probe(struct platform_device *pdev)
 	mtd = nand_to_mtd(chip);
 	nand_set_controller_data(chip, host);
 	nand_set_flash_node(chip, pdev->dev.of_node);
-	mtd->owner = THIS_MODULE;
+
 	mtd->parent_dev = &pdev->dev;
 
 	/* Get NAND clock */
@@ -915,10 +920,16 @@ static int lpc32xx_nand_probe(struct platform_device *pdev)
 		goto release_dma;
 
 	mtd->name = "nxp_lpc3220_slc";
-	res = mtd_device_register(mtd, host->ncfg->parts,
-				  host->ncfg->num_parts);
+	res = nand_set_lifetime(chip, NULL);
 	if (res)
 		goto cleanup_nand;
+	res = mtd_device_register(mtd, host->ncfg->parts,
+				  host->ncfg->num_parts);
+	if (res) {
+		nand_disconnect(chip);
+		mtd_put_master(mtd);
+		goto release_dma;
+	}
 
 	return 0;
 
@@ -944,7 +955,7 @@ static void lpc32xx_nand_remove(struct platform_device *pdev)
 
 	ret = mtd_device_unregister(nand_to_mtd(chip));
 	WARN_ON(ret);
-	nand_cleanup(chip);
+	nand_disconnect(chip);
 	dma_release_channel(host->dma_chan);
 
 	/* Force CE high */
@@ -953,6 +964,7 @@ static void lpc32xx_nand_remove(struct platform_device *pdev)
 	writel(tmp, SLC_CTRL(host->io_base));
 
 	lpc32xx_wp_enable(host);
+	mtd_put_master(nand_to_mtd(chip));
 }
 
 static int lpc32xx_nand_resume(struct platform_device *pdev)

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
