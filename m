Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACDA3606D969
	for <linux-mtd@archiver.kernel.org>; Mon, 16 Nov 2026 06:30:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=amZS0hSU;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=fC77j0go;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lJ7Vhgxa
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=ZqrwM4ZT/L/Z+SZkR9o+O0ltjO5nNMSN5TPA5MoKyew=; b=amZS0hSUFLVT0nhf3G/Z5H4mzz
	LOexfWYnb2b3NzfhRSb3VEoaIW7Vrw6Zv59irEg8WuOO7EaloV+UAiUvxMUma5jx2FmC8m22/2ZB9
	ryxUWS4WhjnKBpOPMj5V+pqQLQmpgNXUJ7N3rM8hLNBuIuuTrTyrxJamU8LBPBZ/5iD4shWm+qzAQ
	OvgjMyF/J8tYEKFMtGeYisKy1XFnA7s1wi1/W3TzbSWapPMyUAGDpTngi3clWzzFhkQgVXksWsUIV
	sCbRR4VSzThXVszt8ThAODOsylJVW2c+E7LEWmSLGKcn1gwZFU+6M+iaSjzSqVrToP1Bm5Yxajs2B
	gaMXkGsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSqEo-00000001GIu-1Nzd;
	Mon, 16 Nov 2026 06:30:46 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSqEZ-00000001FoV-1Qko
	for linux-mtd@bombadil.infradead.org;
	Mon, 16 Nov 2026 06:30:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=aL3SdYEEyAHQY3wjEITl3iA3pxg0pSYQTXWfqffrDSw=; b=fC77j0go+1o6dJcIUWXZ6fxpPU
	cSnkfIwjpCZ3JEf+XUNFPENH/ec5ktSFlW4ZV3WO6qi2EkGnJtcnuYHqaWuxMqYeAXtvwrYUgQUUH
	DAIeISyRvx9J4j4kWi/WTDFGqCXgRuWKY3sB4xdx5Nj4HaTvlC4lI2x9yeTrnSE/meRJzRnmCmZaM
	U7NyH4qHNQTSIPBNFmog9LUiPqySJIzuE6QWgunUfrhuCW0qVdA6t88A88hFIfKXbTtVJJ8cG7M0R
	79FJhyGb0D2HvD2GF7QLlWHqh8MEAgdrIZuUi2OyiSWvt9GN0owXA0irFopnDxmwxGhZc0HY0t0UX
	cwlh3i3Q==;
Received: from mail-oo1-xc33.google.com ([2607:f8b0:4864:20::c33])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSqEU-0000000DPFw-1vsE
	for linux-mtd@lists.infradead.org;
	Mon, 16 Nov 2026 06:30:28 +0000
Received: by mail-oo1-xc33.google.com with SMTP id 006d021491bc7-6df7f544919so2398722eaf.1
        for <linux-mtd@lists.infradead.org>; Sun, 15 Nov 2026 22:30:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794810624; x=1795415424; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aL3SdYEEyAHQY3wjEITl3iA3pxg0pSYQTXWfqffrDSw=;
        b=lJ7VhgxaepDA3UjHm42l6wp1g23uT+flyVzVMyi1hdX/UmihG55TNnJVsgiJ/LLQks
         MU0j4XIlijw17NPGeHOd9EXLbw6oXzNcFaWHb9bWAzIv08+FacL/IgFKCI++IqHeq3qc
         C+uKyeUMjteoIfnG7EcqoKB1TDibS+CAyYfMz4WzcK08dbFCBpcENG6NdN+gKOzvE5KJ
         jXjndCPPQqrIbdfui0ssMq5ByZrOcSyn9xz5mxN64uBQTtF/1o7/ETxSO1tiK8r9Omnr
         M2nKAw6cyTeSFCG56H3GjvV8fX2RTyiNqMSQepbVzpH0FPhY7ih/YBvNyR7HpSqCQXNS
         c5CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794810624; x=1795415424;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aL3SdYEEyAHQY3wjEITl3iA3pxg0pSYQTXWfqffrDSw=;
        b=ZS5ZVz2uhYhRbg7J6f3SUDmXGkIfHYd5MuZyLAKOFX7bm1PAQkNDpSZpQF2amaeVO8
         ZizDyjdk5N2Mhirn68UCsYoQipuBNRLDQpymVjpFKr/ghnKR4g0LSdvBTIPby2VaaQQf
         zw2J2BFMHcJbpIDmDxDimHu3l7OHR57BjHysfUYdfG+rysRyafkvME044Dv5b+6ckNuO
         9LuCf2/gz8sbRXptnxqudzt0aVo03IPBaAKUw9Xiku/22d2zrW4jQreOoixlhQLNGOZM
         y0BI3Hkad8eCooTeylwhiClgRDbYHXIlaxFlNAqEjt2IyI6DAsyP7NcUzEy2HrIo9P7E
         sFmQ==
X-Gm-Message-State: APuU4Z8mvusVSW1TBz0wEIRB2ddfc0sAXXhhVupnXZ53Iu51aXA8ncvG
	iAQgpnerUiXpKTy2h8eUHSJQ5YHlCIi4Nc/1iW6zkVTUf8RJok1Cmz1S
X-Gm-Gg: AYBFou2JPO5Y86xpuJ/apNpSAk8X+91QBj/emG+KnoCHVC4sL80QruFfGd4gnlP6RzF
	ESLCspv209EyHFAdFHxEgSEjUrQeQBoRaAnAg4emJsj7Z8frkMWdccIXjm1hFttZIeSmsxVGXhJ
	XlDuM1Hmr6a16eaQFc+/24Z23OhEdQzmaWNsct/s+ifdJC8jF6gGnt+aTrlZQOFEgGiy9zyFu9A
	HWt2xdlyPmKq+/5CA36MTWx3UnPQIE/htpyTIzpZHEiXZpXxmjLHzydD7v4tRBRZXE5Nbi+dxM+
	UbVBWoPWpmEuAsHxZhcqrgJFOvA/ZhFP25HhL/kVVljEnn7UGC7uxLwqLMmeLhD+tZ54t1Up2Rh
	gdRotyA0YsA3VkeTZwNUcKPxq1/GU0oUJikCHgplh4RAhmdPn+5xztgre/sLm84zBuGf9ewXou3
	byRo23vMS10iQlev4Qq7y21LOjC67uGOn1xtANSAjeXIm7l9wZn5YRYUcF0PsZSxi/2t3Qz07AO
	nA59mB8hXJh+ABk6Mx4y6RXTS/a0bJ9FsUMWIwDBbk4Meoe/K00kPiORv79+F9nGGjOcCbH7nsj
	0zZJN2bHDtZr5vhjBRMNNq2wI122Faot6Wyj9TRqMib9YtAOW+ENzFtAX3Xr4k+RT7IpmINek5F
	i0bA2aCn5Aobcw+PQSah1VxS07U6ko4XUFi9qqfVV419/pD1KMJZLP+Mv5FOERVCBRt8R+29HSf
	WOvfbQutr173w4UMgccyr11yrgGIbgxY2/928vtUGnH0KRJrAM8Pw=
X-Received: by 2002:a05:6820:f016:b0:71a:ce4f:4a7e with SMTP id 006d021491bc7-71ace4f7812mr3792885eaf.12.1794810624151;
        Sun, 15 Nov 2026 22:30:24 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71ab42c41e9sm7994558eaf.6.2026.11.15.22.30.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 22:30:23 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 15 Nov 2026 23:29:46 -0700
Subject: [PATCH v5 31/58] mtd: rawnand: mxc: retain open-handle state on
 removal
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-31-cbc49c5c5e74@gmail.com>
References: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-0-cbc49c5c5e74@gmail.com>
In-Reply-To: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-0-cbc49c5c5e74@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 James Hilliard <james.hilliard1@gmail.com>, 
 Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>, 
 imx@lists.linux.dev, Pengutronix Kernel Team <kernel@pengutronix.de>, 
 linux-arm-kernel@lists.infradead.org, Sascha Hauer <s.hauer@pengutronix.de>
X-Mailer: b4 0.17-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_063026_656581_B4A1883F 
X-CRM114-Status: GOOD (  17.43  )
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

Retain the embedded legacy controller and drain I/O before clock
disable.

Run NAND cleanup during disconnection; the final core-owned put only
releases retained allocation and layout data.

Cc: Fabio Estevam <festevam@gmail.com>
Cc: Frank Li <Frank.Li@nxp.com>
Cc: imx@lists.linux.dev
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: linux-arm-kernel@lists.infradead.org
Cc: Sascha Hauer <s.hauer@pengutronix.de>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/mxc_nand.c | 19 +++++++++++++++----
 1 file changed, 15 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/raw/mxc_nand.c b/drivers/mtd/nand/raw/mxc_nand.c
index f976cf3f7210..b68c2f13234f 100644
--- a/drivers/mtd/nand/raw/mxc_nand.c
+++ b/drivers/mtd/nand/raw/mxc_nand.c
@@ -1694,10 +1694,14 @@ static int mxcnd_probe(struct platform_device *pdev)
 	int err = 0;
 
 	/* Allocate memory for MTD device structure and private data */
-	host = devm_kzalloc(&pdev->dev, sizeof(struct mxc_nand_host),
-			GFP_KERNEL);
+	host = kzalloc_obj(*host);
 	if (!host)
 		return -ENOMEM;
+	this = &host->nand;
+	this->controller = &this->legacy.dummy_controller;
+	err = devm_nand_controller_init(&pdev->dev, this->controller, host);
+	if (err)
+		return err;
 
 	/* allocate a temporary buffer for the nand_scan_ident() */
 	host->data_buf = devm_kzalloc(&pdev->dev, PAGE_SIZE, GFP_KERNEL);
@@ -1796,9 +1800,15 @@ static int mxcnd_probe(struct platform_device *pdev)
 		goto escan;
 
 	/* Register the partitions */
-	err = mtd_device_parse_register(mtd, part_probes, NULL, NULL, 0);
+	err = nand_set_lifetime(this, NULL);
 	if (err)
 		goto cleanup_nand;
+	err = mtd_device_parse_register(mtd, part_probes, NULL, NULL, 0);
+	if (err) {
+		nand_disconnect(this);
+		mtd_put_master(mtd);
+		goto escan;
+	}
 
 	platform_set_drvdata(pdev, host);
 
@@ -1821,9 +1831,10 @@ static void mxcnd_remove(struct platform_device *pdev)
 
 	ret = mtd_device_unregister(nand_to_mtd(chip));
 	WARN_ON(ret);
-	nand_cleanup(chip);
+	nand_disconnect(chip);
 	if (host->clk_act)
 		clk_disable_unprepare(host->clk);
+	mtd_put_master(nand_to_mtd(chip));
 }
 
 static struct platform_driver mxcnd_driver = {

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
