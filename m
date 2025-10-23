Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A332ECCD1BC
	for <linux-mtd@archiver.kernel.org>; Thu, 23 Oct 2025 17:04:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Fhz2J7lsgDBjghsKJx+aEhL4bNIjzdfTzMjC8FZouRU=; b=Ize93ZWlCY5qKW
	mN6Mqttp/ZRTTrV/aFq0gImBoBS6knbghtbHa8AzWurDJBSelBWvDlp6eg1PyAlaYkHMZOWLJmUkP
	USIdhJv7KOS4FCj39uHfCGlLU14XrG27zZG4hRSSjDwwmUCjJhw183T73/e7QOivWv3jVFko6IFZD
	8kE7LM3veuBukvWIj8Ow0T9lyRncn6EnxfLp1OdkAwP5HcG/B3FKveTCs729tThVqnMYt7DPvLjTF
	c7LN4qjMrgpP2lq2P8g6jD0VfjdO8lkXAu5mk+7LrbIf/wowCoK52hII2a+n83eli65G0IuU4yo2/
	J5LkvtbUK4pEjINXibGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vByj9-000000071dJ-29SR;
	Thu, 23 Oct 2025 17:03:51 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vByj6-000000071cQ-2sWJ;
	Thu, 23 Oct 2025 17:03:50 +0000
Received: from mail.maildlp.com (unknown [172.18.186.31])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4csslW00WZz6L4xM;
	Fri, 24 Oct 2025 01:02:14 +0800 (CST)
Received: from dubpeml100005.china.huawei.com (unknown [7.214.146.113])
	by mail.maildlp.com (Postfix) with ESMTPS id 226131402FB;
	Fri, 24 Oct 2025 01:03:43 +0800 (CST)
Received: from localhost (10.203.177.15) by dubpeml100005.china.huawei.com
 (7.214.146.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Thu, 23 Oct
 2025 18:03:40 +0100
Date: Thu, 23 Oct 2025 18:03:39 +0100
From: Jonathan Cameron <jonathan.cameron@huawei.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
CC: Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>, David Airlie
	<airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>, Thomas Zimmermann <tzimmermann@suse.de>,
	Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>,
	Vinod Koul <vkoul@kernel.org>, Moritz Fischer <mdf@kernel.org>, Xu Yilun
	<yilun.xu@intel.com>, Bartosz Golaszewski <brgl@bgdev.pl>, Guenter Roeck
	<linux@roeck-us.net>, Andi Shyti <andi.shyti@kernel.org>, Jonathan Cameron
	<jic23@kernel.org>, "Dmitry Torokhov" <dmitry.torokhov@gmail.com>, Georgi
 Djakov <djakov@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Joerg
 Roedel <joro@8bytes.org>, "Jassi Brar" <jassisinghbrar@gmail.com>, Mauro
 Carvalho Chehab <mchehab@kernel.org>, Lee Jones <lee@kernel.org>, Miquel
 Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>,
	"Vignesh Raghavendra" <vigneshr@ti.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
	"Jakub Kicinski" <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Johannes
 Berg <johannes@sipsolutions.net>, Krzysztof =?UTF-8?Q?Wilczy=C5=84ski?=
	<kwilczynski@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>, "Bjorn
 Helgaas" <bhelgaas@google.com>, Kishon Vijay Abraham I <kishon@kernel.org>,
	Sebastian Reichel <sre@kernel.org>, Uwe =?UTF-8?Q?Kleine-K=C3=B6nig?=
	<ukleinek@kernel.org>, Mark Brown <broonie@kernel.org>, Mathieu Poirier
	<mathieu.poirier@linaro.org>, Philipp Zabel <p.zabel@pengutronix.de>, Olivia
 Mackall <olivia@selenic.com>, Herbert Xu <herbert@gondor.apana.org.au>,
	Daniel Lezcano <daniel.lezcano@linaro.org>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-clk@vger.kernel.org>,
	<dri-devel@lists.freedesktop.org>, <linux-fbdev@vger.kernel.org>,
	<dmaengine@vger.kernel.org>, <linux-fpga@vger.kernel.org>,
	<linux-gpio@vger.kernel.org>, <linux-hwmon@vger.kernel.org>,
	<linux-i2c@vger.kernel.org>, <linux-iio@vger.kernel.org>,
	<linux-input@vger.kernel.org>, <linux-pm@vger.kernel.org>,
	<iommu@lists.linux.dev>, <linux-media@vger.kernel.org>,
	<linux-mtd@lists.infradead.org>, <netdev@vger.kernel.org>,
	<linux-wireless@vger.kernel.org>, <linux-pci@vger.kernel.org>,
	<linux-phy@lists.infradead.org>, <linux-pwm@vger.kernel.org>,
	<linux-remoteproc@vger.kernel.org>, <linux-crypto@vger.kernel.org>,
	<linux-sound@vger.kernel.org>, <linux-usb@vger.kernel.org>
Subject: Re: [PATCH] dt-bindings: Remove extra blank lines
Message-ID: <20251023180339.0000525e@huawei.com>
In-Reply-To: <20251023143957.2899600-1-robh@kernel.org>
References: <20251023143957.2899600-1-robh@kernel.org>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
X-Originating-IP: [10.203.177.15]
X-ClientProxiedBy: lhrpeml500011.china.huawei.com (7.191.174.215) To
 dubpeml100005.china.huawei.com (7.214.146.113)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251023_100349_029918_0188DA4F 
X-CRM114-Status: UNSURE (   7.31  )
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

On Thu, 23 Oct 2025 09:37:56 -0500
"Rob Herring (Arm)" <robh@kernel.org> wrote:

> Generally at most 1 blank line is the standard style for DT schema
> files. Remove the few cases with more than 1 so that the yamllint check
> for this can be enabled.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
Acked-by: Jonathan Cameron <jonathan.cameron@huawei.com>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
