Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A22AAC0015E
	for <linux-mtd@archiver.kernel.org>; Thu, 27 Jul 2023 15:18:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8WXxnIVfOeEVqYLigj5dofyJwSsQXpGLt4t/Ni7sZAo=; b=WOGU0qEfVHtbmL
	RnOzcTkj0yL2HQdY/8AbauJKhFpa1AavYhNC7f9FZAs7+Y7MKxZA3ci90t/wdvlGi71uyvzMAsGgm
	H3r2Bdf2DWgvzeicsv0R72hO61lzfb8Lz7Pg4xZe9HdXR63B/PU2xVJ3oqaY0kuwEFkDo/0jFUWUB
	/36G0Q+WTDMTWJrdiy/CF0q8BlzgPeeZiakdff798P+1mLhCeXyDdx7MSVJrKLIu5gAe+YmM0WfM4
	RMPgGYj/4psmRK0slYKxJISI2cIyi0QijhVQymJIvLqs0lQtYVaXFoO/Ag++6z10MKRwH9/XOMZ5g
	/+rMGuYPbswEpUVH6E4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qP2kr-00Flmx-0i;
	Thu, 27 Jul 2023 15:18:17 +0000
Received: from relay6-d.mail.gandi.net ([2001:4b98:dc4:8::226])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qP2kj-00FlaC-1x;
	Thu, 27 Jul 2023 15:18:11 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 998C9C0006;
	Thu, 27 Jul 2023 15:17:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1690471084;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9aqdGX9nA2iQX2zweZK++in7R/avXw9W2bX/HtVPsxU=;
	b=RJKiI6QqwOneXyDOlHI7qbB9SyJiAEERWGqIsT0b0+gNi9GTgzZzaUkE+BE7gvc8+kuQdR
	QWijR44Pcc8xVjqfnxBToFbBJ2wPbk4r6WOIoJtjY0E+StOeLVOD3syqjRgUoSxoFIJmRZ
	xaK8qo0O240qPLXk0xh/K7Dd3pj9NDjtQ7v2369bc4LXLvt1R9iVO/oRVkKBb9PguVhtKC
	4sa9pJls3QpfcVq2mav+OR2b6Qg6msajS+eN6b7WwzjlPV8w5ZavHal9WfWUZEGwH8GpM7
	W0gkJHi4IN2im5i/LVAOqcTuq9ihYtVyFT5QUd8AzSelfeP5NCLRty5uapSXBA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Rob Herring <robh@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	Han Xu <han.xu@nxp.com>,
	Harvey Hunt <harveyhuntnexus@gmail.com>,
	Paul Cercueil <paul@crapouillou.net>,
	Liang Yang <liang.yang@amlogic.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Michal Simek <michal.simek@amd.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Vladimir Zapolskiy <vz@mleia.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <michael@walle.cc>
Cc: devicetree@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mips@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Subject: Re: [PATCH] mtd: Explicitly include correct DT includes
Date: Thu, 27 Jul 2023 17:17:56 +0200
Message-Id: <20230727151757.586430-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230714174751.4060439-1-robh@kernel.org>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'c2fc6b6947905eee832e9ef445df4803f0056cc6'
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230727_081809_793951_321B48DD 
X-CRM114-Status: GOOD (  10.38  )
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

On Fri, 2023-07-14 at 17:47:49 UTC, Rob Herring wrote:
> The DT of_device.h and of_platform.h date back to the separate
> of_platform_bus_type before it as merged into the regular platform bus.
> As part of that merge prepping Arm DT support 13 years ago, they
> "temporarily" include each other. They also include platform_device.h
> and of.h. As a result, there's a pretty much random mix of those include
> files used throughout the tree. In order to detangle these headers and
> replace the implicit includes with struct declarations, users need to
> explicitly include the correct includes.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> Acked-by: Heiko Stuebner <heiko@sntech.de>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
