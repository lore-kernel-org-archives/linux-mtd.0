Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 005D5606AD6A
	for <linux-mtd@archiver.kernel.org>; Thu, 12 Nov 2026 01:29:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=WiXq/O3J;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DWdBIx47
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=m14vJckHpWOqhmHzHxa5HDTnF1TdryZQFZWnmHmMyDU=; b=WiXq/O3JK7xU55M7vXTTP7KUeN
	iRQBls9mvIVl8fmLbGeOCH4Esc3qpCp85TjDWN4Wy42qOxbHfGt2RVutl/RX+JoufENKhq1iKzNCz
	JcE/OUgQ6veYfE36XTZxNPmfgEc7W8HcqumNbhzKT3vr+XO0iyhMNI1bojE1vGn2zSjnI6nnbi6K8
	xltOK/BX8zz/P9iWSyTWxqxKJuOt9i6T9rvEFB+0Bw0BIiGE8bAoYKUVRR3d7W3/O/rkq5ZwWNQZM
	XHwV9rS6YilHQp4cgwhowTy9odomFORwbqRUsIFhs7Sp/QQ/MXFfl6Qbtomql2lWogG0ti9tHIaI8
	Wl2hWBnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRJcl-00000008MAw-28LL;
	Thu, 12 Nov 2026 01:29:11 +0000
Received: from mail-oi1-x234.google.com ([2607:f8b0:4864:20::234])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRJcP-00000008LSy-0lof
	for linux-mtd@lists.infradead.org;
	Thu, 12 Nov 2026 01:28:55 +0000
Received: by mail-oi1-x234.google.com with SMTP id 5614622812f47-53ec92375d2so1479108b6e.1
        for <linux-mtd@lists.infradead.org>; Wed, 11 Nov 2026 17:28:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794446928; x=1795051728; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FraXL6TvEduJvf5AaveEnMU+FvEiUNO/y+vqECKLnSg=;
        b=DWdBIx47OiBwmOY4OLXEF+Urr20hO2V2yN7exjIXna8jA8XtkM41mAXFSfcQdjSlJn
         JIh8YntRXXHSqKAsT5a5qEyzrdXy+6gZmBxejiQ9N/lWV/CdLPAfC0czqv9sKzH8uM/q
         HIoWwWFZ74mjPmSshwDbBW+zOahaoe0zKN7UKFwZ6BqVdQQBtfe5yHxrB4FsxwjJq1lU
         o+h9LdFilUiqtQvyXxrMoybeEttcV0GFVClGnEozg4smh5EGucYzsFeZM4rSPNPxBmCk
         Tp6hlG5iTDv7LX16Jvopml8lpGLfvdU05JZbGwa0kXptutoBSA8c2qluEeuT8x/kJIlM
         Hhlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794446928; x=1795051728;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FraXL6TvEduJvf5AaveEnMU+FvEiUNO/y+vqECKLnSg=;
        b=XjmV1GLK08xxXWa9ZyMxcTBC6Loz31c3gny/u66HeNnd3PxT8skrdEwR98f2datpnj
         WUthRPc31Cmo72rjEeqXP/jUQPsomZ2va8TJSQ9hWMkB74YheRezUp9hU+DsGXTPQvsS
         PJJYGi6DHknCZixdHtzPQi8VPvRsLruC5Kfp9Lo+jgKqUCR6qKglGzbkr/83w2Wp17c+
         3kImPBl7VOWqLGYi0K209L2k2l4AX/2JKGnP7Y1UKIbQkkQMfw5mX3ADzelWhEeDZv5i
         xyRD6oRQdUL7nCUPqWeNpf+bvEvnzzixnIq/ex7hTMUk9tdbT0Fdl3QZJmUj3lMA1YDK
         bhqg==
X-Gm-Message-State: APuU4Z8cTRuE7hlvDvnu4B4cKLEroUtmmybSb8BsHS77ulc7Rw/8DAkI
	BoCHxr+Z6YiOgT82X/uKoQ7a+6gGJ2VRak+AFkfxpTSpfyH1C/Tk4x8L
X-Gm-Gg: AYBFou2rHJ0QiFQ/fadDNBc0UYISSEKtS9OF2gMCGXC1gn2CGfmdaeaoNKLXzaxp7AJ
	dWcXTbcsrpMwMTP/HdswrPbg+7tqhKRdoeDt//8DWV1rJy1Hx4Pja6LCdxS4GUykOlfet8m7MJk
	W+F6n12xOZxHivWwyGiGFn1uEj2UQt5bUIMTU9C6i/v+c7+E5kY1aGRAFJeLwID8m0rrjI1zJBM
	hX9e9YaBhfdo4CGihcfL/FihRK1YG3466bjXpGOrTP+2z8tFPdQQO5WIt/ladaNAQFn+yVMQTzj
	DUaGIN23AuX9oWm7boUGz/U58ylfYR5vXMgLMoZqeLJfxTC8DnRndyNv7JiDzJm4q7i1cc8Peyf
	hdhO4iYtV2ASJwbjkzg7fEYl2l/mUksSsFyXTIP0GctulgTTDOKVeZtIrzJJwFQwEwXzb9+VPs5
	3AG2ZmuleLm4l1dkXfM/0e1zhqqT76DtOHkaVySoi2Bk2YiJYh+dYr8ssU8klf+x+MANYBg8Ydx
	15DR1WLwDGM0FC2WZPXl+jtGypigTYDWSJSQcgIMAzec0yD3eQB0CA6dN8TyFuHN8L65rmbLjHN
	zzzg7vq+gKnuI11FMfgHBXjMDh0e1MsQVEyFbsHLM7Tx6yJQB/dhQfyDPpkSY+nVcavhU/bmhhE
	QP+zJUJ7MMOIx/ZEOGfbK10uxSoSp1NMo9TS8p+iMQVeqgM/yK99iIsOkro/47c16OpxZx5Gx0X
	uwDFzoelRS7L7UroSgtYUo1y/TCYl7M/LO0J13ctDsdeU/KcaRit6XXZkCJPK59ujhjeaPohQzx
	w==
X-Received: by 2002:a05:6808:1924:b0:4d6:92b3:5c8d with SMTP id 5614622812f47-56b98d27ee0mr4382489b6e.67.1794446927783;
        Wed, 11 Nov 2026 17:28:47 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56905738049sm6823481b6e.10.2026.11.11.17.28.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 17:28:47 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 11 Nov 2026 18:27:56 -0700
Subject: [PATCH v3 17/58] mtd: rawnand: rockchip: retain chips across
 controller removal
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-17-ce537999741d@gmail.com>
References: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-0-ce537999741d@gmail.com>
In-Reply-To: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-0-ce537999741d@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 James Hilliard <james.hilliard1@gmail.com>, 
 Heiko Stuebner <heiko@sntech.de>, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, 
 Yifeng Zhao <yifeng.zhao@rock-chips.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_172849_451793_6BB00CAC 
X-CRM114-Status: GOOD (  15.73  )
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

Keep chip metadata and controller storage alive for retained MTD
handles. Disconnect each chip after unregistering it and before
releasing transfer buffers or clocks. This also lets unregister
notifiers finish using those buffers before hardware teardown. Free chip
metadata on the final MTD put.

Run NAND cleanup during disconnection; the final core-owned put only
releases retained allocation and layout data.

Fixes: 058e0e847d54 ("mtd: rawnand: rockchip: NFC driver for RK3308, RK2928 and others")
Cc: Heiko Stuebner <heiko@sntech.de>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-rockchip@lists.infradead.org
Cc: Yifeng Zhao <yifeng.zhao@rock-chips.com>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/rockchip-nand-controller.c | 41 +++++++++++++++++--------
 1 file changed, 28 insertions(+), 13 deletions(-)

diff --git a/drivers/mtd/nand/raw/rockchip-nand-controller.c b/drivers/mtd/nand/raw/rockchip-nand-controller.c
index 1e56e5e41f79..1616c9335e38 100644
--- a/drivers/mtd/nand/raw/rockchip-nand-controller.c
+++ b/drivers/mtd/nand/raw/rockchip-nand-controller.c
@@ -1134,8 +1134,7 @@ static int rk_nfc_nand_chip_init(struct device *dev, struct rk_nfc *nfc,
 		return -EINVAL;
 	}
 
-	rknand = devm_kzalloc(dev, struct_size(rknand, sels, nsels),
-			      GFP_KERNEL);
+	rknand = kzalloc(struct_size(rknand, sels, nsels), GFP_KERNEL);
 	if (!rknand)
 		return -ENOMEM;
 
@@ -1144,17 +1143,19 @@ static int rk_nfc_nand_chip_init(struct device *dev, struct rk_nfc *nfc,
 		ret = of_property_read_u32_index(np, "reg", i, &tmp);
 		if (ret) {
 			dev_err(dev, "reg property failure : %d\n", ret);
-			return ret;
+			goto free_chip;
 		}
 
 		if (tmp >= NFC_MAX_NSELS) {
 			dev_err(dev, "invalid CS: %u\n", tmp);
-			return -EINVAL;
+			ret = -EINVAL;
+			goto free_chip;
 		}
 
 		if (test_and_set_bit(tmp, &nfc->assigned_cs)) {
 			dev_err(dev, "CS %u already assigned\n", tmp);
-			return -EINVAL;
+			ret = -EINVAL;
+			goto free_chip;
 		}
 
 		rknand->sels[i] = tmp;
@@ -1174,19 +1175,20 @@ static int rk_nfc_nand_chip_init(struct device *dev, struct rk_nfc *nfc,
 	chip->ecc.engine_type = NAND_ECC_ENGINE_TYPE_ON_HOST;
 
 	mtd = nand_to_mtd(chip);
-	mtd->owner = THIS_MODULE;
+
 	mtd->parent_dev = dev;
 
 	if (!mtd->name) {
 		dev_err(nfc->dev, "NAND label property is mandatory\n");
-		return -EINVAL;
+		ret = -EINVAL;
+		goto free_chip;
 	}
 
 	mtd_set_ooblayout(mtd, &rk_nfc_ooblayout_ops);
 	rk_nfc_hw_init(nfc);
 	ret = nand_scan(chip, nsels);
 	if (ret)
-		return ret;
+		goto free_chip;
 
 	if (chip->options & NAND_IS_BOOT_MEDIUM) {
 		ret = of_property_read_u32(np, "rockchip,boot-blks", &tmp);
@@ -1197,16 +1199,26 @@ static int rk_nfc_nand_chip_init(struct device *dev, struct rk_nfc *nfc,
 		rknand->boot_ecc = ret ? chip->ecc.strength : tmp;
 	}
 
+	ret = nand_set_lifetime(chip, container_of(chip, struct rk_nfc_nand_chip, chip));
+	if (ret) {
+		nand_cleanup(chip);
+		goto free_chip;
+	}
 	ret = mtd_device_register(mtd, NULL, 0);
 	if (ret) {
 		dev_err(dev, "MTD parse partition error\n");
-		nand_cleanup(chip);
+		nand_disconnect(chip);
+		mtd_put_master(mtd);
 		return ret;
 	}
 
 	list_add_tail(&rknand->node, &nfc->chips);
 
 	return 0;
+
+free_chip:
+	kfree(rknand);
+	return ret;
 }
 
 static void rk_nfc_chips_cleanup(struct rk_nfc *nfc)
@@ -1219,8 +1231,9 @@ static void rk_nfc_chips_cleanup(struct rk_nfc *nfc)
 		chip = &rknand->chip;
 		ret = mtd_device_unregister(nand_to_mtd(chip));
 		WARN_ON(ret);
-		nand_cleanup(chip);
+		nand_disconnect(chip);
 		list_del(&rknand->node);
+		mtd_put_master(nand_to_mtd(chip));
 	}
 }
 
@@ -1381,11 +1394,13 @@ static int rk_nfc_probe(struct platform_device *pdev)
 	struct rk_nfc *nfc;
 	int ret, irq;
 
-	nfc = devm_kzalloc(dev, sizeof(*nfc), GFP_KERNEL);
+	nfc = kzalloc_obj(*nfc);
 	if (!nfc)
 		return -ENOMEM;
 
-	nand_controller_init(&nfc->controller);
+	ret = devm_nand_controller_init(dev, &nfc->controller, nfc);
+	if (ret)
+		return ret;
 	INIT_LIST_HEAD(&nfc->chips);
 	nfc->controller.ops = &rk_nfc_controller_ops;
 
@@ -1449,9 +1464,9 @@ static void rk_nfc_remove(struct platform_device *pdev)
 {
 	struct rk_nfc *nfc = platform_get_drvdata(pdev);
 
+	rk_nfc_chips_cleanup(nfc);
 	kfree(nfc->page_buf);
 	kfree(nfc->oob_buf);
-	rk_nfc_chips_cleanup(nfc);
 	rk_nfc_disable_clks(nfc);
 }
 

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
