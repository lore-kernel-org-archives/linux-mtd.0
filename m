Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6E7C60A2633
	for <linux-mtd@archiver.kernel.org>; Mon, 16 Nov 2026 06:30:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=pBuliYmG;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jm0FeFPb
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=zy6PQOgpM4P7T63rRvLiQT3Onp8743+RJYmaL0CNF5Q=; b=pBuliYmGnaPssqPYUSApQHSlFY
	OTNIMUK0761VGAI6uHowP/mNMfDYDhkd8KFX8M4cjCRgxEOKSlYMWJN4lk66SJG48JihBVOCJMxbq
	fwLQW9N+mX7wnzQW8+TEO+HHhfOG26hdESXQ4YJNa1mupJUntxky2H9IED9NcYvc0ShTYRJuBkOzR
	h+ZL8hBlUvOWrcOI7eYB0T2o57aadyPHyRmsEoX2eMU7klHPdArusRQSlgIB75FLn52HslACtj3Vt
	N/o+g+LE1XQEqR7n+jtr/FE+ohWIo21O/FcfpbK44JbDwsVqjbDfnw3IRQunkVWVlPWJIu1YECSWc
	Nf9fFVag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSqEG-00000001FHb-2AqT;
	Mon, 16 Nov 2026 06:30:12 +0000
Received: from mail-oo1-xc33.google.com ([2607:f8b0:4864:20::c33])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSqE4-00000001Et0-3xkW
	for linux-mtd@lists.infradead.org;
	Mon, 16 Nov 2026 06:30:02 +0000
Received: by mail-oo1-xc33.google.com with SMTP id 006d021491bc7-6b19e291cc6so3902662eaf.2
        for <linux-mtd@lists.infradead.org>; Sun, 15 Nov 2026 22:30:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794810600; x=1795415400; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GY/HbGTlJH0mFAMxk43t2Nol/0RsWbJ0WzHGNlvzcOU=;
        b=jm0FeFPbTOqxekJ5EtleVQx3QLsCaUXlCz9y36uSDCDPt2Mhgz/hYt+S4VTOuTPBFe
         Blv5hgNhVuPmyyEOQqu5F47Pd8o5JiV3E98eQxQJm1xK4NzBhx3JIiTwWhO3SUglAkK6
         ZbXVJTHCG6kxp5pQJ2SyX5SAIVpt/73LbGnIW/UfwXpPFWk+P7AJlUKkAfzQiBCT81mB
         tFxP7LSFY1yxwIyzdXqE4Lp0ElVnnN1GvyN4BWM08mz087clu8ArrG/ghpERDFVdO2Sv
         y8WyKhTqAqLgNe4KL9LF85m2L4SZwEZbPdFXeM1QdhttoflNUANJxGQK9/2xcOp5g4Ou
         WxxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794810600; x=1795415400;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GY/HbGTlJH0mFAMxk43t2Nol/0RsWbJ0WzHGNlvzcOU=;
        b=EBWviV5PC4Gig5kuDpL1/k94r/zuHnhrS0ZOrge028UdFIPuHVqO59QCr9hKH8nZJa
         ZQOwChaJIf60Uq1+WWe1ylIS3XWHrST5h0y2tESG4EfCit/BpCfSstD+LVFnXpB8PB65
         8r7SOTc2f3E31hUfsZzNf85mk4FqB9Kd3xfL/gFeXlSzvkXVmR0uM6t/HYacKb9epFX1
         GuNCmutMyUM/dqKv3o3Ns3sWr/rKxyxsKGpZ73VL+4do0awcGdsrgV0xJMz7K7aUGu5B
         aLK0I/QprXbQJKYOiJ9rglzVf0K8lHVwit/Pftz5ki/w5O6uUmjG5tpsV4sDAjvPTDjT
         URgg==
X-Gm-Message-State: APuU4Z+1wqD/yxkx44Lj+CQ1YAvaKVvCnykZlw/ri2e6+03Evr2yOOYg
	Qm3oGoDvQabHAvo9SfQpsjwh4FJfqtK8Vaybb+Q0i4ovhqMcGumqAlpE
X-Gm-Gg: AYBFou3B5inBAPYUPvvuAlA+PNFt49fI47dxjV6eaSb7uI3UWGbNrRTvxVIRZRsnpn0
	ky2rw/0Y4yMWx58axAtsZGBDK1/6CUmfe6mZasJ6qqkDhy7JyIoIpMA+UjAGK9bMXpRFZXhHkfB
	KRZKQuctBVfiGCeokMHElROSwMrBQPdqY/9hO51zmJc+HSE783EHndA5j3kDDQ1SC47I7KEvtk5
	4cawg3S8gNtZDJ/Jkxx9I9NPnnNmvKXpLVr6G5bkVqHRqYfVwIQCxQZD1aRnWKuxzLflbjFGlQY
	mMATgzeGyqUvNpCn1gn8Es1K0K2NQbHU4W1r/K1DeyNoiHRuFyXjhcB806VjUAxhaN5XiY/5tNL
	ROIPx2ZTtc6IU1/byxiymaM4kuCw52tycDFx9pMqiJmzHssTlij2QhrlYIsV79aNeJcncnsiQm8
	Weo+OdNPB2fAiaDPib1y445mZM6w3gKjTX3pNIN9m5Cm4BrgXMpknXVcPBsY74tlPQ6iWOjtzEO
	44MLzoZp6NIy94AthqnIRo2XagxOyl3RTo5LPSO87MC5u7lU4aotzT7WgdKCRDheB4xKBiOPdXI
	0Cys8NSiyLLCHrCvs9shR8pcPVAAxCI85rSci29S7PBMMioKHNFzLktmwScmlbCnoJs86txbH64
	7vrXN4YlIOzpQ8VhI/GiLL18SqWeYfWkgm13KZoYOkwcMrGCvLBsSdQVBoHbRQwOx0uBaMJ8VQ1
	CI6rvUmfAtTRb5hz5Jie52wIXk4vfrkDWF+iIEvSay2EBjjWN7rBw=
X-Received: by 2002:a05:6820:c2c9:10b0:71a:facc:5a3a with SMTP id 006d021491bc7-71afacc606dmr274481eaf.64.1794810599616;
        Sun, 15 Nov 2026 22:29:59 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71ab42c41e9sm7994558eaf.6.2026.11.15.22.29.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 22:29:59 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 15 Nov 2026 23:29:27 -0700
Subject: [PATCH v5 12/58] mtd: rawnand: arasan: retain chips across
 controller removal
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-12-cbc49c5c5e74@gmail.com>
References: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-0-cbc49c5c5e74@gmail.com>
In-Reply-To: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-0-cbc49c5c5e74@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 James Hilliard <james.hilliard1@gmail.com>, 
 Boris Brezillon <boris.brezillon@collabora.com>, 
 Michal Simek <michal.simek@amd.com>
X-Mailer: b4 0.17-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261115_223001_144857_BD393630 
X-CRM114-Status: GOOD (  15.67  )
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

Keep chip metadata and controller storage until the last MTD reference
is released. Release BCH state during disconnection. Unregister and
disconnect the chips before releasing chip-select GPIOs, so notifier I/O
and active NAND operations finish while the hardware is usable.

Free unpublished chip allocations directly and use retained cleanup
after MTD registration has been attempted.

Fixes: 197b88fecc50 ("mtd: rawnand: arasan: Add new Arasan NAND controller")
Cc: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Michal Simek <michal.simek@amd.com>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/arasan-nand-controller.c | 47 ++++++++++++++++++---------
 1 file changed, 32 insertions(+), 15 deletions(-)

diff --git a/drivers/mtd/nand/raw/arasan-nand-controller.c b/drivers/mtd/nand/raw/arasan-nand-controller.c
index 839aef6c460b..a28daae30330 100644
--- a/drivers/mtd/nand/raw/arasan-nand-controller.c
+++ b/drivers/mtd/nand/raw/arasan-nand-controller.c
@@ -1276,7 +1276,7 @@ static int anfc_chip_init(struct arasan_nfc *nfc, struct device_node *np)
 	struct mtd_info *mtd;
 	int rb, ret, i;
 
-	anand = devm_kzalloc(nfc->dev, sizeof(*anand), GFP_KERNEL);
+	anand = kzalloc_obj(*anand);
 	if (!anand)
 		return -ENOMEM;
 
@@ -1284,31 +1284,35 @@ static int anfc_chip_init(struct arasan_nfc *nfc, struct device_node *np)
 	anand->ncs_idx = of_property_count_elems_of_size(np, "reg", sizeof(u32));
 	if (anand->ncs_idx <= 0 || anand->ncs_idx > nfc->ncs) {
 		dev_err(nfc->dev, "Invalid reg property\n");
-		return -EINVAL;
+		ret = -EINVAL;
+		goto free_chip;
 	}
 
 	anand->cs_idx = devm_kcalloc(nfc->dev, anand->ncs_idx,
 				     sizeof(*anand->cs_idx), GFP_KERNEL);
-	if (!anand->cs_idx)
-		return -ENOMEM;
+	if (!anand->cs_idx) {
+		ret = -ENOMEM;
+		goto free_chip;
+	}
 
 	for (i = 0; i < anand->ncs_idx; i++) {
 		ret = of_property_read_u32_index(np, "reg", i,
 						 &anand->cs_idx[i]);
 		if (ret) {
 			dev_err(nfc->dev, "invalid CS property: %d\n", ret);
-			return ret;
+			goto free_chip;
 		}
 	}
 
 	/* Ready-busy init */
 	ret = of_property_read_u32(np, "nand-rb", &rb);
 	if (ret)
-		return ret;
+		goto free_chip;
 
 	if (rb >= ANFC_MAX_CS) {
 		dev_err(nfc->dev, "Wrong RB %d\n", rb);
-		return -EINVAL;
+		ret = -EINVAL;
+		goto free_chip;
 	}
 
 	anand->rb = rb;
@@ -1323,24 +1327,35 @@ static int anfc_chip_init(struct arasan_nfc *nfc, struct device_node *np)
 	nand_set_flash_node(chip, np);
 	if (!mtd->name) {
 		dev_err(nfc->dev, "NAND label property is mandatory\n");
-		return -EINVAL;
+		ret = -EINVAL;
+		goto free_chip;
 	}
 
 	ret = nand_scan(chip, anand->ncs_idx);
 	if (ret) {
 		dev_err(nfc->dev, "Scan operation failed\n");
-		return ret;
+		goto free_chip;
 	}
 
-	ret = mtd_device_register(mtd, NULL, 0);
+	ret = nand_set_lifetime(chip, to_anand(chip));
 	if (ret) {
 		nand_cleanup(chip);
+		goto free_chip;
+	}
+	ret = mtd_device_register(mtd, NULL, 0);
+	if (ret) {
+		nand_disconnect(chip);
+		mtd_put_master(mtd);
 		return ret;
 	}
 
 	list_add_tail(&anand->node, &nfc->chips);
 
 	return 0;
+
+free_chip:
+	kfree(anand);
+	return ret;
 }
 
 static void anfc_chips_cleanup(struct arasan_nfc *nfc)
@@ -1353,8 +1368,9 @@ static void anfc_chips_cleanup(struct arasan_nfc *nfc)
 		chip = &anand->chip;
 		ret = mtd_device_unregister(nand_to_mtd(chip));
 		WARN_ON(ret);
-		nand_cleanup(chip);
+		nand_disconnect(chip);
 		list_del(&anand->node);
+		mtd_put_master(nand_to_mtd(chip));
 	}
 }
 
@@ -1436,12 +1452,14 @@ static int anfc_probe(struct platform_device *pdev)
 	struct arasan_nfc *nfc;
 	int ret;
 
-	nfc = devm_kzalloc(&pdev->dev, sizeof(*nfc), GFP_KERNEL);
+	nfc = kzalloc_obj(*nfc);
 	if (!nfc)
 		return -ENOMEM;
+	ret = devm_nand_controller_init(&pdev->dev, &nfc->controller, nfc);
+	if (ret)
+		return ret;
 
 	nfc->dev = &pdev->dev;
-	nand_controller_init(&nfc->controller);
 	nfc->controller.ops = &anfc_ops;
 	INIT_LIST_HEAD(&nfc->chips);
 
@@ -1481,13 +1499,12 @@ static void anfc_remove(struct platform_device *pdev)
 	int i;
 	struct arasan_nfc *nfc = platform_get_drvdata(pdev);
 
+	anfc_chips_cleanup(nfc);
 	for (i = 0; i < nfc->ncs; i++) {
 		if (nfc->cs_array[i]) {
 			gpiod_put(nfc->cs_array[i]);
 		}
 	}
-
-	anfc_chips_cleanup(nfc);
 }
 
 static const struct of_device_id anfc_ids[] = {

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
