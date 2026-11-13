Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E361606B234
	for <linux-mtd@archiver.kernel.org>; Fri, 13 Nov 2026 18:16:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=FoXYRJJs;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=H3OEki+E;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qEGJ01Pp
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=BRQCR9QZ6R5PQror06n/EicY1AJp+Awg5xsKDfdRL0I=; b=FoXYRJJslzKSonelCInPE1OUzW
	SFOxv9P55ikm5H25T2ViLVMBrOmbvN3lFVG9BhmicQyMQKZ/KwssRy3gOWCCAc21ucYHZy6yH/YZk
	8WaWdsj3VEYXdCHarXyGJtOkZUeH1lfvtbI3hauB7wgBL25AQRGxkoh1yROrJELTiqOvA3WpScHA8
	VKh3M0mJWeXBQvMlUS0DzDYShy+6GQYSkgvzbcJU+Ix2vJ37TLU71B0yeUXBYOQCYBYty7s1vuKg7
	qVl9F+jYNhJ/a1QyjD9NLMDwRtC3HrBHmaAEU2f2l86q+bvNTz0FNh74GRFkA802ecdbNDnrUZOLf
	rzJptejg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRvos-0000000DrvF-3RlQ;
	Fri, 13 Nov 2026 18:16:14 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRvoS-0000000DrB1-1PtU
	for linux-mtd@bombadil.infradead.org;
	Fri, 13 Nov 2026 18:15:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=Sg1ZNROy7Nn8Wm6oVbC3wJJVxGisZtuWu171Ny4G3fE=; b=H3OEki+EuYZBTns6QBAZ7yYb+n
	M5eKNN7S/VnaSxu6ugrfHUI2TWZOBtBunPBeeVkFNq58ZAD5zHV5HRwPyk+Mg1+5k7rdT2oiuonOC
	DoPj//ium2zKOgjWqVGFYbz64UZSf6fBHrie2qgw7r/954XPyDWrgNXBG5/V5nPfr+hmKg6/XfpB3
	GboITW4GceBMSzzBLnIjRMKBOv6M223+ST6e+3RaQFDQmGWcAXR14x84KzfqeQUguUdnLqoppcppr
	/BW524Jf1nk7rPiZvP/cxBgCPBB3WYnx+G/kvzaCwdsiA2xH6kFuKrMh2BZ86Td2j2dXArSmVao1L
	3n906BFA==;
Received: from mail-ot1-x335.google.com ([2607:f8b0:4864:20::335])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRvoP-0000000Bdj5-1XnN
	for linux-mtd@lists.infradead.org;
	Fri, 13 Nov 2026 18:15:47 +0000
Received: by mail-ot1-x335.google.com with SMTP id 46e09a7af769-85a5455bd3cso1379001a34.3
        for <linux-mtd@lists.infradead.org>; Fri, 13 Nov 2026 10:15:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794593743; x=1795198543; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Sg1ZNROy7Nn8Wm6oVbC3wJJVxGisZtuWu171Ny4G3fE=;
        b=qEGJ01PpMRPXbr3Bj2dGUbXSgXuZlR8EDfDRd2bfKgANgLdkTgXRplY+EetNzP3eaO
         4ijzuahOk1fOnr4kkifB8W2P1YGzyjdzfZ8WGvtPliLkY6IpovMvL0tUO1r014lSBu54
         Dtl0+igOiCMWZph3Es1T08RjapBiOyxPpFH7elfoIqZ3Jy5ib95mVSp2s6i3bkvDiXVv
         v4JIHNRlCjeAZmKHRL6io7+B88YvAupdjjQqSJakb6Ek/ilEed8KY6GmlEhfA4bh1/o7
         VadcwmsydHtYEssZXlSapeaT3tRSX8wgQzpCAVdgw+FXwnLewiEXgVKu2zdKyHiV911X
         VB5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794593743; x=1795198543;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Sg1ZNROy7Nn8Wm6oVbC3wJJVxGisZtuWu171Ny4G3fE=;
        b=IBQTjVEHipsCMWv2Hn01rfkEqQd8UXN68MJ8vC+uXTLnjiAb5/panImRDoUplyuyu0
         JjHvsAKl7K6dd6LmDxUxRic+YRreHHSRCxfLIRSW+5silgLuchBK4O1vVJWM7h/zqeeP
         NuVLVkf67+XCk1azkG51lUvq9kmK8lpw2/R5uBvJTQ5hWKzKGfGkP70yMBxYHL9AsHEJ
         kDWVroSLDSxcj5Vs8kuCp43pk1FosbT+mQArtSVzcUqnZwlBzZwkq8V7W9SGO9hCd1eC
         NFZZj4gx2pqR80k5gYHSJnrU//AvWDnUeQT0qU6Nd+lFJoT7S9xPGl2keSKyueG/E7WR
         v4QA==
X-Gm-Message-State: APuU4Z8nt5FpVHxirHtaKpdPWLlYd8YXuq2foj9e1vVBU0P0KzGduQbn
	a4t532/sZrNMTR1BaRxFSu8jLP+IbysxY6kGDn3F9Ea9lsbOQ8g8UlhO
X-Gm-Gg: AYBFou169VZCb8P/jXZWkOb1YU8TKAjkms4UF7PAVAroKDI3nUa7FV0k7M8rLzlnvpm
	y62nt4Ps2udXe1KvHHT23ANNtwf6VKXYaDDPPZj4C80OVzlu89V7nd0/d6r4gtRipYJLDP5nV1c
	AYMTgySc0nFWqfRyvTlDAxgeFJk3oUgSCiQ2ocNMsxpijMngEYWtgobbQUyvb2oLNm60OfpfDzv
	Dlf9fjFpucfdOWazLuwLoh2hpBmfUEeEsC/FD7XgKC8Mh8cC+GoxtFA13h5gakhGQO2vuHQnhCz
	53JVE2Ofqus7EQdK0Z4ggaITnX536WYWl5tBCZ3yOA1ygvOrf420rnnAstbFW+rjmmiPT5onGnH
	8tH7f96Cxq0+yhIQm7nFXKrFoJfEX6Lge6xhnzAVu/iAvOuMs8GCRFjxn35HzlcHaIBr3/7EYvr
	K7qspW/rCif1Qfz/x1JU3Al/3zPQvqngxrv2vGui7T4zc0D2vZQ2f4fs/SZ/ZzImg2n47Uiti2/
	gRrZ8RhVDzYRRYA4+auritu75o5yUpsGPjxJZoukzEtVUzLkiatgsW3nSDPiCgyBV8OGG87gKOS
	2tCGHJtwDIX2IosxZYu9DGwBMLdEBlsnC50TzFrXclPZcBkVctD1xQ3NUOoCarzC+uAsClZSg6l
	2b7009S02ZWvpdVegZL8gx3nvSPqKVH7oQ3o2jrZEczVgeiUWbDolsz3TayRs95VlDJQYnhM7lP
	zAXYNB53hkAHe0HxI03UHiEzMd9T7EO9p+fA20yOieM28Z5dq/+119SftsrrzWZDoKhmBs3coC
X-Received: by 2002:a05:6830:4393:b0:814:8259:780c with SMTP id 46e09a7af769-86289893186mr2921738a34.19.1794593743288;
        Fri, 13 Nov 2026 10:15:43 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-8628817d979sm3253414a34.22.2026.11.13.10.15.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 10:15:42 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 13 Nov 2026 11:14:40 -0700
Subject: [PATCH v4 24/58] mtd: rawnand: xway: retain open-handle state on
 removal
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-24-556b1d7c6221@gmail.com>
References: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-0-556b1d7c6221@gmail.com>
In-Reply-To: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-0-556b1d7c6221@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_181545_304150_C63C8BE5 
X-CRM114-Status: GOOD (  17.27  )
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
