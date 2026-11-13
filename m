Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9175A60A5BC0
	for <linux-mtd@archiver.kernel.org>; Fri, 13 Nov 2026 18:26:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=inGXe8R0;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZXOFdkwX
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-ID
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=K1x2mNj5Nak4KcczeFfDMuav8dv1CH0fr7dU4qQ3i3w=; b=inGXe8R0JeWO2ay2Kkb5doWBJm
	l1+X5Nxsq3mfugUQNY5sB/gjJaTGFbz73fN1tMdOMdhrEHOCtnBL2pJHG891pWCQAihNE9AsiKtk4
	4krVGPe9+5+/CysIdMlhvKiwXtzbnU5OD7lXDtQ88kpqPSyIQOuzvbAjDGh8DuCtf9JgUfnS4aK99
	VTrQ8O2INxyQILdZS4RersHBF7oBYp1RfYQG5sUXz1chnCN3QpFs6qG/l30OtMuk+rpaTR5UMLMlQ
	8l8ezZM+lUZtas/1XDhO/cYf6JvASNUCkOIaLLCO8RrG9GnJPDZ427wVbVv3NGG2j3eQBUGMHhEql
	ziRpZYjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRvyc-0000000Dvl5-1DG9;
	Fri, 13 Nov 2026 18:26:18 +0000
Received: from mail-oo1-xc30.google.com ([2607:f8b0:4864:20::c30])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRvyZ-0000000DvjQ-3enP
	for linux-mtd@lists.infradead.org;
	Fri, 13 Nov 2026 18:26:17 +0000
Received: by mail-oo1-xc30.google.com with SMTP id 006d021491bc7-6b8e2d8df4fso1576102eaf.1
        for <linux-mtd@lists.infradead.org>; Fri, 13 Nov 2026 10:26:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794594375; x=1795199175; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kNGcaHU4xg09YyH3FdGk4qxS8on/P7E4zZCMCqu0z3c=;
        b=ZXOFdkwXOL9iIouIocbSKTYtGKLF2QMJfBVIk58MKsJ1GAMpzOzTsPyo5BFWd0FQ5k
         L1Zukc55QExwy1Fp6XpUDenyXg3WboWiUxS8FZpe7i9xnUak7Ou8FH3STMi1ugGqhtwt
         bRxJa7N3EnlsevWYGkY21SM7fBzFPV3PLiEhjWHhP5mUIQcs5pUDf705U5/Fv5NLGfIC
         J6UCyZuUcr8BqevMWoTyDg+FEfqXsPbL4cKvK0ptLHiPMJKtOJHR+xja2JK10VbKrBA8
         5u1Zglf4oTzVLvkaja7O0zNhQAeRd2NNEWMHDGR3N3A+Aa3BZiWbGbBfxoDM4g/0VwQF
         k1hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794594375; x=1795199175;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kNGcaHU4xg09YyH3FdGk4qxS8on/P7E4zZCMCqu0z3c=;
        b=yu+zXlgLCXxdmDKLj3D8j8T0TVtGwHPG1eSUeQU896u5mFMYAa9nt/kq67wAqZbh7N
         L7UbBtHZ+wZXDq6AI1gqSAdqgfdeeGHxf+O4EHNeMK70aOe72tVE0fOxEYD0KqwC5zlS
         ka8+eO8zcC1pjRnTwc4Ibq3yNaGxWj3cZLVRMuk7heoIU6s77zBQF1+D0+VsjaiGUUUw
         Ne/d3jlX9LMdhlh7aGD0HhZn6f7yF2CGyWfY1DVefbT27fAMM9pwOVSqTIh/6GChkeWH
         E+3jp3JVvhfGdowJDVCnje79J2zkzDN41Ql8bPxfieZKJYjEFKj+6vrgrdx4j5Hm4tra
         ui/g==
X-Gm-Message-State: APuU4Z+3RnsMB684hEzX4vU6+o5FyTEFZ75uCmebzOlZ+36BUR8w6dj8
	LBsp1LlM6SRjq/R0WCayw/UdTFu2iUDDdHqWhLwZEAp9C/d2XyqJx03u
X-Gm-Gg: AYBFou1yffefrToJ2081FT+ipB895HePLPuLXZizKBB/v4nMfX6KkESVIYvOK/0zwxJ
	7UY2hNBpmzhDBLdzV1dBmefyH6mvyQAYgeWJlSA4AErVnHs9lcl2AIV0U1f+6Y+vDsz2Gg4LjPx
	msvF2XKb6+l+O/mT1gRUjI8UygQAolERYRAyC/rdnYWaAPLYqL9vKbym1aqNiNq39Fkx2/oK1ie
	pIoJZ2ZBL2YBCoUgeSzqBWUBqGgeYvjt51SeCYFkWdhDCPJKDC1jRFBBLdKb7FQa5juyW7xBezB
	wVWXBeY7MvJMYovZfCUTaQEJytTeWCrGGAKgoUmJYuE4Y8Yz34/Ax2GlDZv2DjmvVfOUGVWxRNW
	D02sH9h4YCEmcbfQuFQv5zUTXHoRT7DlOEhXhu8dQdSjSDxIhYzo5zAy6xt9XBWyxe1/vh5nyWg
	RGzuQX2Mx9y8fxSBnBRjvGbD7RNiKFmFcePxapSTIJG12Xj9sKUpfuCnTnnEhvXOpo413FVYx8p
	vdqeqKYvXhuTFCaT1zWKE1kftxSqvhVnoIfiGmUJCRI9tx8l8h3BULhfqKhek6X3SOjg+4oq7fW
	0XDuf2K9lIwM1IgYGrxkmiCEH0Q8udtYMH62OYJBYy7UbX66kalsEKV6R7PpSe0z0bjQbAYlmW1
	tWLULVmC2FNiER6GN2RAoo0wRh4M0mwYaUNzC7NN/XwDe9SGQ2ZOy0fosX1dipqGV02Fxc59eRu
	o64RWwSDi51JmSnYfOQfQqvXnxYHkIvlK8O50yEKvS2kU5/9dzcOw=
X-Received: by 2002:a05:6820:a285:10b0:716:f44b:2dd6 with SMTP id 006d021491bc7-71ab4fe1152mr1411891eaf.25.1794594374727;
        Fri, 13 Nov 2026 10:26:14 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4afe2011c25sm1887061fac.2.2026.11.13.10.26.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 10:26:13 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 13 Nov 2026 11:15:05 -0700
Subject: [PATCH v4 49/58] mtd: rawnand: txx9ndfmc: retain chip state across
 removal
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-ID: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-49-556b1d7c6221@gmail.com>
References: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-0-556b1d7c6221@gmail.com>
In-Reply-To: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-0-556b1d7c6221@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_102615_923330_84FFAA92 
X-CRM114-Status: GOOD (  15.60  )
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

Retain each chip and its shared controller while MTD references remain.
Unregister and disconnect before dropping driver ownership, and check
MTD registration failure without publishing partially initialized chip
slots.

Run NAND cleanup during disconnection; the final core-owned put only
releases retained allocation and layout data.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/txx9ndfmc.c | 39 ++++++++++++++++++++++++++++++---------
 1 file changed, 30 insertions(+), 9 deletions(-)

diff --git a/drivers/mtd/nand/raw/txx9ndfmc.c b/drivers/mtd/nand/raw/txx9ndfmc.c
index 6fd6e530c38b..bd0cc30ab820 100644
--- a/drivers/mtd/nand/raw/txx9ndfmc.c
+++ b/drivers/mtd/nand/raw/txx9ndfmc.c
@@ -276,17 +276,28 @@ static const struct nand_controller_ops txx9ndfmc_controller_ops = {
 	.attach_chip = txx9ndfmc_attach_chip,
 };
 
+static void txx9ndfmc_chip_release(struct nand_chip *chip)
+{
+	struct txx9ndfmc_priv *priv = nand_get_controller_data(chip);
+
+	kfree(priv->mtdname);
+	kfree(priv);
+}
+
 static int txx9ndfmc_probe(struct platform_device *dev)
 {
 	struct txx9ndfmc_platform_data *plat = dev_get_platdata(&dev->dev);
 	int hold, spw;
-	int i;
+	int i, ret;
 	struct txx9ndfmc_drvdata *drvdata;
 	unsigned long gbusclk = plat->gbus_clock;
 
-	drvdata = devm_kzalloc(&dev->dev, sizeof(*drvdata), GFP_KERNEL);
+	drvdata = kzalloc_obj(*drvdata);
 	if (!drvdata)
 		return -ENOMEM;
+	ret = devm_nand_controller_init(&dev->dev, &drvdata->controller, drvdata);
+	if (ret)
+		return ret;
 	drvdata->base = devm_platform_ioremap_resource(dev, 0);
 	if (IS_ERR(drvdata->base))
 		return PTR_ERR(drvdata->base);
@@ -306,7 +317,6 @@ static int txx9ndfmc_probe(struct platform_device *dev)
 	dev_info(&dev->dev, "CLK:%ldMHz HOLD:%d SPW:%d\n",
 		 (gbusclk + 500000) / 1000000, hold, spw);
 
-	nand_controller_init(&drvdata->controller);
 	drvdata->controller.ops = &txx9ndfmc_controller_ops;
 
 	platform_set_drvdata(dev, drvdata);
@@ -361,7 +371,20 @@ static int txx9ndfmc_probe(struct platform_device *dev)
 		}
 		mtd->name = txx9_priv->mtdname;
 
-		mtd_device_register(mtd, NULL, 0);
+		ret = nand_set_lifetime(chip, txx9_priv);
+		if (ret) {
+			nand_cleanup(chip);
+			txx9ndfmc_chip_release(chip);
+			continue;
+		}
+		kfree(txx9_priv->mtdname);
+		txx9_priv->mtdname = NULL;
+		ret = mtd_device_register(mtd, NULL, 0);
+		if (ret) {
+			nand_disconnect(chip);
+			mtd_put_master(mtd);
+			continue;
+		}
 		drvdata->mtds[i] = mtd;
 	}
 
@@ -376,18 +399,16 @@ static void txx9ndfmc_remove(struct platform_device *dev)
 	for (i = 0; i < MAX_TXX9NDFMC_DEV; i++) {
 		struct mtd_info *mtd = drvdata->mtds[i];
 		struct nand_chip *chip;
-		struct txx9ndfmc_priv *txx9_priv;
 
 		if (!mtd)
 			continue;
 		chip = mtd_to_nand(mtd);
-		txx9_priv = nand_get_controller_data(chip);
 
 		ret = mtd_device_unregister(nand_to_mtd(chip));
 		WARN_ON(ret);
-		nand_cleanup(chip);
-		kfree(txx9_priv->mtdname);
-		kfree(txx9_priv);
+		nand_disconnect(chip);
+		drvdata->mtds[i] = NULL;
+		mtd_put_master(mtd);
 	}
 }
 

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
