Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DC00606D805
	for <linux-mtd@archiver.kernel.org>; Sat,  7 Nov 2026 10:17:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=cvwUrnV/;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=WbgcVjrV;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=n6X9twcw
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=T6kPSKr6JuadrHgUoxOdNq742eVV91+81T7XvzYWcH4=; b=cvwUrnV/mB5+r1LFwd31W0qnCi
	3tUKo3Te3hFYfxL4W23fkgKrFMbVb35fZ5NaDq2ygw2Nxe64eVkjx61+eopqGzG0IVqWS6Qmp4ewm
	PqcsfgUa/uxgCzCw9frX0xhX1TJ3gCHLip8hj1tz4zYHiyupX5m/iQXmgQ29vZB1cM0nXf4qnmNxJ
	n3YyQkaoYgCPhh5tahkRwGipLwgf12Ys4wc4yzJPZwn2EiVaCvk5vRVvynVNGD5sar2RpIwKGT69i
	KYVOKOAHEaDqFhj8NnsaVFx0BB++RxEBoPNYTM3i/R4Vu3QI3F5ky9zsAsZ2ZMiM7xKglyeGiAV8A
	1/thqXmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPdUS-0000000EURE-2mcH;
	Sat, 07 Nov 2026 10:17:45 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPdTz-0000000ETju-06nB
	for linux-mtd@bombadil.infradead.org;
	Sat, 07 Nov 2026 10:17:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Cc:To:In-Reply-To:References:Message-Id
	:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=xSLRQn3nJAr2hF1oaNjj9xTWKwIvsqTVkRqHh/k0qb8=; b=WbgcVjrVaA/9Skvux0QjDCpOPR
	CMv4NWTgu94hFGheJDTyaorB48PDFgw6qjs7anQnoHmuGKLYw/baz1kb2LvHFSSa0bD7WdjnkXcem
	d+0lZ9jPDUlJOewGwn5UK8wJ+MBKccS5xJnBWFwrf1bhMQY1+uttvOv9DZuhTq+SBBheFE44JbnAC
	d3N5TjUMWCdt6fQch+6MmCtQ3a6cynODIRfx/EREKR+a5H3BIQAK/rfzpOk/HhJPZy6EgBGzUmVEJ
	W1sO1bnNjnk8AWUHrz3nBCION3UvcbEPB1IsLhpL/ic2u3MKaNhHObDsck0AkGRYKczWaEG2KSF9r
	s5IEjKNg==;
Received: from mail-ot1-x334.google.com ([2607:f8b0:4864:20::334])
	by casper.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPdTu-0000000GOOP-2tKm
	for linux-mtd@lists.infradead.org;
	Sat, 07 Nov 2026 10:17:10 +0000
Received: by mail-ot1-x334.google.com with SMTP id 46e09a7af769-833e671ee9fso1573576a34.0
        for <linux-mtd@lists.infradead.org>; Sat, 07 Nov 2026 02:17:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794046625; x=1794651425; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xSLRQn3nJAr2hF1oaNjj9xTWKwIvsqTVkRqHh/k0qb8=;
        b=n6X9twcwo1r4EES11tjE1tNGJdqOWAupxe4JaqaEIKLIBsRHE+Yt3/7iyZJNroCwJZ
         3I6jdbklt7JBOQAJQD5CI1eT/2ByGq2AAJQBVP91Sexo43utsCxx0rqMcmAS26voqsBF
         YM6nKcootDH4vaMAUr97o/6SkjvqvG/kY+9XqlA0stQCyQEvIuGqxktkykBMc4T/X9f3
         0nQYRUx6mwKFAfQZ36KC5BY+r8md8AW5rEzXUJ/6fe5v8Hcn3dQM11SxOCa4+bgnfl1G
         DCAL5ejOD3VuubeZNTfJKKjK3T5s3QBcQgSUb85x5Jfh7XPdzemzKEA60vaVu0hyZWPD
         HecQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794046625; x=1794651425;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xSLRQn3nJAr2hF1oaNjj9xTWKwIvsqTVkRqHh/k0qb8=;
        b=GQBuWD8FLUxahJmz6FAf013FhchWW+q7DMUaPpuw7rYtIGEnez6f+xruU6EqnSy0Ho
         BINYvKqNPms5Z0D6bNr9+dSMB3Jxx5yJtZ86TDlC7Nt2mYNaA7UpFqyPBVrgGykuLVBR
         zlDqVh49dQtynHG5uO+1RLGI0mzDmdFlFDvVai+ZrMlSYAoRdFo3UJe3qQC2jaUJTv+r
         1xT7+T4l6/QAR7EH/fUXYHZx5PsWlANtJ5JfXzOOHJKNhhYiBmMzbABsV/x/NWKZ1fsG
         w7E5OhbBilIHW+gBRTPxjPHxv6zwlvwJeRUH/oNtypb/haNqfLeip6VZ0HK85g8uAgoV
         BhWA==
X-Forwarded-Encrypted: i=1; AKwUvBzldDjl8uTnL5iZoZ9Fj1XKS5djgbaxIrhrq2qhfxrLYp2oqK1JgMZyqVHoIrwhq59EcH1HiUh3lf0=@lists.infradead.org
X-Gm-Message-State: APuU4Z/kSHcQQsQ7LWuJ6Wesa8puwMxeHnPFxMObg+t+gjwLvHBPgqei
	Klob0hTD7eW3q1f52XDMh4fxFEPRFdEJr8drOYUnfYuvntdZ0PP2fgoW
X-Gm-Gg: AYBFou3XoBmzBOeLFi8NzIyInYYY84oP8Yn4y2LsDL1earftBH2aQbSaBhpenipwxt0
	5Xxj2ZA6p2+RxBB1wsMyHTRSxii+pI/lIHTjE+4KFQQo/ZW0MRIOmMwORqz7i6MGeFdiXUpE47w
	PDHUkd6FvtZxBzqrG8wK2OjvS7baJbc8NGZ/FT5wVMYVLDKVG5DUL8ty18sIipmB0na6Six1GRb
	swekLSjkMG2cZ+SE09cqTs3kWGqnpgjrPcPj4ePI1kY53quS9XbVN22dyy5nrMidyTIyxcQURhO
	g8A9K2sTm4T9NEgHXU+tMwuMTHhUYA8tnLEcsGjlIkmVqObzVT4ZIvK7pHc7cJrwckx1w2J832v
	KPVUz8HHMr+82cGXDN5b8DjhQrmgCLtSAeKF4YrsK5PAGr3IL88RXnDxgLzd38uu1AApBxdKExU
	I+fZho+eKalnP+87pmTtCYYTBVDGkmDyvdwEST1kk9MrLDQcffT2UAOPP+dnPG5b7Odj4tEi3n8
	Qx4YKHo2tNOyVazAXGRHkAHQvdDeABPGUfthFkNW+5+dlbeK8Tw3knhtu/RjnCgg+6z2XoNqVcW
	NK6xJFWOwp4zQNWiVbKdvO+MnsjyoCTg1wUZARRL+6BofxcQnXY9d3QBn96aPycmz2BslZGrQkl
	luB+IErHXERvxSi4e6k3A8Bkg6RZN5ZaP62RKbFSo+FrRjaPSt9uTXGagEZ3+3rUPCJjHoR5RzD
	W+XPyKDbJuWf58AIoataAf5k3v2WjDvZTVluTIocSmv0Hdh5kakx/S
X-Received: by 2002:a05:6830:4ac6:b0:81c:a6c8:8a65 with SMTP id 46e09a7af769-85f1d0d0beamr4517941a34.25.1794046624830;
        Sat, 07 Nov 2026 02:17:04 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85f1dbef224sm3990269a34.12.2026.11.07.02.17.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 02:17:04 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 07 Nov 2026 03:16:11 -0700
Subject: [PATCH 14/58] mtd: rawnand: intel: retain open-handle state on
 removal
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-14-0181ef0cc4c8@gmail.com>
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
X-CRM114-CacheID: sfid-20261107_101706_814066_558BCFF7 
X-CRM114-Status: GOOD (  15.08  )
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

Disconnect NAND operations after unregistering MTD and before disabling
the controller or releasing DMA channels. Retain the embedded chip,
controller lock and NAND metadata until the last MTD reference is
released, including references obtained during a partially successful
probe.

Fixes: 0b1039f016e8 ("mtd: rawnand: Add NAND controller support on Intel LGM SoC")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/intel-nand-controller.c | 22 ++++++++++++++++++----
 1 file changed, 18 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/raw/intel-nand-controller.c b/drivers/mtd/nand/raw/intel-nand-controller.c
index 477a427dac1f..e4a24e69ebbc 100644
--- a/drivers/mtd/nand/raw/intel-nand-controller.c
+++ b/drivers/mtd/nand/raw/intel-nand-controller.c
@@ -573,6 +573,11 @@ static void ebu_dma_cleanup(struct ebu_nand_controller *ebu_host)
 		dma_release_channel(ebu_host->dma_tx);
 }
 
+static void ebu_nand_release(struct nand_controller *controller)
+{
+	kfree(container_of(controller, struct ebu_nand_controller, controller));
+}
+
 static int ebu_nand_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -585,12 +590,14 @@ static int ebu_nand_probe(struct platform_device *pdev)
 	int ret;
 	u32 cs;
 
-	ebu_host = devm_kzalloc(dev, sizeof(*ebu_host), GFP_KERNEL);
+	ebu_host = kzalloc_obj(*ebu_host);
 	if (!ebu_host)
 		return -ENOMEM;
+	ret = devm_nand_controller_init(dev, &ebu_host->controller, ebu_nand_release);
+	if (ret)
+		return ret;
 
 	ebu_host->dev = dev;
-	nand_controller_init(&ebu_host->controller);
 
 	ebu_host->ebu = devm_platform_ioremap_resource_byname(pdev, "ebunand");
 	if (IS_ERR(ebu_host->ebu))
@@ -692,9 +699,15 @@ static int ebu_nand_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_cleanup_dma;
 
-	ret = mtd_device_register(mtd, NULL, 0);
+	ret = nand_set_release(nand, NULL);
 	if (ret)
 		goto err_clean_nand;
+	ret = mtd_device_register(mtd, NULL, 0);
+	if (ret) {
+		nand_disconnect(nand);
+		mtd_put_master(mtd);
+		goto err_cleanup_dma;
+	}
 
 	return 0;
 
@@ -715,9 +728,10 @@ static void ebu_nand_remove(struct platform_device *pdev)
 
 	ret = mtd_device_unregister(nand_to_mtd(&ebu_host->chip));
 	WARN_ON(ret);
-	nand_cleanup(&ebu_host->chip);
+	nand_disconnect(&ebu_host->chip);
 	ebu_nand_disable(&ebu_host->chip);
 	ebu_dma_cleanup(ebu_host);
+	mtd_put_master(nand_to_mtd(&ebu_host->chip));
 }
 
 static const struct of_device_id ebu_nand_match[] = {

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
