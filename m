Return-Path: <SRS0=jvb0=DN=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5750AC41604
	for <linux-mtd@archiver.kernel.org>; Tue,  6 Oct 2020 07:38:47 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C4E0920760
	for <linux-mtd@archiver.kernel.org>; Tue,  6 Oct 2020 07:38:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Qe8FzDY3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C4E0920760
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=cQeoFNzmvErIWGTkv8dAjNrgWh5jqM+QQyt5sFhsn6A=; b=Qe8FzDY3mpM/gVnbYi+U1LphM
	Nwhgt2FDRZIwfqMERetxqxSRuQDyKvg7lrQMS9FbVrO7axj9EyRQAQituo+KHMudOLeP4Vj6GG8sV
	WnrUcs48Qhqe0/qS0/ZaJY78nZ/RtpJBDIj0If6RhVNVgBIkbthzSPz2DERzPoMeMC99N+RvUy7td
	5ErZowDqRR0B3k7wh1yKuug/99i/IB/jek1SzAVQpXjw0ZZZaEfGisDux+XxKr+2+AGJE9TDEu9x+
	KxrVWf5wqQZ6EpSpqIYMmr+Ewoj6cSKBOu82L8MM8a/78zymgVZWkifrAAWsVTwhiYgxBLqWhI957
	0U4632K3g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kPhXz-0000Za-OM; Tue, 06 Oct 2020 07:38:07 +0000
Received: from mail-ot1-f67.google.com ([209.85.210.67])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kPhXu-0000Ve-LO; Tue, 06 Oct 2020 07:38:03 +0000
Received: by mail-ot1-f67.google.com with SMTP id q21so11386817ota.8;
 Tue, 06 Oct 2020 00:37:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8+YGZEZXCDlVSYcoSNcJ9v6pHT8JdkLtCN5s+E2ToaQ=;
 b=GGq+16cqqp8FqQKvbo3EhWcyu+OguPr4vScHewKxHKBX3JW/R9xOcgAczgphDYbxpP
 Y3mKlZQC/UerRULk9Yqs7g/FZEmEmjnRW8XxAt48PJQfocxy93v799zXBN7FeehfdHKU
 GbHs6PSnhGO5TBxPp37wQH/ysuXivHSIbtGU7CFKJZdwibvyJbGRkJl1px3icVjW4Mnb
 Yq5PV92qpt9QCK5A/J2TaT6SnuFRP+LlBS8sKg1h8LFtjdT3M0Sgk3g1EGvFNkOoy/xr
 K+xSeL/lj3OEHYzrznFZOF1Sjcgb5ljQjldohvKiAVjI7NIBNtHVBwMj7GSPYBRn0uM5
 lJqg==
X-Gm-Message-State: AOAM531VWOX4xRLw83BlWEVLVfbJl1Q7EeCJ2nrveDiMjqWewVlcKRoU
 SZ/CBgrZNFcZqvnjCTfXBD58zgiVtopN7wOHrO4=
X-Google-Smtp-Source: ABdhPJz2bCZlgB6we6A9AWlaXsOI2O+CwxUcnmKhPrIVPza5tGmo+mK6C98Ugzjy2W9HQnh3L0gpSmpM+xs5ujOFQMY=
X-Received: by 2002:a05:6830:210a:: with SMTP id
 i10mr2082078otc.145.1601969875043; 
 Tue, 06 Oct 2020 00:37:55 -0700 (PDT)
MIME-Version: 1.0
References: <20201005183830.486085-1-robh@kernel.org>
 <20201005183830.486085-2-robh@kernel.org>
In-Reply-To: <20201005183830.486085-2-robh@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 6 Oct 2020 09:37:43 +0200
Message-ID: <CAMuHMdXjBSzbs4yAPJ-XUTBRZWKN61hO8vQ1-nGN5nAo7JnV-w@mail.gmail.com>
Subject: Re: [PATCH 1/4] dt-bindings: Add missing 'unevaluatedProperties'
To: Rob Herring <robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201006_033802_775995_85881D14 
X-CRM114-Status: GOOD (  22.81  )
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
Cc: Andrew Lunn <andrew@lunn.ch>, Ulf Hansson <ulf.hansson@linaro.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Peter Meerwald-Stadler <pmeerw@pmeerw.net>, Sam Ravnborg <sam@ravnborg.org>,
 Linux PWM List <linux-pwm@vger.kernel.org>, linux-iio@vger.kernel.org,
 linux-pci <linux-pci@vger.kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Sebastian Reichel <sre@kernel.org>, linux-ide@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Pavel Machek <pavel@ucw.cz>, Miquel Raynal <miquel.raynal@bootlin.com>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Lee Jones <lee.jones@linaro.org>, linux-clk <linux-clk@vger.kernel.org>,
 linux-leds@vger.kernel.org, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-rtc@vger.kernel.org, Lars-Peter Clausen <lars@metafoo.de>,
 Viresh Kumar <vireshk@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, Chanwoo Choi <cw00.choi@samsung.com>,
 MyungJoo Ham <myungjoo.ham@samsung.com>,
 "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
 linux-input@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>,
 Zhang Rui <rui.zhang@intel.com>,
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 Jens Axboe <axboe@kernel.dk>, Vivien Didelot <vivien.didelot@gmail.com>,
 Wolfgang Grandegger <wg@grandegger.com>,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Albert Ou <aou@eecs.berkeley.edu>,
 Jason Cooper <jason@lakedaemon.net>, Linux PM list <linux-pm@vger.kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, linux-can@vger.kernel.org,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Mark Brown <broonie@kernel.org>, Marc Kleine-Budde <mkl@pengutronix.de>,
 Paul Walmsley <paul.walmsley@sifive.com>, Bjorn Helgaas <bhelgaas@google.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-hwmon@vger.kernel.org,
 Alessandro Zummo <a.zummo@towertech.it>,
 Linux Watchdog Mailing List <linux-watchdog@vger.kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Richard Weinberger <richard@nod.at>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, Stephen Boyd <sboyd@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 USB list <linux-usb@vger.kernel.org>,
 Linux MMC List <linux-mmc@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-spi <linux-spi@vger.kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Wim Van Sebroeck <wim@linux-watchdog.org>,
 Marc Zyngier <maz@kernel.org>, dmaengine <dmaengine@vger.kernel.org>,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 Heiner Kallweit <hkallweit1@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Jonathan Cameron <jic23@kernel.org>,
 Linux I2C <linux-i2c@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Rob,

On Mon, Oct 5, 2020 at 8:39 PM Rob Herring <robh@kernel.org> wrote:
> This doesn't yet do anything in the tools, but make it explicit so we can
> check either 'unevaluatedProperties' or 'additionalProperties' is present
> in schemas.
>
> 'unevaluatedProperties' is appropriate when including another schema (via
> '$ref') and all possible properties and/or child nodes are not
> explicitly listed in the schema with the '$ref'.
>
> This is in preparation to add a meta-schema to check for missing
> 'unevaluatedProperties' or 'additionalProperties'. This has been a
> constant source of review issues.
>
> Signed-off-by: Rob Herring <robh@kernel.org>

Thanks for your patch!

>  Documentation/devicetree/bindings/bus/renesas,bsc.yaml       | 2 ++
>  .../bindings/memory-controllers/renesas,rpc-if.yaml          | 2 ++
>  Documentation/devicetree/bindings/net/renesas,ether.yaml     | 2 ++
>  Documentation/devicetree/bindings/serial/renesas,hscif.yaml  | 2 ++
>  Documentation/devicetree/bindings/serial/renesas,sci.yaml    | 2 ++
>  Documentation/devicetree/bindings/serial/renesas,scif.yaml   | 2 ++
>  Documentation/devicetree/bindings/serial/renesas,scifa.yaml  | 2 ++
>  Documentation/devicetree/bindings/serial/renesas,scifb.yaml  | 2 ++
>  Documentation/devicetree/bindings/spi/renesas,hspi.yaml      | 2 ++
>  Documentation/devicetree/bindings/spi/renesas,rspi.yaml      | 2 ++
>  Documentation/devicetree/bindings/spi/renesas,sh-msiof.yaml  | 2 ++

Acked-by: Geert Uytterhoeven <geert+renesas@glider.be>

> --- a/Documentation/devicetree/bindings/net/renesas,ether.yaml
> +++ b/Documentation/devicetree/bindings/net/renesas,ether.yaml
> @@ -85,6 +85,8 @@ required:
>    - clocks
>    - pinctrl-0
>
> +unevaluatedProperties: false

This one has received an "additionalProperties: false" in commit
41506bff84f1563e ("dt-bindings: net: renesas, ether: Improve schema validation")
in net-next, which you probably want to remove.

> +
>  examples:
>    # Lager board
>    - |

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
