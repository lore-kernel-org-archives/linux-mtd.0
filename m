Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CEE3EE49A5
	for <linux-mtd@archiver.kernel.org>; Mon, 21 Aug 2023 07:59:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=J6cPww0qZ0IHu0PhLmWwHmxTa6sAQ/U308MWocZQCyo=; b=R4LD9k2iG/01CS
	PlCu5bN0UAYQEKhQ4OJ8zTsq4qZF8NPcZlIEP4A3rctFKnUrTpZ6LjXI4JbHfW/uqlN+f8SiUY8yB
	QoDM7j90wG/i27TzxWF2oC63i2bZBE6XKPU+d0CsgwrbrVoulTMiMyXJe5NiT405Nzzia8gwnAXLh
	e5YX3ON92wU2xCtVrzyZsZcGeoDnCY+CQKGUb7CCdX4QUQGN+1GCq+ccY9T923vbCronsv+/h9/4A
	JVMvF2Wyg+7U3Xq8+p92es0mdAq2pxB9ASSBhz2t6HImOJOfkKKaw8AsrO8bYmWJJLR+Xg/uNoqua
	SApC+i7sxNzgXb4KsBhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qXzoX-00DQd9-2r;
	Mon, 21 Aug 2023 07:59:05 +0000
Received: from relay9-d.mail.gandi.net ([2001:4b98:dc4:8::229])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qXznn-00DPzC-2b;
	Mon, 21 Aug 2023 07:58:22 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id DFE36FF809;
	Mon, 21 Aug 2023 07:58:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1692604696;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Uc2Xg/1450PAikBhYpYT3mmBo7X64EeqDOUbq51ENXM=;
	b=gf7CzRkiUuhczHShIhEayXodQaO5V+QuVX0h1BjRt3TTUvAn5h3DMJxrlQ5kKoYFF44p8O
	TMIniBu7I7ZWMliERBGJ+ajrPEUgNa/IJ6+/CoKIU8O+EczLM30wCC4mzJ8R/WEtd/q9a2
	bLye2bn/nVPT1Wn1pmEBNKP1S75AdD58u7MdtTAJ3OMj9slo+Ru7G9hcHrFu42bLi//sxp
	GOIeOjt9Q9uAMTTjbuStK2t4Zpb1AJ4VDSz5Ahvv9GL5M+ULvlSgZVHBPBoS2GBrUoJh2r
	ohLN5kzYNbx3eF78qiRnw/zaf/Z4Jr+2S5BhXo5jedF4LdIhha7apuhT1Z84sg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Li Zetao <lizetao1@huawei.com>,
	miquel.raynal@bootlin.com
Cc: alexandre.torgue@foss.st.com,
	angelogioacchino.delregno@collabora.com,
	christophe.kerello@foss.st.com,
	christophe.leroy@csgroup.eu,
	dmitry.torokhov@gmail.com,
	frank.li@vivo.com,
	geert+renesas@glider.be,
	heiko@sntech.de,
	jernej.skrabec@gmail.com,
	jinpu.wang@ionos.com,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-mtd@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-sunxi@lists.linux.dev,
	martin.blumenstingl@googlemail.com,
	matthias.bgg@gmail.com,
	mcoquelin.stm32@gmail.com,
	michael@walle.cc,
	michal.simek@amd.com,
	paul@crapouillou.net,
	philmd@linaro.org,
	pratyush@kernel.org,
	richard@nod.at,
	robh@kernel.org,
	rogerq@kernel.org,
	samuel@sholland.org,
	stefan@agner.ch,
	tudor.ambarus@linaro.org,
	u.kleine-koenig@pengutronix.de,
	vigneshr@ti.com,
	vz@mleia.com,
	wens@csie.org,
	yangyingliang@huawei.com
Subject: Re: [PATCH -next v3 03/12] mtd: rawnand: fsmc: Use helper function devm_clk_get_enabled()
Date: Mon, 21 Aug 2023 09:58:13 +0200
Message-Id: <20230821075813.33396-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230821031737.1973183-4-lizetao1@huawei.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'ee0152d0b4e624205c24845d3ca57015a941b361'
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230821_005820_002418_E334C27A 
X-CRM114-Status: UNSURE (   5.94  )
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

On Mon, 2023-08-21 at 03:17:28 UTC, Li Zetao wrote:
> Since commit 7ef9651e9792 ("clk: Provide new devm_clk helpers for prepared
> and enabled clocks"), devm_clk_get() and clk_prepare_enable() can now be
> replaced by devm_clk_get_enabled() when driver enables (and possibly
> prepares) the clocks for the whole lifetime of the device. Moreover, it is
> no longer necessary to unprepare and disable the clocks explicitly. The
> label "disable_clk" no longer makes sense, rename it to "disable_fsmc".
> 
> Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>
> Signed-off-by: Li Zetao <lizetao1@huawei.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
