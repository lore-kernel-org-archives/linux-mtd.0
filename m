Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19935ECAAA1
	for <linux-mtd@archiver.kernel.org>; Tue,  6 Sep 2022 12:28:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=K7AhiaIG4c2T//Zrte3w4IihLKthER7AzoIBentH9xY=; b=35ces2VD1HEjr+
	F69z1Z1QFzn8rZ+Bomt5ghQPgDv2gQCTx/OK306E6elZ773N3g2pjlUk+dKc7D3Nqv6GC1Y6+T9Le
	0ofhFJUVZtnrG7RkJ0Wyt+HkFneC7cpwICNf0A9n2Na4koYeq9uGiQ8vCEZnwyR1448XjI25v4NhG
	SUVMGFnbjrK5MmbgMD67uAqthXCNowqVVK43+UlrAHLPSjeA1AUfEHhk+mNpjEBWxFyQTbPjTvdKg
	x1s3OauirijUCXVIETpg/P1LuOekEWkgcr0I8sGGQN99tI0ZrwYYamK5CAolKun8K5FdHzyzfHeCf
	RsbybL4cwlpFL4uT79Ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVXgF-00DKaa-Ej; Tue, 06 Sep 2022 12:27:51 +0000
Received: from mga04.intel.com ([192.55.52.120])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVXgC-00DKY6-BK; Tue, 06 Sep 2022 12:27:49 +0000
X-IronPort-AV: E=McAfee;i="6500,9779,10461"; a="295313299"
X-IronPort-AV: E=Sophos;i="5.93,294,1654585200"; 
   d="scan'208";a="295313299"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2022 05:27:45 -0700
X-IronPort-AV: E=Sophos;i="5.93,294,1654585200"; 
   d="scan'208";a="565074197"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2022 05:27:36 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andy.shevchenko@gmail.com>)
	id 1oVXfv-00975d-2X;
	Tue, 06 Sep 2022 15:27:31 +0300
Date: Tue, 6 Sep 2022 15:27:31 +0300
From: Andy Shevchenko <andy.shevchenko@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
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
Subject: Re: [PATCH v1 04/11] usb: phy: tegra: switch to using
 devm_gpiod_get()
Message-ID: <Yxc8s8IfzElm/mjS@smile.fi.intel.com>
References: <20220903-gpiod_get_from_of_node-remove-v1-0-b29adfb27a6c@gmail.com>
 <20220903-gpiod_get_from_of_node-remove-v1-4-b29adfb27a6c@gmail.com>
 <CAHp75VdMr7wru-2hD1HH3OS5JTNdzt6VRqB6OFoCp2JkiuiTjw@mail.gmail.com>
 <YxZQj8bwJCx5rqDv@google.com>
 <CAHp75VdHJS4YgrTK15OuY5sxodxKObUtzturL+YPXFQ3_wpxig@mail.gmail.com>
 <YxZTS3Nl1YaMGoBC@google.com>
 <CAHp75VeNajcf-Y6xvDDVwZijg6U53ggg1HQox1AZ74=wRut+1Q@mail.gmail.com>
 <4a0d089d-6ac6-b92e-6ac7-3d3de0144b4b@roeck-us.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4a0d089d-6ac6-b92e-6ac7-3d3de0144b4b@roeck-us.net>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220906_052748_439529_328C1825 
X-CRM114-Status: GOOD (  30.20  )
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

On Mon, Sep 05, 2022 at 03:07:48PM -0700, Guenter Roeck wrote:
> On 9/5/22 12:55, Andy Shevchenko wrote:
> > On Mon, Sep 5, 2022 at 10:51 PM Dmitry Torokhov
> > <dmitry.torokhov@gmail.com> wrote:
> > > On Mon, Sep 05, 2022 at 10:41:40PM +0300, Andy Shevchenko wrote:
> > > > On Mon, Sep 5, 2022 at 10:40 PM Dmitry Torokhov
> > > > <dmitry.torokhov@gmail.com> wrote:
> > > > > On Mon, Sep 05, 2022 at 01:59:44PM +0300, Andy Shevchenko wrote:
> > > > > > On Mon, Sep 5, 2022 at 9:32 AM Dmitry Torokhov
> > > > > > <dmitry.torokhov@gmail.com> wrote:

...

> > > > > > > +               gpiod = devm_gpiod_get(&pdev->dev, "nvidia,phy-reset",
> > > > > > > +                                      GPIOD_OUT_HIGH);
> > > > > > >                  err = PTR_ERR_OR_ZERO(gpiod);
> > > > > > 
> > > > > > What does _OR_ZERO mean now?
> > > > > 
> > > > > This converts a pointer to an error code if a pointer represents
> > > > > ERR_PTR() encoded error, or 0 to indicate success.
> > > > 
> > > > Yes, I know that. My point is, how is it useful now (or even before)?
> > > > I mean that devm_gpio_get() never returns NULL, right?
> > > 
> > > What does returning NULL have to do with anything.
> > 
> > It has to do with a dead code. If defm_gpiod_get() does not return
> > NULL, then why do we even bother to check?
> 
> PTR_ERR_OR_ZERO() converts into an error code (if the pointer is an
> ERR_PTR) or 0 if it is a real pointer. Its purpose is not to convert
> NULL into 0, its purpose is to convert a pointer either into an error
> code or 0. That is what is done here, and it is done all over the place
> in the kernel. I don't see your problem with it. Care to explain ?
> 
> > > It converts a pointer
> > > to a "classic" return code, with negative errors and 0 on success.
> > > 
> > > It allows to not use multiple IS_ERR/PTR_ERR in the code (I'd need 1
> > > IS_ERR and 2 PTR_ERR, one in dev_err() and another to return).
> > 
> > I don't see how this is relevant.
> 
> You lost me. Really, please explain your problem with PTR_ERR_OR_ZERO().

I don't know what I was thinking about... You, guys, are right, sorry for
my noise.

-- 
With Best Regards,
Andy Shevchenko



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
