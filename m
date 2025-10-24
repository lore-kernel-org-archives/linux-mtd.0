Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80ACECCD1BF
	for <linux-mtd@archiver.kernel.org>; Fri, 24 Oct 2025 14:59:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dLPacKgMfZb6xFzchQznIcmt9vcj+7FCVAgHGS7KW2M=; b=GnOhkaSrz1YO1b
	5qgOVPcFHpanSXkJczUGoUGnCMU6D20otURAbXkyoKm9Aye6NGg4ThAcEjnwmIPndSL2sAvf9tPjF
	YdT/Bq/FLLR9xDCeHHpuiXnXSwHW4YoDhi1MuKpNiaGQNbgI30Y+e/uE4ZyNAG/LpwSrSLc0llLEs
	C9xqe7/NDVQFORkHr8W8ENBvkQMCy+Kr3+H4cPNvDKWVcEuaG9p3Z8eD5XmJJh1gGl+FV8KWBcPzk
	SMJaIUWQdPj4F0ifGW4YVmvWEKWfsKeQZXEgp4Y1IBFYm8ZBBCDyK8pNIF66QFb8ponXBlURTYYrw
	pOoW2/AXrWHWGWK8sxjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCJGR-00000009k9O-2ekW;
	Fri, 24 Oct 2025 14:59:35 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCJGP-00000009k8o-3ZKE;
	Fri, 24 Oct 2025 14:59:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D7187455AD;
	Fri, 24 Oct 2025 14:59:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB6A2C4CEF1;
	Fri, 24 Oct 2025 14:59:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761317972;
	bh=YlGEYTT5nrHovfloLOOpUQRYN+fXsCYG2LixOaa5378=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=I/4F9kA1e7P2p4l5Kvey8Q2WS1TGvL+gAQgqglnM7cmRBIbBVx1y0KF3FxqlHN3hw
	 DgUerun10okT687v2FNFL1mveKVGAuMBci/DNS7IeNQx4dHxCN0LMvEmYDSzUSJTwu
	 gUY+8uEjZe4tu24kb84PL0W6wXuKbAvKH4nxG++v9LyeMh0H4C3ueJByez8hbGKbS6
	 xqXi3KAU0karokUs3nlG9tBvMchWD6lkMGi3JAGU/AYT1rog8Vem1Xs7Tu1xe8NjIV
	 loFh9k/M45Xg8oOhyvuELi7rogTRTE+/JFOTfxl9M529IWpSCrO4/yVB5ofkwHPO1f
	 K+WsCVS+PAmZQ==
Message-ID: <d87ac82b-0ca9-417d-a239-c68cfdfa4c78@kernel.org>
Date: Fri, 24 Oct 2025 17:59:06 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: Remove extra blank lines
To: "Rob Herring (Arm)" <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>,
 Vinod Koul <vkoul@kernel.org>, Moritz Fischer <mdf@kernel.org>,
 Xu Yilun <yilun.xu@intel.com>, Bartosz Golaszewski <brgl@bgdev.pl>,
 Guenter Roeck <linux@roeck-us.net>, Andi Shyti <andi.shyti@kernel.org>,
 Jonathan Cameron <jic23@kernel.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>, Joerg Roedel <joro@8bytes.org>,
 Jassi Brar <jassisinghbrar@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Lee Jones <lee@kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Johannes Berg <johannes@sipsolutions.net>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Bjorn Helgaas
 <bhelgaas@google.com>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Sebastian Reichel <sre@kernel.org>, =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?=
 <ukleinek@kernel.org>, Mark Brown <broonie@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Olivia Mackall <olivia@selenic.com>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, dmaengine@vger.kernel.org,
 linux-fpga@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-hwmon@vger.kernel.org, linux-i2c@vger.kernel.org,
 linux-iio@vger.kernel.org, linux-input@vger.kernel.org,
 linux-pm@vger.kernel.org, iommu@lists.linux.dev,
 linux-media@vger.kernel.org, linux-mtd@lists.infradead.org,
 netdev@vger.kernel.org, linux-wireless@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-pwm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
 linux-crypto@vger.kernel.org, linux-sound@vger.kernel.org,
 linux-usb@vger.kernel.org
References: <20251023143957.2899600-1-robh@kernel.org>
From: Georgi Djakov <djakov@kernel.org>
Content-Language: en-US
In-Reply-To: <20251023143957.2899600-1-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251024_075933_929765_666976D7 
X-CRM114-Status: UNSURE (   7.79  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 10/23/25 5:37 PM, Rob Herring (Arm) wrote:
> Generally at most 1 blank line is the standard style for DT schema
> files. Remove the few cases with more than 1 so that the yamllint check
> for this can be enabled.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
[..]>   .../devicetree/bindings/interconnect/qcom,rpmh.yaml          | 1 -
Acked-by: Georgi Djakov <djakov@kernel.org>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
