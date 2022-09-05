Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABDA3ECAAD5
	for <linux-mtd@archiver.kernel.org>; Mon,  5 Sep 2022 20:10:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hgeAIQtaBbzuXuaowWGtkMqY/s9bbdCfScJTuON/Yp4=; b=0XhCMPL5/zDyXY
	Y3E6MOUjQqRCv6RdR0KkCJXzRkhT3U9vYv1erTV5vCTl5LVRViAnQbwyjGzSpl3YxFOU4AGJnEPOY
	LJF+jmsPMdOWrbDTEKcDQEvLoGXDyXYdfMMR5LqoJ6xDJHTFxzozNLSxebDh58ghGAwXDTw/EEyw0
	Nal5rWgP29U9c4HToiDDvifnwW6oDwTLwkV6xsbVCRapSL2E0/fZ3pFPTOnKOo8xEcMm3ljhIcWLI
	ytkOCRgBKpvAPEKpeGFV8Nl/plWD6ymV2cOP3iNnVH47lxJqX/qlL5uMnFBBmyeFCI4jxHAA3fDK0
	NyccxiF6j9i1jxuCCohQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVIQQ-00A0uM-EQ; Mon, 05 Sep 2022 20:10:30 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVI4G-009cwv-S0; Mon, 05 Sep 2022 19:47:38 +0000
Received: by mail-pl1-x629.google.com with SMTP id jm11so9227327plb.13;
        Mon, 05 Sep 2022 12:47:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=G9Qf5nb4X9K1i84KXH4HdM00CRNAf5tzFBdtc+b4TKE=;
        b=cWny7dbbvfDII4XkGp5mcFhDW7xnoXHh4AKp8q/idS35yLNxXCSkBzhGNbyJdfKcgw
         I98s6U9AGgEVnvf/Otkfnonv1p93zecPAa1Wxa3KSM+UL95+uWumTNi/u3z4jHg0grzX
         JtIxbBCRknabFNdt+fjzwr65uC6OsrsW5a4sEZz0NEuBTvgOr4Bn6uiqxSSkgXONv6VT
         dMkF/Ehj96BrC/2YGY47othtHiCKBlZNyPsKpaY7eBC/Q5vm7GnaEikiaZ3BvOwvpZmX
         nN/ytcT90lHjiXGbNBizBZZroVETT+W7vOuh6f97BaXqY726iRuZQ2CjSiog5B/naWka
         hITg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=G9Qf5nb4X9K1i84KXH4HdM00CRNAf5tzFBdtc+b4TKE=;
        b=xNzZmziQM3PftRFgkREYIpxDsWzQm4LkBhJ49N4y3xHqO1xGCnN2r/KC05b0DQzvBD
         2axcK9NZzggCZy1p5PS38jvTNSQxeNnDOX2+YWQZHi59VYSoHAv85cD5baGBLPNZxGgL
         dRbBMT3VDTPzTkzDo+btadmCwwM7M3VeQXMB4YcEVEHxu5pQwV2Nq5AYUzvXPzPG6aYF
         yMBS4BUpowvPKDsIvM1xxuSfM0vlYdt1TB7Ck2o8iUidIxWCv7FFurYsMtNyBnqmbSVS
         HpjfD4QStjGMqtJ+vYkrRPAy5muE4a6x8lQU3nUV8lwBdknut7duOp/bxOUV0PrJabT7
         bSxw==
X-Gm-Message-State: ACgBeo26bXD0J88I/ekR2EPgP9p4x9lzk6MlJY6BF5jSzVV4rmepaFR+
	uh3ZiZSFhO1oSR+742YNp1E=
X-Google-Smtp-Source: AA6agR4rG9EXV1E/55fesrVFOXE77lWvaBqXkzFJkUjVwNbVeqHEEiHG7UvgGt+kX2D0zKBcZVYK9g==
X-Received: by 2002:a17:90a:3c89:b0:1fa:acc2:bafe with SMTP id g9-20020a17090a3c8900b001faacc2bafemr21251569pjc.84.1662407254825;
        Mon, 05 Sep 2022 12:47:34 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:7332:f188:2984:5930])
        by smtp.gmail.com with ESMTPSA id v63-20020a622f42000000b0053e20a0333fsm27362pfv.93.2022.09.05.12.47.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Sep 2022 12:47:34 -0700 (PDT)
Date: Mon, 5 Sep 2022 12:47:30 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Matti Vaittinen <mazziesaccount@gmail.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Claudiu Beznea <claudiu.beznea@microchip.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Felipe Balbi <balbi@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Marc Zyngier <maz@kernel.org>, Richard Weinberger <richard@nod.at>,
	David Airlie <airlied@linux.ie>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Rob Herring <robh@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>,
	LINUXWATCHDOG <linux-watchdog@vger.kernel.org>,
	USB <linux-usb@vger.kernel.org>,
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
	linux-pci <linux-pci@vger.kernel.org>,
	linux-tegra <linux-tegra@vger.kernel.org>,
	"open list:MEMORY TECHNOLOGY..." <linux-mtd@lists.infradead.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	dri-devel <dri-devel@lists.freedesktop.org>,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v1 10/11] watchdog: bd9576_wdt: switch to using
 devm_fwnode_gpiod_get()
Message-ID: <YxZSUlCPEE9o/s4G@google.com>
References: <20220903-gpiod_get_from_of_node-remove-v1-0-b29adfb27a6c@gmail.com>
 <20220903-gpiod_get_from_of_node-remove-v1-10-b29adfb27a6c@gmail.com>
 <CAHp75Vd35EOy=mP25=9fmYfqQnbafgotHw1fxk-TdGk6Oc8g8Q@mail.gmail.com>
 <75e60144-9fa2-d6ba-bc92-edd23f7e7189@roeck-us.net>
 <CAHp75VcisCTYoRp-=713YKtwi7BQyPKGiUhF4DkpfAFtvDXCiQ@mail.gmail.com>
 <c696b9bf-d0ce-1c6a-0ee3-939b180891be@roeck-us.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c696b9bf-d0ce-1c6a-0ee3-939b180891be@roeck-us.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220905_124736_963667_3AEBCA3D 
X-CRM114-Status: GOOD (  31.31  )
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

On Mon, Sep 05, 2022 at 08:49:58AM -0700, Guenter Roeck wrote:
> On 9/5/22 08:21, Andy Shevchenko wrote:
> > On Mon, Sep 5, 2022 at 6:13 PM Guenter Roeck <linux@roeck-us.net> wrote:
> > > On 9/5/22 04:09, Andy Shevchenko wrote:
> > > > On Mon, Sep 5, 2022 at 9:33 AM Dmitry Torokhov
> > > > <dmitry.torokhov@gmail.com> wrote:
> > 
> > ...
> > 
> > > > > +       count = device_property_count_u32(dev->parent, "rohm,hw-timeout-ms");
> > > > > +       if (count < 0 && count != -EINVAL)
> > > > > +               return count;
> > > > > +
> > > > > +       if (count > 0) {
> > > > 
> > > > > +               if (count > ARRAY_SIZE(hw_margin))
> > > > > +                       return -EINVAL;
> > > > 
> > > > Why double check? You may move it out of the (count > 0).
> >
> > > Two checks will always be needed, so I don't entirely see
> > > how that would be better.
> > 
> > But not nested. That's my point:
> > 
> > if (count > ARRAY_SIZE())
> >    return ...
> > if (count > 0)
> >    ...
> > 
> 
> The old code has either 1 or two checks if there is no error.
> Your suggested code has always two checks. I don't see how that
> is an improvement.
> 
> > > > > -       if (ret == 1)
> > > > > -               hw_margin_max = hw_margin[0];
> > > > 
> > > > > +               ret = device_property_read_u32_array(dev->parent,
> > > > > +                                                    "rohm,hw-timeout-ms",
> > > > > +                                                    hw_margin, count);
> > > > > +               if (ret < 0)
> > > > > +                       return ret;
> > > > 
> > > > So, only this needs the count > 0 check since below already has it implicitly.
> > > > 
> > > Sorry, I don't understand this comment.
> > 
> > if (count > 0) {
> >    ret = device_property_read_u32_array(...);
> >    ...
> > }
> > if (count == 1)
> >   ...
> > if (count == 2)
> >   ...
> > 
> > But here it might be better to have the nested conditionals.
> > 
> 
> We know that count is either 1 or 2 here, so strictly speaking
> 	if (count == 1) {
> 	} else {
> 	}
> would be sufficient. On the other side, that depends on ARRAY_SIZE() being
> exactly 2, so
> 	if (count == 1) {
> 	} else if (count == 2) {
> 	}
> would also make sense. Either way is fine with me. I'll leave it up
> to Dmitry to decide what he wants to do.

My goal is to drop usage of devm_gpiod_get_from_of_node(), beyond that I
do not have strong preferences either way really. It is probing code, so
performance is not critical, but I'm obviously satisfied with how the
code looks now, or I would not have sent it.

Thanks.

-- 
Dmitry

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
