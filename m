Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 636C0ECAAA1
	for <linux-mtd@archiver.kernel.org>; Mon,  5 Sep 2022 06:32:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zTN8y59hQeVq8zYnBe3XywX4goyZVTBSdSK3FHINrZo=; b=R9n3P0N562Wmkk
	Nm3A7GEA13LBGdhGcHvMyzzoIZhWmHGLprxEzyeYv1hwO7ARdTe10tb/FEr7sqFr0xYxL373FCDGE
	v4z1RsICl7BCKBzL+PbqIrGdAPpQgRrffoX0V9/5wF3o/82IN6+kdzlgTe6aP1b6dVD68znHBSSVx
	cAWSXTWMIeT/p49yzZWlM1lNTjJ+mf4v+5h3h+aPLfT5BSiUTDtYXFIHIGEYBywcjn2iqW08Mz2Qx
	z5GD343Xogdf0rP77xtaa8mLlG9JwGFr452+6lLIa0Rb9wKx5MSKq6Bgo/aQC4uV9bT7J5ph1wuMf
	J+Z2E+vrKvyWAeAgQ/0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oV5e8-00CGbQ-Bg; Mon, 05 Sep 2022 06:31:48 +0000
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oV5dZ-00CFro-C4; Mon, 05 Sep 2022 06:31:24 +0000
Received: by mail-pg1-x52c.google.com with SMTP id bh13so7306229pgb.4;
        Sun, 04 Sep 2022 23:31:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=OVfZryZDsn7EOmcZgQCBsExc88uptR2TDaptHz7Mkz0=;
        b=NCVkm6jO5T8JvtIiswGFJRWQ6X8V/lEcdFXeBX/jS7NR6HfIMOFQqwtvbzVJH4QbnW
         5eAaKJ2Btz6EDiplEg7pNTEHzAVyU5kQFh+Had3EVkArXQkeEhZc+8Xu5s/fSXNTBYRd
         QxwDXvJLKzwpv0KLpWVLomVHNaTztUDtOmDZOUePP3FQAXx80QMYryGWp8Qtgtkq+rCS
         zMl46htgUuknSjojcasQ8VFXQgdYGTuGM8zLouDO2HoFeHfp3xTuqNCMdAVcyrwb89NO
         Puk4rmbUyqRCdbE9PptjU3xweuFiTOXTPnuBWJEMAtMUaphJsUh67rNB6zwD4fYTTNtY
         YpiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=OVfZryZDsn7EOmcZgQCBsExc88uptR2TDaptHz7Mkz0=;
        b=g5880/95r3hjNLespcQDpGIBUSrbqhtDq4wJASUBEWQzkhrks0sUGpn4p+SxH2cJ9u
         dx+6uCoN4pulhWnxB2aoDkasdFBlS9D4rCD9eC7wyMsuoLaL3hi4aDU3ahKVHsHoGB0L
         mZKqCEONtNM13KCkAn0yo7GXnbOeyby7K1iR2WGzXZ3igxryHzxPBIA9jjz5ASU29Pn3
         Rzia3R4NWL4JTj2yBCP27vHYZ4PESUaRhs/Oa8JQDd1C/IlRpQwxXUzBtwBgy8tDXtoj
         BWWSZ6uCBdsHGqqgi5l6cMRbJhXOpl5Pfv5kKI3KASfowv65rMcwyx0aSjACOjrSNXiS
         9Qww==
X-Gm-Message-State: ACgBeo25Wq7lJdgH8hqPiblGX5uQ/IHZDP5+cav1W9ZKCDAdBctTdfAL
	2Sn2G8/LTn0rdAkbeWnPA1o=
X-Google-Smtp-Source: AA6agR6Idf7B+Ir3+C7s0CQ8UlH5pwxbWKYpAaeA415uduldic97z5mhuS5KFGWggWKjnL3sMq7imA==
X-Received: by 2002:a63:dd51:0:b0:430:18d9:edf8 with SMTP id g17-20020a63dd51000000b0043018d9edf8mr21685454pgj.163.1662359471251;
        Sun, 04 Sep 2022 23:31:11 -0700 (PDT)
Received: from dtor-ws.mtv.corp.google.com ([2620:15c:202:201:7332:f188:2984:5930])
        by smtp.gmail.com with ESMTPSA id d197-20020a6336ce000000b0042254fce5e7sm5710653pga.50.2022.09.04.23.31.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Sep 2022 23:31:10 -0700 (PDT)
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
Subject: [PATCH v1 01/11] PCI: tegra: switch to using devm_fwnode_gpiod_get
Date: Sun,  4 Sep 2022 23:30:53 -0700
Message-Id: <20220903-gpiod_get_from_of_node-remove-v1-1-b29adfb27a6c@gmail.com>
X-Mailer: git-send-email 2.37.2.789.g6183377224-goog
In-Reply-To: <20220903-gpiod_get_from_of_node-remove-v1-0-b29adfb27a6c@gmail.com>
References: <20220903-gpiod_get_from_of_node-remove-v1-0-b29adfb27a6c@gmail.com>
MIME-Version: 1.0
X-Mailer: b4 0.10.0-dev-fc921
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220904_233113_467645_9610D128 
X-CRM114-Status: GOOD (  11.43  )
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

diff --git a/drivers/pci/controller/pci-tegra.c b/drivers/pci/controller/pci-tegra.c
index 8e323e93be91..929f9363e94b 100644
--- a/drivers/pci/controller/pci-tegra.c
+++ b/drivers/pci/controller/pci-tegra.c
@@ -2202,10 +2202,11 @@ static int tegra_pcie_parse_dt(struct tegra_pcie *pcie)
 		 * and in this case fall back to using AFI per port register
 		 * to toggle PERST# SFIO line.
 		 */
-		rp->reset_gpio = devm_gpiod_get_from_of_node(dev, port,
-							     "reset-gpios", 0,
-							     GPIOD_OUT_LOW,
-							     label);
+		rp->reset_gpio = devm_fwnode_gpiod_get(dev,
+						       of_fwnode_handle(port),
+						       "reset",
+						       GPIOD_OUT_LOW,
+						       label);
 		if (IS_ERR(rp->reset_gpio)) {
 			if (PTR_ERR(rp->reset_gpio) == -ENOENT) {
 				rp->reset_gpio = NULL;

-- 
b4 0.10.0-dev-fc921

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
