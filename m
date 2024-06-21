Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73E42C27C4F
	for <linux-mtd@archiver.kernel.org>; Fri, 21 Jun 2024 05:57:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:Cc:References:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4cYcfRDuYCOltF5R7hSGl0QBil91FUaLELsBg8e1680=; b=HPsZ/YAkDn5ymH
	DF4OJSl88rrEURULkuhmT9OmpdNshvt3nhrnSPHxl2iyy8qVuIfploLO9+q14raRhB3e1YezMUUnU
	8Pia9czq9j+wMIU/OZ6+TJikJTUvb3Ogx9W9Uh5I6rPcLUazT7jf1DCzYrmCBf+aiIy+zSFh/bqRc
	PmZsZmx9zR9rV8vBRGOzJVpB80RzvtuOnvgHQoSdNnaH5KbPagxQ5GDNDpXhfTh9UYJ2anggTZ3+3
	XraWnccYGmMv3vitN1TFRbVFdtw/X0tr9QyscBDCLFBnb+RACEk31tKzA4Zh5D6361DRnEmQ5RZwm
	SRjgurIieb4hNOl1NNuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKXGb-00000007qWD-1l73;
	Fri, 21 Jun 2024 05:56:57 +0000
Received: from mout.web.de ([212.227.15.3])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKXGX-00000007qVK-0zXn;
	Fri, 21 Jun 2024 05:56:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1718949371; x=1719554171; i=markus.elfring@web.de;
	bh=70TtcVLm9kmqiepSERoWu/9Hwwx1Rf4phfsof9PPYa4=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:
	 References:Cc:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=wO5bF2dnR36pYugAZFszjcO3gw0sL18WgGHyX6gNBuq9IaZKpqCaNVBg+xCZQrMx
	 Y2/x2INaouP5hzu5A401lKHRk7OGa3pJy5idb/1yHkzlUWvXWThvtMFbrnTqNOOaQ
	 DijgoTMjTEyJ+dI2rxFtO1nrQdEFiMI+S/8ZepiBj2pGkSWclmr6QLpGDbcMh40Q+
	 XRUlVAvh/BsNifyu6T8mjVYsbFLPDy2WrtwyIoO94VC1T7Y7w5W5sAhzntGtkBQkM
	 Sg3JFn+9S/TJCMLmkTHUru/f9YHCz3ElL6T4dGGVpuOJy1ueVodJvxjo5Odt1Pd/j
	 EoKpzuAwElV5I+mU2Q==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.85.95]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MN6FV-1s1cnG2hm9-00UG7M; Fri, 21
 Jun 2024 07:56:11 +0200
Message-ID: <bc3d018e-5a60-46b0-8e84-7158d231d2cc@web.de>
Date: Fri, 21 Jun 2024 07:56:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Patch v4 07/10] ARM: lpc32xx: Remove pl08x platform data in
 favor for device tree
To: Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
 Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, "J.M.B. Downing" <jonathan.downing@nautel.com>,
 Vladimir Zapolskiy <vz@mleia.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Russell King <linux@armlinux.org.uk>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Yangtao Li <frank.li@vivo.com>, Arnd Bergmann <arnd@arndb.de>,
 Li Zetao <lizetao1@huawei.com>, Michael Ellerman <mpe@ellerman.id.au>,
 Chancel Liu <chancel.liu@nxp.com>, dmaengine@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org,
 linux-sound@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-i2c@vger.kernel.org, linux-mtd@lists.infradead.org
References: <20240620175657.358273-1-piotr.wojtaszczyk@timesys.com>
 <20240620175657.358273-8-piotr.wojtaszczyk@timesys.com>
Content-Language: en-GB
Cc: LKML <linux-kernel@vger.kernel.org>
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20240620175657.358273-8-piotr.wojtaszczyk@timesys.com>
X-Provags-ID: V03:K1:iTUduqMb9cBGoyLdNuW6NQOj676Ul3b9o6PsNTkjdCixiNwYyKR
 oRvmzegMp0qsnzSo70irPsk4uNh054uLIALzh4CztbqWraJbmZHWwsKMRTm8H8QF3uXl6aw
 kX1K/LyUquko0H/IMh72DAyOoKYpTBJD4E6yCi3y21vP7Qgmc0rbTfrxSric9CHiwM0yEkI
 srUTTBp1uUclGZLL0j4BA==
UI-OutboundReport: notjunk:1;M01:P0:4zwWuLMBIcI=;p3T9mcjmv9EhVlHD/sbm6ZtwCba
 UW1bkeS7/UTJNK3NQOP8ZTd48Yusiy5ZCAL1lyRMxOHwlVEQftGxe98qQylZmEpcdepsI+I/O
 /Gd7WAKyUHB2sWSHJFyt0//5tzvkYVAoJqXpUa173WTSwzFjjp8Mmm16e3xjTwMiEFa8s1wFo
 RMVLj3dQ43GBmpWNbS+3WoOplbIYIXLIkTgqR0dhJ4mOuVn7lHvfrCplqqsferQTJvMYZH7Ns
 INtfxjHQy8bLawfnhVbbBE/yeGK0Fy4EbE/1qo+BZpOZK8+cjnghxQiiNggT9SJC+GIa2e0zP
 rnZGJ5ZtpynHbThpuiManMYgp/NWQfdMvTFFm5GdzCAvNlfWeSzAbYaxc/DPQ8sT/Y6Xw89rd
 q8uoiSTyU6wQpib1I/h7mL0JaUI5nU9o3ByLA4f87UBVBXaz5YcBmAvvNVoEVCVylJ2gm24eb
 TWhgJG8fsq5TFXpP3zrBtVGr6/cqv3HwJv9XoRqhahaTAuc9AnSt9P/xeisDATr5AxmRFGNZn
 Bf/aIaIQEJArOgYQwP+hVLatduOlUoeajtsaXAzmhQhWtQhSvVjGxsNbdKOpwkku0X5GctvOg
 gJWAZy6HqbpBqQ8qQNH8sZen5E60fHE9ZMADZS9NrbJYBwfUApaMyYfHpyOEsdlZ9xrGY2Bvg
 s5zglaFXZisv5uabkgkayKCx/HDe0gnGtkZ6QIu4bm/w9BbmW0vXhd6jTqtK9ZCyhGf0aHRV6
 4HgugA1UVbpqfWetnoa0VNmw+tRV61JKjOqSbx+O2VEMFROG/2I206GuAeiCCobeg14qAVH39
 d60BOgwvPQJESFlorxlJel7invZ+WB2Ew+jDa9ggMRf9o=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240620_225653_594363_4855CDE6 
X-CRM114-Status: UNSURE (   7.32  )
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

> With the driver for nxp,lpc3220-dmamux we can remove the pl08x platform
> data and let pl08x driver to create peripheral channels from the DT
> properties.

Do you see opportunities to improve such a change description?
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/submitting-patches.rst?h=v6.10-rc4#n94

Regards,
Markus

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
