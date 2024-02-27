Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACAAFC48BF6
	for <linux-mtd@archiver.kernel.org>; Tue, 27 Feb 2024 01:22:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=I624tRgtIrAczBLR3SbZFUmueEhrzP+bLqmgB9h74C4=; b=LL3NiHCoVXIAal
	XhiK/cvYfNIml5C/TVQrfNSVZ52O/TLD7EoO/09+3sZ5/Zv0KryKEbnXAhmWB23jaPCmvVsoNrsqo
	oN+XOqHZAq8vEsQxkY4p/e43KwSduhnhnAxGuVnWLQQZKn743nDEGh2jAlJrxJN8746DOitXcN7Ow
	gjBgT1tSh6LCxUEkNjmAqMkH5wKfqRDEPdcxybjYWd5FnAQGhm3EV8rv4BYlKAR5P7S5kU2pxu/sF
	0vqpF1rMz1R9QLSR4MANBIV5AK2dIkzIjI04D6CYAMRqll3E6z+tosAJRyGmV46kY6DEF9G+BShGY
	ulYXMrnGzDIvR6a1ISGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1remAZ-00000003G9o-3cn7;
	Tue, 27 Feb 2024 01:22:07 +0000
Received: from 5.mo582.mail-out.ovh.net ([46.105.54.31])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1remAV-00000003G25-2GYR
	for linux-mtd@lists.infradead.org;
	Tue, 27 Feb 2024 01:22:06 +0000
Received: from director2.ghost.mail-out.ovh.net (unknown [10.108.2.179])
	by mo582.mail-out.ovh.net (Postfix) with ESMTP id 4TkKTD34Rdz19jK
	for <linux-mtd@lists.infradead.org>; Tue, 27 Feb 2024 01:21:52 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-f4n6p (unknown [10.111.174.252])
	by director2.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 605D91FD7C;
	Tue, 27 Feb 2024 01:21:40 +0000 (UTC)
Received: from etezian.org ([37.59.142.108])
	by ghost-submission-6684bf9d7b-f4n6p with ESMTPSA
	id uPD7FCQ53WXtyQAAxDwYeA
	(envelope-from <andi@etezian.org>); Tue, 27 Feb 2024 01:21:40 +0000
Authentication-Results: garm.ovh; auth=pass (GARM-108S002fe1109a9-1c88-4d0a-8ee4-2e8d2b473102,
                    9285090D84508773EC2C25A4099646E261C64314) smtp.auth=andi@etezian.org
X-OVh-ClientIp: 89.217.109.169
From: Andi Shyti <andi.shyti@kernel.org>
To: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
 conor+dt@kernel.org, nicolas.ferre@microchip.com, 
 alexandre.belloni@bootlin.com, claudiu.beznea@tuxon.dev, 
 mturquette@baylibre.com, sboyd@kernel.org, herbert@gondor.apana.org.au, 
 davem@davemloft.net, tglx@linutronix.de, tudor.ambarus@linaro.org, 
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com, 
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, 
 linus.walleij@linaro.org, sre@kernel.org, u.kleine-koenig@pengutronix.de, 
 p.zabel@pengutronix.de, olivia@selenic.com, radu_nicolae.pirea@upb.ro, 
 richard.genoud@gmail.com, gregkh@linuxfoundation.org, jirislaby@kernel.org, 
 lgirdwood@gmail.com, broonie@kernel.org, wim@linux-watchdog.org, 
 linux@roeck-us.net, linux@armlinux.org.uk, andrei.simion@microchip.com, 
 mihai.sain@microchip.com, andre.przywara@arm.com, neil.armstrong@linaro.org, 
 tony@atomide.com, durai.manickamkr@microchip.com, geert+renesas@glider.be, 
 arnd@arndb.de, Jason@zx2c4.com, rdunlap@infradead.org, rientjes@google.com, 
 vbabka@suse.cz, mripard@kernel.org, codrin.ciubotariu@microchip.com, 
 eugen.hristev@collabora.com, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-crypto@vger.kernel.org, 
 linux-i2c@vger.kernel.org, linux-mtd@lists.infradead.org, 
 netdev@vger.kernel.org, linux-gpio@vger.kernel.org, 
 linux-pm@vger.kernel.org, linux-pwm@vger.kernel.org, 
 linux-rtc@vger.kernel.org, linux-spi@vger.kernel.org, 
 linux-serial@vger.kernel.org, alsa-devel@alsa-project.org, 
 linux-sound@vger.kernel.org, linux-watchdog@vger.kernel.org, 
 Varshini Rajendran <varshini.rajendran@microchip.com>
In-Reply-To: <20240223171342.669133-1-varshini.rajendran@microchip.com>
References: <20240223171342.669133-1-varshini.rajendran@microchip.com>
Subject: Re: (subset) [PATCH v4 00/39] Add support for sam9x7 SoC family
Message-Id: <170899689860.412407.545047377007032928.b4-ty@kernel.org>
Date: Tue, 27 Feb 2024 02:21:38 +0100
MIME-Version: 1.0
X-Mailer: b4 0.13.0
X-Ovh-Tracer-Id: 4120793662683875913
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvledrgeefgdeffecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfgjfhfukfffgggtgffosehtjeertdertdejnecuhfhrohhmpeetnhguihcuufhhhihtihcuoegrnhguihdrshhhhihtiheskhgvrhhnvghlrdhorhhgqeenucggtffrrghtthgvrhhnpeelkefhieeljeejffdtvddthfffleffueekkefgieelveejjedtudettdeghfdutdenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecukfhppeduvdejrddtrddtrddupdekledrvddujedruddtledrudeiledpfeejrdehledrudegvddruddtkeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomheprghnughisegvthgviihirghnrdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtoheplhhinhhugidqmhhtugeslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdpoffvtefjohhsthepmhhoheekvddpmhhouggvpehsmhhtphhouhht
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240226_172203_925504_6B917252 
X-CRM114-Status: GOOD (  10.55  )
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

Hi

On Fri, 23 Feb 2024 22:43:42 +0530, Varshini Rajendran wrote:
> This patch series adds support for the new SoC family - sam9x7.
>  - The device tree, configs and drivers are added
>  - Clock driver for sam9x7 is added
>  - Support for basic peripherals is added
>  - Target board SAM9X75 Curiosity is added
> 
>  Changes in v4:
>  --------------
> 
> [...]

Applied to i2c/i2c-host on

git://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux.git

Thank you,
Andi

Patches applied
===============
[06/39] dt-bindings: i2c: at91: Add sam9x7 compatible string
        commit: a856c9e6104f7b4619f09e19ab95903c7888da96


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
