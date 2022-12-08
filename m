Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 612EFC3A5A7
	for <linux-mtd@archiver.kernel.org>; Thu,  8 Dec 2022 13:55:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3VPHJQK7OPh7SJmXOYcewPDrJbaiev2sfP/3W74ckbo=; b=Q1zJ6GdFXZvjoZ
	OfHPNuMpeLixdDGRyPk7mnxvKD5dotkBAef0VNAYFkauWW2hQOWo8o9QxMHNDRD+K/AJsj67TKRRL
	96uoK1ADUo7+AVMOmZLV60Q/+Ej41HYkfEM4sAOx8/2Rt+PdANhr4GhivR5HRG/WThMxxWuiUK70V
	zHFlmZWTbiLiNJcebu4KIkMSKorsb41EgyTkp7PFjb2XCspP9t50eURB1+de64sMhSfMb+sqnRhkZ
	OHd42CTZ8i0CRJVW/TFEgTW/dH5qfNmwWKYIMFM/k+4eBzTi6wZuROCOthmhP/hsO5TG/JXx9jfPW
	6+ATZ+5t3R25+8LSK2dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3HMX-001Q4o-BZ; Thu, 08 Dec 2022 13:54:57 +0000
Received: from phobos.denx.de ([2a01:238:438b:c500:173d:9f52:ddab:ee01])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3HMM-001Pyy-AW; Thu, 08 Dec 2022 13:54:48 +0000
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 00038817FB;
	Thu,  8 Dec 2022 14:54:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1670507685;
	bh=5xDJlwrd0zqkIN9nBK5C7VNF8PbYTDTfmRcPZ8Vq1Z0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=wU/A1kV8m0n1cx/qEnXp2O4vGbBSDCrYgDizeWdVesl1jCHZUKqUyesyxZZDMB1L7
	 6mkXR7pmTmFRA6AouvQz9LePzEnGUh8yGsb3IVE4oagU4IEEwWuOJpRWWMszafM4Qw
	 KSFsbgAI/4YFkx4Cnyp0KvlWDE65GF7bDN/joANbTr6pUZjm8hzX8f5hWaGMiqz6wz
	 o44cdjhmkfkJJjfLgd94rzhurtM+qUWA2HuiH7S1p5nBGyYO+CMeI9t6vkl02EjrqO
	 AbJU0tNVMNo9vFkp/gcfIa8lwq2GN3wKqVGLEtZxWboyCXZC/oTTmF9s8SVTK349zf
	 +RXKJQiNb2vsA==
Message-ID: <108503ba-f4a8-a9de-20ee-f8f1f90965a2@denx.de>
Date: Thu, 8 Dec 2022 14:54:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v1] Revert "ARM: dts: imx7: Fix NAND controller
 size-cells"
Content-Language: en-US
To: Francesco Dolcini <francesco@dolcini.it>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Shawn Guo <shawnguo@kernel.org>, linux-arm-kernel@lists.infradead.org,
 Francesco Dolcini <francesco.dolcini@toradex.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 devicetree@vger.kernel.org, linux-mtd@lists.infradead.org,
 stable@vger.kernel.org, Thorsten Leemhuis <regressions@leemhuis.info>
References: <20221205152327.26881-1-francesco@dolcini.it>
 <0aa2d48b-35a0-1781-f265-0387d213bdd6@denx.de>
 <20221208115124.6cc7a8bf@xps-13>
 <2a6c5a08-1649-3f80-cc37-a425f09f3a67@denx.de>
 <544539BE-F7C2-4484-9588-6428EFA8A537@dolcini.it>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <544539BE-F7C2-4484-9588-6428EFA8A537@dolcini.it>
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221208_055446_695986_8C47BC08 
X-CRM114-Status: GOOD (  14.69  )
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

On 12/8/22 14:49, Francesco Dolcini wrote:
> Il 8 dicembre 2022 14:21:31 CET, Marek Vasut <marex@denx.de> ha scritto:
>> On 12/8/22 11:51, Miquel Raynal wrote:
>>> Hi Shawn,
>>
>> Hi,
>>
>>> + Thorsten
>>>
>>> marex@denx.de wrote on Mon, 5 Dec 2022 17:26:53 +0100:
>>>
>>>> On 12/5/22 16:23, Francesco Dolcini wrote:
>>>>> From: Francesco Dolcini <francesco.dolcini@toradex.com>
>>>>>
>>>>> This reverts commit 753395ea1e45c724150070b5785900b6a44bd5fb.
>>>>>
>>>>> It introduced a boot regression on colibri-imx7, and potentially any
>>>>> other i.MX7 boards with MTD partition list generated into the fdt by
>>>>> U-Boot.
>>>>>
>>>>> While the commit we are reverting here is not obviously wrong, it fixes
>>>>> only a dt binding checker warning that is non-functional, while it
>>>>> introduces a boot regression and there is no obvious fix ready.
>>>>>
>>>>> Cc: stable@vger.kernel.org
>>>>> Fixes: 753395ea1e45 ("ARM: dts: imx7: Fix NAND controller size-cells")
>>>>> Link: https://lore.kernel.org/all/Y4dgBTGNWpM6SQXI@francesco-nb.int.toradex.com/
>>>>> Link: https://lore.kernel.org/all/20221205144917.6514168a@xps-13/
>>>>> Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
>>> [...]
>>>> Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>
>>> [...]
>>>> Acked-by: Marek Vasut <marex@denx.de>
>>> [...]
>>>
>>> As discussed in the above links, boot is broken on imx7 Colibri boards,
>>> this revert was the most quick and straightforward fix we agreed upon
>>> with the hope (~ duty?) it would make it in v6.1. Any chance you could
>>> pick this up rapidly and forward it to Linus? Or should we involve
>>> him directly (Thorsten?).
>>
>> It seems neither Francesco nor me agree that this is the right approach and rather the fix should be the two-liner change to the OF partition parser, so maybe this should not be picked ?
> 
> I think that the 2 lines change might not be good enough to properly handle the U-Boot generated OF partitions in the general case, even if it fixes my specific issue.
> 
> Given that I would do the revert as an immediate first step.

Then that's fine, let's do it.

Will you also follow up on the parser fix please ?

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
