Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AD8DC54EE9
	for <linux-mtd@archiver.kernel.org>; Tue, 20 Sep 2022 08:36:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KgCJE28VzhEZO0RDsM5Bei6H53o/AutP0KFTg6H6llY=; b=ckkVCCB1fbLp7T
	07YezgghgOhBx8755bHUxbHgw0cW40oo+bfoouVk2Toe2quNGdjdu+5rwBny173Y6wt6UOzLkFV66
	me2jBBygDVKpiQkU6BRf9pQm4AluAph7EB6QqZmPBs0tBzH7YL7oSKr+85+tZiGGDZZy6Go2xbRVk
	uVdeMybTWfjG/kw8rznsWgc4YCvBeMcNwQUb894Ru9aRWipZQTJ0cNpLUHjcQBMEuL1CZgTSgCzfL
	XWfh2b9Ij0awhdVIPqbwz56cY99b2UaaPxdTGxA8yHhEL3CQI/x/SIvJGZJewYRR8q1+U8OuMmwLw
	OEyoG3G5PC5gBdMD4/BA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaYjh-001t5Z-KZ; Tue, 20 Sep 2022 08:36:09 +0000
Received: from relay2-d.mail.gandi.net ([217.70.183.194])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaYhS-001r7g-Uf; Tue, 20 Sep 2022 08:33:55 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 93B0A40008;
	Tue, 20 Sep 2022 08:33:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1663662828;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WdCBW02Fmd3bjrCh+OZZwzQ5M+jFgiJ3BIAxKxcGchY=;
	b=Fkc2Mq4Ojmk6fA3bxJPKaJn0WLqyjQT/npMoIhSfZX76aXLoThMbC516XCfnOeiiBamxGC
	ef/U8lKG8CzN7Q96xUd4LtMIeVblPti2tyyEKtMf32UNp7AfXZFnOGAg+k1ZQGwJQykmDA
	fPkMuJPLuC8phFSfGeS17s7hENly3KI6ctjaChfKwb4CKjQrsUOoc0MDXBqqdVTbOhXDoh
	3wV2R5IcM/BB7UthrsqKmOzknjS7VAp0uOkeJv2MDKwd/JfIjmk/eBV1Xgz128d0vrXrJ+
	HCs5k8j2cnkQ3Ho73v081g4gSg/IgirZsYsb+6cipakSlYrU6szR8RzXypbq3Q==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Thierry Reding <thierry.reding@gmail.com>,
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
	=?utf-8?q?Krzysztof_Wilc?= =?utf-8?q?zy=C5=84ski?= <kw@linux.com>,
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
	=?utf-8?q?Pali_Roh=C3=A1r?= <pali@kernel.org>
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
Subject: Re: [PATCH v1 03/11] mtd: rawnand: stm32_fmc2: switch to using devm_fwnode_gpiod_get()
Date: Tue, 20 Sep 2022 10:33:42 +0200
Message-Id: <20220920083342.601039-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220903-gpiod_get_from_of_node-remove-v1-3-b29adfb27a6c@gmail.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'130bd3cdb880c444005e173485124a7bbf3df9b2'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220920_013351_208971_00480EF8 
X-CRM114-Status: UNSURE (   9.39  )
X-CRM114-Notice: Please train this message.
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

On Mon, 2022-09-05 at 06:30:55 UTC, Dmitry Torokhov wrote:
> I would like to stop exporting OF-specific devm_gpiod_get_from_of_node()
> so that gpiolib can be cleaned a bit, so let's switch to the generic
> fwnode property API.
> 
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
