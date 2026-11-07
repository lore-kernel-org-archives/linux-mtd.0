Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10AA9606EE8D
	for <linux-mtd@archiver.kernel.org>; Sat,  7 Nov 2026 10:17:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=tE0JBUyu;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=WB6forK9;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OkJoHxck
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Mr3O4eWih0w9ezHY4IGvLjWi5z6OjW42Ajvv/Epq8cU=; b=tE0JBUyu7BpWAEQ9zTUarwD+Ea
	mTtOjjM/CLRce7ahXdjbfCCV1iw10wKuevVwX7wu5I9+62rNBJjj3V46iO8dW4wtQUlPc1YtwFEds
	MybUBRSaI1rulzBXjoWVk5HOQCJzASpcOj6yePL3YK2CuSWGFv3wCJea/8/sISgd7po/Z3Yk9HpST
	cGpXOIa8UXb8iRwa+CAEwzuXSOQOMuByzyt3i/M2dXD0FAJmCZHnX5m7gEDY3hkpS/JcaVVtY/6wl
	5hcIfnd5ekrcDY2xDc3Z2q0LtPkYL6Z7Nkrtm5gbHFCf7oAiDQOZIdb9sGSaqb9Cr0KPc+oJPSre+
	37+6NVPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPdTq-0000000ETWB-1yfH;
	Sat, 07 Nov 2026 10:17:02 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPdTg-0000000ET9j-2GlS
	for linux-mtd@bombadil.infradead.org;
	Sat, 07 Nov 2026 10:16:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=kjPwaFDbZuTJvqjQ+cQB8B42nBaUa83lSo+JE+gssUA=; b=WB6forK9s5mqcdMqIQvw7yPgHf
	c0VsuuKrXG2B1HkUYMuCGbIARL/LRmA5S4kM69kSvMHGPOMev44OSTD5JXAiGLs//Fs7Mf3x020pG
	+Ag4pxJqTiNP3AwicPk/kTsSV+tbg2uS08cjcckJz7U0vm/ZhHV+UC2rReorG3LGjHnLCl1VCG3s6
	BiRNM4w/vl6YZonqgDMVQHn3lEDWxi4juYQFhsDBr3HTSjtxajb+8euGj+eS6T42rg8IS47drTZzG
	NwkzFxnf2+CQ7K4YI72BlXBcm9x013zQBAWu5Hwz5jrRCGesCYRZU2es2cLTovosck1gsUeH08Eds
	G/NwfEug==;
Received: from mail-ot1-x32a.google.com ([2607:f8b0:4864:20::32a])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPdTd-000000057dc-3WMI
	for linux-mtd@lists.infradead.org;
	Sat, 07 Nov 2026 10:16:51 +0000
Received: by mail-ot1-x32a.google.com with SMTP id 46e09a7af769-85ac281604dso881370a34.0
        for <linux-mtd@lists.infradead.org>; Sat, 07 Nov 2026 02:16:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794046608; x=1794651408; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kjPwaFDbZuTJvqjQ+cQB8B42nBaUa83lSo+JE+gssUA=;
        b=OkJoHxck+VMcTAS0xnYrL0kSobzuhN0x1WA5xRhxBAHU+OyCZKud98NbDtRUUIbBmr
         +y9zeXvTg4i1B0lUFRCErba040dKP41m5yOowPP9jk9FHmrKTayrkTlbHyw5SMBdH/Cg
         jQqi2EMOOGIA1IiMjIzFnz6l7aVcTsVX8nKjG/Bo0bLhPMj2U0XQChZHHImmsa166uae
         qnX5DLUQl84zFqp4j7cNCvhimBQzdB29Ih0S2NyP0G4bj8ULOIpD/bxlcPR/G3rFS+xL
         85uMyUKmH0BuT/1gc/LCE9JdzyrxMla51IGFCHupG6hoLt+s35JcMvz6ZpD6m+ppVTY6
         pTaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794046608; x=1794651408;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kjPwaFDbZuTJvqjQ+cQB8B42nBaUa83lSo+JE+gssUA=;
        b=icAMytwdS4CaGevgc51WCentspAnlkYmSXMuSDLK4IUELQ8OC/xf7Rp3isE8eCszjv
         gq8mhN5NkDeY7Tz7GxZ6Zf2DLRXDzqjITkEKfo5t9Ak8+ntzIXPM+5iDIMKHbrM4Jpw1
         AKT51leMkYe5ljXIde3HLyqeavdZTy9q/aMyeEnj81QETze7VMPYo9x2IjLJ4Gvdolgn
         IaHYYuFx+lBY8wrLVlvJ+rjhn4hTIl107cKSfSVO4D2ArjQxHvRbVuWpfsa7Sc3KGtSv
         7lj2gLjokTvD9rwnuEP/Kd1yRXvJ6Pt66QsASxY3cnEnL05jMfUKrR53HFIYrIQ+kNj+
         iC5w==
X-Forwarded-Encrypted: i=1; AKwUvBxGmxHaTKHIsKzpUpEFV8d18Xec3Z5C2Ft6Ist/qw7JQV+Giuq8r+l+8tMzdBQm7CPOhmPehnI0v+M=@lists.infradead.org
X-Gm-Message-State: APuU4Z/TBl5ApiJkoks9BV4qypENOWiI3aNxXKwGkCl4f9zVqFs47fGj
	CztPZLMkVtVBX31+iVwlKAhX4HhoJ+MT3IYjb87yVP2LHcF/z3ZXQVmS
X-Gm-Gg: AYBFou17s0RrpwRDLpQaks6AWm7fP9rxuzW2JXTXAM/mVEoad3ydESAIk7CvjkHF69R
	VZHcGYxm2IJELWcLsrtViRppQnMalRriISwWN6wdUmI6yRq4KJdWx0Hn7A2nIwi0Xin1r03zxj5
	WS0TiCm/FkIv1N2uoIscxEeMJbAM6Kro1rPWm5fA9Vig0dI8V9muvDmto75a8i7fuV8SB1y55p+
	lT3iskVNd349akP9kAC+B4b+9ClG88K490/Y3NBn6wadl05bZwitiTvoZf1f5c9PU3r6do3HdkI
	NHJks1/SWOZ/kjfv/qnDPqJaMwAYuJLtgkgptXY1skTdFSNv9ZwLQJCrlG74l8aeTXk638ODTRB
	FeTu2ImvzoBjbwsI8l1cfFOx9gdsDaSGbMUVLhUbor41uhEJaTRufnp0fS2HArqs4iycgm/zu0Y
	k7WO0+OfahAkPt+atITeRBuFgoIHnvwgzxMe3khwgASDBYdM4IfTmXgSHFr9Igs+9Yc+c5YkGwX
	5b+dknCK5UUeAH/s4IoAj7qn4kW+PIEBX7CSbnerHSpT8/ZNZO/K+pf9OIllGnpvYkMS9jy/nQ2
	//MQ0+NkaZAlPDltc73dR+o9R724KoVy9PyRbObE+kBLbcArbYMJjgjyIRIepBzT9kr+G68pT79
	F/2tcJqOl8HFeTSRZt5E+osatMLqNXfuZHmgQ5lN8SUA5BHfAYdzRhfh67jGVdQdfK2ywLb7pFv
	wsU7G5cVbytTGFloKtGNC4P3lKhi1Jh9fs/JXWeq+2npQHyHRUC46b
X-Received: by 2002:a05:6830:4486:b0:81f:b198:5b6c with SMTP id 46e09a7af769-85f1d060dacmr4931533a34.22.1794046607890;
        Sat, 07 Nov 2026 02:16:47 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85f1dbef224sm3990269a34.12.2026.11.07.02.16.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 02:16:47 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 07 Nov 2026 03:16:05 -0700
Subject: [PATCH 08/58] mtd: rawnand: plat_nand: retain open-handle state on
 removal
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-8-0181ef0cc4c8@gmail.com>
References: <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-0-0181ef0cc4c8@gmail.com>
In-Reply-To: <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-0-0181ef0cc4c8@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Brian Norris <computersforpeace@gmail.com>, 
 Boris Brezillon <bbrezillon@kernel.org>, 
 Arseniy Krasnov <AVKrasnov@sberdevices.ru>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Thomas Gleixner <tglx@kernel.org>, 
 Vitaly Wool <vitalywool@gmail.com>, David Woodhouse <dwmw2@infradead.org>, 
 Russell King <rmk+kernel@arm.linux.org.uk>, 
 David Woodhouse <David.Woodhouse@intel.com>, 
 Mike Rapoport <rppt@kernel.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Christophe Kerello <christophe.kerello@st.com>, 
 Jason Roberts <jason.e.roberts@intel.com>, 
 Michal Simek <michal.simek@amd.com>, 
 Boris Brezillon <boris.brezillon@collabora.com>, 
 Mason Yang <masonccyang@mxic.com.tw>, 
 Ramuthevar Vadivel Murugan <vadivel.muruganx.ramuthevar@linux.intel.com>, 
 Stefan Agner <stefan@agner.ch>, Lucas Stach <dev@lynxeye.de>, 
 Thierry Reding <thierry.reding@kernel.org>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Dmitry Osipenko <digetx@gmail.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>, 
 Heiko Stuebner <heiko@sntech.de>, Yifeng Zhao <yifeng.zhao@rock-chips.com>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Keguang Zhang <keguang.zhang@gmail.com>, Jacky Huang <ychuang3@nuvoton.com>, 
 Shan-Chun Hung <schung@nuvoton.com>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Han Xu <han.xu@nxp.com>, 
 Liang Yang <liang.yang@amlogic.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 Kamal Dasu <kamal.dasu@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Vladimir Zapolskiy <vz@mleia.com>, 
 Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>, 
 Paul Cercueil <paul@crapouillou.net>, 
 Harvey Hunt <harveyhuntnexus@gmail.com>, 
 Maxim Levitsky <maximlevitsky@gmail.com>, Michael Walle <michael@walle.cc>, 
 Srinivas Kandagatla <srini@kernel.org>
Cc: Tze Yee Ng <tze.yee.ng@altera.com>, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-mips@vger.kernel.org, imx@lists.linux.dev, 
 linux-renesas-soc@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 linux-arm-msm@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261107_101649_923590_5ADBC692 
X-CRM114-Status: GOOD (  20.96  )
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

Unregister MTD while notifier clients can finish their I/O, then
disconnect the NAND chip before invoking the platform hardware teardown.
Keep the chip, controller lock and software ECC metadata until the last
MTD reference is dropped.

Handle registration failures through the same reference-counted cleanup,
since partitions can have become visible before registration fails.

Fixes: 711fdf627ce1 ("[MTD] [NAND] platform NAND driver: add driver")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/plat_nand.c | 24 +++++++++++++++++++-----
 1 file changed, 19 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/nand/raw/plat_nand.c b/drivers/mtd/nand/raw/plat_nand.c
index fe31551bcf5f..8321667fae2f 100644
--- a/drivers/mtd/nand/raw/plat_nand.c
+++ b/drivers/mtd/nand/raw/plat_nand.c
@@ -21,6 +21,11 @@ struct plat_nand_data {
 	struct gpio_desc	*ready_gpio;
 };
 
+static void plat_nand_release(struct nand_controller *controller)
+{
+	kfree(container_of(controller, struct plat_nand_data, controller));
+}
+
 static int plat_nand_attach_chip(struct nand_chip *chip)
 {
 	if (chip->ecc.engine_type == NAND_ECC_ENGINE_TYPE_SOFT &&
@@ -65,10 +70,13 @@ static int plat_nand_probe(struct platform_device *pdev)
 	}
 
 	/* Allocate memory for the device structure (and zero it) */
-	data = devm_kzalloc(&pdev->dev, sizeof(struct plat_nand_data),
-			    GFP_KERNEL);
+	data = kzalloc_obj(*data);
 	if (!data)
 		return -ENOMEM;
+	err = devm_nand_controller_init(&pdev->dev, &data->controller,
+					plat_nand_release);
+	if (err)
+		return err;
 
 	data->ready_gpio = devm_gpiod_get_optional(&pdev->dev, "ready",
 						   GPIOD_IN);
@@ -77,7 +85,6 @@ static int plat_nand_probe(struct platform_device *pdev)
 				     "could not get READY GPIO\n");
 
 	data->controller.ops = &plat_nand_ops;
-	nand_controller_init(&data->controller);
 	data->chip.controller = &data->controller;
 	chip = &data->chip;
 	nand_set_controller_data(chip, data);
@@ -126,6 +133,11 @@ static int plat_nand_probe(struct platform_device *pdev)
 		goto out;
 
 	part_types = pdata->chip.part_probe_types;
+	err = nand_set_release(chip, NULL);
+	if (err) {
+		nand_cleanup(chip);
+		goto out;
+	}
 
 	err = mtd_device_parse_register(mtd, part_types, NULL,
 					pdata->chip.partitions,
@@ -134,7 +146,8 @@ static int plat_nand_probe(struct platform_device *pdev)
 	if (!err)
 		return err;
 
-	nand_cleanup(&data->chip);
+	nand_disconnect(chip);
+	mtd_put_master(mtd);
 out:
 	if (pdata->ctrl.remove)
 		pdata->ctrl.remove(pdev);
@@ -153,9 +166,10 @@ static void plat_nand_remove(struct platform_device *pdev)
 
 	ret = mtd_device_unregister(nand_to_mtd(chip));
 	WARN_ON(ret);
-	nand_cleanup(chip);
+	nand_disconnect(chip);
 	if (pdata->ctrl.remove)
 		pdata->ctrl.remove(pdev);
+	mtd_put_master(nand_to_mtd(chip));
 }
 
 static const struct of_device_id plat_nand_match[] = {

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
