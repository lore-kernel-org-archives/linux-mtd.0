Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81648C79F99
	for <linux-mtd@archiver.kernel.org>; Tue,  8 Sep 2026 17:19:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tLiwp6EG8gklkUinWy/ZGFwjwG/FnUozY93I5ampTsY=; b=LeDdSeeRKkJaJq
	vJOt1GVq1Sdj2n5l1kRX5GMFy0LjDs3r7d1Gl73lsChC6yLolIzHJiYfbF3DFGsuM9YRWiLoXsnFo
	dDWsSCXzegAvZK0FiqGR5xPSHBvwTpv+rS3I2JBwNYW8o82vV2+e+g3ckeFXogmEkPUatzTTX6wHi
	8HwPH1tUlkH/RX+s0oWv81gzeAPslHROB8En+PgjZ0RRiWA+wZ44yTUr1k0I7D+GdgFMEwif66L0Y
	iG4UixALnxyj9M9QJWCga64/xFQ0N2mxSJNkaFAiAtiZAJcfAP794Yrqwn6VieJXpz25vYfMWpzP5
	dThqXBpoUoB9W3ofh6KQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3zTS-00000009nXq-1wmQ;
	Tue, 08 Sep 2026 17:19:10 +0000
Received: from lahtoruutu.iki.fi ([185.185.170.37])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3zTN-00000009nUP-1ume;
	Tue, 08 Sep 2026 17:19:08 +0000
Received: from darkstar.musicnaut.iki.fi (85-76-138-200-nat.elisa-mobile.fi [85.76.138.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: aaro.koskinen)
	by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 4hfVyj3s1Sz49Q5S;
	Tue, 08 Sep 2026 20:18:37 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
	t=1788887928;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=PO/N7p293WhZWOnEDuSy9gtwR4Cj1KkgRIMnOyAdkIo=;
	b=RuEeEMW/lTLQi0I0YRvcxTIwqjW3vNe/zSCBmL/PGJcJBZCIMJydTjFu34u3aTjpaeBQp/
	qlxsWAySlfMOjDBRxCvil5yr9Go9xiMyb3yHsgrHzpvjURsZDuC2J0VNoTCAzH9d50ohZ9
	SZt4pd7ThrbA6qTlPwQRFXl85Go9ymb2mUnYH8zcdlBH8xKgdDG/aUdijBE6B91mHYsf/3
	jHGxS5ZdtOAqcHIzQf8RLPi05/UAICgWjCa4RVxqPJrKEa4fpqAwol5EP2Mr/pyCO5XkJf
	TvQHKUsuqJlrBKO1872gFYm514Sf7gAjW1wQgR4YUn/6wUUZCkdvej9fYv4iag==
ARC-Seal: i=1; a=rsa-sha256; d=iki.fi; s=lahtoruutu; cv=none; t=1788887928;
	b=SbNwL400m2OjexdcOokzSVLBXJYp5eFG2UrettS0xu6rLtPQAw0BoPf/Rha3nNm32X4n6N
	pZhnu1IOhmA42K4eSL3KfjRee1wbSyxocwUHfDcWMWOHXj4ILLfIYj0jWl0C3v0shda8Cs
	YtShuPaJjzTUQuyHUm+jWn6ClSqpo3i6e8bdD1Sy6wO5h9/gMFr72HuFxxQuuwAWWrwBjJ
	Bvhd7kAL7qs2ZH5rUYZr3YJgdQLEkmeHK6NniKr8EnUhnI15MVz9pr297APC9kWFLR28Nd
	gJE3miv9HUpHfPcdmHHFoGcNaVcJ+kap7WMST5SiQb1OOG5go9hAWHx3O2mZBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=lahtoruutu; t=1788887928;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=PO/N7p293WhZWOnEDuSy9gtwR4Cj1KkgRIMnOyAdkIo=;
	b=PKxyd3l3jvpv/hX9vp8woYeZp39vkZDVbD7MEec2pYDL0IMXGYLnkm9tAwprnb+m4HisQ2
	CW5kybZg+P7otj2oJtrIFVpdmVNtKUmS31fGV6YnREg1F9XRdbVjOZCdwPkB+jNi1dUtUI
	7yL74o8J8adJHO9mTvoZjYN74doQp6+pmwVJQy8Vv4FXx5KqxhCn4/JS5JJmDwh/x0KBFz
	RKjUDwmtYkvNckHVaeu/b+tTcKJKCccwev1BtIq7RW5wBTe5/NKaKTS+d0hIbqi3vontaO
	eaNQzuBeoWECcyoUJmaDmeTAaq1rBu7nKsbJHhov2Dyhro3U1y7boF5omjgoAA==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=aaro.koskinen smtp.mailfrom=aaro.koskinen@iki.fi
Date: Tue, 8 Sep 2026 20:18:35 +0300
From: Aaro Koskinen <aaro.koskinen@iki.fi>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Linus Walleij <linusw@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Drew Fustini <fustini@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Vladimir Zapolskiy <vz@mleia.com>, Stefan Agner <stefan@agner.ch>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andreas Kemnade <andreas@kemnade.info>,
	Kevin Hilman <khilman@baylibre.com>,
	Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Andrew Lunn <andrew@lunn.ch>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Kristoffer Ericson <kristoffer.ericson@gmail.com>,
	Ethan Nelson-Moore <enelsonmoore@gmail.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Alexander Sverdlin <alexander.sverdlin@siemens.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Karl Mehltretter <kmehltretter@gmail.com>,
	"David Hildenbrand (Arm)" <david@kernel.org>,
	Nicolas Pitre <npitre@baylibre.com>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-omap@vger.kernel.org, Paul Walmsley <paul@pwsan.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	Helge Deller <deller@gmx.de>, Tero Kristo <kristo@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	linux-media@vger.kernel.org, linux-mtd@lists.infradead.org,
	linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linux-clk@vger.kernel.org
Subject: Re: [PATCH 06/13] ARM: omap2: remove omap24xx support
Message-ID: <aqBDa2f__ZE5BQao@darkstar.musicnaut.iki.fi>
References: <20260908152808.3928630-1-arnd@kernel.org>
 <20260908152808.3928630-7-arnd@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260908152808.3928630-7-arnd@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_101905_687166_B150B80F 
X-CRM114-Status: GOOD (  12.93  )
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

Hi,

On Tue, Sep 08, 2026 at 05:27:56PM +0200, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> The omap24xx SoC platform was used in the Nokia N800 and N810 tablets
> released on 2007 and was among the first ARMv6 CPUs in products that
> made it into products.
> 
> Unfortunately the early ARM1136r0 CPU cores had a number of quirks that
> caused a disproportionate amount of work to keep them compatible with
> later ARMv6K/v7/v8 implementations.
> 
> Drop the support for this SoC in order to allow removing ARM1136r0.
> 
> Cc: Aaro Koskinen <aaro.koskinen@iki.fi>

Acked-by: Aaro Koskinen <aaro.koskinen@iki.fi>

A.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
