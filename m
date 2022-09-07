Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC1F7ECAAD5
	for <linux-mtd@archiver.kernel.org>; Wed,  7 Sep 2022 02:01:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ifQfcJnhZPNL+ohYvhPV2tNsZrFCTCmK6M6fSPFatsw=; b=I0yER443+LLJGy
	+bpEk1RyBRbyUaJLu04SIpoc38dwGXCKRea0yfPbvjWJp2ZGQeKOPj1zwoKFlcz0smOWz+g5p7lF6
	ybgCeEshIvMzgwD3w8/BBJU9Z3dySeDp8NC9wKkjH/61aWR3XY3svS1vAeeapAZ97jWzU13WzEgIo
	evy5kEzvqtZcu4FUzFccXboKVkIksQ15CfszbpHVZNUP6EP0oTsVcqitohOJxKyxPeViIT6KIAnju
	mfUHG7KwgEt1Kg7T/cq/hreTJkG20jWTRaZYcH2MFjcZm48dm/Ey+ULWQw7KD8KhwqwekYvUGkxy3
	OTbIIcj8bxvuy9xLf56A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVkNM-001THW-Ny; Wed, 07 Sep 2022 02:01:12 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVkNG-001TE9-Uw; Wed, 07 Sep 2022 02:01:10 +0000
Received: by mail-pl1-x634.google.com with SMTP id t3so7993458ply.2;
        Tue, 06 Sep 2022 19:01:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=YaCijregOqOjgcZeIED7JVmldRewR4dEphbJlxDQblY=;
        b=S9pRunUxPC7r0e1w9yj0o8783wojVpjNhKP8jsT71wWMuWPsfUFzdJz0TJMPpqTsPB
         M+Ae8ANyYrV4Sep3x0VbDc+EnMue4OoEN8RpFTpOjPkluJnGT2cqlVh1JYNiO5h/tDGK
         RGVJLwVuP7GISwNRAdT5OiqdenVIGFNKEJzKBNq2q1BXIKHlp8tWKx0fxbOK8GA6DZwQ
         TZfa9JbPfMPcxWCYQlbaTpn5opve5VlejEuuBRLWTpxblG8WQDMhb5np+dyWJJ6kAEEW
         rXWcB3V4lQHvMssIFHI0kdZjP9pomfXdXnH1i/sJC8kJC91PlHbGOcBl6u1/CPq1k3ff
         5tAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=YaCijregOqOjgcZeIED7JVmldRewR4dEphbJlxDQblY=;
        b=ZnDk8J427tY0/kpBtD778Mf2X5bjSBaVASUuEx7bP0ZVF9XoqspScEgJLSh3A5ZZeM
         3qLY2O1oGMm2zJCMPRp7BbFAnbQ0wuHWVxNemxKccwBmCvGH/fIX5b8o9djaqW5KvyHo
         I7rm0YcMPGC58d+TweNhGF/grjWlAFNS1QxxZVFSxFYr0L4VJZ3gPKcuP/DKueNFKZ6c
         fy7YTNHYPbA/jjZ3kOzV9c+hZog8KNBxtPmgbzYZ52YWOeWQfggSbOxgKhPDD+XcJEzZ
         3ecSrTTDZUO0MCAIHjRXrYh4/4YuRkXQ9eI1ar3xSP3eb9MW0zYo+GFe8pXVUMR8fvjO
         ZnDw==
X-Gm-Message-State: ACgBeo3qWtcIOSL+dfgxByW9D50cfrrlSMjLENIA2n7CiIkei3bISHXy
	N9HzTM7RCONMRrHgTn6EdzA=
X-Google-Smtp-Source: AA6agR4W7OfcLFzEOrvTrf5AWbvTtcvq1nW6dbnnaSOnulUmzjwEL9HxLO3xrl5g0PyDmCwuPzMlMg==
X-Received: by 2002:a17:90b:3ec7:b0:1fa:cdc1:f66 with SMTP id rm7-20020a17090b3ec700b001facdc10f66mr28531683pjb.167.1662516062292;
        Tue, 06 Sep 2022 19:01:02 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:abc4:5d24:5a73:a96b])
        by smtp.gmail.com with ESMTPSA id a206-20020a621ad7000000b00537d74f58cbsm2322985pfa.69.2022.09.06.19.00.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Sep 2022 19:01:01 -0700 (PDT)
Date: Tue, 6 Sep 2022 19:00:57 -0700
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
Message-ID: <Yxf7WTFG7xEh2Gv6@google.com>
References: <20220903-gpiod_get_from_of_node-remove-v1-0-b29adfb27a6c@gmail.com>
 <20220903-gpiod_get_from_of_node-remove-v1-10-b29adfb27a6c@gmail.com>
 <CAHp75Vd35EOy=mP25=9fmYfqQnbafgotHw1fxk-TdGk6Oc8g8Q@mail.gmail.com>
 <75e60144-9fa2-d6ba-bc92-edd23f7e7189@roeck-us.net>
 <CAHp75VcisCTYoRp-=713YKtwi7BQyPKGiUhF4DkpfAFtvDXCiQ@mail.gmail.com>
 <c696b9bf-d0ce-1c6a-0ee3-939b180891be@roeck-us.net>
 <YxZSUlCPEE9o/s4G@google.com>
 <73749107-35aa-0720-1a30-02a90c0540fa@roeck-us.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <73749107-35aa-0720-1a30-02a90c0540fa@roeck-us.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220906_190107_345465_8417E217 
X-CRM114-Status: GOOD (  22.36  )
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

On Mon, Sep 05, 2022 at 03:09:05PM -0700, Guenter Roeck wrote:
> On 9/5/22 12:47, Dmitry Torokhov wrote:
> [ ... ]
> > > We know that count is either 1 or 2 here, so strictly speaking
> > > 	if (count == 1) {
> > > 	} else {
> > > 	}
> > > would be sufficient. On the other side, that depends on ARRAY_SIZE() being
> > > exactly 2, so
> > > 	if (count == 1) {
> > > 	} else if (count == 2) {
> > > 	}
> > > would also make sense. Either way is fine with me. I'll leave it up
> > > to Dmitry to decide what he wants to do.
> > 
> > My goal is to drop usage of devm_gpiod_get_from_of_node(), beyond that I
> > do not have strong preferences either way really. It is probing code, so
> > performance is not critical, but I'm obviously satisfied with how the
> > code looks now, or I would not have sent it.
> > 
> 
> Good point.
> 
> Reviewed-by: Guenter Roeck <linux@roeck-us.net>

Guenter, individual patches are going through maintainer's trees, will
you take this one?

Thanks.

-- 
Dmitry

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
