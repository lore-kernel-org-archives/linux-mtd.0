Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7517606A8A5
	for <linux-mtd@archiver.kernel.org>; Fri, 13 Nov 2026 18:16:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=UWG0fwr3;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DiPJgPr/
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=I40VdOmHs1pTREmgH9CdKFPnSQtQF/kmnDtZAoesoMY=; b=UWG0fwr3udi69IT35lwRRWCIHe
	BJiZVjLKIiwD0dhTHIiEwFMw6XjSSYClhPL9A3fOYHN3GIFU/bLdeThDOjdQkVpVbRtUSxRb1nFhf
	J+Tbq/vBQmd3RoMmjg+OzMhItmxpSFVE2/i5fDUnRT988Iiwock/UUpG0/VaDY47HDarTeUE+bWAz
	jYpxvuO+wRAvwCoxStma6SPep6LlR7szU0Hc8WGmuH56PAS/t5YFEo/b/Wb6/emXQxTYzOLLoC/wJ
	hTl4LetLqq6sXvtZ9Jk3mt9FbrnKXmYmX8txRUcT6dZnLlNq1O8ZbdvQvZyVqKTCpQMACyDW/CQ+p
	Z9rnh5VA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRvou-0000000Dry3-06VZ;
	Fri, 13 Nov 2026 18:16:16 +0000
Received: from mail-oo1-xc33.google.com ([2607:f8b0:4864:20::c33])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRvoQ-0000000Dr7O-2TDn
	for linux-mtd@lists.infradead.org;
	Fri, 13 Nov 2026 18:15:52 +0000
Received: by mail-oo1-xc33.google.com with SMTP id 006d021491bc7-6df5e315bd1so1811537eaf.2
        for <linux-mtd@lists.infradead.org>; Fri, 13 Nov 2026 10:15:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794593745; x=1795198545; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zRAO/+Dfdvj39T/d3HsXbcwOfS2WRbpSEM9ReQOXCqc=;
        b=DiPJgPr/PzOQ4gGv2x7r+NLaz+kTUVvG223ieplUAc1DDmFuyY5oJL6vIwk+yBwgvS
         rh/Qkb8YpAQr4Kca1sv9xsBmsL6vQ2WG4egHuQE6RrnsboJSDMaXpadPDKcs2wAWGeeC
         W/wOLKZrvpGExA5/79ZGY9d00pB2u2ttJu9n2n6WQz85Oo+PPRxAb3s1mC7nIerwFZ9b
         PH2tL28MXqcocvV59YkBuFNQw31znF6ZHn5z+9bED69TRmkfrs3OwRy/bimYe56x9AEX
         bRiqlLAkebj31UmJ4K0xP6VivQFLdss5fwmstL6Mtzkd2tGnJNn/FcOriCmwV/rWH8rq
         YI/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794593745; x=1795198545;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zRAO/+Dfdvj39T/d3HsXbcwOfS2WRbpSEM9ReQOXCqc=;
        b=KqRYrNbhWUZEFkvyZraDa/30MIobzkCEJRtbAT2XMcMNouQ+Oedk62VymOUfQE4S4H
         Jv90g3bxo63FjvHlIpfJgi12fbB6fXGmoAioAc/UNDVnIqkrx+jWVQ29ab9h2higXqKr
         WcxdfmAT1keWIvfmBCIqwBUkI7W5fV7GYkF9kC6NWT65hPaC69dKtJrSOJU4DTRorYnp
         zQk1lkGeTN26vgBxGAAL61AHisE+meT53+B/gf0aXMY7fPKVoSyiVZPs+YOfq1gBBbC9
         ZbXtoyF10hvjTKJlP7Z5Sogqq3T4iZJQGXHD6bbYfSK6y9TpzV3yGZlbynsedWAJI0wr
         gLrA==
X-Gm-Message-State: APuU4Z+B1lnJdnOfI/Pa4vf9LK97qXNQ52HhZ0ZDz4t8lLZ0wbmBYfFp
	1PwoX51QJjrFu+uz2/04ctEA2AD5t8gnzOQcZViMPQqMW+gH7AbYbMiD
X-Gm-Gg: AYBFou3qqzpW8yCAfl47Z3p5m67rBG+Y2NuYRV4lwUc87BwyLGHgxSVVaDgywuovtAR
	nBu+3e2Ks8ZeazIazqxwmKw6bIuQRdvY1D4x2qdtw1r/FnRICcxJY/+XGpVwLCeKvdx1PvSnr2G
	JnqGZNBpMEIYu+Vr1gCS6i/HPXb8kqgiJz8NAXZnlGP7ng58jpADNJyokp6KNsw1VX0S1iOFvBX
	m6BeFrLHTvBK+01JhqhgFYB8TqWAqAb279rjTOA/astvkcgUYXHGR2vQ5X/DhcJ+d7pqXZ9BEGu
	2FDZMsoAMdxpHy87PSnOwwQtjfv43ZZV1rnk3h7qR2T6IbxgLVFiki84n39T9/Ag9xD5/jAM1m6
	GsARrZCARKXsWmK82J9A7PAJXZDy4A7+Ew6JuucTeCZ9kxOj78a55JJJaUkC+vNMgLFG13tQxop
	sJqnTr/EiOpOaAJ8B7fsczGb85tv2R/4WG5dftzvLGCqsS73RBuN1ZFwYK77zLGOwkONDGZ9fOf
	SfnHWHetUP8WqsKhI7m1j3GlZRU9eZKtxYWIh3gVKum91baFSWUsPPMgBIvw+y7EIznqVaWbsw8
	Kupsn5WD9k5ep5JxPwRrp5zIWItsSkgLynjhDklLIMhxhnsG5d0lOlo1S1lhPcnU5oVezRS0jb5
	qDSL/zUVkN5iglDiGTNiz9yS+2Ia+i5PVMAAkfiH+OvIjH3XzPxCyeWlBzkGPAjPUgnjpR0GxF7
	kIiyT3HGBkbZ9dFK9S2f2psPw8MSAkRTZ4MKI/gyqm7TYTgPmBTztH
X-Received: by 2002:a05:6820:1693:b0:6fb:b922:8d30 with SMTP id 006d021491bc7-71ab4d05c0cmr1995559eaf.2.1794593745342;
        Fri, 13 Nov 2026 10:15:45 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-8628817d979sm3253414a34.22.2026.11.13.10.15.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 10:15:44 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 13 Nov 2026 11:14:42 -0700
Subject: [PATCH v4 26/58] mtd: rawnand: vf610: retain open-handle state on
 removal
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-26-556b1d7c6221@gmail.com>
References: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-0-556b1d7c6221@gmail.com>
In-Reply-To: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-0-556b1d7c6221@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 James Hilliard <james.hilliard1@gmail.com>, Stefan Agner <stefan@agner.ch>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_101547_276614_3FA6D058 
X-CRM114-Status: GOOD (  13.16  )
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

Keep managed register, IRQ and clock teardown after chip disconnection.

Run NAND cleanup during disconnection; the final core-owned put only
releases retained allocation and layout data.

Cc: Stefan Agner <stefan@agner.ch>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/vf610_nfc.c | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/nand/raw/vf610_nfc.c b/drivers/mtd/nand/raw/vf610_nfc.c
index 57da9eab940e..16e84ade92db 100644
--- a/drivers/mtd/nand/raw/vf610_nfc.c
+++ b/drivers/mtd/nand/raw/vf610_nfc.c
@@ -813,15 +813,17 @@ static int vf610_nfc_probe(struct platform_device *pdev)
 	int err;
 	int irq;
 
-	nfc = devm_kzalloc(&pdev->dev, sizeof(*nfc), GFP_KERNEL);
+	nfc = kzalloc_obj(*nfc);
 	if (!nfc)
 		return -ENOMEM;
+	err = devm_nand_controller_init(&pdev->dev, &nfc->base, nfc);
+	if (err)
+		return err;
 
 	nfc->dev = &pdev->dev;
 	chip = &nfc->chip;
 	mtd = nand_to_mtd(chip);
 
-	mtd->owner = THIS_MODULE;
 	mtd->parent_dev = nfc->dev;
 	mtd->name = DRV_NAME;
 
@@ -873,7 +875,6 @@ static int vf610_nfc_probe(struct platform_device *pdev)
 
 	vf610_nfc_preinit_controller(nfc);
 
-	nand_controller_init(&nfc->base);
 	nfc->base.ops = &vf610_nfc_controller_ops;
 	chip->controller = &nfc->base;
 
@@ -885,9 +886,15 @@ static int vf610_nfc_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, nfc);
 
 	/* Register device in MTD */
-	err = mtd_device_register(mtd, NULL, 0);
+	err = nand_set_lifetime(chip, NULL);
 	if (err)
 		goto err_cleanup_nand;
+	err = mtd_device_register(mtd, NULL, 0);
+	if (err) {
+		nand_disconnect(chip);
+		mtd_put_master(mtd);
+		return err;
+	}
 	return 0;
 
 err_cleanup_nand:
@@ -903,7 +910,8 @@ static void vf610_nfc_remove(struct platform_device *pdev)
 
 	ret = mtd_device_unregister(nand_to_mtd(chip));
 	WARN_ON(ret);
-	nand_cleanup(chip);
+	nand_disconnect(chip);
+	mtd_put_master(nand_to_mtd(chip));
 }
 
 #ifdef CONFIG_PM_SLEEP

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
