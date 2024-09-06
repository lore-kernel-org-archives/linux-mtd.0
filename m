Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28079CE7B1E
	for <linux-mtd@archiver.kernel.org>; Fri,  6 Sep 2024 15:08:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=U6pgQphjm4qlkDY6M30viPPkYbZyJZT5aHl/4prh4N0=; b=IilRTcPdWhy/em
	hb8yEaZ9Tgo0BRhJHuClojUZ/qn89YZp2UzIFVj9jdmRR6DmGYHJBVaz7O63xi7sQhcXyY8J4f8bI
	uPGiSQvTUIsAZqhMWZ1zwqGElextB/uartPl1KdAV7hS/6CNe4UKlesOxEwc7lo23b65yFlKMMBWG
	Qwfygc43pOla/bQGS1KHJcoNYl7eGOhqRLqTYPRvZcyXe0IAAp4eKKZE+stP5d6ey+kVdpzm+vzhd
	N1ajgsx379zFp5z0fWCJaF4xmLpKZJqCG0fPMIg+sG9oM081fEl/b++y3FwjJYQeBV+yKXFlp//C8
	6G6WeP6eKGSIRhVl1nqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smaZ8-0000000Ch4c-2OZU;
	Fri, 06 Sep 2024 15:08:02 +0000
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smaV5-0000000Cf0C-1vLB;
	Fri, 06 Sep 2024 15:03:52 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id F10221BF206;
	Fri,  6 Sep 2024 15:03:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1725635029;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=b8ODKZaCniGTHW6OkRl9tVAEUv9GIxZiiZmZyth8g8g=;
	b=Vg4M17S0ts0e61e+Vye/efUQ1IIDQhnk6EdDJDu89ir9Pu5Y737hcF9pXu1NLMK2PEC4a7
	NgTDWV9F3FKJX9LxL+M/+S9ZQ8/mP+T8IN5fOwRKtWlLpAdCcHdS5KWz/qY00/1+Vi12y8
	THdSw45/vQW+CeaApXaPfGH8f9RFKLDjV4rbA7Lh+0bb+Uqv57plcCWHuputbDJKxDoBSg
	IVEEfOHCmCtNK9t5txrASCVVXg9NNDdrN38ZjwliS3O5YvNykCR8nFDGclDB4RguZkBoTG
	0jh1yABAwDhXgY7mCgW6WuiUg6FDzPmpgHX8S8RTmOOYhUAWtzO4z5BRVNNbNQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Jinjie Ruan <ruanjinjie@huawei.com>,
	miquel.raynal@bootlin.com,
	michal.simek@amd.com,
	richard@nod.at,
	vigneshr@ti.com,
	liang.yang@amlogic.com,
	neil.armstrong@linaro.org,
	khilman@baylibre.com,
	jbrunet@baylibre.com,
	martin.blumenstingl@googlemail.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	heiko@sntech.de,
	mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com,
	wens@csie.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	kees@kernel.org,
	gustavoars@kernel.org,
	linux@treblig.org,
	robh@kernel.org,
	u.kleine-koenig@pengutronix.de,
	erick.archer@gmx.com,
	christophe.jaillet@wanadoo.fr,
	val@packett.cool,
	christophe.kerello@foss.st.com,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	krzk@kernel.org,
	jic23@kernel.org
Subject: Re: [PATCH -next RESEND 06/10] mtd: rawnand: meson: Use for_each_child_of_node_scoped()
Date: Fri,  6 Sep 2024 17:03:46 +0200
Message-ID: <20240906150346.734628-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240826094328.2991664-7-ruanjinjie@huawei.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'ee06c7821d0426d0f998593cbc442757247e7cd6'
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240906_080351_650437_BB3BAD03 
X-CRM114-Status: UNSURE (   4.62  )
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

On Mon, 2024-08-26 at 09:43:24 UTC, Jinjie Ruan wrote:
> Avoids the need for manual cleanup of_node_put() in early exits
> from the loop.
> 
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
