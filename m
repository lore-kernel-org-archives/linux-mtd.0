Return-Path: <SRS0=a+HT=CG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EC63C433E2
	for <linux-mtd@archiver.kernel.org>; Fri, 28 Aug 2020 08:47:28 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DC3002071B
	for <linux-mtd@archiver.kernel.org>; Fri, 28 Aug 2020 08:47:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="aRs/QTju";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aIm4qyEy"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DC3002071B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ldjfDfHGhUZAgMolbHgQDlv13Y87sWDDM+8G1FIcH2U=; b=aRs/QTju+s83f2vX0fwq+kY01
	akMcIVHc6UhyvgaQ8uT+kQBlPmP46MicjHJLe91u52J4Og74Mh39QgUmchkC/7H7UULoWfXUv+ebX
	Z7aUnFnz90076z9i4RyfAZ20KCBofu05i66WGXR5bO0ROKRQok8k/WNeCFwKayZm3AqbKDe2Bkxp0
	Z44ebxwl20l27DFqAlAlGra9XBpgVwIjh+twFFa7Z2pxslxBCJrlIX72T6JPhtdcK4AyytqPyAYP8
	bjenJSSmlD/L15Dq6lOiV3aM4Dm4ttP7iBmt31DxZUOesActtjVv38dLRS6xUkfNSfFd9exNKVDje
	u5bYnD2JQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kBa1j-0005YN-RP; Fri, 28 Aug 2020 08:46:27 +0000
Received: from mail-vs1-xe44.google.com ([2607:f8b0:4864:20::e44])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kBa1d-0005Ro-14
 for linux-mtd@lists.infradead.org; Fri, 28 Aug 2020 08:46:22 +0000
Received: by mail-vs1-xe44.google.com with SMTP id a21so198091vsd.3
 for <linux-mtd@lists.infradead.org>; Fri, 28 Aug 2020 01:46:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=189lzAWfQfsXqTmFG0edsCDCtQB53S1O0XCFYRVJy0M=;
 b=aIm4qyEymVO5ohXmss62q8J7ZsU21OeX87DHri44FY+MtB8kKPRTRN8fC2fuIy9zvX
 Z9GTB09WEFGr+7TVAWibwyGyVwol+ajGdpcyUuC4mEf8pIP20ndS3jHWcXKurf5SVAhY
 V+KCtnocv+7SjPRR+/YrhNgmkynyreSovR2OBYvRS0xkDojpgFoNajirehBgyh2Hrzif
 0zPrbgW8qQ+iLRDMParVC4EFTYOfC0SYgcE9hKp/OLDf4Z3U/WxlgJJAx8ImgeFHI7Ms
 K2rPmiftA1He8wyBKNzMVDF2IAg9gwh+r+motN/9SM691+1Dlb6EM3f2CTGjxwoc2hSk
 YCSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=189lzAWfQfsXqTmFG0edsCDCtQB53S1O0XCFYRVJy0M=;
 b=i031H3Czd/Xc7W3iIQ6oNLFi5Fcpd0h3Uad9+Htpqfo9ShwclLXlxQPp2UextFZX1m
 adzPGidmAajJ3sRVgclU26Gr3m8Cz45yg6Y89iowhry2o6q6k3U8GeWU8x1u/80n6AUd
 gCEjFA7TnmVdbyzxx+eRSVpwfJ+hXhrIBHT7hMC2EMRq1dhBzEEDYMFMnWrPZLG0EvQv
 39ovD3W/EpKTx3W3vMFa7GD+J/Bm/nf53f3E+MgVOAuiyqyTakADiBHosCQbvw3ruayX
 tx8Lns7k21skVT18CKxTu+mgPpHzCsB0F7t8oPOSQgEPy7hUSxVgwG4iDyl5Gb7rGBT0
 axWg==
X-Gm-Message-State: AOAM530LW4IxHEgyFscyZhXdpEJoqkvPTuz1qEjGUIvCSKnYrL1UuA/8
 V5xL/s6nyyuKnUZWMwKhYA5jlMpAeEZkzprdG7fPfg==
X-Google-Smtp-Source: ABdhPJwdM//IK26BNKLGQTKBrolM5NysJSl2j+QUGwsOTG7KyqNDjalKpnYeND/9ptvlwZBlFInKLZnPBJM5EgFzpWg=
X-Received: by 2002:a67:f8ce:: with SMTP id c14mr189781vsp.14.1598604376960;
 Fri, 28 Aug 2020 01:46:16 -0700 (PDT)
MIME-Version: 1.0
References: <20200825193536.7332-1-krzk@kernel.org>
 <20200825193536.7332-13-krzk@kernel.org>
In-Reply-To: <20200825193536.7332-13-krzk@kernel.org>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Fri, 28 Aug 2020 10:45:40 +0200
Message-ID: <CAPDyKFp9m6xBJMGn2TgwD8VEUZ0JwzgowU32qUbL1qgEPua-GA@mail.gmail.com>
Subject: Re: [PATCH v3 12/19] dt-bindings: mmc: fsl-imx-esdhc: Fix i.MX 8
 compatible matching
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh+dt@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200828_044621_211886_BFD82926 
X-CRM114-Status: GOOD (  17.32  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, linux-pwm@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>, Frank Li <frank.li@nxp.com>,
 Thierry Reding <thierry.reding@gmail.com>, linux-mtd@lists.infradead.org,
 Miquel Raynal <miquel.raynal@bootlin.com>, Fabio Estevam <festevam@gmail.com>,
 Anson Huang <Anson.Huang@nxp.com>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 NXP Linux Team <linux-imx@nxp.com>, linux-serial@vger.kernel.org,
 DTML <devicetree@vger.kernel.org>, linux-watchdog@vger.kernel.org,
 Linux PM <linux-pm@vger.kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Han Xu <han.xu@nxp.com>, Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Fugang Duan <fugang.duan@nxp.com>,
 "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Li Yang <leoyang.li@nxp.com>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Tue, 25 Aug 2020 at 21:37, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> The i.MX 8 DTSes use two compatibles so update the binding to fix
> dtbs_check warnings like:
>
>   arch/arm64/boot/dts/freescale/imx8mn-evk.dt.yaml: mmc@30b40000:
>     compatible: ['fsl,imx8mn-usdhc', 'fsl,imx7d-usdhc'] is too long
>     From schema: Documentation/devicetree/bindings/mmc/fsl-imx-esdhc.yaml
>
>   arch/arm64/boot/dts/freescale/imx8mn-evk.dt.yaml: mmc@30b40000:
>     compatible: Additional items are not allowed ('fsl,imx7d-usdhc' was unexpected)
>
>   arch/arm64/boot/dts/freescale/imx8mn-ddr4-evk.dt.yaml: mmc@30b40000:
>     compatible: ['fsl,imx8mn-usdhc', 'fsl,imx7d-usdhc'] is too long
>
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

Rob, Krzysztof - do you want me to pick this one?

Kind regards
Uffe

>
> ---
>
> Changes since v2:
> 1. Remove moved compatibles.
>
> Changes since v1:
> 1. Handle also fsl,imx8mm-usdhc and fsl,imx8qxp-usdhc
> ---
>  .../bindings/mmc/fsl-imx-esdhc.yaml           | 37 ++++++++++---------
>  1 file changed, 20 insertions(+), 17 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/mmc/fsl-imx-esdhc.yaml b/Documentation/devicetree/bindings/mmc/fsl-imx-esdhc.yaml
> index 10b45966f1b8..e71d13c2d109 100644
> --- a/Documentation/devicetree/bindings/mmc/fsl-imx-esdhc.yaml
> +++ b/Documentation/devicetree/bindings/mmc/fsl-imx-esdhc.yaml
> @@ -21,23 +21,26 @@ description: |
>
>  properties:
>    compatible:
> -    enum:
> -      - fsl,imx25-esdhc
> -      - fsl,imx35-esdhc
> -      - fsl,imx51-esdhc
> -      - fsl,imx53-esdhc
> -      - fsl,imx6q-usdhc
> -      - fsl,imx6sl-usdhc
> -      - fsl,imx6sx-usdhc
> -      - fsl,imx6ull-usdhc
> -      - fsl,imx7d-usdhc
> -      - fsl,imx7ulp-usdhc
> -      - fsl,imx8mq-usdhc
> -      - fsl,imx8mm-usdhc
> -      - fsl,imx8mn-usdhc
> -      - fsl,imx8mp-usdhc
> -      - fsl,imx8qm-usdhc
> -      - fsl,imx8qxp-usdhc
> +    oneOf:
> +      - enum:
> +          - fsl,imx25-esdhc
> +          - fsl,imx35-esdhc
> +          - fsl,imx51-esdhc
> +          - fsl,imx53-esdhc
> +          - fsl,imx6q-usdhc
> +          - fsl,imx6sl-usdhc
> +          - fsl,imx6sx-usdhc
> +          - fsl,imx6ull-usdhc
> +          - fsl,imx7d-usdhc
> +          - fsl,imx7ulp-usdhc
> +      - items:
> +          - enum:
> +              - fsl,imx8mm-usdhc
> +              - fsl,imx8mn-usdhc
> +              - fsl,imx8mp-usdhc
> +              - fsl,imx8mq-usdhc
> +              - fsl,imx8qxp-usdhc
> +          - const: fsl,imx7d-usdhc
>
>    reg:
>      maxItems: 1
> --
> 2.17.1
>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
