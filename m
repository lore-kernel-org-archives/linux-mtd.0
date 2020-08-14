Return-Path: <SRS0=BXPI=BY=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84985C433E1
	for <linux-mtd@archiver.kernel.org>; Fri, 14 Aug 2020 14:52:11 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 51C1420855
	for <linux-mtd@archiver.kernel.org>; Fri, 14 Aug 2020 14:52:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="M4oTeIj9";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="prpw3/kx"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 51C1420855
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=zyza/hV09fcO+S9VKfH69O1J1yy0SiEg8GM9dw/xysI=; b=M4oTeIj9AnBMOq94cVUZkS1qR
	w6c+auAUT+Zk54kjOd8dKGNX4RyOhfTe62dB+lkQn0ULIs6KTjbjsA3Lu5cwrL1CGGAl1KluV0O5N
	RYres3MkBjvYLA0CbrKtxf4M+6nsXohbgefnw13cUqfiaPIBdaK4JzBJt+/2RtXBUYAn8sTBe5H4b
	KfiMpPAcPnpgSA7rcgF4/jsEPXFMfLFEOmiG8otTQD5AE5kxZIBR3VUnODHUcU3rzHm3gtVCvo0Ui
	M1kM64YICBTGMjEJ6xpj3fWW7nw/IBQS2wiy8tXfY0gr/DjCoKePkEEAOJUKQIGhv1GBAWabSVwl4
	pPObK/UEw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k6b3W-0002Xa-9c; Fri, 14 Aug 2020 14:51:42 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k6b3S-0002RY-EB; Fri, 14 Aug 2020 14:51:39 +0000
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com
 [209.85.210.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D633A20855;
 Fri, 14 Aug 2020 14:51:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1597416696;
 bh=2azDCJAW0WmwzjFoNP1+Xf1baXp64Ykp/VUpBlKju0s=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=prpw3/kxkCO5L+ZzIGqI6IWSbn4Gjfl/XiOAJK1cZ21tQ+vKPNqwRX8ojTLY13+sW
 IsErIVuBIOX1B5fxlXCrKztysgXNlUaXau0ewnnjk83KFK1l4s1c7RHmsl1dQ0O34O
 ATzSeLY7UpgbSvXBXGQ1Z8B+nOtare8pQZwTZ67M=
Received: by mail-ot1-f48.google.com with SMTP id v21so7741698otj.9;
 Fri, 14 Aug 2020 07:51:36 -0700 (PDT)
X-Gm-Message-State: AOAM530Z3rUnS3wi9QUmDILT+PWiOZ4vvRYi9yF+326cFunnbH1Mk5a9
 69ZQsfTdSefbKoxyQZFmad5EpcqrOvAINTHHeA==
X-Google-Smtp-Source: ABdhPJzAQOVgwIRLTeJz+4kS8jI7uSM4yy2bV/QUkiEz2152JH8sgfiQxJMSY+wk4abg95jsoFr6h5Ymz6ZJoeFhB2g=
X-Received: by 2002:a05:6830:1b79:: with SMTP id
 d25mr1995774ote.107.1597416696235; 
 Fri, 14 Aug 2020 07:51:36 -0700 (PDT)
MIME-Version: 1.0
References: <20200812203618.2656699-1-robh@kernel.org>
 <d5808e9c-07fe-1c28-b9a6-a16abe9df458@lucaceresoli.net>
In-Reply-To: <d5808e9c-07fe-1c28-b9a6-a16abe9df458@lucaceresoli.net>
From: Rob Herring <robh@kernel.org>
Date: Fri, 14 Aug 2020 08:51:24 -0600
X-Gmail-Original-Message-ID: <CAL_JsqKekx0VO4NROwLrgrU8+L584HaLHM9i3kCZvU+g5myeGw@mail.gmail.com>
Message-ID: <CAL_JsqKekx0VO4NROwLrgrU8+L584HaLHM9i3kCZvU+g5myeGw@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: Whitespace clean-ups in schema files
To: Luca Ceresoli <luca@lucaceresoli.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200814_105138_629909_027721E6 
X-CRM114-Status: GOOD (  22.07  )
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
Cc: Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 "open list:IIO SUBSYSTEM AND DRIVERS" <linux-iio@vger.kernel.org>,
 "open list:REMOTE PROCESSOR \(REMOTEPROC\) SUBSYSTEM"
 <linux-remoteproc@vger.kernel.org>, Linux-ALSA <alsa-devel@alsa-project.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 Linux I2C <linux-i2c@vger.kernel.org>, linux-clk <linux-clk@vger.kernel.org>,
 "open list:REAL TIME CLOCK \(RTC\) SUBSYSTEM" <linux-rtc@vger.kernel.org>,
 "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
 Linux Input <linux-input@vger.kernel.org>,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 devicetree@vger.kernel.org, "open list:THERMAL" <linux-pm@vger.kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>,
 Linux HWMON List <linux-hwmon@vger.kernel.org>,
 netdev <netdev@vger.kernel.org>, Linux USB List <linux-usb@vger.kernel.org>,
 linux-mmc <linux-mmc@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 linux-spi <linux-spi@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Thu, Aug 13, 2020 at 4:31 AM Luca Ceresoli <luca@lucaceresoli.net> wrote:
>
> Hi Rob,
>
> On 12/08/20 22:36, Rob Herring wrote:
> > Clean-up incorrect indentation, extra spaces, long lines, and missing
> > EOF newline in schema files. Most of the clean-ups are for list
> > indentation which should always be 2 spaces more than the preceding
> > keyword.
> >
> > Found with yamllint (which I plan to integrate into the checks).
>
> [...]
>
> > diff --git a/Documentation/devicetree/bindings/clock/idt,versaclock5.yaml b/Documentation/devicetree/bindings/clock/idt,versaclock5.yaml
> > index 3d4e1685cc55..28c6461b9a9a 100644
> > --- a/Documentation/devicetree/bindings/clock/idt,versaclock5.yaml
> > +++ b/Documentation/devicetree/bindings/clock/idt,versaclock5.yaml
> > @@ -95,10 +95,10 @@ allOf:
> >        # Devices without builtin crystal
> >        properties:
> >          clock-names:
> > -            minItems: 1
> > -            maxItems: 2
> > -            items:
> > -              enum: [ xin, clkin ]
> > +          minItems: 1
> > +          maxItems: 2
> > +          items:
> > +            enum: [ xin, clkin ]
> >          clocks:
> >            minItems: 1
> >            maxItems: 2
>
> Thanks for noticing, LGTM.
>
> [...]
>
> > diff --git a/Documentation/devicetree/bindings/input/touchscreen/touchscreen.yaml b/Documentation/devicetree/bindings/input/touchscreen/touchscreen.yaml
> > index d7dac16a3960..36dc7b56a453 100644
> > --- a/Documentation/devicetree/bindings/input/touchscreen/touchscreen.yaml
> > +++ b/Documentation/devicetree/bindings/input/touchscreen/touchscreen.yaml
> > @@ -33,8 +33,8 @@ properties:
> >      $ref: /schemas/types.yaml#/definitions/uint32
> >
> >    touchscreen-min-pressure:
> > -    description: minimum pressure on the touchscreen to be achieved in order for the
> > -                 touchscreen driver to report a touch event.
> > +    description: minimum pressure on the touchscreen to be achieved in order
> > +      for the touchscreen driver to report a touch event.
>
> Out of personal taste, I find the original layout more pleasant and
> readable. This third option is also good, especially for long descriptions:
>
>   description:
>     minimum pressure on the touchscreen to be achieved in order for the
>     touchscreen driver to report a touch event.
>
> At first glance yamllint seems to support exactly these two by default:
>
> > With indentation: {spaces: 4, check-multi-line-strings: true}

Turning on check-multi-line-strings results in 10K+ warnings, so no.

The other issue is the style ruamel.yaml wants to write out is as the
patch does above. This matters when doing some scripted
transformations where we read in the files and write them back out. I
can somewhat work around that by first doing a pass with no changes
and then another pass with the actual changes, but that's completely
scriptable. Hopefully, ruamel learns to preserve the style better.

Rob

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
