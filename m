Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F25D606A8B1
	for <linux-mtd@archiver.kernel.org>; Mon, 16 Nov 2026 06:30:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ZIf4pVAY;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CfWZvpfI
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=UNUETX4auAZmQElyhJmwou2/IdjVGGJtLMv8t7Va3Ic=; b=ZIf4pVAYTPt1egH0USllq1gQ1f
	MzulGhXaDABKFEz02OESxq1srivVJe16bUpXx1oURRdDfjnmI2gUGa3a/8W1UVqfcAS9BWpGtQnyR
	t0ObEeDG2tGAKulJ6L0d0oXcLF4HnVBVv/hdJnZ3lwF7ruANPTSi6EaB9mWRj2U6DdrN+Oqbz4nTK
	m3hEQLaaODPgwvuMzVlX308v21zX2tBActn6lKNjr744CtUIy60XCkzU5HrLH9iXLkU1EL3JvgOEw
	hQ6AhPDfJwvTku9hJzfMDc+0TEpQ2jb03G+AO3b37LM7D3S71wKdxD5VmFiC37xk/SqlHNPjLUxuU
	jMCEyHFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSqEH-00000001FKc-4B7o;
	Mon, 16 Nov 2026 06:30:14 +0000
Received: from mail-oo1-xc35.google.com ([2607:f8b0:4864:20::c35])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSqEE-00000001FDo-1FiW
	for linux-mtd@lists.infradead.org;
	Mon, 16 Nov 2026 06:30:11 +0000
Received: by mail-oo1-xc35.google.com with SMTP id 006d021491bc7-717080a2d50so3388435eaf.0
        for <linux-mtd@lists.infradead.org>; Sun, 15 Nov 2026 22:30:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794810609; x=1795415409; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sNo5qhtsBv7Y9DGF9dmvBQzqD4m+n2CIICREnklMfow=;
        b=CfWZvpfIYKZGXxBzQjV6UsQrGsUH/tHZZQcRUy7da6T6MWxdmzV3DlnAzcU9eGb3ss
         WeN00DzWNGVLGTchy3tFHkSG1JX97FET4L2IqdywF3fvq77fGyjYBZ96EWrOZngUfc5h
         7ExfuOikLhN19+rV/NCLJICsPk0BE3xiNXHYW4LT9tph1/g48nCkSGKYB/ckYFkT7O5S
         2+smoC1tQLTt5yb4pYemEURP8lDefmxu0uLfKEoSAlIBE7mRUwbmNvCt4PiaZyVgTN48
         ghl/NA+OaO9fDVzFnnfJW6XtFy9+6tDecHEuNzt3+qILjV9XjtLvdJT2Dy7dbijeYqy0
         oLXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794810609; x=1795415409;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sNo5qhtsBv7Y9DGF9dmvBQzqD4m+n2CIICREnklMfow=;
        b=wtPgBCc0oqtPg9D5sZ28LVkR1WeOLAYbkOiUGvXeZGuRxayXsy87VA2hO8FyZNH5Ng
         bPecV6iWaifw+fgUljrRwCVCfzqrn5SQ7Bu23IrBFGvQkfpYliIBygdxTiUjHGkKL1EA
         bN3o6qBWh7+Mvc43s7qNog8D9+9avzWzLLoj2PtF/Nlj5Cp2RIu33DBmGcKGQtaqu6Q5
         iNSDkpRmWUJU4BNzZOMQNa+TV7OQZ+DJX8bHWFO+LAakHMRnEDrRwe5IbeNkYmB3zTG+
         pE/+TrKIT8EN6ZuJl2BotSV7tMFJvhA0eB4VSyCrxyCvLe1YJt6YXT5LDwKQ5Z9UnuJu
         J1qg==
X-Gm-Message-State: APuU4Z8WbY4gkMCxdApThFMVQ8v3WdGyIb5N0cY5WH1gbqgiC6IWsIoQ
	qxBiKxDgskA6bxwWJ1A2uNyFMyUKbc9E3YZ9Wb9dFd1HopfpkQawpbln
X-Gm-Gg: AYBFou0FFpKZt56BMYK2czdUtK97HXE2OdgQyhYsFieag9IXrIQ1n0y1foYMeKvG2Qq
	0vfn2W1e9bE5+I9T7hlxxJWq7IOdHMk0kiqv/gpy5+gltVzeAoGVFaF3/R5qERgM1F7+UBW0Xwe
	fvp5+y+AJ8kElHzebXzyBptNLTpWALWNwxJPSSmnUPRkdhF4lAUoVB1DTq2M5emskZddjxOZhYa
	bJ/OabBusxARL6AmzAoP4OskIfCJrAeBUyYrSKEGtRKBxcbkXtwrH9FQ5ro5/6wViby/lE8vB0A
	zIoLbEbM1DdxsXI1Kd5ezBmBfqPbmoSJEwWtYoh3jOhB6ZO20HkH+enYcPsS5GO+c8nElEcl9bz
	gA8GhpZN/kWZMK9yIY2/pJjUDwzFZELbQ+qpnXv7IHQMrHqoMTZP7URghTkbwtNXaWCoz8CMDFU
	C70+Y6W7c9hb6c7qnrvGJW/oO6dYl7cxuNN+IMrBB/P3Gpr0dps5qKhkCV88xKr1k7nvEjB2y5r
	QVUFJFqAm2AGbPh8PrLvYkiyw6pCVFQoAyioocyPbjf5i8mz6r0jAPWY/svg1d3mI18J15h01be
	HYIl/DnjvmjzYMcrNKAnAJlEqCcubeXXYmrud/jxLW+pxjJE772O9ePoaW2dGMbX63FE0WlF90z
	KMuTBnW3P0HFoeQ5XAt0hhL428giYZ4jGxtoOYHD+9YY/VWPBfJSoXwM/aaQo89uQhfsPeMDsVA
	ScpSvi9I+cHH/2HGIcmVmDqRcUbc3eEGaCs5ylMibzhuLiKQKOQNQ=
X-Received: by 2002:a05:6820:571b:20b0:719:1803:3132 with SMTP id 006d021491bc7-71ab4f5e0a6mr4315836eaf.36.1794810609420;
        Sun, 15 Nov 2026 22:30:09 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71ab42c41e9sm7994558eaf.6.2026.11.15.22.30.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 22:30:09 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 15 Nov 2026 23:29:35 -0700
Subject: [PATCH v5 20/58] mtd: rawnand: socrates: retain open-handle state
 on removal
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-20-cbc49c5c5e74@gmail.com>
References: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-0-cbc49c5c5e74@gmail.com>
In-Reply-To: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-0-cbc49c5c5e74@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.17-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261115_223010_410789_0ACB1FB6 
X-CRM114-Status: GOOD (  14.96  )
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

Drain operations before unmapping the FPGA registers.

Run NAND cleanup during disconnection; the final core-owned put only
releases retained allocation and layout data.

Fixes: 1b578193af3b ("[MTD] [NAND] Add support for NAND on the Socrates board")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/socrates_nand.c | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/raw/socrates_nand.c b/drivers/mtd/nand/raw/socrates_nand.c
index 91d4394c1137..5b9b99bc1b38 100644
--- a/drivers/mtd/nand/raw/socrates_nand.c
+++ b/drivers/mtd/nand/raw/socrates_nand.c
@@ -142,9 +142,12 @@ static int socrates_nand_probe(struct platform_device *ofdev)
 	int res;
 
 	/* Allocate memory for the device structure (and zero it) */
-	host = devm_kzalloc(&ofdev->dev, sizeof(*host), GFP_KERNEL);
+	host = kzalloc_obj(*host);
 	if (!host)
 		return -ENOMEM;
+	res = devm_nand_controller_init(&ofdev->dev, &host->controller, host);
+	if (res)
+		return res;
 
 	host->io_base = of_iomap(ofdev->dev.of_node, 0);
 	if (host->io_base == NULL) {
@@ -156,7 +159,6 @@ static int socrates_nand_probe(struct platform_device *ofdev)
 	mtd = nand_to_mtd(nand_chip);
 	host->dev = &ofdev->dev;
 
-	nand_controller_init(&host->controller);
 	host->controller.ops = &socrates_ops;
 	nand_chip->controller = &host->controller;
 
@@ -188,11 +190,17 @@ static int socrates_nand_probe(struct platform_device *ofdev)
 	if (res)
 		goto out;
 
+	res = nand_set_lifetime(nand_chip, NULL);
+	if (res) {
+		nand_cleanup(nand_chip);
+		goto out;
+	}
 	res = mtd_device_register(mtd, NULL, 0);
 	if (!res)
 		return res;
 
-	nand_cleanup(nand_chip);
+	nand_disconnect(nand_chip);
+	mtd_put_master(mtd);
 
 out:
 	iounmap(host->io_base);
@@ -210,9 +218,10 @@ static void socrates_nand_remove(struct platform_device *ofdev)
 
 	ret = mtd_device_unregister(nand_to_mtd(chip));
 	WARN_ON(ret);
-	nand_cleanup(chip);
+	nand_disconnect(chip);
 
 	iounmap(host->io_base);
+	mtd_put_master(nand_to_mtd(chip));
 }
 
 static const struct of_device_id socrates_nand_match[] =

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
