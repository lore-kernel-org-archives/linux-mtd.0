Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECB7F606A335
	for <linux-mtd@archiver.kernel.org>; Mon, 16 Nov 2026 06:31:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=bewFV0/8;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=OhhBN7wm;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sKe6wv3m
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=BRQCR9QZ6R5PQror06n/EicY1AJp+Awg5xsKDfdRL0I=; b=bewFV0/83kzlwgn1IH0zMTkGby
	UJ+Kdp0FCPpXQSFI6/OaAv6eOgx1FVOHvyg/Ich7OwSvU9Kw4puS3TVkkNQ680CHLww9PnaXF1sPY
	0UJ4jofUD24CcqMTd3BcAlXY1Kwn0wxEkgmlO8Xp1vqPAoe3xSCJ9aLR+g0PecynaCLcekc1MGYU/
	Fx2EXrHINKN8fMPIMAhjZ3k1kTWMcWvtOqRcPs6ZwepUKCVMvuKpZFSCdkXigfw5BI+g6o4mEL8uy
	ylOq6QYBWUyGdTAj87Okd4+qtQQvA1LmQq/nDpn/j8OLvJFsMCNOqXTyy2AnWNN7qIz6lvcVRL/l6
	3Uq1HECg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSqFO-00000001HMQ-0DE4;
	Mon, 16 Nov 2026 06:31:22 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSqEp-00000001GHA-2YsA
	for linux-mtd@bombadil.infradead.org;
	Mon, 16 Nov 2026 06:30:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Cc:To:In-Reply-To:References:Message-Id
	:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=Sg1ZNROy7Nn8Wm6oVbC3wJJVxGisZtuWu171Ny4G3fE=; b=OhhBN7wm2XDSihTK1MCFZUH38F
	Zua9gfrxOxKemHBOshlBNpLyG0pMeERN9GKx7HpfKOJ9evR/E+UYQkrCzH+IDmDxSWDG3dgEEtwG2
	xC2qdzghPVATfu+2q4bw4PT7uuYvSWhQVX63SK1Zp5xI8u2s3ABr+jSsOB4/fc1URSqbaqgw2sEAK
	2V1kGNoWGWseFQmQ53sZBegDrfjqwflotVt4WRmKeSSt+gb/FiD/XkYatBF6ZarZ8v8pdkliLEVh6
	dML8AwNPqELeES026EkIQOBcNqCWNl+jzTzwQNgLy5TtwFHxJtbib6MgKIy3zn7Ldus7Tsp4s40Ji
	WChAqv2w==;
Received: from mail-oo1-xc2e.google.com ([2607:f8b0:4864:20::c2e])
	by casper.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSqEM-0000000CeP4-2NtM
	for linux-mtd@lists.infradead.org;
	Mon, 16 Nov 2026 06:30:44 +0000
Received: by mail-oo1-xc2e.google.com with SMTP id 006d021491bc7-6df5e315bd1so3352020eaf.2
        for <linux-mtd@lists.infradead.org>; Sun, 15 Nov 2026 22:30:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794810616; x=1795415416; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Sg1ZNROy7Nn8Wm6oVbC3wJJVxGisZtuWu171Ny4G3fE=;
        b=sKe6wv3mxuhl1U839K8EynNsUVoDqeYz7OazVQwcotf28oMopgRGvwmYHO/iBMZ47+
         GAXoswMy5Eav66L7SaGqu+S02zN2+84ws+ZfSeGcENmiFh3GL/AooBQgcgq3bliLh3wX
         157dGySE4AeKD7UfMDqxnlAarFej3u8iB8sA/StSHDBTyAG0MvjHh0+CEBv6Ok9brvHH
         m77g9+2Q64aJ5qf+wKK+WXDqeyyrPEIT3pHRxPFWMpPjLyHeSON5j82O6/HujzWkPwKj
         Oy4OiWY/ztTxRkaXGrn23qbc8COk3+i/gRbCX86Hwvex8KgeyVx//IfSUNZr7SGtyT6v
         vTxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794810616; x=1795415416;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Sg1ZNROy7Nn8Wm6oVbC3wJJVxGisZtuWu171Ny4G3fE=;
        b=rSeGSbXl7s73ZULHDqHSu86oLzf67VxxVGqPvihBmeGFuORvv1RgP89SchsLeo7j0w
         k8qkAGadS8l84U1T+RZDOFWh6UzmfAnz1jSmZg4vfIvvRn5nauWHnxHQ/9+BETFTmQ7r
         scgX2gePrwxHr4bpdLx6NbGq5SkYsXfQP/VUK8xefxaP0tWlscALy9Yuxof6DPEbxabo
         r4qwMyrEQ/CmjoWWUvR+Un1G9SvEumZc8fc2Egzi/w1jd+3zNMamBMMOg5vM2PclCXh5
         s3iVHuXQvBWhiLvh9jfatkUVfNJ2LuusU+C4b/p1bUnz5Pqh8Yc2n4M3zM47fokGouma
         O9ZA==
X-Gm-Message-State: APuU4Z/HwejfJlob0KckiY392/1jj18wvo5bT11jaz+y0AjHPhgk9tsY
	Uqsm2tcrmtNc7MRj/ZeXN3nidkqDMhfL9qXjrThWC1O7LOuypYfVg4Sp
X-Gm-Gg: AYBFou1HO4BjKd7SKgksAy/sIKZmz+H4hmAgEz2TFoa1rUpBTPXkR3nvLc5AiMuKaMn
	sSbE8rNXLx/CPD5Ln53x3gKgoCJWKHVFAnKEL4XJKlpPz5HKAc+0kcKmn8i2SwNQCn5xW/twl/X
	UKcCQ2ahBjE8dsBjYxjg2q0wpOEALb5Aw7iQQ6UGZoRooo8iKtSk1qjkpIzokH9HrbwMUTKOLv3
	dtcZmQdN75z7PqZHE68g+TTyU+0E1AnV2LGnd4wb6CEJnqzkviCCE6xA3C4IeybdOO9m/bP8EdW
	zyysGligrOf3Ni+HadUWT+KzittPYkq5rk46sR/8918ChthdmjTpzoJT7dfKnehZFqcAa4X+Sq2
	83GtzDKUFb53vJFqQqYdqSw0a2ReRuDots0zk0hIobVltt5skLAe3CMph5vKwlQz7VUA1avN6hY
	JUxbcjmII+RnoDhq8dqTS0cOhHrn6Ut0kZxobFMQqYFzYYAHVm6xcQkb4fWlZBGRIUKSHFEot78
	xpOQ9N9WasM3JuFTd/CJ/eMgZ1VTZwlzSzB6Mx5qE0BX8HtY62igKyQEbhvAF3DEHsNH4Kh6XN/
	wM794jbvS9NSuTm7cPTUv7hEB0fHR5KVmcqJLai/U+jf3Wtbr2IwRZTCqh3llsGmuJ7J/pDNIjN
	5lj7yABObZgUkRrOdlWQ/TNrDvc+TLOo6IxrYH4dzpRnEY9A0H/u6s0wj2ktXOWLygW5O0VHHME
	vVdREIJWrjC88BVFYrrFDgqNbiU4D4loOo1FahzJaBvSTfIbW8I5I=
X-Received: by 2002:a05:6820:1693:b0:6fb:b922:8d30 with SMTP id 006d021491bc7-71ab4d05c0cmr6181022eaf.2.1794810616246;
        Sun, 15 Nov 2026 22:30:16 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71ab42c41e9sm7994558eaf.6.2026.11.15.22.30.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 22:30:15 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 15 Nov 2026 23:29:39 -0700
Subject: [PATCH v5 24/58] mtd: rawnand: xway: retain open-handle state on
 removal
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-24-cbc49c5c5e74@gmail.com>
References: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-0-cbc49c5c5e74@gmail.com>
In-Reply-To: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-0-cbc49c5c5e74@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.17-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_063019_146306_02BC2E1E 
X-CRM114-Status: GOOD (  14.66  )
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
