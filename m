Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C52BB606A335
	for <linux-mtd@archiver.kernel.org>; Mon, 16 Nov 2026 06:31:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=JqonYyry;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qj2JHXJ8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=qd+10QarzHJYPbnj3Nw/WVBfZmhPYmrw50o4wLAmAHA=; b=JqonYyryDxfkBB4OvVSbCo2tJl
	H/Wu1rOHrQxGAfe0DYCQuO/eis1oK8DmVFqKhoHYAKMAey3w+QCIjITNQB9SUwYb0ZQExndtr5hVq
	n4h2nDDBDS8zL9Lf8SVYE1dBDY68855RebRTGEEBIzR9mNEeMxDaLLbqlgbhN382V46nzP4kdtbwd
	guSaiI3d9tpOBCdeh/P4VTxvrfUEuC+oN0xH/Ak6whmR7j2kIqKzOeeK8LP6qBkhPnBMYdcgmMFjZ
	RWyouOTIQneHlzNg+RjJMAsG7ZzDYRjQ5uiAgDMdckNBfyAEaaEPTaZXhVrO6INW14BU/xrTT90md
	1g5/s6tA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSqFG-00000001H4b-1rDa;
	Mon, 16 Nov 2026 06:31:14 +0000
Received: from mail-oo1-xc2b.google.com ([2607:f8b0:4864:20::c2b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSqEh-00000001Fzy-1GHi
	for linux-mtd@lists.infradead.org;
	Mon, 16 Nov 2026 06:30:40 +0000
Received: by mail-oo1-xc2b.google.com with SMTP id 006d021491bc7-6d68de53053so1979565eaf.0
        for <linux-mtd@lists.infradead.org>; Sun, 15 Nov 2026 22:30:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794810638; x=1795415438; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SubzzqvdexK4LdKpYasagIhJ9T4UYXHall1sMz1DzD4=;
        b=qj2JHXJ85OtyKrLglCWpxIkB9kONd2mBYGrq2Xk99tFud1PmGe7AYA/7RkxQM3EjCE
         Zr0kw5E+mdnGiyadu5qsrqDoBSkcE4IAh6F+908n34cZTb0s90PPylDhs4kSkZSg07WM
         E98E0AWJnorUbaEBft/iXSl55MHsfal3Na1wMLkDecnVwxZmXFc9vQmq2kjS3Wa3x5ZZ
         xYcFaJio3fS+SS7Fl/3g+W+TiaU9XzCV8YEg5c2cTev275FhFsc9777fWhxQ5sAcX+rp
         ZW5+Ho9GyYaz7+g25NDUKWkvCSq0ZBUeoShfT5ZcAJMSmq/Xv05OrQ0pGbABx2IPSnhd
         72Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794810638; x=1795415438;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SubzzqvdexK4LdKpYasagIhJ9T4UYXHall1sMz1DzD4=;
        b=1vzPXsbuAEJLR6/Bf6LYOjJcbCTxFDFW97N2dDfUCFVx/XagRUumd7mVXhJAUfqB/k
         bY6rNFJrRmztJ1kAtNHa0b467cnnqHzDxVeJq3GOzMfJl2iFPeAB9J7OfxjPSUdyg/1r
         ZmjUc0bsau7S1uUZyQW3EIDESg81mMemhhrzpRZiIrhdxFjFvacdXojyw2XwJPOAC5Yv
         EkpPVfBMCg1xZyCE+5NxIkN0NTQ1f7Vdb/1kV30vGuVueG4bVXg5GSX1PJvrGmhCWykW
         S0kJHgDHPZkkP1zU4ZUib1Bz3Hv82jMQp47NaA8rHzrkn5z6dgbgtXpUbb7K/sXpBIfo
         dJQw==
X-Gm-Message-State: APuU4Z9VkFcSxVwF0ZWU8jFPG5M4O9Rjihi7F8QFEP4yaBjRnp8q3dxp
	793V0KQ+9ymlX9yinNsgJA8xzaJppGxiqT6NwcjkxbMHHSuyAHqcFOAw
X-Gm-Gg: AYBFou02dTVlW4Ms8ltMIVqNz4TJj6AoeLRvJ6Ok1MwV4uFIPGx9Qj7aOg3vII0yYz7
	Z2cEFKhDlrril48V6ZJCS1pbHPZ6+tIlhZrZajmcO356R4LJcRX633qU5gJPwQrwQ0tcqmUzI3N
	+2/hGJm9AaThun4OOz2YMjEZb03SIx60LRfoZU0RKWTVJznBp5x5njf+P8gsdcNtwr0csiWzVoh
	92irrVP+dhCBzN4UbdypNBFm8XTHzFJtbszWA1w/fM3HaHTQM+0ZieruY5cvdZfxCb+SytJU8KJ
	V9Av2f50mcnMA/0kYuh55QX0GulohWCrrODqpgKjXy8zq70IszpQ8NcU+73cDb68dH7xFlUI8dU
	Nx8C2PW0iZRRRuCSjcQ14Pf5vXqvHueRLB0Y2U69BqiSrwARpXFbKtnVq4UtQOVjNklIGnEI3W4
	jhLeYk+Sx7L1PRV58WjOl5FfbIcZeuY2GtA7POAbKPkWpX6rXhVlGWEAXIp1p9XgaGDiDNRmeZF
	IwUYaX1DmzcuBbgZpzXUPzGmf8/edWXAyP3vALMG5GdeC02jYyHY8fM4OvPdZ46ccvoDF67AgyD
	/6PYW9cUp6DKFvtK7RdCmKSB58gdC/K/6lCMxoOomB+wD0lfe/8QhwDC/lIFpgvqOAp62B/yQoP
	/+QCmzr+8xqPxXcBiNDIf7sDEVRytVWX/RN7pF6PsQbo3Npg0q1HRzLb10f/kilkcUDWcVBVtQc
	Ybi1KoD21q0f+ZfotS5GL87/MWDMkfn1+hqVDOwixOUSuI+tJRcBz2Hj8UQux3cmhcjcyuVqTpO
	g==
X-Received: by 2002:a05:6820:a28c:20b0:71a:d99b:e86e with SMTP id 006d021491bc7-71ad99bf189mr2185125eaf.36.1794810638249;
        Sun, 15 Nov 2026 22:30:38 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71ab42c41e9sm7994558eaf.6.2026.11.15.22.30.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 22:30:37 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 15 Nov 2026 23:29:58 -0700
Subject: [PATCH v5 43/58] mtd: rawnand: sharpsl: retain chip state across
 removal
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-43-cbc49c5c5e74@gmail.com>
References: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-0-cbc49c5c5e74@gmail.com>
In-Reply-To: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-0-cbc49c5c5e74@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.17-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261115_223039_432664_7F4EDFA1 
X-CRM114-Status: GOOD (  15.15  )
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

Separate chip-select unmapping from chip storage reclamation.
Outstanding MTD references retain the scanned chip and layout metadata
after removal; new hardware operations fail once the chip is
disconnected.

Run NAND cleanup during disconnection; the final core-owned put only
releases retained allocation and layout data.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sharpsl.c | 20 +++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/nand/raw/sharpsl.c b/drivers/mtd/nand/raw/sharpsl.c
index 5aea5afd480e..8376ac823c98 100644
--- a/drivers/mtd/nand/raw/sharpsl.c
+++ b/drivers/mtd/nand/raw/sharpsl.c
@@ -135,6 +135,9 @@ static int sharpsl_nand_probe(struct platform_device *pdev)
 	sharpsl = kzalloc_obj(struct sharpsl_nand);
 	if (!sharpsl)
 		return -ENOMEM;
+	err = devm_nand_controller_init(&pdev->dev, &sharpsl->controller, sharpsl);
+	if (err)
+		return err;
 
 	r = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	if (!r) {
@@ -154,7 +157,6 @@ static int sharpsl_nand_probe(struct platform_device *pdev)
 	/* Get pointer to private data */
 	this = (struct nand_chip *)(&sharpsl->chip);
 
-	nand_controller_init(&sharpsl->controller);
 	sharpsl->controller.ops = &sharpsl_ops;
 	this->controller = &sharpsl->controller;
 
@@ -188,10 +190,16 @@ static int sharpsl_nand_probe(struct platform_device *pdev)
 	/* Register the partitions */
 	mtd->name = "sharpsl-nand";
 
-	err = mtd_device_parse_register(mtd, data->part_parsers, NULL,
-					data->partitions, data->nr_partitions);
+	err = nand_set_lifetime(this, NULL);
 	if (err)
 		goto err_add;
+	err = mtd_device_parse_register(mtd, data->part_parsers, NULL,
+					data->partitions, data->nr_partitions);
+	if (err) {
+		nand_disconnect(this);
+		mtd_put_master(mtd);
+		goto err_scan;
+	}
 
 	/* Return happy */
 	return 0;
@@ -203,7 +211,6 @@ static int sharpsl_nand_probe(struct platform_device *pdev)
 	iounmap(sharpsl->io);
 err_ioremap:
 err_get_res:
-	kfree(sharpsl);
 	return err;
 }
 
@@ -221,12 +228,11 @@ static void sharpsl_nand_remove(struct platform_device *pdev)
 	WARN_ON(ret);
 
 	/* Release resources */
-	nand_cleanup(chip);
+	nand_disconnect(chip);
 
 	iounmap(sharpsl->io);
 
-	/* Free the driver's structure */
-	kfree(sharpsl);
+	mtd_put_master(nand_to_mtd(chip));
 }
 
 static struct platform_driver sharpsl_nand_driver = {

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
