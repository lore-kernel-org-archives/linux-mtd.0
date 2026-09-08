Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FC94C79F82
	for <linux-mtd@archiver.kernel.org>; Tue,  8 Sep 2026 19:22:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RszRpLpbevtRdMjofbSL2+XQXjtFMH4nMETSrQNNTMs=; b=SnO6TXxWHe7EOf
	wVkgTkb8bCwG+6K9BSiQr11wOW/f2431IN3LSmNFs9zmFr+5tSsDWEAw3G2L7xZQ/rqo7lC9nZbhS
	kL/C98e1QPlNZtUotve3y/YsRymERp1OEgp8iDY/dgRa/iLXxqfA6gKOOXTt42lrYQ23tiTdh2opG
	shy/CIIDOPqtkgoLZkaIHD54ckJMqjaP8u6OiLReSsu/mQOQx+gsbL2z080bUTzdj2uFYXYcfEQds
	tltotykbBfMX23C+EopysCUbiKIgmw/ZShrU5/l87bDKybco0cU/frUMOfY8QlfKmVzFMvDaOq0jP
	8xC2KHkvaixRwgiLEWlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x41P1-0000000A48Z-209a;
	Tue, 08 Sep 2026 19:22:43 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x41Oy-0000000A47M-3w5I
	for linux-mtd@lists.infradead.org;
	Tue, 08 Sep 2026 19:22:42 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-49cd77e0f95so40582515e9.3
        for <linux-mtd@lists.infradead.org>; Tue, 08 Sep 2026 12:22:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788895358; x=1789500158; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GVs4+8gm56Wnu6exUObCNgkOQEYDE8t6OW3Oqkq6qd8=;
        b=HHS1BwIxyYha85fUy+fMumUUujRYY8ht20/3ylLRhsx7FROEHNiEwHh+AzEuFxXPGs
         Ybl+0fTYdDC7yhQyVrsBA3ReQl6xalR9BXF7hfcbKfcuHrASWVkU60VJm/I3LZ8L7LTo
         Jg/Z0CSUj00Cuwleo7SIpfBXKp1Dx6qc4rMYlio2ETnvIYxZOrqs8Q/1dy0LsS7uDxnO
         O3PQ/+O+2RTxDYz53Sp6ag3gE7Ad6JzFdASUWlQ0XhrCnT2I+gbX8oXfjHUIOUT5AVIC
         xjbQTYF6+qeU9+JQkut5IQ4CvIqycTBgj5Le7bbQayvVMcRUKcco7c4F0DkzwICvJr0j
         f14A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788895358; x=1789500158;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GVs4+8gm56Wnu6exUObCNgkOQEYDE8t6OW3Oqkq6qd8=;
        b=oIR4I0u+gixi8DElT4Il+q0xaDaP0MSd5i2a36Z4Omfbg/bSCBOwU2LSNc7lcHFVNS
         mWZQbbu/2nXg8/2VD29qrOIyN2mf0nvxTPApofzSh+8eWH81v8Z2+ToDOmQZewHeldUO
         VGXXe2vpPfaHEJwRfKlQZACKpE/+5u/Dd95sgnHD/Al2WemsxNANIe/LpgTz+rz3maTG
         7RipGN6kEbOaPgnd9iACiUnKU3COSIbD9omCPT00tEJ81OOhxSLB6pY6AZ4K0rROtHpu
         olTrOW/F+bf01gnUvRCGpiMkUCf2f6PWbU0R5d7RykWbh1WNv5CT1CSttKTq90DO7Vzj
         8jFw==
X-Forwarded-Encrypted: i=1; AKwUvBwYPf/N6Te/o2DwyA5i+6HmNQrXiKOGBxZN094FwVZBA630Si8b/OlnTNvn5sYCUQYrFliEAQCIke0=@lists.infradead.org
X-Gm-Message-State: AFuF++lnSWPZyzQ677K4oav0ckNOiFHkT21n+oq7qHwYXRuXD9Ccz/Ea
	3D4TJRp64BoHU2LCpqLhR3Wm6MfcWMEXNez5WD9Rtpx0ZdiIQAyve9DY
X-Gm-Gg: AYBFou0cTR+DEaMubWLdbxbE6ozZEnpvqz98jW2pJjp/pc8qt1bPzW5m7gjFyqD7C+L
	vWjkyP0DgVyuIDmm6pVt/qt0Usoita84OFF9eYL6xUVR2qUmTL8VBKxDIgFuD0LFozeHf/7sV5J
	9ijX72F/bplarBF3+yD51mhq2u5251uJuUpQ6GTzoPtsI6MfCQKRoiflWG11q9EmkBLmrAMQOYi
	+8/zvaTYFMksPD7vx9dixSQS7L8OUyKWgLH3Zv90h3AGXIBcS0+YZMqixj24kEA6qQnljWZqhvx
	DnnphTG3eBR3yzKi0uaxdjJ565YPGZrT4fMAXjTY5zv/MXoXHc6DQaAabWBMkKI6hy4ofPbPRr0
	bYFmKYtJWSOVKckiGQ5960UtpUjS9HCO6XSoI5Wk9Cg9TZmnm/hd+ZA6oUpXlyxpboFLHl5M3Yb
	4lsLTboFZlZKXK9BY5EL/1eZVwOVKcGZxUhEUYizXXK2bzZI2nl1jpByPMicUrHoJec/HRBXmCf
	0eGgGlAUZFFYuPrvvg4pNq3k9JneUBPlLQEKfxOTr0pQJHlyETUiTD/IvMg9Dwts09yoSdrjZ16
	wBqZ2fU7cVvvAPJZtEaK8GV9EiqTMw==
X-Received: by 2002:a05:600c:3ba3:b0:49d:e79:612f with SMTP id 5b1f17b1804b1-49d0e79635amr157041045e9.26.1788895358151;
        Tue, 08 Sep 2026 12:22:38 -0700 (PDT)
Received: from MacBook-Pro-von-Karl (dynamic-095-117-170-066.95.117.pool.telefonica.de. [95.117.170.66])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485881353e8sm38080321f8f.1.2026.09.08.12.21.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 12:22:37 -0700 (PDT)
Date: Tue, 8 Sep 2026 21:21:22 +0200
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Linus Walleij <linusw@kernel.org>, 
	Russell King <linux@armlinux.org.uk>, Drew Fustini <fustini@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Liviu Dudau <liviu.dudau@arm.com>, Sudeep Holla <sudeep.holla@kernel.org>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Vladimir Zapolskiy <vz@mleia.com>, 
	Stefan Agner <stefan@agner.ch>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Aaro Koskinen <aaro.koskinen@iki.fi>, 
	Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>, 
	Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
	Gregory Clement <gregory.clement@bootlin.com>, Robert Jarzmik <robert.jarzmik@free.fr>, 
	Kristoffer Ericson <kristoffer.ericson@gmail.com>, Ethan Nelson-Moore <enelsonmoore@gmail.com>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Alexander Sverdlin <alexander.sverdlin@siemens.com>, 
	Shawn Guo <shawnguo@kernel.org>, "David Hildenbrand (Arm)" <david@kernel.org>, 
	Nicolas Pitre <npitre@baylibre.com>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-stm32@st-md-mailman.stormreply.com, linux-omap@vger.kernel.org, Paul Walmsley <paul@pwsan.com>, 
	Herbert Xu <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Kyungmin Park <kyungmin.park@samsung.com>, 
	Helge Deller <deller@gmx.de>, Tero Kristo <kristo@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, linux-media@vger.kernel.org, linux-mtd@lists.infradead.org, 
	linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH 06/13] ARM: omap2: remove omap24xx support
Message-ID: <aqBXOemS4boakDGt@gmail.com>
References: <20260908152808.3928630-1-arnd@kernel.org>
 <20260908152808.3928630-7-arnd@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260908152808.3928630-7-arnd@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_122240_988615_BB935905 
X-CRM114-Status: GOOD (  15.25  )
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

On Tue, Sep 08, 2026 at 05:27:56PM +0100, Arnd Bergmann wrote:
>  86 files changed, 60 insertions(+), 10696 deletions(-)

Note that Sashiko skipped reviewing this patch, because it exceeded
its current 10000 line limit.

> -CONFIG_ARCH_MULTI_V6=y
>  CONFIG_OMAP_RESET_CLOCKS=y
> -CONFIG_ARCH_OMAP2=y

With CONFIG_ARCH_MULTI_V6 gone, CONFIG_ARM_ERRATA_411920=y a few lines
down can be deleted (savedefconfig drops it)

> diff --git a/arch/arm/mach-omap2/gpmc.h b/arch/arm/mach-omap2/gpmc.h
> deleted file mode 100644

perl scripts/get_maintainer.pl --self-test=patterns now warns:
  ./MAINTAINERS:19896: warning: no file matches	F:	arch/arm/mach-omap2/*gpmc*

> @@ -560,13 +533,11 @@ void __init pdata_quirks_init(const struct of_device_id *omap_dt_match_table)
>  	 * We still need this for omap2420 and omap3 PM to work, others are

Stale comment about omap2420

> diff --git a/arch/arm/mach-omap2/voltagedomains2xxx_data.c b/arch/arm/mach-omap2/voltagedomains2xxx_data.c
> deleted file mode 100644
> [...]
> -void __init omap2xxx_voltagedomains_init(void)

The declaration for this is still in voltage.h.

Thanks,
Karl

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
