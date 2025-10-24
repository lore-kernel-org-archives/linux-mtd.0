Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C02DCCF9E3
	for <linux-mtd@archiver.kernel.org>; Fri, 24 Oct 2025 10:30:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gaY7cTRe6jq/Ft8RW0pl3o0F96UHi6OC6nugyMSmVyY=; b=YWHoHjxs/xMTZ1
	pSvD9z39qKt2lU989iL5hZ4nWBDoYP7i+e60uT3yjp1t1j9QO9VajGMWSB5F66niReXxcJNLqy6A4
	015DVGxfQhEsXUoJssKxidaiyWbwGzcM33GzvmZEmioz8NAtk7UEze8Czq7s+T8VS9rhrinUUV127
	2VupPKmJSc6zBwhuZu36GtcXvxHbhHvi1uOVtdi5YOBlm6M16Y0pCVCuAkRYCtYXaWAvr3Z/9+vJr
	lUmozTyVNvOcbE4fkEIaacHOvm+Qj9N+XOBwKec5JZwTgw4+0Fu0QansEhmwVqGwqwMRjA2g+NAM2
	TpA6dqG/CH2APNXsSePg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCF4H-000000092B0-3WWu;
	Fri, 24 Oct 2025 10:30:45 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCF4F-000000092A8-2vcR;
	Fri, 24 Oct 2025 10:30:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D291B4876E;
	Fri, 24 Oct 2025 10:30:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E75CC4CEF1;
	Fri, 24 Oct 2025 10:30:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761301842;
	bh=xjBMkmI+qsDoGp9ZiRzBUp/jILZSgk47twlvE8podR4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=l/d2Y+U8bQs8VF+XsPwC/lo+bxBE0j4eWS6VDHNCD/dOyGEFM7pOVi7s1xB8wyT1F
	 jv0kcNfIyneAU7DFc2XMuu8oHJ2C93dqlydWRrXYT3RCBqDbolkiQ18EsFfqCwzdIT
	 F0FJ+u2jbBRNARJVywQ0ZMr1PM6LZQ50TTD9W4llmkHp0cxkQM8R7YTAZNZuhKj472
	 K02nhKLn9f/Q1d19EUPlbhQT59235yFCKn8XDWmWaJOjbnUv34C0E0GbdT7yY2B8c1
	 q4jVSAnw+7Qfl9JCs14YGXOOwUUitTY/lsolUgoznKOAtNMsr23PjYx6i1nIOnN4f/
	 YsZZGbsmS20jw==
Date: Fri, 24 Oct 2025 12:30:37 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
	Moritz Fischer <mdf@kernel.org>, Xu Yilun <yilun.xu@intel.com>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Guenter Roeck <linux@roeck-us.net>, 
	Jonathan Cameron <jic23@kernel.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Georgi Djakov <djakov@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Joerg Roedel <joro@8bytes.org>, Jassi Brar <jassisinghbrar@gmail.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Lee Jones <lee@kernel.org>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, 
	Vignesh Raghavendra <vigneshr@ti.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Johannes Berg <johannes@sipsolutions.net>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Sebastian Reichel <sre@kernel.org>, 
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, Mark Brown <broonie@kernel.org>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Olivia Mackall <olivia@selenic.com>, Herbert Xu <herbert@gondor.apana.org.au>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org, dmaengine@vger.kernel.org, 
	linux-fpga@vger.kernel.org, linux-gpio@vger.kernel.org, linux-hwmon@vger.kernel.org, 
	linux-i2c@vger.kernel.org, linux-iio@vger.kernel.org, linux-input@vger.kernel.org, 
	linux-pm@vger.kernel.org, iommu@lists.linux.dev, linux-media@vger.kernel.org, 
	linux-mtd@lists.infradead.org, netdev@vger.kernel.org, linux-wireless@vger.kernel.org, 
	linux-pci@vger.kernel.org, linux-phy@lists.infradead.org, linux-pwm@vger.kernel.org, 
	linux-remoteproc@vger.kernel.org, linux-crypto@vger.kernel.org, linux-sound@vger.kernel.org, 
	linux-usb@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: Remove extra blank lines
Message-ID: <fncqrwr6pi3ttxkf44hncy35ogxqdvql52hdcycq4yakbkeose@gv6lxr6a4uri>
References: <20251023143957.2899600-1-robh@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251023143957.2899600-1-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251024_033043_770552_A8F01CCF 
X-CRM114-Status: UNSURE (   9.46  )
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

Hi Rob,

On Thu, Oct 23, 2025 at 09:37:56AM -0500, Rob Herring (Arm) wrote:
> Generally at most 1 blank line is the standard style for DT schema
> files. Remove the few cases with more than 1 so that the yamllint check
> for this can be enabled.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

Acked-by: Andi Shyti <andi.shyti@kernel.org>

Thanks,
Andi

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
