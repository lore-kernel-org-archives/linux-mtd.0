Return-Path: <SRS0=rH0u=CD=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6778CC433DF
	for <linux-mtd@archiver.kernel.org>; Tue, 25 Aug 2020 04:48:33 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2FB232072D
	for <linux-mtd@archiver.kernel.org>; Tue, 25 Aug 2020 04:48:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="eEm/C0QW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2FB232072D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=wBcilcDx6sLmgv62gcNMtwAzPFRKrxzlVI27SD2pI+c=; b=eEm/C0QWCDiq8f6KZXaBDkOK7
	A7/sdfSFNY0Qanc1JA/CIbdlgp6hPkod29UD99N2QGpNfTW2J/gDoi3AiDIktZHjJvMZ+WNjWvonf
	CEeqDLQJlK9IFzp4IAsss5fV1NhgqN9uSurLGCszoqbyTyTRK/B9fwrzjifz2f1/sozpaMEIDgFxo
	ueOFx+Cm+lcCnEwSukx1i5H5UtpV+2LLSRo6FsJZVRoIgJu61AK4HKwkAi3ojmVfm4+TO+9jqwSfh
	TI+dV/NyemDG+c7y6mI3APVIh4HsvD95Sc4bsXSaGIbB8v6Yb3Om/wVC2HR7EmZduk1Kod8G4u0Jd
	ENdCRA78Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kAQrs-0002HD-9G; Tue, 25 Aug 2020 04:47:32 +0000
Received: from metis.ext.pengutronix.de ([85.220.165.71])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kAQrp-0002Ge-L9
 for linux-mtd@lists.infradead.org; Tue, 25 Aug 2020 04:47:30 +0000
Received: from [2001:67c:670:100:1d::c0] (helo=ptx.hi.pengutronix.de)
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1kAQrH-0004DB-JG; Tue, 25 Aug 2020 06:46:55 +0200
Received: from sha by ptx.hi.pengutronix.de with local (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1kAQrF-0004IR-Cn; Tue, 25 Aug 2020 06:46:53 +0200
Date: Tue, 25 Aug 2020 06:46:53 +0200
From: Sascha Hauer <s.hauer@pengutronix.de>
To: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v2 13/19] dt-bindings: nvmem: imx-ocotp: Update i.MX 8M
 compatibles
Message-ID: <20200825044653.GK13023@pengutronix.de>
References: <20200824162652.21047-1-krzk@kernel.org>
 <20200824162652.21047-13-krzk@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200824162652.21047-13-krzk@kernel.org>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-IRC: #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 06:38:05 up 187 days, 12:08, 138 users,  load average: 0.13, 0.17,
 0.18
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: sha@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200825_004729_732419_C1495612 
X-CRM114-Status: GOOD (  15.70  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>, Ulf Hansson <ulf.hansson@linaro.org>,
 linux-pwm@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>,
 Frank Li <frank.li@nxp.com>, Thierry Reding <thierry.reding@gmail.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Will Deacon <will@kernel.org>,
 linux-watchdog@vger.kernel.org, Fabio Estevam <festevam@gmail.com>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 NXP Linux Team <linux-imx@nxp.com>, linux-serial@vger.kernel.org,
 Uwe =?iso-8859-15?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
 Guenter Roeck <linux@roeck-us.net>, devicetree@vger.kernel.org,
 Pengutronix Kernel Team <kernel@pengutronix.de>, linux-pm@vger.kernel.org,
 linux-gpio@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Han Xu <han.xu@nxp.com>, linux-arm-kernel@lists.infradead.org,
 Fugang Duan <fugang.duan@nxp.com>, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Li Yang <leoyang.li@nxp.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, linux-mtd@lists.infradead.org,
 Shawn Guo <shawnguo@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Mon, Aug 24, 2020 at 06:26:46PM +0200, Krzysztof Kozlowski wrote:
> +    oneOf:
> +      - items:
> +          - enum:
> +              - fsl,imx6q-ocotp
> +              - fsl,imx6sl-ocotp
> +              - fsl,imx6sx-ocotp
> +              - fsl,imx6ul-ocotp
> +              - fsl,imx6ull-ocotp
> +              - fsl,imx7d-ocotp
> +              - fsl,imx6sll-ocotp
> +              - fsl,imx7ulp-ocotp
> +              - fsl,imx8mq-ocotp
> +              - fsl,imx8mm-ocotp
> +              - fsl,imx8mn-ocotp
> +              - fsl,imx8mp-ocotp
> +          - const: syscon
> +      - items:
> +          # The devices are not really compatible with fsl,imx8mm-ocotp, however
> +          # the code for getting SoC revision depends on fsl,imx8mm-ocotp compatible.

Shouldn't this be fixed? It seems strange to justify a binding with
existing code.

Sascha

> +          - enum:
> +              - fsl,imx8mn-ocotp
> +              - fsl,imx8mp-ocotp
> +          - const: fsl,imx8mm-ocotp
> +          - const: syscon
>  
>    reg:
>      maxItems: 1
> -- 
> 2.17.1
> 
> 

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
