Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF844ECAAA1
	for <linux-mtd@archiver.kernel.org>; Mon,  5 Sep 2022 06:32:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=56JAy5lgbyDcQmwO4JfAeHw8XEExr/SUG8UM1oQeskw=; b=0RxB+IiVJJMlSJ
	evSCRjompqaPwfVRYgKLAW6Rmt74uEofzubEuvkoIinl8+Y+Gp6vnygwg8TpHpZbnF2hkBHVLNqq+
	RoY3tK/OJCswznH+ZQNp2M5xnY1ImHWwjlhZCEC7bMOfeWgH4pG4j7AamJT+GbKst9CU9iDYa/mWY
	QbggZTaqB8yYGMZxfzLaJxlJ9tlinPF+bgvhICoE4jmUMR3GIqriN48Rw3DtmTvfU+YRXbdkdgFnY
	pT1vDhsW3d40o6+SvpXyFuAgiAjMCLWS5G4tydtyztn6W/lrjbQoKyUQFomkfpXRdP9vQTR3nWyL8
	k/Ne/gd+mizAfr7QvXHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oV5eM-00CGx3-Nq; Mon, 05 Sep 2022 06:32:03 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oV5db-00CFuS-7q; Mon, 05 Sep 2022 06:31:24 +0000
Received: by mail-pf1-x432.google.com with SMTP id b144so2941690pfb.7;
        Sun, 04 Sep 2022 23:31:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=U194c+dv3L8PGxjQRUqmKsyVJlhonDrX8vTPY/i9hXs=;
        b=Fkbc/qOj6ZS7IqaqFcyPDPM8EDvYCU7OGChWB/9DpWkiWqS2dcKh9l1ojNoGhPTnaD
         njtjyQXo+Rn/WKjPbWSgQwcSRXqdDOgJDGXNJQq5SFjXCfctlSjW18o5uDca1l2zvr9s
         qI1PzrfdfgBUibYLHx0f78UFpIn7lM4srMFlpQG6GGUAs+9ir4zw3UO2CcA6EiK7Fjf1
         bf4cjTs1g6ppz8vMIVX34VakImJ62Z/3L44MxW6WWlAwFP7SjkuSosBV+uw4t/dQJPMK
         jdTwvre314VlwpC1eofIVn09IiP/lYmwjM75pESkwXfDC4BXtIhlz1s+2S/HOBFZhOcr
         KREw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=U194c+dv3L8PGxjQRUqmKsyVJlhonDrX8vTPY/i9hXs=;
        b=zOSaYzVazDxoilpbY+C541azkDxbaJ48WZ5Hm8WqicuOWQL/ZJXTlDLpln48nSDgM6
         W9+UUSELcva5K7i6WYj4noA+Bmye3cYjc8aMCOP8iWa0rqwGwzd8dd2dgidSs912Idks
         XRa/j8Liircfipwh3MuwsXhF985VkIszRzjZ2oaEWRx2Na175w5TUdTPu+rm5kuq4YS3
         NL9dauzmRMB1K/fILEhbQqI/F0CUOxNo6qq8lYMHo9d2t8ZG6gNCfH7LTM04wVN3ZGyU
         32z+xRPaty7AgBFKC1rLLnLuvWLabYu5A3hED/mg3F5TvltEQPjlQ6dZixuBCAnDTm+f
         vYEw==
X-Gm-Message-State: ACgBeo04LpLcOgBnBxbRNQFhKEmUHNSBWFcnHZG+yV0HXZr1GaKNMt7/
	ZT35e6Hktq9iETapJ4Duz3U=
X-Google-Smtp-Source: AA6agR5AcoEUClPAM45JZ1w1Bqqw5txpdGe6Mc9rimWxG6gO38z3tQNrUedFo00QOImtqhFwVKAqJg==
X-Received: by 2002:a63:914c:0:b0:42b:a8fa:eb4a with SMTP id l73-20020a63914c000000b0042ba8faeb4amr34343614pge.481.1662359473959;
        Sun, 04 Sep 2022 23:31:13 -0700 (PDT)
Received: from dtor-ws.mtv.corp.google.com ([2620:15c:202:201:7332:f188:2984:5930])
        by smtp.gmail.com with ESMTPSA id d197-20020a6336ce000000b0042254fce5e7sm5710653pga.50.2022.09.04.23.31.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Sep 2022 23:31:13 -0700 (PDT)
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
Subject: [PATCH v1 02/11] drm/tegra: switch to using devm_fwnode_gpiod_get
Date: Sun,  4 Sep 2022 23:30:54 -0700
Message-Id: <20220903-gpiod_get_from_of_node-remove-v1-2-b29adfb27a6c@gmail.com>
X-Mailer: git-send-email 2.37.2.789.g6183377224-goog
In-Reply-To: <20220903-gpiod_get_from_of_node-remove-v1-0-b29adfb27a6c@gmail.com>
References: <20220903-gpiod_get_from_of_node-remove-v1-0-b29adfb27a6c@gmail.com>
MIME-Version: 1.0
X-Mailer: b4 0.10.0-dev-fc921
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220904_233115_414972_67D26F03 
X-CRM114-Status: GOOD (  10.43  )
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

I would like to limit (or maybe even remove) use of
[devm_]gpiod_get_from_of_node in drivers so that gpiolib can be cleaned
a bit, so let's switch to the generic device property API. It may even
help with handling secondary fwnodes when gpiolib is taught to handle
gpios described by swnodes.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

diff --git a/drivers/gpu/drm/tegra/output.c b/drivers/gpu/drm/tegra/output.c
index 47d26b5d9945..a8925dcd7edd 100644
--- a/drivers/gpu/drm/tegra/output.c
+++ b/drivers/gpu/drm/tegra/output.c
@@ -133,11 +133,11 @@ int tegra_output_probe(struct tegra_output *output)
 		}
 	}
 
-	output->hpd_gpio = devm_gpiod_get_from_of_node(output->dev,
-						       output->of_node,
-						       "nvidia,hpd-gpio", 0,
-						       GPIOD_IN,
-						       "HDMI hotplug detect");
+	output->hpd_gpio = devm_fwnode_gpiod_get(output->dev,
+					of_fwnode_handle(output->of_node),
+					"nvidia,hpd",
+					GPIOD_IN,
+					"HDMI hotplug detect");
 	if (IS_ERR(output->hpd_gpio)) {
 		if (PTR_ERR(output->hpd_gpio) != -ENOENT)
 			return PTR_ERR(output->hpd_gpio);

-- 
b4 0.10.0-dev-fc921

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
