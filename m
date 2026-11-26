Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91B58606A31C
	for <linux-mtd@archiver.kernel.org>; Thu, 26 Nov 2026 17:40:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=kUPw3zKN;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=thegoodpenguin-co-uk.20260707.gappssmtp.com header.i=@thegoodpenguin-co-uk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=UDieDNpa
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=vUPbkpV0fDlnsp0SNM+vPhj206bE62DGls2+xqxUH5I=; b=kUPw3zKN940asbeQjUsE1ZzTnr
	1MMYhKZ1gF5Oywm3zgJdzfDXaZk+n0BlEfE3gER2zD4+QwdIBTsihOru2OGNQoxIe2m4xovaEoqK5
	taOPWUzSbqzezGWyhLSX1DHjqzlHYfhYL9RTgI8IcQhevYh6bi2GyHLaykdxq7EH7kl37QXdxj4UN
	gVv3QlFce3WJY9E8f+ek70qWuTGvCDD1DwNTycskmdGB36HdWOZmpLI2CHTIgvFlRrJmIREsx2qZN
	8/nWIM3WLfvtPVpv14DrQ2b1HWamV1RlEZgfZybkgZLKMCiCcOf6jtZBGlueTdMs75pZZEdgPFKnu
	J10ro0MQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWdSb-0000000E5YU-0sOE;
	Thu, 26 Nov 2026 17:40:41 +0000
Received: from mail-qv1-xf36.google.com ([2607:f8b0:4864:20::f36])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWdST-0000000E5Vn-27N2
	for linux-mtd@lists.infradead.org;
	Thu, 26 Nov 2026 17:40:39 +0000
Received: by mail-qv1-xf36.google.com with SMTP id 6a1803df08f44-9213eb1f3a7so61608026d6.0
        for <linux-mtd@lists.infradead.org>; Thu, 26 Nov 2026 09:40:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795714832; cv=none;
        d=google.com; s=arc-20260327;
        b=No+UTH/E06NY9q2fmRo6DJfeV+Mic+CDILqE8aSOJQH7/ODZzPlF7jCk7h/GtdDlaI
         JbMKaZPdbpnk5lUvHH9wQ3FYCK3L4INFmS+kbpIBv0J3lcF7bAeKo4qWz/nV8HQ3Cyso
         yRGMkCXLpIfu0MBw3s4NPIXF+Y1O6DZSwVvIJrp4d+RCQZuxhs5hYfHJWi7Z8lWschxr
         ErCFIZ53yp/CFbfyuATZ0tqBVXa1ZPSsy1kVHF/9vHp4AJHy1MMQh1rXDmMMY7q4rmeC
         B6CnVjRWpTKDF7MdUAWgeEUDQ7Tq9m55qLungn3cKkZgHNS8gUhR14gAgEl1Cv1/5ZHf
         898w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=WnUI0hkBPpSkdO9GvSJqBbk00QrZu2iiDVFhG7JTP+o=;
        fh=dVxtKx1uU9oRJ1jpAswgFfIn1khEMd61elaYdS242Xc=;
        b=AjCfz4+JiPCUl7qrzoA5WmKHzvOZgnnpxmSvzNg2bK2YmDfJRcD+QuVyLeqDeXYpGm
         Mgg+GbRCjukDu2wCs4d6JbTzRDukRnWf5HPmomuWPoOryG2Ignd+HAc4SXmyQ4SDyLaf
         ojIdyh8FFm3zhdWBfLB2XAy6LAb4NqVFCOlm/4pSjtQJV9yxe/CFqcSexhfReQ+s8FxN
         /HJaRlEra8kc4WJo6Udk5dCe524MqxBPLlUZ8cyIkqpsfWpvmcjSBnJEAQ1Q4kgcautI
         TQBMg4ErScxH7aEOFgNTS5NmyAnngn/wuCqZ/j8uXaCQH09FgRFNErXRqf9pgYu1qisH
         gs5g==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thegoodpenguin-co-uk.20260707.gappssmtp.com; s=20260707; t=1795714832; x=1796319632; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WnUI0hkBPpSkdO9GvSJqBbk00QrZu2iiDVFhG7JTP+o=;
        b=UDieDNpaTBL7/WP5r4ARaKBywa3vKIAdMdWO2TnWCuxKoVfMx6nOncjZ+345Tmj6Fm
         gM9p0R7x0c7O3cnDe/mpYnVz9u/5DRMUrHbBjzWN+jy8sPEDhExiubxIYypgNiHX96pR
         fBc2l2ux7kz9DEIVZOxla5OedMA5ERHFnxnkINb4h/HeYfrvb75NMWRCKf91exv0UKaS
         r/eYaXKSNN4dAmj1VK1365FMyiaNAT1UAEnV6vyaE8YY66kEkPXs53HaDGKwnVhu41A9
         j4cd4/U18xzs+iLxDZbGlwT4Dq6udFTx1lEg1kGoFcmiakiaVrxZlyDi0vkV8YMfrrow
         Elkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795714832; x=1796319632;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=WnUI0hkBPpSkdO9GvSJqBbk00QrZu2iiDVFhG7JTP+o=;
        b=qW1FkHo6gljLZ8rkz6ROj56DmRdHsHBCoiVujky+I8wmDcsE9SUpqQTsWWTfVXNrff
         4c6V95+uplvzm7KTjbh7sitYWY18u8rF6/+ImzYwKsqfpxhkBAdSeVkvHHWAp9Mc/VF4
         XbLaal+RRtlwJBATa2jXsmIwkbPumYQm5ECpe4C6H8P83dGkhr3/2ZCLKLMzUlBEjX4w
         eJ2Lbm14E6blZSCyL4TmAVccTQoMgSp/HkcLZemC4/mWP9el/mI2GAUrFkQY0U5MARb0
         r2uEll8+ALO/AeeXMnCCaJ0ObIxVNG/fV/TgVgk1Wl7L1Z6SULiYNoZwD0a5QAyukGx4
         KoBQ==
X-Forwarded-Encrypted: i=1; AL+hErEtEQbFvLZtLMpx9nuJqviNvtEXq/tyOf0ZsuZYKyDEkTcD6QL7Wlp1oAihHRi6+NlTQmaSio6QcvA=@lists.infradead.org
X-Gm-Message-State: APuU4Z8vOOL/2/ngIZ0ozYKc3eqyKjeE79K/Fn+1cowzBj4etnfd9lL/
	tMz4pXeP6U4S5b2OEIdVPN/YKQzxd6SD1wMsM468slBVJMrJMzzlUx1kep4Nwpl99icS2R/3c3J
	7BHZ0OFn+z4hpQIqvkvLiyW4uHGVqeKoIzWLX+k27pQ==
X-Gm-Gg: AZFdTZfsIrtiWEmQmZPUgfyTVHUHrR54B8nIB1HvXGM2Cb9AgdW2mC7nXMsGxKa4ZBW
	a+V4tavI+ETBfGH8/EbC9NuBviWKx8SuCdl7GZ31wsfYzNNagbr5kFuL7ZZdcdV9CT+A0vW1T+n
	z3JxH/ke2wzP0yJbXiz/Cd54DH+X1NWL0m+cnTKQnN4rnsULoLCrHRgNQfN82ax3L0v35wfRgbd
	43el+5JthqG7nhgc0MLl8Ec52HH+YuEi+V60zt1ItvhP4Kum/aJd6pKhaFR18nw1VAMUV5wvBI9
	NUtJZVWS6Zoul1qbKriR+8RaUitx+HZIynx/Z7UDVJetS+5Gjyt6VgJUOQrRD3RWASY5MXYT24H
	npBc4Y31zyzoIX1WJcrWq/iquphekf6OA97tiiOnIck0p+wKxyDLSziPL628ED+qHoSvA1es=
X-Received: by 2002:a05:6214:3c9d:b0:91c:9316:f4e8 with SMTP id
 6a1803df08f44-92134baab8amr374316166d6.54.1795714831544; Thu, 26 Nov 2026
 09:40:31 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261125-acpi-mtd-v1-0-42ad2f645bee@thegoodpenguin.co.uk>
 <awcZcuSbse5g3FWK@monoceros> <87v75jyiw2.fsf@bootlin.com> <awg4ubbFu0FksThB@monoceros>
 <87a4mvwv1b.fsf@bootlin.com>
In-Reply-To: <87a4mvwv1b.fsf@bootlin.com>
From: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Date: Thu, 26 Nov 2026 17:40:20 +0000
X-Gm-Features: Aa3M54pTYXahjqTv7_MT1I1wEAeHDvmXQpnCEn41MhhclxuSVrfOIbrke1NKz3k
Message-ID: <CAA6zWZKPY-wjq_sbheLBK-k1b6rCdXs353b7j-fTYB6vTGLmGA@mail.gmail.com>
Subject: Re: [PATCH 00/10] mtd: use desginated initializers in *_device_id arrays
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
	Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Pratyush Yadav <pratyush@kernel.org>, 
	Michael Walle <mwalle@kernel.org>, Takahiro Kuwano <takahiro.kuwano@infineon.com>, 
	Vladimir Zapolskiy <vz@mleia.com>, Robert Jarzmik <robert.jarzmik@free.fr>, 
	Alexander Usyskin <alexander.usyskin@intel.com>, Joern Engel <joern@lazybastard.org>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, 
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>, Shrikanth Hegde <sshegde@linux.ibm.com>, 
	Michal Simek <michal.simek@amd.com>, Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Brian Norris <computersforpeace@gmail.com>, Kamal Dasu <kamal.dasu@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	William Zhang <william.zhang@broadcom.com>, Anand Gore <anand.gore@broadcom.com>, 
	Kursad Oney <kursad.oney@broadcom.com>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	=?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, 
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Han Xu <han.xu@nxp.com>, 
	Paul Cercueil <paul@crapouillou.net>, Harvey Hunt <harveyhuntnexus@gmail.com>, 
	Keguang Zhang <keguang.zhang@gmail.com>, Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>, 
	Liang Yang <liang.yang@amlogic.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Manivannan Sadhasivam <mani@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Stefan Agner <stefan@agner.ch>, Lucas Stach <dev@lynxeye.de>, 
	Thierry Reding <thierry.reding@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Jacky Huang <ychuang3@nuvoton.com>, Shan-Chun Hung <schung@nuvoton.com>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Linus Walleij <linusw@kernel.org>, 
	Kyungmin Park <kyungmin.park@samsung.com>, linux-mtd@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, 
	imx@lists.linux.dev, linux-mips@vger.kernel.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_094033_658932_FB2B6B75 
X-CRM114-Status: GOOD (  11.24  )
X-Spam-Score: -1.9 (-)
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
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

> Let me know what you intend to do.
I might as well address the nitpick since we are refactoring already,
so please wait for v2.

> Not related but since you were removing the /* sentinel */ comment
> sometimes, when do we get rid of those extra entries entirely?
I don't really know if there are any plans for that, I certainly will
not attempt that anytime soon.

Thanks,
Pawel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
