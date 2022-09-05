Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69B2DECAAA1
	for <linux-mtd@archiver.kernel.org>; Mon,  5 Sep 2022 06:37:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QuOJXwedMT30QgTRFCUNdrjhWVKwiNbsj1QPFfxcRzk=; b=gQ6U9LKjRhs9hP
	H9p/NaahbrrTDa+avlSqS9y6zjR35hcbQ3cW8ll/Rff0sT4zEH3BguNKfJhUBUPh1K+nbFZG7W1jA
	hpHEW83KmFa2ITDNnJ0Qx8l6xZnNmcL1acyQqE1H7kH971CRGpPA9FjqBUZHIciuFRz43HVIXCFxh
	gvMBVfBbS/MlQpnZndp9w73qNNguBFC2L4Ltx0rfmh/abBY/jjXSWVmhrgw1zvCHpodlZ4c8BAZU+
	qSmX51DL6MPxDQ8dIl7fVS+v3R68c5UkIuvPSh4oy7iquhgXXUm/Iv2bkAgeuEk3XZEKYoRHvqb2+
	Z7NojUTmafwe4CP8Jzgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oV5jD-00CMRm-Th; Mon, 05 Sep 2022 06:37:04 +0000
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oV5dn-00CG8T-W8; Mon, 05 Sep 2022 06:31:32 +0000
Received: by mail-pg1-x532.google.com with SMTP id t70so1478779pgc.5;
        Sun, 04 Sep 2022 23:31:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=ynLt5at1fPNx8OKjwAxE9TZqe0qSgR0LfMKd2/ukQyE=;
        b=o0c6aYKNJPicMxZzE1PkKtIkQSLJsOwJFh3bcl+LYHEmHr5TaY61x79o0SD+ivoxZk
         DPf8vEmv/G+sAfYEywkQmzYS8TqIgrCK6wSXSLFwKEAK7Cbw08AkpqBT96rMRzPEVa0T
         aMMtmW+0f9glO6/cQ8keV15iEPs13h8fVonila+4g/ocL46xIqfFx7rDdBBE/MrAjqtO
         5sl8bIgqi3+F/6v0vHcDrNJ1k/oQaqO7VkvMD/DoMztr6Me8/am6pi66ZHOCMZneRwid
         Zb3n7NhsZprL3d7KX03DatOFU7DvGf4H7pflgVDpxL0aWedJ+FcdT7hgq54vmCH9Sgv5
         7z2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=ynLt5at1fPNx8OKjwAxE9TZqe0qSgR0LfMKd2/ukQyE=;
        b=acq8Xr8XLHapZo7NDWBXL6UPIAz/eVZvN3qhxdbbzRlAIQGmLppeo+lwEotAmqgXbK
         KIVyVVd2/6V/xZ280BrUAoySwuWTASiXKSvkjcikn9N+YRg+f1p9sYknkw4o/Q7070yE
         EFDG+ydF2WUohIDGYUQX4PiHVPN/TL+yh3pWiR2tV1o/NiGQxUgYyDIq16ySYzD15PH7
         yeJiC79dPmTc1wTVI5eApt+FSY6J9ZbZ8z3GI7cW4wrXYP+5uccBVnxXmL3fXRITSXrb
         2lGZV/raB2PDXEXjUdZT6uNSMu6OEDWvtZXSU0E2iYUPbcAOqIyOhu0djmzy7FrI/1V7
         bjfA==
X-Gm-Message-State: ACgBeo19Fp/vnt7QBqYyj4kSlTV3lf6+p/5bEfL5QtgVr6rZHsZQ8wv/
	ijii2Ow4SqCCoI11t/pucGTqwC2J54A=
X-Google-Smtp-Source: AA6agR6nqqurcOlRTW5MwumdR49aUTj5edmtMHpG5pntto/Ic3d6LDisTkJ/i3KAH13zMjWGur9aVA==
X-Received: by 2002:a63:62c3:0:b0:434:2b09:6f62 with SMTP id w186-20020a6362c3000000b004342b096f62mr6851828pgb.374.1662359486505;
        Sun, 04 Sep 2022 23:31:26 -0700 (PDT)
Received: from dtor-ws.mtv.corp.google.com ([2620:15c:202:201:7332:f188:2984:5930])
        by smtp.gmail.com with ESMTPSA id d197-20020a6336ce000000b0042254fce5e7sm5710653pga.50.2022.09.04.23.31.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Sep 2022 23:31:26 -0700 (PDT)
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
Subject: [PATCH v1 07/11] PCI: apple: switch to using fwnode_gpiod_get_index()
Date: Sun,  4 Sep 2022 23:30:59 -0700
Message-Id: <20220903-gpiod_get_from_of_node-remove-v1-7-b29adfb27a6c@gmail.com>
X-Mailer: git-send-email 2.37.2.789.g6183377224-goog
In-Reply-To: <20220903-gpiod_get_from_of_node-remove-v1-0-b29adfb27a6c@gmail.com>
References: <20220903-gpiod_get_from_of_node-remove-v1-0-b29adfb27a6c@gmail.com>
MIME-Version: 1.0
X-Mailer: b4 0.10.0-dev-fc921
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220904_233128_142525_4BD20B4E 
X-CRM114-Status: GOOD (  10.25  )
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

I would like to stop exporting OF-specific gpiod_get_from_of_node()
so that gpiolib can be cleaned a bit, so let's switch to the generic
fwnode property API.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

diff --git a/drivers/pci/controller/pcie-apple.c b/drivers/pci/controller/pcie-apple.c
index a2c3c207a04b..d83817d3ff86 100644
--- a/drivers/pci/controller/pcie-apple.c
+++ b/drivers/pci/controller/pcie-apple.c
@@ -516,8 +516,8 @@ static int apple_pcie_setup_port(struct apple_pcie *pcie,
 	u32 stat, idx;
 	int ret, i;
 
-	reset = gpiod_get_from_of_node(np, "reset-gpios", 0,
-				       GPIOD_OUT_LOW, "PERST#");
+	reset = fwnode_gpiod_get_index(of_fwnode_handle(np),
+				       "reset", 0, GPIOD_OUT_LOW, "PERST#");
 	if (IS_ERR(reset))
 		return PTR_ERR(reset);
 

-- 
b4 0.10.0-dev-fc921

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
