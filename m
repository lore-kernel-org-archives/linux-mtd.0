Return-Path: <SRS0=MAvX=B2=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BA8FC433DF
	for <linux-mtd@archiver.kernel.org>; Sun, 16 Aug 2020 08:45:04 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 178292067C
	for <linux-mtd@archiver.kernel.org>; Sun, 16 Aug 2020 08:45:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="COrK0Xd7";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="drEoeXpH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 178292067C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=9m7Qk21C6cFKq/FLiHGMkkWGrRnzw8uAiFVfw/gdmAQ=; b=COrK0Xd79CwewxsuR375TvPLk
	yZQq4kbDyzsLIP1cSrfhHOLQ5psTSFl8LDP3K/LqF3226qKsjV34EvaLsmikP2KYay0YpmmLItVaE
	/nWcHv6labeKMlWi2Na5FpbgOHgorpJZC7n9CkuIsjjnbpIdcrzI/CLU8Y5OQNN05a7d95OUPIaGm
	BCCj+K1mjphHCKXANN0noRZeNvF7IVXpe47lgR+16RGpbEq+N9A4jSvTmW4uKtjH0dezjjuN461+h
	5A464AankZ9J/Az5vYzZCMSgJH1CE6bCrLcHKhV7kTEUufKEYdOne9CT69WLvv/LMcAkU+bpCxrHM
	QfWLK59nQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k7EHI-0002Fs-9q; Sun, 16 Aug 2020 08:44:32 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k7EHC-0002EU-9h; Sun, 16 Aug 2020 08:44:27 +0000
Received: from archlinux (cpc149474-cmbg20-2-0-cust94.5-4.cable.virginm.net
 [82.4.196.95])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 032672067C;
 Sun, 16 Aug 2020 08:44:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1597567464;
 bh=T6UwMy4v18bgR1RYSk8bKZfCqTMnyUP8XZKnI31+u3w=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=drEoeXpHv0E0mUqTh6XgOtxm5HjQ3BZXo/2Vyh0E5JgpqmZ5oJHeFCZAHCZB9rAXm
 AbIb6f0WWGOxG4kSm3h11hWn0MA48MyZ6oiLma2mj2RujKNmxiI3bNdIjGxh0rdsDK
 bybFa1BfDVi2cbQ+dCfDbBrEzAgdhLg63i6r2Z2c=
Date: Sun, 16 Aug 2020 09:44:18 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH] dt-bindings: Whitespace clean-ups in schema files
Message-ID: <20200816094418.5bd08f5f@archlinux>
In-Reply-To: <20200812213453.GA690477@ravnborg.org>
References: <20200812203618.2656699-1-robh@kernel.org>
 <20200812213453.GA690477@ravnborg.org>
X-Mailer: Claws Mail 3.17.6 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200816_044426_500312_BF841702 
X-CRM114-Status: GOOD (  30.20  )
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
Cc: linux-fbdev@vger.kernel.org, linux-iio@vger.kernel.org,
 linux-remoteproc@vger.kernel.org, alsa-devel@alsa-project.org,
 dri-devel@lists.freedesktop.org, linux-mtd@lists.infradead.org,
 linux-i2c@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-rtc@vger.kernel.org, Rob Herring <robh@kernel.org>,
 linux-serial@vger.kernel.org, linux-input@vger.kernel.org,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-hwmon@vger.kernel.org,
 netdev@vger.kernel.org, linux-usb@vger.kernel.org, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Wed, 12 Aug 2020 23:34:53 +0200
Sam Ravnborg <sam@ravnborg.org> wrote:

> Hi Rob.
> 
> On Wed, Aug 12, 2020 at 02:36:18PM -0600, Rob Herring wrote:
> > Clean-up incorrect indentation, extra spaces, long lines, and missing
> > EOF newline in schema files. Most of the clean-ups are for list
> > indentation which should always be 2 spaces more than the preceding
> > keyword.
> > 
> > Found with yamllint (which I plan to integrate into the checks).  
> 
> I have browsed through the patch - and there was only a few things
> that jumped at me.
> 
> With these points considered:
> Acked-by: Sam Ravnborg <sam@ravnborg.org>

Replying here as the patch doesn't seem to have made it to linux-iio
at least. I'm not sure why...

Anyhow, found it in an lkml archive so for the iio changes
Acked-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

> 
> I expect only some (few) of my points to actually results in any updates.
> 
> I look forward to have the lint functionality as part of the built-in
> tools so we catch these things early.
> 
> 	Sam
> 
> > diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
> > index f63895c8ce2d..88814a2a14a5 100644
> > --- a/Documentation/devicetree/bindings/arm/fsl.yaml
> > +++ b/Documentation/devicetree/bindings/arm/fsl.yaml
> > @@ -273,8 +273,8 @@ properties:
> >                - fsl,imx6ull-14x14-evk     # i.MX6 UltraLiteLite 14x14 EVK Board
> >                - kontron,imx6ull-n6411-som # Kontron N6411 SOM
> >                - myir,imx6ull-mys-6ulx-eval # MYiR Tech iMX6ULL Evaluation Board
> > -              - toradex,colibri-imx6ull-eval            # Colibri iMX6ULL Module on Colibri Evaluation Board
> > -              - toradex,colibri-imx6ull-wifi-eval       # Colibri iMX6ULL Wi-Fi / Bluetooth Module on Colibri Evaluation Board
> > +              - toradex,colibri-imx6ull-eval      # Colibri iMX6ULL Module on Colibri Eval Board
> > +              - toradex,colibri-imx6ull-wifi-eval # Colibri iMX6ULL Wi-Fi / BT Module on Colibri Eval Board
> >            - const: fsl,imx6ull  
> 
> This change looks bad as it drops the alignment with the comments below.
> See following patch chunck:
> 
> >
> >        - description: Kontron N6411 S Board
> > @@ -312,9 +312,12 @@ properties:
> >                - toradex,colibri-imx7d                   # Colibri iMX7 Dual Module
> >                - toradex,colibri-imx7d-aster             # Colibri iMX7 Dual Module on Aster Carrier Board
> >                - toradex,colibri-imx7d-emmc              # Colibri iMX7 Dual 1GB (eMMC) Module
> > -              - toradex,colibri-imx7d-emmc-aster        # Colibri iMX7 Dual 1GB (eMMC) Module on Aster Carrier Board
> > -              - toradex,colibri-imx7d-emmc-eval-v3      # Colibri iMX7 Dual 1GB (eMMC) Module on Colibri Evaluation Board V3
> > -              - toradex,colibri-imx7d-eval-v3           # Colibri iMX7 Dual Module on Colibri Evaluation Board V3
> > +              - toradex,colibri-imx7d-emmc-aster        # Colibri iMX7 Dual 1GB (eMMC) Module on
> > +                                                        #  Aster Carrier Board  
> 
> 
> 
> > diff --git a/Documentation/devicetree/bindings/display/panel/ilitek,ili9322.yaml b/Documentation/devicetree/bindings/display/panel/ilitek,ili9322.yaml
> > index 177d48c5bd97..e89c1ea62ffa 100644
> > --- a/Documentation/devicetree/bindings/display/panel/ilitek,ili9322.yaml
> > +++ b/Documentation/devicetree/bindings/display/panel/ilitek,ili9322.yaml
> > @@ -25,8 +25,7 @@ properties:
> >    compatible:
> >      items:
> >        - enum:
> > -        - dlink,dir-685-panel
> > -
> > +          - dlink,dir-685-panel
> >        - const: ilitek,ili9322
> >
> >    reset-gpios: true
> > diff --git a/Documentation/devicetree/bindings/display/panel/ilitek,ili9881c.yaml b/Documentation/devicetree/bindings/display/panel/ilitek,ili9881c.yaml
> > index a39332276bab..76a9068a85dd 100644
> > --- a/Documentation/devicetree/bindings/display/panel/ilitek,ili9881c.yaml
> > +++ b/Documentation/devicetree/bindings/display/panel/ilitek,ili9881c.yaml
> > @@ -13,8 +13,7 @@ properties:
> >    compatible:
> >      items:
> >        - enum:
> > -        - bananapi,lhr050h41
> > -
> > +          - bananapi,lhr050h41
> >        - const: ilitek,ili9881c
> >  
> 
> The extra lines is a simple way to indicate that here shall be added
> more in the future. So I like the empty line.
> 
> 
> > diff --git a/Documentation/devicetree/bindings/leds/backlight/qcom-wled.yaml b/Documentation/devicetree/bindings/leds/backlight/qcom-wled.yaml
> > index 32e0896c6bc1..47938e372987 100644
> > --- a/Documentation/devicetree/bindings/leds/backlight/qcom-wled.yaml
> > +++ b/Documentation/devicetree/bindings/leds/backlight/qcom-wled.yaml
> > @@ -79,7 +79,8 @@ properties:
> >      description: |
> >        kHz; switching frequency.
> >      $ref: /schemas/types.yaml#/definitions/uint32
> > -    enum: [ 600, 640, 685, 738, 800, 872, 960, 1066, 1200, 1371, 1600, 1920, 2400, 3200, 4800, 9600 ]
> > +    enum: [ 600, 640, 685, 738, 800, 872, 960, 1066, 1200, 1371, 1600, 1920,
> > +            2400, 3200, 4800, 9600 ]
> >
> >    qcom,ovp:
> >      description: |  
> 
> In the modern world we are living in now line length of 100 chars are
> OK. checkpatch and coding_style is updated to reflected this.
> 
> > diff --git a/Documentation/devicetree/bindings/spi/mikrotik,rb4xx-spi.yaml b/Documentation/devicetree/bindings/spi/mikrotik,rb4xx-spi.yaml
> > index 4ddb42a4ae05..9102feae90a2 100644
> > --- a/Documentation/devicetree/bindings/spi/mikrotik,rb4xx-spi.yaml
> > +++ b/Documentation/devicetree/bindings/spi/mikrotik,rb4xx-spi.yaml
> > @@ -33,4 +33,5 @@ examples:
> >          reg = <0x1f000000 0x10>;
> >      };
> >
> > -...
> > \ No newline at end of file
> > +...
> > +  
> 
> Added one line too much?
> 
>  diff --git a/Documentation/devicetree/bindings/spi/spi-mux.yaml b/Documentation/devicetree/bindings/spi/spi-mux.yaml
> > index 0ae692dc28b5..3d3fed63409b 100644
> > --- a/Documentation/devicetree/bindings/spi/spi-mux.yaml
> > +++ b/Documentation/devicetree/bindings/spi/spi-mux.yaml
> > @@ -43,47 +43,47 @@ properties:
> >      maxItems: 1
> >
> >  required:
> > -   - compatible
> > -   - reg
> > -   - spi-max-frequency
> > -   - mux-controls
> > +  - compatible
> > +  - reg
> > +  - spi-max-frequency
> > +  - mux-controls
> >
> >  examples:
> > -   - |
> > -     #include <dt-bindings/gpio/gpio.h>
> > -     mux: mux-controller {
> > -       compatible = "gpio-mux";
> > -       #mux-control-cells = <0>;
> > +  - |
> > +    #include <dt-bindings/gpio/gpio.h>
> > +    mux: mux-controller {
> > +        compatible = "gpio-mux";
> > +        #mux-control-cells = <0>;
> >
> > -       mux-gpios = <&gpio0 3 GPIO_ACTIVE_HIGH>;
> > -     };
> > +        mux-gpios = <&gpio0 3 GPIO_ACTIVE_HIGH>;
> > +    };  
> 
> Example is updated to use 4-space indent. I like.
> 
> But many other examples are left untouched.
> 
> So I wonder if updating all examples to the same indent should
> be left for another mega-patch?
> 
> > diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> > index f3d847832fdc..2baee2c817c1 100644
> > --- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
> > +++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> > @@ -993,7 +993,8 @@ patternProperties:
> >    "^sst,.*":
> >      description: Silicon Storage Technology, Inc.
> >    "^sstar,.*":
> > -    description: Xiamen Xingchen(SigmaStar) Technology Co., Ltd. (formerly part of MStar Semiconductor, Inc.)
> > +    description: Xiamen Xingchen(SigmaStar) Technology Co., Ltd.
> > +      (formerly part of MStar Semiconductor, Inc.)
> >    "^st,.*":
> >      description: STMicroelectronics
> >    "^starry,.*":  
> 
> Did you check that they are all in alphabetical order?
> I would be suprised if this is the only issue in this file.
> 
> 


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
