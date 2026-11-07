Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 615076082BE8
	for <linux-mtd@archiver.kernel.org>; Sat,  7 Nov 2026 10:18:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=MqHkHgJY;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=j147RXqZ;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pWRK4eo2
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=1lYbAkTCqegTgYIyPlsh+DtAsfnGiNrPoygStNaa5VM=; b=MqHkHgJYrEhaOaLz+P72c/exYT
	acT4PPHW1zIYBlY7Xqwk1knvOCZdvB6ipnwQwBAHTj9EfjUi3b1AwYDPuN2ZN2KmOS/+XdlIFm6z5
	GU/557y9mnSr/BVuRePdm33WUAgbEayHUvmp2/S7zpQTbZuBaCj/hSr2YRZwbe3zDWVsrSLCmswy2
	4lBYGqbmklwqyDOV43XRDbyy+Lb3MO0r+f5E2lTzK8R+mVQRH4n86KzudU2f5SYoCNs50T8pGnDYk
	QqJgm+Nd7Plq5WavS7WqWu9eT/xZahD2q1wxn++X0mkc1hzgMhUn62jAVcDaWbKI+IX/2NCpBVTgt
	03QSxhzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPdUw-0000000EUr4-40ZB;
	Sat, 07 Nov 2026 10:18:10 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPdUB-0000000ETxs-1u8W
	for linux-mtd@bombadil.infradead.org;
	Sat, 07 Nov 2026 10:17:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=Z1GX3FC386wHtTixExxpffl4mL+VCVpguFEY1F+fIuc=; b=j147RXqZ0QO/nbXPcCgY3gQuJQ
	OTI4ijv2hjh/pPPhIgm9kr1Y0du8ugofCLf3bNe7kJ26xR7kOWBbG+MZA/YneBqhok8rAc5LVXwCR
	21qyZEdmSKlXvv5mE2SiNeORYACfEW6yd5TUbRdR6AMw0CSTedEsUm0OlBNZRM8E/2BgTgTu7uCgF
	OGt/eRZTdXoSS2l1dQ4a2ouHie7Vx9NvP7D4a4KZcLZ2a7Ab4BIXfZX0H/xyIl/9CsnHm5P5/etFO
	gIim16FaloR55PwXmNJF2b4Msfw0EXqTpC95jdxUCheC3kAuPvuxpohE8xDZNGIYaZNDP60HJX3zo
	fbRc6LAQ==;
Received: from mail-ot1-x333.google.com ([2607:f8b0:4864:20::333])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPdU8-000000057vy-46rI
	for linux-mtd@lists.infradead.org;
	Sat, 07 Nov 2026 10:17:22 +0000
Received: by mail-ot1-x333.google.com with SMTP id 46e09a7af769-843b6f8e2c7so1882009a34.1
        for <linux-mtd@lists.infradead.org>; Sat, 07 Nov 2026 02:17:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794046639; x=1794651439; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z1GX3FC386wHtTixExxpffl4mL+VCVpguFEY1F+fIuc=;
        b=pWRK4eo2Aq5AtHO8cnsMYlRmoL7WSFcOr2phgAAGbPhxcx8Dw80wIHwgi9UDyBiEU6
         atk7qlnf663cYBc0CrQ2+FPlOBu8R0MgZElLi8pXU5Ay+Kp+NsKxvW/cODbbcSMk4bih
         bRJLHV0FPf2exi4x365J4ACin0tSgQo1e9Yl8tIfc9x1AVvtIdzSBpA3yylFtIX0vnND
         UwI8TXRtGLaps55jxPkeNTmVLdLJklXwKlYHecEa03QA2Wvd0gf2ScfLMFaZ/XinTGoN
         CmL+aYHSzmbQiO40mZLPuO3u8I9isaM3njUx3vTdUzjz1Tbo1z4emCGdkIqozsGQzS8c
         YV9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794046639; x=1794651439;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Z1GX3FC386wHtTixExxpffl4mL+VCVpguFEY1F+fIuc=;
        b=ijh20/BfsloAa+7OHghimu+4SU4aZmpiwWQrIdDOFEnhTh75wDCjKtinRsB0gumoMJ
         ImBOmYwUo23tga7gLluCJ5EFy0lruLPAzXq45NEK1EykbZgkbSGylyXrE7qTw3u+XXa5
         C11hdUHKSxSORT8PQWghLQrCaE3ohlj6SZtiZ+NXgaLp+zEImo21VC9rapfoa1bGa3rY
         rlmP0Lijg7c0Vn3sbunwapHCmHNYJK8iZBQPaF58N+7mBuMOW5R/ODLzI8Ff4jW/0NWQ
         qoRro5zMG35GYBQUmWPk8qhXds66GyScv0rba42s8qVSCsYm+LhrpEnsOHMt+0k3S4dB
         /D0g==
X-Forwarded-Encrypted: i=1; AKwUvBzR8iQgTC86RwZy09vt7Z+Cziu14D0na8lUm+xWbJO2jXkh26eFFPWNTwEMwV2umA+GI5T2k20dTsk=@lists.infradead.org
X-Gm-Message-State: APuU4Z95x7SfhA1wxzHkjXTUEESeysxa4cJnGGB9F/kTgZRUjqQHNvo3
	oUHZZJW8l+p4GjJwhxeB9JwE49T7L6ZRboWT69vCuymwApDmVNCMWnzw
X-Gm-Gg: AYBFou28/XZUVNLVN92OZMz6nQMY64C7KxtkTvA43FD3U1wlglHpn9DpqIsXxHsDnbW
	rOyNx8aP2lNxAHgJpilG/DOd30QtLCAWlAOSU+sC6042z7m2Cd34q24zQQ0V6NnQdj/rms2ZuP4
	8ONZIlb6DR5gKIi0rrggSm8CEvaZIxHkIVFrWONgxJkIlPImPn/yvI2DiHre5cN7quYl+38QN8O
	PY9WZf3jPK7jdh6cgDAJ/1SnGVy4toQotmQB/zfcbTd+//zaANqEndfj7gdJg+YimNBAkMerk2w
	EUwSyIblmnVIOLdi+Bg/nNxuk/W7y+e7TrNPmIGYDE40cfH5QoMd7E4Vt+z9kVzjXpmappLq9H7
	gliUDVhcmqIFgwW7g7lCSIvY4vOb3FBIGRE0TtZuFl3Vu3ViNNIepz9Q9nm9G+9AXbZw3YvjQc+
	Ek92GDIsNmx4b/bQdoH43oa6SGYlSPMNzWZm2Ku+KpflU1RFRERZyFMRLj/2okMCaixTHCbx6ku
	eBXwH3+masNQOwrcXnMmzDjOeG+DHvbXlRPAd+Ggu3jLFgvlJ2zu2NkgFsnP2uJu4DoctXvFWZ1
	5ax6FkWQP+0f6OXRGO+5FbUjQLldgFunz3bKsfOOj7F0tJnMuC2ghLqo0UR731GqeEkmGqGM7xW
	Dta3dY4JF1LKKpEqjEnBQJwKeabsPpmjxQdHG1KN/JnxzAMvv6otXgIkAzVvjj+JHiLT/gZrQbU
	BDOFEI2QZqiPoCLjCVhTcW0y2A60YNSfNMzylX/WYiEsgEgkkIepaD5A==
X-Received: by 2002:a05:6830:34a6:b0:85d:44ee:607d with SMTP id 46e09a7af769-85f1cbf2fa6mr4361234a34.0.1794046639191;
        Sat, 07 Nov 2026 02:17:19 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85f1dbef224sm3990269a34.12.2026.11.07.02.17.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 02:17:18 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 07 Nov 2026 03:16:16 -0700
Subject: [PATCH 19/58] mtd: rawnand: orion: retain open-handle state on
 removal
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-19-0181ef0cc4c8@gmail.com>
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
X-CRM114-CacheID: sfid-20261107_101720_923719_EFB0C904 
X-CRM114-Status: GOOD (  17.08  )
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

Retain the embedded chip and its copied name through the shared
allocation.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/orion_nand.c | 27 ++++++++++++++++++++-------
 1 file changed, 20 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/nand/raw/orion_nand.c b/drivers/mtd/nand/raw/orion_nand.c
index 47e80d5e58c5..aae054e47db5 100644
--- a/drivers/mtd/nand/raw/orion_nand.c
+++ b/drivers/mtd/nand/raw/orion_nand.c
@@ -96,6 +96,11 @@ static const struct nand_controller_ops orion_nand_ops = {
 	.attach_chip = orion_nand_attach_chip,
 };
 
+static void orion_nand_release(struct nand_controller *controller)
+{
+	kfree(container_of(controller, struct orion_nand_info, controller));
+}
+
 static int __init orion_nand_probe(struct platform_device *pdev)
 {
 	struct orion_nand_info *info;
@@ -106,15 +111,15 @@ static int __init orion_nand_probe(struct platform_device *pdev)
 	int ret = 0;
 	u32 val = 0;
 
-	info = devm_kzalloc(&pdev->dev,
-			sizeof(struct orion_nand_info),
-			GFP_KERNEL);
+	info = kzalloc_obj(*info);
 	if (!info)
 		return -ENOMEM;
+	ret = devm_nand_controller_init(&pdev->dev, &info->controller, orion_nand_release);
+	if (ret)
+		return ret;
 	nc = &info->chip;
 	mtd = nand_to_mtd(nc);
 
-	nand_controller_init(&info->controller);
 	info->controller.ops = &orion_nand_ops;
 	nc->controller = &info->controller;
 
@@ -186,9 +191,16 @@ static int __init orion_nand_probe(struct platform_device *pdev)
 		return ret;
 
 	mtd->name = "orion_nand";
-	ret = mtd_device_register(mtd, board->parts, board->nr_parts);
-	if (ret)
+	ret = nand_set_release(nc, NULL);
+	if (ret) {
 		nand_cleanup(nc);
+		return ret;
+	}
+	ret = mtd_device_register(mtd, board->parts, board->nr_parts);
+	if (ret) {
+		nand_disconnect(nc);
+		mtd_put_master(mtd);
+	}
 
 	return ret;
 }
@@ -202,7 +214,8 @@ static void orion_nand_remove(struct platform_device *pdev)
 	ret = mtd_device_unregister(nand_to_mtd(chip));
 	WARN_ON(ret);
 
-	nand_cleanup(chip);
+	nand_disconnect(chip);
+	mtd_put_master(nand_to_mtd(chip));
 }
 
 #ifdef CONFIG_OF

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
