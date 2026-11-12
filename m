Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50A526073FE2
	for <linux-mtd@archiver.kernel.org>; Thu, 12 Nov 2026 01:29:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=vdaf0Ib5;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jOuB4hXa
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=BRQCR9QZ6R5PQror06n/EicY1AJp+Awg5xsKDfdRL0I=; b=vdaf0Ib5RiKzXa04aYhl6Hxxj8
	ln8aMB+M6ciRKVI+0Ax7gyLeQ3IvAKv1sCh3hnmEBVdK9jdh6oqXl6YU5KtPXLXnf32Rss6UyHcev
	+31eZ0JlA3Vh00W19tWV9HB8F0Vj7S9hwZUbCO7INEodSqf4m5+QTYcsNum2rCZb/xl/Y6Upak20u
	YjLgGzAYQ8kUrb0OlUZjHGN8bIxdrjbPetZBjIhLHA8LbFcEWxlqnx+6uaQGpxUJPRjo8FZtgVAag
	ad1NCrgnoI5NKS2FKzr/174oGjVDusoYwUQ/RPaE+GivqPtLmM80XTI0z5c1YE6Nxci8yZxOaJ/sB
	oIf4RS3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRJd1-00000008Miu-3Gn5;
	Thu, 12 Nov 2026 01:29:27 +0000
Received: from mail-oi1-x229.google.com ([2607:f8b0:4864:20::229])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRJcW-00000008LlC-3WAs
	for linux-mtd@lists.infradead.org;
	Thu, 12 Nov 2026 01:29:08 +0000
Received: by mail-oi1-x229.google.com with SMTP id 5614622812f47-55651e7de9bso1910665b6e.0
        for <linux-mtd@lists.infradead.org>; Wed, 11 Nov 2026 17:28:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794446935; x=1795051735; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Sg1ZNROy7Nn8Wm6oVbC3wJJVxGisZtuWu171Ny4G3fE=;
        b=jOuB4hXab3hUk1j268b4C6pCsWMYXZoNodYP6mWZ4q8IQH3j3kCagWQ02eeZAu/B+6
         5/pHqTegunx5n/5/mwC6H4X7T6UeMvF1Y+7r/faFj3UzRpiYUipP1rTjwJOnyHUbrKhX
         0CrB20aemIynQWwiZazAqKkfglKXjrYoQU7lHQUb3rMax48MTkExu9H/TWgG9Gp6QxRq
         rSuElmxt7W/QFPDoHiPcGAUX4zPmyYPkFDfXiBcuN2vcCZ1lmvyNvF5JySg3BrT22YOl
         VSQl4YXG1fYzetjQ43vLpQ++lK6baVQP/V3llCyd5fr5T3wlHHN8dYZ7G7n2vUGPGv0H
         McfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794446935; x=1795051735;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Sg1ZNROy7Nn8Wm6oVbC3wJJVxGisZtuWu171Ny4G3fE=;
        b=K2GQV5uT6QY7SThhJg1LiA2griN0VWhkzSCd00EMf3pf9MzgOAZS+yAxpP6ODJnxP9
         0TueR+LOw0G/1l/m08ZIoghU65kjQh7IkkP6vMNXq9vgTYFCaTl3HX6UvCONzvgHX7U7
         v0WKPVLIhuXHbNMNk6gstPG7dnwiE/G0wmudwcA//1eYC31SJexDaTQCLwA4CgLcnDGY
         DxZm1JQhNGtY1SAFb6b3LR0hw9hng1LD4GVs0Onyf3CMvMdCPoQx7zLFfV/VVuSE08sz
         0qFsQ+DI05+vmEDlkYpiR5uxDsE7CIRwiarXqt1kj14nijzNaWqvvO0F6gldLfC5E1tD
         VFRQ==
X-Gm-Message-State: APuU4Z99FagUdVNM2bsej8DHekvKAn9JvqZ7tM6NQJW6/ionE7uGR0Bp
	qPI6s+zSCPq2LzV+oDX8WKutSK+yLW2SkoEFQwSEa5b6XGOEg698Nwat
X-Gm-Gg: AYBFou0i++vkmHszZcPtMqDE7MtPNMLd6CC3iCwymb7Ir0knq2wbuGIK/SzMVWADoQg
	lCYZoVeJMhDK+H+2Cr8IhwcTEhyFr1Q90BdaRn+td6sPjlazPEF9WdEwNH+ea8Kzy07O1iu4zIB
	fMEK+oU/fbFwulvUieQ8N5/9OYgsG7VWArVj0DlT2yTBXjVxbVHGrFdaFc9LpLZ6RnF41EZswIT
	AJbM9HXDOJc/0Pd2IcBC93wZjyQfvKr8WXvscJISlB5jvV30XNkdqjDP/d6qS0j6UGYSLunAv9f
	IbL0GDFVSRdItn7kGRRRItWipABYqWN+9ESTd5sgwcPzDDZ6w0sXI36MT4IFgHj79GUWDoUASXx
	gfxjFm+aCNERxieB79eqoPcDshBaVdPZqHnkd+iKXZj0ELO/MlOgsFqKnAJxn71ENprhuCUhcLM
	1D3ZD/8f1StAGPzVFmkNOGv7WeMKy199iBvU6WIkAZrYDKFiMDOWzeLnmqM/LWZQ3R2gV5hZrzx
	y2gAiUn8ZrsZwoSvkMeH6NE/6GGpRwD/ZBE7C+uEuTSrlyxULVX+e6yiEIOWSlbWx5amkUMBhuv
	iCBEbyzgA0pzZw6qx0a/EZ7eu16Fva46SfORQ813pJaCX1g4Q6ELnhsTsvfOroPJsVyyXOiAk3z
	wrPR/2aGcBfeeBQ2fvztzbk1bciVeaUuUGVZnabxliB85GBg47G/P+tvlCBrKfrWtZlVMSMK602
	+BAOOk7La4HhfxP5XF836Vcij2i+705ds9/tgJLG2uiwcD7pvfowuf
X-Received: by 2002:a05:6808:16a8:b0:4f7:867a:bfa with SMTP id 5614622812f47-56b92845782mr4039294b6e.5.1794446935572;
        Wed, 11 Nov 2026 17:28:55 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56905738049sm6823481b6e.10.2026.11.11.17.28.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 17:28:55 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 11 Nov 2026 18:28:03 -0700
Subject: [PATCH v3 24/58] mtd: rawnand: xway: retain open-handle state on
 removal
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-24-ce537999741d@gmail.com>
References: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-0-ce537999741d@gmail.com>
In-Reply-To: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-0-ce537999741d@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_172856_995804_7B558C7F 
X-CRM114-Status: GOOD (  16.89  )
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

Retain the embedded controller and chip across platform-device removal.

Run NAND cleanup during disconnection; the final core-owned put only
releases retained allocation and layout data.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/xway_nand.c | 22 ++++++++++++++++------
 1 file changed, 16 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/nand/raw/xway_nand.c b/drivers/mtd/nand/raw/xway_nand.c
index 7fcefb24fc23..89c4cda08794 100644
--- a/drivers/mtd/nand/raw/xway_nand.c
+++ b/drivers/mtd/nand/raw/xway_nand.c
@@ -8,6 +8,7 @@
 #include <linux/mtd/rawnand.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
+#include <linux/slab.h>
 
 #include <lantiq_soc.h>
 
@@ -171,10 +172,12 @@ static int xway_nand_probe(struct platform_device *pdev)
 	u32 cs_flag = 0;
 
 	/* Allocate memory for the device structure (and zero it) */
-	data = devm_kzalloc(&pdev->dev, sizeof(struct xway_nand_data),
-			    GFP_KERNEL);
+	data = kzalloc_obj(*data);
 	if (!data)
 		return -ENOMEM;
+	err = devm_nand_controller_init(&pdev->dev, &data->controller, data);
+	if (err)
+		return err;
 
 	data->nandaddr = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(data->nandaddr))
@@ -192,7 +195,6 @@ static int xway_nand_probe(struct platform_device *pdev)
 	data->chip.legacy.read_byte = xway_read_byte;
 	data->chip.legacy.chip_delay = 30;
 
-	nand_controller_init(&data->controller);
 	data->controller.ops = &xway_nand_ops;
 	data->chip.controller = &data->controller;
 
@@ -228,9 +230,16 @@ static int xway_nand_probe(struct platform_device *pdev)
 	if (err)
 		return err;
 
-	err = mtd_device_register(mtd, NULL, 0);
-	if (err)
+	err = nand_set_lifetime(&data->chip, NULL);
+	if (err) {
 		nand_cleanup(&data->chip);
+		return err;
+	}
+	err = mtd_device_register(mtd, NULL, 0);
+	if (err) {
+		nand_disconnect(&data->chip);
+		mtd_put_master(mtd);
+	}
 
 	return err;
 }
@@ -246,7 +255,8 @@ static void xway_nand_remove(struct platform_device *pdev)
 
 	ret = mtd_device_unregister(nand_to_mtd(chip));
 	WARN_ON(ret);
-	nand_cleanup(chip);
+	nand_disconnect(chip);
+	mtd_put_master(nand_to_mtd(chip));
 }
 
 static const struct of_device_id xway_nand_match[] = {

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
