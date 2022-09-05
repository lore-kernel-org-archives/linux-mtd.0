Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FCE8ECAAD3
	for <linux-mtd@archiver.kernel.org>; Mon,  5 Sep 2022 17:33:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tfwtLJ5veHdZct687r7r40v3Ku2vrffirPjzeGAAiOU=; b=YjgX3Ccy7wiPI+
	91H8A8+ShWZqs167IOi36TYB99/4e8FSC7v/f3CJEm7R7CFIot+47g7PEvUKlobo6QM6T8g1+zlFp
	rhuRMKKDJO6UL4dJf3c7Jqnf7IxXAkNcX2OvBDDGgPpl8GTcAxLcuUWTqrIF50DL2jVVelU930l4j
	YymIU2fsgdEql7W438v4VUJu55ZXWCrF6hb7q2dgkSVvTDabDOInSMf6LNnc7aonRfRAW735q8AQa
	1xgyEoFWqXzG86JNd8sRLg6rSpyqF8om0PHl1Pp2Xnsm8FscK9xzgJR/q/J1UOovQdyKOPN0SOaaq
	Y4gDgAhhsQ+bfXC0mdKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVFxu-007cKt-Ej; Mon, 05 Sep 2022 17:32:55 +0000
Received: from mail-qk1-x72f.google.com ([2607:f8b0:4864:20::72f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVDvX-005qmC-HB; Mon, 05 Sep 2022 15:22:21 +0000
Received: by mail-qk1-x72f.google.com with SMTP id w18so6467341qki.8;
        Mon, 05 Sep 2022 08:22:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=+ZiqcY4iwW4z7/E7mCAKrjs2qkOwesFoeuU+408Ac8o=;
        b=VFmGFDTElC9gVBP4IH125hq51A7FGr51vQ9KGLGqsDH5FAEMbMbUXIVHi85ww+a0fI
         GziSfVv/AV96vVMyihm0a9WLMAOVaqURD6Z6C0QYsgp+rD6u9b5XKuySpRwB9/4ukD5r
         ntRcngBKUZIdj1p7dnKxVpS61IIJC70YsoWsdaYgU3yQ1OeaPC6Dp8pG57kfBWmOL/93
         L/IFFf00dHT3zgOp5UKnif6AxMU2wmHM+SIXzgJwfA+idsrUzSPhTV0Cy8bk19HNDekI
         +ldaJp7J0Y+v4fVjKkwUglDoR826zDL6l5uW2KrYqW3xGquKc2bpuTp1y4lh/YVJ6mAK
         GUTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=+ZiqcY4iwW4z7/E7mCAKrjs2qkOwesFoeuU+408Ac8o=;
        b=fRZp3pWQa5OlQ6fT7e73fBe7XTSh6yn4VKqs25Tb68RPGC9pA5maGpCNYQ7men9Xdo
         5UrHjMzz8ihUPObOFDc3JU9PK196oC4nKRa+0Z4bL0mHNPsMtimc+9mJ71pM0tysGPrV
         grjRKBs/OvfIF8KADN1bUBkQHbjXZe5WChYMo6YKaMso1JWuIxwMcjXfxowZTPhvkpjt
         ErX4aDTttyTQbxs1vqN73v8rkR7Gc1i637cQwHl3NT9irhYxAjpSYGVAECftlzgpwKEv
         7QqihNMmN3QmuY3vLWU++sPOghcEeIJcrwVO72ALdds1aHR5cZQ4aKpqhKBOL4cys1AB
         dfOA==
X-Gm-Message-State: ACgBeo2Wxqb1WQEiIuOoqMKUd91T90hKfO5ve851ZTBcw9pdQh664R73
	wM2nk79MLeQajvQBA1gYkgS9lSLMym8uleMK8OA=
X-Google-Smtp-Source: AA6agR6eqDleGJQNbmaUKo+DXkG0Owzp6XfxQg6gg92/7A34V7uBDxuh7YdkC5fcKcuRE7T6e8KsWIJlWSuvkZ2TzuU=
X-Received: by 2002:a05:620a:410e:b0:6bc:5cdc:88ec with SMTP id
 j14-20020a05620a410e00b006bc5cdc88ecmr33187504qko.734.1662391338268; Mon, 05
 Sep 2022 08:22:18 -0700 (PDT)
MIME-Version: 1.0
References: <20220903-gpiod_get_from_of_node-remove-v1-0-b29adfb27a6c@gmail.com>
 <20220903-gpiod_get_from_of_node-remove-v1-10-b29adfb27a6c@gmail.com>
 <CAHp75Vd35EOy=mP25=9fmYfqQnbafgotHw1fxk-TdGk6Oc8g8Q@mail.gmail.com> <75e60144-9fa2-d6ba-bc92-edd23f7e7189@roeck-us.net>
In-Reply-To: <75e60144-9fa2-d6ba-bc92-edd23f7e7189@roeck-us.net>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 5 Sep 2022 18:21:42 +0300
Message-ID: <CAHp75VcisCTYoRp-=713YKtwi7BQyPKGiUhF4DkpfAFtvDXCiQ@mail.gmail.com>
Subject: Re: [PATCH v1 10/11] watchdog: bd9576_wdt: switch to using devm_fwnode_gpiod_get()
To: Guenter Roeck <linux@roeck-us.net>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Thierry Reding <thierry.reding@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Matti Vaittinen <mazziesaccount@gmail.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Claudiu Beznea <claudiu.beznea@microchip.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Wim Van Sebroeck <wim@linux-watchdog.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Miquel Raynal <miquel.raynal@bootlin.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Felipe Balbi <balbi@kernel.org>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
	Vignesh Raghavendra <vigneshr@ti.com>, Daniel Vetter <daniel@ffwll.ch>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Marc Zyngier <maz@kernel.org>, 
	Richard Weinberger <richard@nod.at>, David Airlie <airlied@linux.ie>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Jonathan Hunter <jonathanh@nvidia.com>, Rob Herring <robh@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>, 
	=?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>, 
	LINUXWATCHDOG <linux-watchdog@vger.kernel.org>, USB <linux-usb@vger.kernel.org>, 
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, linux-pci <linux-pci@vger.kernel.org>, 
	linux-tegra <linux-tegra@vger.kernel.org>, 
	"open list:MEMORY TECHNOLOGY..." <linux-mtd@lists.infradead.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220905_082219_659351_96907483 
X-CRM114-Status: GOOD (  22.31  )
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

On Mon, Sep 5, 2022 at 6:13 PM Guenter Roeck <linux@roeck-us.net> wrote:
> On 9/5/22 04:09, Andy Shevchenko wrote:
> > On Mon, Sep 5, 2022 at 9:33 AM Dmitry Torokhov
> > <dmitry.torokhov@gmail.com> wrote:

...

> >> +       count = device_property_count_u32(dev->parent, "rohm,hw-timeout-ms");
> >> +       if (count < 0 && count != -EINVAL)
> >> +               return count;
> >> +
> >> +       if (count > 0) {
> >
> >> +               if (count > ARRAY_SIZE(hw_margin))
> >> +                       return -EINVAL;
> >
> > Why double check? You may move it out of the (count > 0).
>
> Two checks will always be needed, so I don't entirely see
> how that would be better.

But not nested. That's my point:

if (count > ARRAY_SIZE())
  return ...
if (count > 0)
  ...

> >> -       if (ret == 1)
> >> -               hw_margin_max = hw_margin[0];
> >
> >> +               ret = device_property_read_u32_array(dev->parent,
> >> +                                                    "rohm,hw-timeout-ms",
> >> +                                                    hw_margin, count);
> >> +               if (ret < 0)
> >> +                       return ret;
> >
> > So, only this needs the count > 0 check since below already has it implicitly.
> >
> Sorry, I don't understand this comment.

if (count > 0) {
  ret = device_property_read_u32_array(...);
  ...
}
if (count == 1)
 ...
if (count == 2)
 ...

But here it might be better to have the nested conditionals.

> >> -       if (ret == 2) {
> >> -               hw_margin_max = hw_margin[1];
> >> -               hw_margin_min = hw_margin[0];
> >> +               if (count == 1)
> >> +                       hw_margin_max = hw_margin[0];
> >> +
> >> +               if (count == 2) {
> >> +                       hw_margin_max = hw_margin[1];
> >> +                       hw_margin_min = hw_margin[0];
> >> +               }
> >>          }

-- 
With Best Regards,
Andy Shevchenko

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
