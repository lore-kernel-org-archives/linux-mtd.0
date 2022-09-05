Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDD05ECAAA1
	for <linux-mtd@archiver.kernel.org>; Mon,  5 Sep 2022 22:08:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KtcmPfpsjkUwJ5z+44g6HLgjJsZP4M7izM0ivbp/jt0=; b=QwfEEq3VXhap6I
	Fj1A6S2fXz+f1csiWMo12BMm+L3S8azKLCLW5CkWZ+tOLiDYCEZspRSru+ZPyyObEbO+AdjdDBBKI
	aAW8lc2q6ccyRr5U7KRAnWGBtiiPJavEcGQqHPvLUcUkYokhz5V9YdPjcutcVQU5D1zzpCpwXwAuh
	8XPXhY/ivOp6+0O7HAAhf1KFIJNWUt2XYqoa+3jGRTlOsgdh5Oubnvf1EObjZreUD/rANMDGAI3SZ
	bal+XvWkBzMDYd++SCMXYpfolquzlfaoxck6FYjvdZF2w2FJLdw2nXcqJU/Ke//Ihv7a9FrYEUVd/
	MQEvhgH68j7RKd5h3bGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVKGl-00H3GS-7b; Mon, 05 Sep 2022 22:08:39 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVKGi-00H3FE-GA; Mon, 05 Sep 2022 22:08:37 +0000
Received: by mail-pf1-x430.google.com with SMTP id q15so9556005pfn.11;
        Mon, 05 Sep 2022 15:08:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=5z1ooZsxXJhukGg5jtTnKIsDm0LxvDPLLdQBFIOg9Mo=;
        b=YgTpoNtQskYKJFiEm9roM8UsHLvYEBNA1mL8ijvR43dcIl3qE9TJ2QJ31Crw3ouUSM
         iI8m5cQ7oncVgCHnH06GZ7ixBdCItXBCOTQ0lnmtukCsaxmucAabTpdrPK7wJWhoEWT7
         cgfEiI7IXkgrurTPX8XkkJoSsKsg9OzznrhVAXoVVoMju1sc4m7PY17g3MSbb/mrzdVs
         e0eC6TEC3Uajc8BSqN8s3bXjyqbHUencfLf3ZSqIc6lxiBQcd3c3TAVmvjecPrYNaR0z
         fbBCLNGPTSjT+MdQuaaUYKGVdpkhWWf3pd/I4UIY2tn2zmhrhfXgmb3XRio80gdSixHJ
         PRBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=5z1ooZsxXJhukGg5jtTnKIsDm0LxvDPLLdQBFIOg9Mo=;
        b=moktuLLEm66hm71bhBFTA6wylxdEl9MCm5UlespwwcLcSaN7f7wthbzH6rf4xRjNja
         xzgVOxlB7kUPMscGbkBTYtImBe8SEjGwtwX9hsSySVcQlujCiS6v8IzIt/r6spEgniXy
         qNyKH03aMNqak4Kf06LQRM6dBv72PZKdEciFz/VAtWq32OcbI/Qe8o0h9EfFNEcLTYUY
         AqPFWrYAV07E9kpV6zL8x2NauLS9LMoo2CQoThBKSSYPhmKUGrWaIBZK8/g58EPYqcuT
         tCx7cG4svTu+bmjsWqyaYaIO2YcJC/Aesy3ghne8b58LqD3s91d+MgCdr+hZZbeO+qho
         iiBA==
X-Gm-Message-State: ACgBeo3C8ntoCNap078aC4IDRPebjcM3OzSElk116XwdsbpNXMHTYRuv
	Sfbi2eVBGYR9S7oyXtwyfY0=
X-Google-Smtp-Source: AA6agR7YbREIA01VRSmP+zvXlY2q8iiOZpKUEqi6KFy5cemoOzMeF56ZDQMRUefeyhXXs1gJaKAhsA==
X-Received: by 2002:a63:4719:0:b0:42c:5586:de2 with SMTP id u25-20020a634719000000b0042c55860de2mr31993067pga.158.1662415714908;
        Mon, 05 Sep 2022 15:08:34 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:1190:fbfa:ae95:111c])
        by smtp.gmail.com with ESMTPSA id a12-20020a170902710c00b00172f1d0825esm8092373pll.113.2022.09.05.15.08.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Sep 2022 15:08:34 -0700 (PDT)
Date: Mon, 5 Sep 2022 15:08:30 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Mathias Nyman <mathias.nyman@intel.com>,
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Matti Vaittinen <mazziesaccount@gmail.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Claudiu Beznea <claudiu.beznea@microchip.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
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
Subject: Re: [PATCH v1 02/11] drm/tegra: switch to using devm_fwnode_gpiod_get
Message-ID: <YxZzXqJiOPDVmACo@google.com>
References: <20220903-gpiod_get_from_of_node-remove-v1-0-b29adfb27a6c@gmail.com>
 <20220903-gpiod_get_from_of_node-remove-v1-2-b29adfb27a6c@gmail.com>
 <CAHp75Vc4yfh0JcY0B-vNawHTay5QNuhd7GAm86QZZZvUnQaMzQ@mail.gmail.com>
 <YxZP/exeVD7DQ5Hx@google.com>
 <CACRpkda0iUTV=71eQf5_FdKWLe3Bu=U+Zny9_uJJL=5xXtnrnQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CACRpkda0iUTV=71eQf5_FdKWLe3Bu=U+Zny9_uJJL=5xXtnrnQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220905_150836_561011_7096E003 
X-CRM114-Status: GOOD (  25.46  )
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

On Mon, Sep 05, 2022 at 11:03:38PM +0200, Linus Walleij wrote:
> On Mon, Sep 5, 2022 at 9:37 PM Dmitry Torokhov
> <dmitry.torokhov@gmail.com> wrote:
> > On Mon, Sep 05, 2022 at 01:57:01PM +0300, Andy Shevchenko wrote:
> > > On Mon, Sep 5, 2022 at 9:32 AM Dmitry Torokhov
> > > <dmitry.torokhov@gmail.com> wrote:
> > > >
> > > > I would like to limit (or maybe even remove) use of
> > > > [devm_]gpiod_get_from_of_node in drivers so that gpiolib can be cleaned
> > > > a bit, so let's switch to the generic device property API.
> > >
> > > > It may even
> > > > help with handling secondary fwnodes when gpiolib is taught to handle
> > > > gpios described by swnodes.
> > >
> > > I would remove this sentence from all commit messages since it's a
> > > debatable thing and might even not happen, so the above is a pure
> > > speculation.
> >
> > I have the patches. Granted, I had them since '19 ;) but I'm rebasing
> > them and going to push them. I need them to convert bunch of input
> > drivers away from platform data.
> 
> That's good news!
> 
> Are you referring to this patch set mentioned in a discussion
> from 2017 thru 2020?
> https://lore.kernel.org/linux-input/20200826161222.GA1665100@dtor-ws/
> 
> I put aside GPIO descriptor conversion for input devices (keys, buttons)
> in board files anticipating a swnode mechanism.

Yep, that one, exactly. It is taking a bit longer than I anticipated ;)

Thanks.

-- 
Dmitry

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
