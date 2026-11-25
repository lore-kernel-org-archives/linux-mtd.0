Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE840606A334
	for <linux-mtd@archiver.kernel.org>; Wed, 25 Nov 2026 16:30:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=lTRvKZ1X;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=WaGkw86w;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=thegoodpenguin-co-uk.20260707.gappssmtp.com header.i=@thegoodpenguin-co-uk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=rL50TBMR
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=UrHkvyVgq73kCQ7OYRvPakETlJTn6ma5KrKPGGKmK/I=; b=lTRvKZ1XX68k5PasWLhDwLTVHm
	T3iEq2NuH9StIdrEgVlILcHGj7xPhEG0aJu2hktpGRJflqXmJPGnoxmM/Pd0BFH2aXTgZ0s+Ka2OZ
	VFU+m/ZtJrxH5xOQcTNmgAQgITKHQZnZB4H90wPF6FGafBTw21mTsRsOxl6st+OlRUuwBX67IjC4x
	loVfeHrZ8N2Oml+Sifokdm7jfBuX2P+Z04xyrsAjvOTTmaqj0tJA7HsBC0yIaj5uLjQQ+/zZ8aK1V
	R8SdkRiM9IyfyngJEyIJlyTIBSiU0QRHc98+FiyfC5A7I6Xo/kod7hF9KG2tpTBXaAjvJCWc/yyOz
	1wrjb1dQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWFsu-0000000AZCL-0mmu;
	Wed, 25 Nov 2026 16:30:16 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWFrU-0000000AYT8-3waI
	for linux-mtd@bombadil.infradead.org;
	Wed, 25 Nov 2026 16:29:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=AFDbeCHQMCzywmdZtzco98P0xWzZOKchEiBzgROq0f4=; b=WaGkw86w3WFbWE5+h1XdQaB18v
	dVugpGttsFdn5fgml8TVqgQhKZPLyB7kToYZh/E7AS6V6MeFRWNg1AOjt5Cg6Onqxg1y7DqgCIFQ7
	PbfZKaFMp9G9mEKtS7+YqM/6xPf2KVg3truQVHcfaat6bd26olymdZ0395ejz1o/gYTcrd/eYMhva
	4nxxk0s6acUgtb6nKo1KouKm7WyIUV5AhSOpsWENWiYffIbUt9wSZ0NaBW1TCiTja1IpxRSOFmKik
	c1W9PrOZAIajhjcGRQoWkGYsvSqkRFBEalanB0sXmgK4sXTFfTL1pihleY7MgbCbuNCtEvqI9/K4j
	JKLx9RzQ==;
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWFrN-00000005Wsi-2lKm
	for linux-mtd@lists.infradead.org;
	Wed, 25 Nov 2026 16:28:45 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-4a5b2be99a8so51025815e9.2
        for <linux-mtd@lists.infradead.org>; Wed, 25 Nov 2026 08:28:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thegoodpenguin-co-uk.20260707.gappssmtp.com; s=20260707; t=1795624119; x=1796228919; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AFDbeCHQMCzywmdZtzco98P0xWzZOKchEiBzgROq0f4=;
        b=rL50TBMR+CdRxrtlIKePzz1kb9Fj1EyA/NjbLj8ghD2cY+GUc/QSE01MBjAL089E43
         4GZpe9Bc1P6aer0dSaHXGnawgDCE6qAZN2Yij25tKEaI87eGIg6mJvMsADEMTIG9H8Io
         p3pzFGp6OnDIRf6R9ldCaU/1DqF0j/Frj1YeZMz2sINWtnp5nFhxj9OTycxGskhEIAFw
         9FvGyY7bNLdthUR25r3jDsOUh8xf0jqJHZ+yLd0CxgfBY1UreUq/eVMjxjQM1wbwQopQ
         3uHUGH1N3P9PYyS3348hFvCl+jZFXeBuiK4HGLBeEr5C+Om2zg3Lcasx/VZAtEdUxB3j
         gmuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795624119; x=1796228919;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AFDbeCHQMCzywmdZtzco98P0xWzZOKchEiBzgROq0f4=;
        b=jzaMBZjYZmflPDVom43vwu+Bp9IGzYXTgOfgTMScLtW7GEqbNHooNqfk3IyuEJVqc7
         1bNyIXwgOhIQ6dN8wvIGtfnhoIbwQU6/9YaqBAsT3wUgsvyVMwsdDuia+cpseN/kWi/N
         Psx7ohHy7mXONM0pmEctLnwSjRnjNzPlizbqIaP6X3ZWbexhpkceLzeq85hvZT0ickFt
         PLd4fCbw9thgJvFo/4MXxePtBPXPjpJuwsoT9GdYbNWM7xMPrm7fK6lPL1tqe+mAXOPg
         /SxhNEsBT5my05M8T1X8jwU7m9biQZsiYvY99ZLmbKNRvNys1vXVn3Om3XYhyx5F3JHM
         4M4g==
X-Gm-Message-State: APuU4Z+qWh8jxIfBYDMNLVRInjG7rC7x1cbk0XnUWhBeLZFyZE15eJ8e
	PxhVDS0imT066b9B54ISdnwTFsdIeorlT58UJ3slfr8SacHoaYHZcXtEoM4WOkkeH5k=
X-Gm-Gg: AZFdTZfptWiJ3yGrtUREtYTqaQ+D4fIcZks9Li0J2LUzlDg70yz+c/fGwqL5fGfrDhG
	OiY/jJk39HnYn+p1RY0hbcEiYPFVlZEeFz/dwGzSouxF58NxyfMcLar+HjfTXLVrfJeFKXq7Wwh
	vAilnDqqBL/7Y1CFyXVHttPkDJJaLg6goLOZqRmEfCLaQhDT2Oz+lQMg36FlIcsccSQJ1OsCLKA
	SHz7dFYqlGtgErth9RQhT/Shk8uLcEV4kuSOkccZ+s63W6qFjeQLdgkZpGrFiE9bxc9Y0ET3PTZ
	32UG3qutJgqYjsUp5q3iXqyY/NW+kEBz7HNkkptnIarlQy2HDKJ2eDGholcvbJKXB9Gv9XLV8KO
	lVt1j8t4ItTsocnVZFo5Zu6NQqrxDd/IAVuC6LAHufNXr0rzzLFL4rHA5UPVFe8DMgrcuDw0E1A
	nNDVxXE8tvBiYtX6c7WFW0NsyiHbKjTnAjf7O+xzylon+neKsdOLpnz8J8ex+HgWKw+XsoCNsOx
	ovDcwnCSMcdutemFV/naQb3ypMgJ1Mbo8giDCoDcjxlAfxYNgQgjvnxVym2WNqogSC/Jw4+chUu
	5Wp+4bo1wYKwyi8unHhrr+FHHtTlzmR4ZViKrqVVyeag9g==
X-Received: by 2002:a05:600c:5246:b0:4bb:6de4:2f7c with SMTP id 5b1f17b1804b1-4bb8881c5bdmr384806975e9.20.1795624119085;
        Wed, 25 Nov 2026 08:28:39 -0800 (PST)
Received: from [10.42.0.1] ([2a00:23c7:1d1a:9c01:f716:ba19:8aaa:f1c2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853368d3sm527336375e9.1.2026.11.25.08.28.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 08:28:38 -0800 (PST)
From: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Date: Wed, 25 Nov 2026 16:28:27 +0000
Subject: [PATCH 01/10] mtd: maps: pismo: Use named initializers for
 i2c_device_id
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261125-acpi-mtd-v1-1-42ad2f645bee@thegoodpenguin.co.uk>
References: <20261125-acpi-mtd-v1-0-42ad2f645bee@thegoodpenguin.co.uk>
In-Reply-To: <20261125-acpi-mtd-v1-0-42ad2f645bee@thegoodpenguin.co.uk>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Takahiro Kuwano <takahiro.kuwano@infineon.com>, 
 Vladimir Zapolskiy <vz@mleia.com>, Robert Jarzmik <robert.jarzmik@free.fr>, 
 Alexander Usyskin <alexander.usyskin@intel.com>, 
 Joern Engel <joern@lazybastard.org>, 
 Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, 
 "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>, 
 Shrikanth Hegde <sshegde@linux.ibm.com>, 
 Michal Simek <michal.simek@amd.com>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Brian Norris <computersforpeace@gmail.com>, 
 Kamal Dasu <kamal.dasu@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 William Zhang <william.zhang@broadcom.com>, 
 Anand Gore <anand.gore@broadcom.com>, 
 Kursad Oney <kursad.oney@broadcom.com>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Han Xu <han.xu@nxp.com>, Paul Cercueil <paul@crapouillou.net>, 
 Harvey Hunt <harveyhuntnexus@gmail.com>, 
 Keguang Zhang <keguang.zhang@gmail.com>, 
 Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>, 
 Liang Yang <liang.yang@amlogic.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Manivannan Sadhasivam <mani@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Stefan Agner <stefan@agner.ch>, 
 Lucas Stach <dev@lynxeye.de>, Thierry Reding <thierry.reding@kernel.org>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Jacky Huang <ychuang3@nuvoton.com>, 
 Shan-Chun Hung <schung@nuvoton.com>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, Linus Walleij <linusw@kernel.org>, 
 Kyungmin Park <kyungmin.park@samsung.com>
Cc: linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linuxppc-dev@lists.ozlabs.org, imx@lists.linux.dev, 
 linux-mips@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 linux-arm-msm@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev, 
 linux-tegra@vger.kernel.org, 
 Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795624113; l=851;
 i=pzalewski@thegoodpenguin.co.uk; s=20260430; h=from:subject:message-id;
 bh=IHAi0qeArnt0Dz3MPX/pMNLkcr4ipLn3XGqru6V8PMg=;
 b=FYYb5NZv5bMag5GUq5jhUZI3EA/wssPu4IODYyOGaefHzIx0GqzM1xxUbS1yXt9hVm+9RShR6
 U7w6XKaTkOyAdXUAkIbyQhY8qzilz1ISb3JVyfa0dct/S0WrrapbtfS
X-Developer-Key: i=pzalewski@thegoodpenguin.co.uk; a=ed25519;
 pk=vHq4n9IonORH2GTzLv8r6CWAFHzgfBuNkQPXA8NSly0=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_162841_792763_0DCBC2D0 
X-CRM114-Status: GOOD (  16.37  )
X-Spam-Score: 0.0 (/)
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Use a designated initializer for the i2c_device_id fields which makes the
code more readable and consistent with how lists are initialized in the
rest of the kernel code base.

Unify the list terminator to have a single space between the brackets and
no trailing comma.

Signed-off-by: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
---
 drivers/mtd/maps/pismo.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/maps/pismo.c b/drivers/mtd/maps/pismo.c
index b0310fddcaa3..babb6d367623 100644
--- a/drivers/mtd/maps/pismo.c
+++ b/drivers/mtd/maps/pismo.c
@@ -250,8 +250,8 @@ static int pismo_probe(struct i2c_client *client)
 }
 
 static const struct i2c_device_id pismo_id[] = {
-	{ "pismo" },
-	{ },
+	{ .name = "pismo" },
+	{ }
 };
 MODULE_DEVICE_TABLE(i2c, pismo_id);
 

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
