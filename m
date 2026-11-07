Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 739F6606EE91
	for <linux-mtd@archiver.kernel.org>; Sat,  7 Nov 2026 10:18:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=fRhxl2bs;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=U3a5mUcG;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=b2UwixhX
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=7AIDWG6bO3u66vK/4jp4tDjfZghOX9qRmmd+Gbf6Lp4=; b=fRhxl2bszPoIn6yz8AAuha/ao+
	pmcJHEuwagL61YhNzK2c4vW5TetjwIWvdYdlX8j/Nz0XedRu6JVg64ZLWD34bLxR4hP//4eQwbVFL
	m2rSELizmrGBkefX0kXH/M+Eekj/s2jDmwQvz9EcZXpUYTOcOlqPhjevWRW6tDnAV5Y63QBDG9h44
	1JPTTk8N+TpgSzQiaTLFSDwYDpsYQw3NgIafvPwBw90SZPkjuHGs9vSNxUjlXhjlloFEvSyCs0Z8w
	2vWHQrWnmq540MSj4z+AxtNrPkVvJbjO7oayBYyfLuoop3xi3gBBRbEVXbdlA/7NuvWfWoyiuPe3w
	0xM45Q7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPdVW-0000000EVT8-3rDn;
	Sat, 07 Nov 2026 10:18:46 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPdUL-0000000EUEV-46Pa
	for linux-mtd@bombadil.infradead.org;
	Sat, 07 Nov 2026 10:17:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=FiM3FdgX/n0U5FfSnJDnohTAFRzhZZoozip4F2zbWJU=; b=U3a5mUcG+sJMBb8lCegXMhfME4
	PRaPk9SXY7heX70bLQpRAFoRB3zL9ACHmJ1lx4BQYXapZdIywqQcyPxuD2M7ENgjPQw9rdn/RgVKn
	priX5Fm8HqatFcCu49ANxdJhK04FqaI0AVtMHHD6gyfDFCbuYNB0XSK320N+vwmu3Mqx1YDr+ubua
	SSNSnGgyw/Lh0aJ1pHH2D33/FW/4wyOg0UGQ9Smwj9ZHupOt/xmnV0eOzsAw7baHd+1IQF7vL1j1X
	WSQ1W0QrJGa+wDF8Wvuqsh/OwIhJqgwtNfLTu5CcdcAiwubKr2rmcxlNS1s2TzLg9TC226ODOg0k4
	Kdh51EdA==;
Received: from mail-ot1-x32b.google.com ([2607:f8b0:4864:20::32b])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPdUH-0000000582T-23z2
	for linux-mtd@lists.infradead.org;
	Sat, 07 Nov 2026 10:17:32 +0000
Received: by mail-ot1-x32b.google.com with SMTP id 46e09a7af769-843b6f8e2c7so1882147a34.1
        for <linux-mtd@lists.infradead.org>; Sat, 07 Nov 2026 02:17:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794046647; x=1794651447; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FiM3FdgX/n0U5FfSnJDnohTAFRzhZZoozip4F2zbWJU=;
        b=b2UwixhXeTDuwWW7FeqZQSZNEEIp7BXEBPMqNwIYOURwJURzMUk5DOftmsxncQ3VcE
         Ug+xZlD6ldEAI1+REHIvuhJCpU1XQc6nuqrJLKvJnnn3Ry2aHeHq2dJNntoOzUpkdQ1h
         RAztCuyX97Xwh2wJ1SzHC4YSS7ZMAnWAKivodulDaBSaKdclW2LGB7TQiTYJY6u2vQht
         bZmBZKc4JbPzTjz+aQgGrwh850apQCgEjzwR8oZoVUh31zSx6eN6bZpT6IexvdSxLy/4
         rE0M8IPAm0csG9vENxNeoI/Y0HfeUfwajENMZeiqGghy482eDS02qRe4NikMgiyn2M+/
         m1hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794046648; x=1794651448;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FiM3FdgX/n0U5FfSnJDnohTAFRzhZZoozip4F2zbWJU=;
        b=fWwuZuLj2dBENgRu9+Z+cTpXoiSIq+uLxBwZBLIuZFrR+T9PC09kiesBDSjnP2mUGf
         9TmwX8YYd97HI3iPymjYiOx+gpesAYoH4it15XMqkJcJv9zHkAodfnepwMk6U/mbusEe
         dXXdsPMHNv3CWaDeHIbmPMPPsvv/JjGHN+lWn/eLc8vmcSrv9d7KQp5QHSBhxvowQLMD
         +KcHzgA6Lw9i+18NSZ7pdB+po30BWq26U8WrD8v+KdIUjPOndxCVRKBx6er2bOfIjafj
         4rI2XIx0XxpuHIOiCOXJlHyEzL+wt4kmJZ6fYHdV4GsYj8wT4agXHhfIomFaTu2eWE83
         1Qnw==
X-Forwarded-Encrypted: i=1; AKwUvBzFonDSZkP2aQsLV1EfwSPjn35ftuygKwL7qSQz8kM6s988HgOqmXsCUkR+fGJ2nIBepr5UktwcG1s=@lists.infradead.org
X-Gm-Message-State: APuU4Z/oaGaJBT/aAD19+2gkFs00YBLcCTlMe3EPKiYHB0nWHHl+Duoy
	ThReg55vufird7k+P8v598YQ7iLG0YzsDXYD/YbM7cQW7quSegCz6hPE
X-Gm-Gg: AYBFou1aflMBW7N1aQEx1SqvcfEjq6kR8hW8wQ6mRTT5gqmK7Yb88bI40LHpUNP2wjE
	xXPhD2iCGNnNIw0I9RgKPBNvAGeYOWZjVSAGLBfZrEW5MMO0cepB0NJGClmPll5Pm1zoU9Wrmq4
	nk0hKbUf2j/Zea1WTN7A+AazBT/RYBppu4+5fVCG8Q9v15mEYTU47CcFgisQRQ6ki5zW+cpylu1
	nqWjFGgCYWei9hBEQkE3NI7R0tKaM3Z3FOvk64JCnENs4SpdIUi5tTSGXNTmzulYfT54lFjfMVU
	3Ll0aKJaAAczMOt51tcSXhSWkLm2SW+Aqsvt9julgY21TH7JzJQ8haCiJvE7P8RELxC3ci9Gpie
	GaB9h0dZJFRVpiIjVOTC3rdI2XKBdu4Fw7e95kPrTmAatKLAV601eMazhQABIigLSH/RYNWJnJm
	LAAedd6tqKbxAbsk5kJxw9oAtXIZLzsSS5vySjaIQjHepqMZUQk4QT/AuJW50T8Fg46XgekzFwi
	OyFAwKHHtF9WdnuBdUfeXs19b+R6VgY63d7efGEbkw4rFHUoPhgfn0EZm+Un6MRvHT20DSIGFlq
	wWfqaLCjf6gfmoWgDNpseBpcLxcDowifKCWzAqOFba+ObUEQfew9WL5anDo0H8xMf3LI0Wby4nA
	JxW7PTFSemE5tQ1EiD2W1w11O7esk6g944ehxYLmfscEtK4tgyKbpCkxo9K48uYeZsD3mceyTVC
	Px+lZtmukPO5dtDGtQBPbW96vRieFtV1yTvQPe8j2yVzEJTuAj08Fl
X-Received: by 2002:a05:6830:4c0e:b0:846:7d51:d9d7 with SMTP id 46e09a7af769-85f1d18bb98mr4287417a34.28.1794046647554;
        Sat, 07 Nov 2026 02:17:27 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85f1dbef224sm3990269a34.12.2026.11.07.02.17.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 02:17:27 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 07 Nov 2026 03:16:19 -0700
Subject: [PATCH 22/58] mtd: rawnand: pasemi: retain open-handle state on
 removal
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-22-0181ef0cc4c8@gmail.com>
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
X-CRM114-CacheID: sfid-20261107_101729_555460_CF793795 
X-CRM114-Status: GOOD (  18.34  )
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

Release the LPC region and NAND mapping after disconnection.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/pasemi_nand.c | 25 +++++++++++++++++--------
 1 file changed, 17 insertions(+), 8 deletions(-)

diff --git a/drivers/mtd/nand/raw/pasemi_nand.c b/drivers/mtd/nand/raw/pasemi_nand.c
index 09409b703d93..d00d57cbb0f1 100644
--- a/drivers/mtd/nand/raw/pasemi_nand.c
+++ b/drivers/mtd/nand/raw/pasemi_nand.c
@@ -93,6 +93,11 @@ static const struct nand_controller_ops pasemi_ops = {
 	.attach_chip = pasemi_attach_chip,
 };
 
+static void pasemi_nand_release(struct nand_controller *controller)
+{
+	kfree(container_of(controller, struct pasemi_ddata, controller));
+}
+
 static int pasemi_nand_probe(struct platform_device *ofdev)
 {
 	struct device *dev = &ofdev->dev;
@@ -122,8 +127,10 @@ static int pasemi_nand_probe(struct platform_device *ofdev)
 	chip = &ddata->chip;
 	controller = &ddata->controller;
 
+	err = devm_nand_controller_init(dev, controller, pasemi_nand_release);
+	if (err)
+		return err;
 	controller->ops = &pasemi_ops;
-	nand_controller_init(controller);
 	chip->controller = controller;
 
 	pasemi_nand_mtd = nand_to_mtd(chip);
@@ -136,7 +143,7 @@ static int pasemi_nand_probe(struct platform_device *ofdev)
 
 	if (!chip->legacy.IO_ADDR_R) {
 		err = -EIO;
-		goto out_mtd;
+		goto out;
 	}
 
 	pdev = pci_get_device(PCI_VENDOR_ID_PASEMI, 0xa008, NULL);
@@ -174,10 +181,15 @@ static int pasemi_nand_probe(struct platform_device *ofdev)
 	if (err)
 		goto out_lpc;
 
+	err = nand_set_release(chip, NULL);
+	if (err)
+		goto out_cleanup_nand;
 	if (mtd_device_register(pasemi_nand_mtd, NULL, 0)) {
 		dev_err(dev, "Unable to register MTD device\n");
 		err = -ENODEV;
-		goto out_cleanup_nand;
+		nand_disconnect(chip);
+		mtd_put_master(pasemi_nand_mtd);
+		goto out_lpc;
 	}
 
 	dev_info(dev, "PA Semi NAND flash at %pR, control at I/O %x\n", &res,
@@ -191,8 +203,6 @@ static int pasemi_nand_probe(struct platform_device *ofdev)
 	release_region(ddata->lpcctl, 4);
  out_ior:
 	iounmap(chip->legacy.IO_ADDR_R);
- out_mtd:
-	kfree(ddata);
  out:
 	return err;
 }
@@ -210,14 +220,13 @@ static void pasemi_nand_remove(struct platform_device *ofdev)
 	/* Release resources, unregister device */
 	ret = mtd_device_unregister(pasemi_nand_mtd);
 	WARN_ON(ret);
-	nand_cleanup(chip);
+	nand_disconnect(chip);
 
 	release_region(ddata->lpcctl, 4);
 
 	iounmap(chip->legacy.IO_ADDR_R);
 
-	/* Free the MTD device structure */
-	kfree(ddata);
+	mtd_put_master(pasemi_nand_mtd);
 }
 
 static const struct of_device_id pasemi_nand_match[] =

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
