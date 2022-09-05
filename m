Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1B0FECAAA1
	for <linux-mtd@archiver.kernel.org>; Mon,  5 Sep 2022 07:10:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VIda9i9yFgEcxXLxQF2IL5kIUSm9iiWZmK10C4Dsz7s=; b=INoBzm3DI59HQF
	OyH+m8RdfQzJxOKbUMNwK2tnjCG101dYDIF8aggfa3m7ldduJo7gw2bypLQuGbdnCJgsUF0H2Wkpd
	84W9XbHKGVUEASHs+lMqrR9BDWxwziF/N9lCmNKEb7lYu+vUz1lU8boGZq9N9Gx+oaRoXMtJpWLFX
	ZyzQVwzw5vVESr5W4YA+lq7OODJGoSU0OuiRMkyL+OmyN1n+9DLeSy/tu0siXceGVxX3YZqxOve9v
	20Cq0XfijoITfWZeo9gbUnvTGnKeU3DR2M/RiLbCveMmC5q27X6dNKC+i/XQelyOshDktBEVefOT/
	oEHsRWYNq/o+28PrCocA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oV6FV-00CzcE-88; Mon, 05 Sep 2022 07:10:25 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oV5v2-00Ca4V-3z; Mon, 05 Sep 2022 06:49:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=wtbsIN0G6G4Rk7NZw280WIou3MxCBWt+mxKFWMG1Byk=; b=nivducxx0x8v4IGD+jL8zb+EjU
	BIS31uwyAVRD2u1RpmzMaHyuTIS9NNBC5Clc9McMlYMfzJgzIg9+SwGHbrC12OINUxpjvbfhCjhpx
	GeYzWxwVwClJid1YgJ7U/djIGCwMB+tJhMLwKAqHEJu7qiD4RqBC4LtQZAn9XUbLeDxTpq1s7UtA0
	4Rvd05x/Ri8JjNBNmYta+XaPu6sNJnc+8fxnMosDTbkGiPyMg6GptsN1fSYmXsKKnrCxEh9L/O0hl
	WPQ4s5eptZcE1nZeIyEXk/+WBkltJ5ha8KZT/PYteDg6Z1EOPj0JpoHMoyOsq9zapVKIjFPRCfdwe
	z7UiLCgg==;
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
	by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oV5do-009SE0-LZ; Mon, 05 Sep 2022 06:31:32 +0000
Received: by mail-pg1-x531.google.com with SMTP id v4so7273540pgi.10;
        Sun, 04 Sep 2022 23:31:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=wtbsIN0G6G4Rk7NZw280WIou3MxCBWt+mxKFWMG1Byk=;
        b=V8iL1hdeCP411j7WuyV0RKuzlQrPJroM9XqkRFVvCrpK5bPAPTQyE3nfxPRzAf22UM
         NdSbdYACGTqUH/jKS6oq3P2avtZxFrHjmK+37r3HM6hSTlwP5zMTrLgtHcunRzXS7wMw
         MLZe8oKnvo6VJsVi46R1kynkLOywScoAoQvo19TSTMHFDsHauT8z363qjjda0HgeiYKj
         huXRCccitr3elT9rdkidc7YsLzXzhKdBuKVC9nAAEu81j9W3fv8DO1eNUEeEVii/KGJq
         9BBdMvEozmLc0fRzk0Ub2eeNBu38hun0rdIUAhS3h9SBA/pWcydN9r0W5OPOyH/yn5ft
         K/4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=wtbsIN0G6G4Rk7NZw280WIou3MxCBWt+mxKFWMG1Byk=;
        b=J+AGOPzaN3DCw0Wt7B2dHpZFEXg/BjjXOIplPLh0I1fPg0VDK9I4FhguVwdTlzZ+x1
         Vmdugcpmu8mUWixUebZ18XkGZPUqFAnOUqh1UY026tcSo99g7maZAZnb3bvwJhckg0rW
         6JDmotYL9j9JDXpBAyyPEgp9Ks3YyHZ8OFfZtA091CGv5VXSNH5BhHZ1Tir+3swA32+/
         kHW9WMJnAA8s+Z0h/d85CtWaPhkc3HpcHRp9fCH3YDhK+ksmkKQ1F1lJmYQk7YTYD2sz
         9WUq2YenND8n0QR3MOPROsrszXmcFN0jNfhJrrkF2n64meKfcrAOBvL/xF6AsQSP5PnV
         HDsA==
X-Gm-Message-State: ACgBeo0YfPoMvbTDUdNXCpkO73ccv2xcH1FCebW82MYBs6Kc9tis+g4a
	fXu5ul1Rb+yAx6VlYTGENrY=
X-Google-Smtp-Source: AA6agR4FBFN+x/sadubmd0SYUEKWfxGwwbu9hv38iBqADEsB7NAUvJK2vZMuiOES3OuHFLGr7mqtfA==
X-Received: by 2002:a62:4c2:0:b0:52e:bd4d:50e1 with SMTP id 185-20020a6204c2000000b0052ebd4d50e1mr49629750pfe.8.1662359484138;
        Sun, 04 Sep 2022 23:31:24 -0700 (PDT)
Received: from dtor-ws.mtv.corp.google.com ([2620:15c:202:201:7332:f188:2984:5930])
        by smtp.gmail.com with ESMTPSA id d197-20020a6336ce000000b0042254fce5e7sm5710653pga.50.2022.09.04.23.31.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Sep 2022 23:31:23 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Matti Vaittinen <mazziesaccount@gmail.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Claudiu Beznea <claudiu.beznea@microchip.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Felipe Balbi <balbi@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Marc Zyngier <maz@kernel.org>,
	Richard Weinberger <richard@nod.at>,
	David Airlie <airlied@linux.ie>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Rob Herring <robh@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	=?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>
Cc: linux-watchdog@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v1 06/11] PCI: aardvark: switch to using devm_gpiod_get_optional()
Date: Sun,  4 Sep 2022 23:30:58 -0700
Message-Id: <20220903-gpiod_get_from_of_node-remove-v1-6-b29adfb27a6c@gmail.com>
X-Mailer: git-send-email 2.37.2.789.g6183377224-goog
In-Reply-To: <20220903-gpiod_get_from_of_node-remove-v1-0-b29adfb27a6c@gmail.com>
References: <20220903-gpiod_get_from_of_node-remove-v1-0-b29adfb27a6c@gmail.com>
MIME-Version: 1.0
X-Mailer: b4 0.10.0-dev-fc921
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220905_073128_976092_23496891 
X-CRM114-Status: GOOD (  15.47  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

I would like to stop exporting OF-specific devm_gpiod_get_from_of_node()
so that gpiolib can be cleaned a bit, so let's switch to the generic
device property API.

I believe that the only reason the driver, instead of the standard
devm_gpiod_get_optional(), used devm_gpiod_get_from_of_node() is
because it wanted to set up a pretty consumer name for the GPIO,
and we now have a special API for that.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

diff --git a/drivers/pci/controller/pci-aardvark.c b/drivers/pci/controller/pci-aardvark.c
index 4834198cc86b..4a8a4a8522cb 100644
--- a/drivers/pci/controller/pci-aardvark.c
+++ b/drivers/pci/controller/pci-aardvark.c
@@ -1856,20 +1856,19 @@ static int advk_pcie_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	pcie->reset_gpio = devm_gpiod_get_from_of_node(dev, dev->of_node,
-						       "reset-gpios", 0,
-						       GPIOD_OUT_LOW,
-						       "pcie1-reset");
+	pcie->reset_gpio = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_LOW);
 	ret = PTR_ERR_OR_ZERO(pcie->reset_gpio);
 	if (ret) {
-		if (ret == -ENOENT) {
-			pcie->reset_gpio = NULL;
-		} else {
-			if (ret != -EPROBE_DEFER)
-				dev_err(dev, "Failed to get reset-gpio: %i\n",
-					ret);
-			return ret;
-		}
+		if (ret != -EPROBE_DEFER)
+			dev_err(dev, "Failed to get reset-gpio: %i\n",
+				ret);
+		return ret;
+	}
+
+	ret = gpiod_set_consumer_name(pcie->reset_gpio, "pcie1-reset");
+	if (ret) {
+		dev_err(dev, "Failed to set reset gpio name: %d\n", ret);
+		return ret;
 	}
 
 	ret = of_pci_get_max_link_speed(dev->of_node);

-- 
b4 0.10.0-dev-fc921

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
