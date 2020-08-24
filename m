Return-Path: <SRS0=BSfO=CC=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D584CC433E1
	for <linux-mtd@archiver.kernel.org>; Mon, 24 Aug 2020 06:58:44 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A22D6206BE
	for <linux-mtd@archiver.kernel.org>; Mon, 24 Aug 2020 06:58:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="MnNJH4aM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A22D6206BE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=TjJ5gtbqgAMWTIZO7tU7CS6GcP4zs/qJ8Y/I8VKYDbQ=; b=MnNJH4aM8jFoxCK2ARdPa77/Y
	hscATNhM0yzfA2rJOjoKu162YDXXrCW33BLWwVB782+yIG7LWOvuzFIUmfP4VoKw21QXXzFFzZnTQ
	00exMWRXZLSyQ6hIMOkJ2c3xyWz87k5WD/dLle7nrO2X6aeXaq3zZmxdVYVa07LjlGQhFy84walBe
	mMkoICNvyZHKIQ8UkodqoMeOL5iad4cqSHMRy0ztIQUUSuFr4LRgaX+0b2coaFhO53UVbHUoQ4Og8
	ofN2jq2/bpQmuji8ISFjtKxSQyArfoBHG8BN3fBvKGzldBt7p1BtX8H8WxX2gjukIKkoqtedIAd1v
	Dmc1UgU9g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kA6Qm-0001Ti-Ab; Mon, 24 Aug 2020 06:58:12 +0000
Received: from metis.ext.pengutronix.de ([85.220.165.71])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kA6Qj-0001Sk-DG
 for linux-mtd@lists.infradead.org; Mon, 24 Aug 2020 06:58:10 +0000
Received: from [2001:67c:670:100:1d::c0] (helo=ptx.hi.pengutronix.de)
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1kA6Qc-00039e-ED; Mon, 24 Aug 2020 08:58:02 +0200
Received: from sha by ptx.hi.pengutronix.de with local (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1kA6Qb-0006nF-2p; Mon, 24 Aug 2020 08:58:01 +0200
Date: Mon, 24 Aug 2020 08:58:01 +0200
From: Sascha Hauer <s.hauer@pengutronix.de>
To: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH 02/22] dt-bindings: gpio: fsl-imx-gpio: Add gpio-ranges
 property
Message-ID: <20200824065801.GH13023@pengutronix.de>
References: <20200823161550.3981-1-krzk@kernel.org>
 <20200823161550.3981-2-krzk@kernel.org>
 <20200824052446.GE13023@pengutronix.de>
 <20200824063806.GA2497@kozik-lap>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200824063806.GA2497@kozik-lap>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-IRC: #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 08:53:51 up 186 days, 14:24, 148 users,  load average: 0.09, 0.16,
 0.18
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: sha@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200824_025809_487459_54110353 
X-CRM114-Status: GOOD (  21.11  )
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
Cc: devicetree@vger.kernel.org, linux-serial@vger.kernel.org,
 Anson Huang <Anson.Huang@nxp.com>, linux-gpio@vger.kernel.org,
 Fabio Estevam <festevam@gmail.com>, Linus Walleij <linus.walleij@linaro.org>,
 linux-pm@vger.kernel.org, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Rob Herring <robh+dt@kernel.org>, linux-mtd@lists.infradead.org,
 NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Thierry Reding <thierry.reding@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-watchdog@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Mon, Aug 24, 2020 at 08:38:06AM +0200, Krzysztof Kozlowski wrote:
> On Mon, Aug 24, 2020 at 07:24:46AM +0200, Sascha Hauer wrote:
> > On Sun, Aug 23, 2020 at 06:15:30PM +0200, Krzysztof Kozlowski wrote:
> > > The GPIO controller node can have gpio-ranges property.  This fixes
> > > dtbs_check warnings like:
> > > 
> > >   arch/arm64/boot/dts/freescale/imx8mm-evk.dt.yaml: gpio@30200000: 'gpio-ranges' does not match any of the regexes: 'pinctrl-[0-9]+'
> > >     From schema: Documentation/devicetree/bindings/gpio/fsl-imx-gpio.yaml
> > > 
> > > Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> > > ---
> > >  .../devicetree/bindings/gpio/fsl-imx-gpio.yaml    | 15 +++++++++++++++
> > >  1 file changed, 15 insertions(+)
> > > 
> > > diff --git a/Documentation/devicetree/bindings/gpio/fsl-imx-gpio.yaml b/Documentation/devicetree/bindings/gpio/fsl-imx-gpio.yaml
> > > index 454db20c2d1a..1fac69573bb9 100644
> > > --- a/Documentation/devicetree/bindings/gpio/fsl-imx-gpio.yaml
> > > +++ b/Documentation/devicetree/bindings/gpio/fsl-imx-gpio.yaml
> > > @@ -51,6 +51,9 @@ properties:
> > >  
> > >    gpio-controller: true
> > >  
> > > +  gpio-ranges:
> > > +    maxItems: 1
> > > +
> > >  required:
> > >    - compatible
> > >    - reg
> > > @@ -62,6 +65,18 @@ required:
> > >  
> > >  additionalProperties: false
> > >  
> > > +allOf:
> > > +  - if:
> > > +      properties:
> > > +        compatible:
> > > +          contains:
> > > +            const: fsl,imx8mp-gpio
> > > +    then:
> > > +      properties:
> > > +        gpio-ranges:
> > > +          minItems: 1
> > > +          maxItems: 2
> > 
> > Why do you limit this to fsl,imx8mp-gpio? The i.MX5,6,7 dtsi files use
> > gpio-ranges as well and other i.MX dtsi files could also use it.
> 
> All other cases use maximum one element in gpio-ranges, so they are
> covered so I assumed they are continuous. But if it not the case, I can
> make all them maximum 2.

I misread this, I thought you allow gpio-ranges only for imx8mp, but
it's only the maxItems you set differently for that SoC. Anyway,
arch/arm/boot/dts/imx6dl.dtsi has this:

&gpio1 {
        gpio-ranges = <&iomuxc  0 131 2>, <&iomuxc  2 137 8>, <&iomuxc 10 189 2>,
                      <&iomuxc 12 194 1>, <&iomuxc 13 193 1>, <&iomuxc 14 192 1>,
                      <&iomuxc 15 191 1>, <&iomuxc 16 185 2>, <&iomuxc 18 184 1>,
                      <&iomuxc 19 187 1>, <&iomuxc 20 183 1>, <&iomuxc 21 188 1>,
                      <&iomuxc 22 123 3>, <&iomuxc 25 121 1>, <&iomuxc 26 127 1>,
                      <&iomuxc 27 126 1>, <&iomuxc 28 128 1>, <&iomuxc 29 130 1>,
                      <&iomuxc 30 129 1>, <&iomuxc 31 122 1>;
};

I don't think it makes sense to specify maxItems.

Sascha

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
