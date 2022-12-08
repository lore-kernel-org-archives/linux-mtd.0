Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C82E8C4332F
	for <linux-mtd@archiver.kernel.org>; Thu,  8 Dec 2022 11:14:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Yszou+DJWATCgAKI+OtvFIW/HNYbqcZVmkiGXEZAogU=; b=zBP6e3DwiIGksX
	gpa0LIEgzSXLJqbTiautsedzbCcQHQf+cG8CA0SukMUvXFWtskX6HzKC0Dc7Jr3uMDk5uzF7zRH+W
	iNwesMgXsZGwrKzVg5mswsSOb1BOm2gkUGpGapC8XshuSLAm7TNwmQLWExyY9uWaLvS4Dtr/Y5t5P
	gB/lP4hfnlKhDJHSXtpMLVlbwyWMjiD4LhDoTHxX8wM1utmBi4A/jIsOlIRECt1c/KBKhNUzCCIam
	EaPV0vIvK6kd4wq7+Yc626fMB6ed6VpgImziswUFMa7JRkXNPdbLA4LPgts12MVzcFbJK0J+SxpIo
	jfMjrfrcq1XUsaG9+h4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3EqT-00ERII-Cn; Thu, 08 Dec 2022 11:13:41 +0000
Received: from wp530.webpack.hosteurope.de ([80.237.130.52])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3EqF-00EPpL-I2; Thu, 08 Dec 2022 11:13:29 +0000
Received: from [2a02:8108:963f:de38:eca4:7d19:f9a2:22c5]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1p3Eq6-0002BL-Gj; Thu, 08 Dec 2022 12:13:18 +0100
Message-ID: <e31c7d2c-d32b-844f-4a24-c68f726d531c@leemhuis.info>
Date: Thu, 8 Dec 2022 12:13:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v1] Revert "ARM: dts: imx7: Fix NAND controller
 size-cells"
Content-Language: en-US, de-DE
To: Miquel Raynal <miquel.raynal@bootlin.com>, Marek Vasut <marex@denx.de>
Cc: Francesco Dolcini <francesco@dolcini.it>, Shawn Guo
 <shawnguo@kernel.org>, linux-arm-kernel@lists.infradead.org,
 Francesco Dolcini <francesco.dolcini@toradex.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 devicetree@vger.kernel.org, linux-mtd@lists.infradead.org,
 stable@vger.kernel.org
References: <20221205152327.26881-1-francesco@dolcini.it>
 <0aa2d48b-35a0-1781-f265-0387d213bdd6@denx.de>
 <20221208115124.6cc7a8bf@xps-13>
From: Thorsten Leemhuis <regressions@leemhuis.info>
In-Reply-To: <20221208115124.6cc7a8bf@xps-13>
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1670498007;4e22d4c4;
X-HE-SMSGID: 1p3Eq6-0002BL-Gj
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221208_031327_775756_ACBB6AE3 
X-CRM114-Status: GOOD (  13.82  )
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

On 08.12.22 11:51, Miquel Raynal wrote:
> Hi Shawn,
> 
> + Thorsten
> 
> marex@denx.de wrote on Mon, 5 Dec 2022 17:26:53 +0100:
> 
>> On 12/5/22 16:23, Francesco Dolcini wrote:
>>> From: Francesco Dolcini <francesco.dolcini@toradex.com>
>>>
>>> This reverts commit 753395ea1e45c724150070b5785900b6a44bd5fb.
>>>
>>> It introduced a boot regression on colibri-imx7, and potentially any
>>> other i.MX7 boards with MTD partition list generated into the fdt by
>>> U-Boot.
>>>
>>> While the commit we are reverting here is not obviously wrong, it fixes
>>> only a dt binding checker warning that is non-functional, while it
>>> introduces a boot regression and there is no obvious fix ready.
>>>
>>> Cc: stable@vger.kernel.org
>>> Fixes: 753395ea1e45 ("ARM: dts: imx7: Fix NAND controller size-cells")
>>> Link: https://lore.kernel.org/all/Y4dgBTGNWpM6SQXI@francesco-nb.int.toradex.com/
>>> Link: https://lore.kernel.org/all/20221205144917.6514168a@xps-13/
>>> Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
> [...]
>> Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>
> [...]
>> Acked-by: Marek Vasut <marex@denx.de>
> [...]
> 
> As discussed in the above links, boot is broken on imx7 Colibri boards,
> this revert was the most quick and straightforward fix we agreed upon
> with the hope (~ duty?) it would make it in v6.1. Any chance you could
> pick this up rapidly and forward it to Linus? Or should we involve
> him directly (Thorsten?).

Asking Linus directly often is fine, if it's something urgent and the
maintainer that usually would handle a patch is MIA. But in this
particular case it's likely not the best strategy, as it seems
753395ea1e45 was merged via the ARM soc tree. In that case I'd say the
revert should ideally go through there as well, hence I'd suggest asking
those maintainers (e.g. Arnd and Olof) is the right move at this point
in time (would be something different if today was release day; but even
then it would be wise to have them involved).

Ciao, Thorsten

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
