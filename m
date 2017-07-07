Received: from mail-yw0-f195.google.com ([209.85.161.195])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dTU58-0004zn-Ql
 for linux-mtd@lists.infradead.org; Fri, 07 Jul 2017 14:18:08 +0000
Received: by mail-yw0-f195.google.com with SMTP id a12so1822123ywh.1
 for <linux-mtd@lists.infradead.org>; Fri, 07 Jul 2017 07:17:46 -0700 (PDT)
Date: Fri, 7 Jul 2017 09:17:44 -0500
From: Rob Herring <robh@kernel.org>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Hauke Mehrtens <hauke@hauke-m.de>, Ralf Baechle <ralf@linux-mips.org>,
 Linux MIPS Mailing List <linux-mips@linux-mips.org>,
 "open list:MEMORY TECHNOLOGY..." <linux-mtd@lists.infradead.org>,
 linux-watchdog@vger.kernel.org, devicetree <devicetree@vger.kernel.org>,
 "martin.blumenstingl" <martin.blumenstingl@googlemail.com>,
 john <john@phrozen.org>, linux-spi <linux-spi@vger.kernel.org>,
 "hauke.mehrtens" <hauke.mehrtens@intel.com>,
 Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [PATCH v7 10/16] reset: Add a reset controller driver for the
 Lantiq XWAY based SoCs
Message-ID: <20170707141744.atno6j3f7hcidxze@rob-hp-laptop>
References: <20170702224051.15109-1-hauke@hauke-m.de>
 <20170702224051.15109-11-hauke@hauke-m.de>
 <CAHp75VexwnVsb-ojXaZDN7QPVRKUeP-R=5C+j5ZSkE37Dtyp1Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHp75VexwnVsb-ojXaZDN7QPVRKUeP-R=5C+j5ZSkE37Dtyp1Q@mail.gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Jul 03, 2017 at 10:51:51AM +0300, Andy Shevchenko wrote:
> On Mon, Jul 3, 2017 at 1:40 AM, Hauke Mehrtens <hauke@hauke-m.de> wrote:
> > From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> >
> > The reset controllers (on xRX200 and newer SoCs have two of them) are
> > provided by the RCU module. This was initially implemented as a simple
> > reset controller. However, the RCU module provides more functionality
> > (ethernet GPHYs, USB PHY, etc.), which makes it a MFD device.
> > The old reset controller driver implementation from
> > arch/mips/lantiq/xway/reset.c did not honor this fact.
> >
> > For some devices the request and the status bits are different.
> 
> > +Required properties:
> > +- compatible           : Should be one of
> > +                               "lantiq,danube-reset"
> > +                               "lantiq,xrx200-reset"
> > +- offset-set           : Offset of the reset set register
> > +- offset-status                : Offset of the reset status register
> 
> Just one side comment (I'm fine with either choice, just for your
> information). Recently I have reviewed at24 patch which adds a
> property for getting MAC offset and my reseach ends up with the naming
> pattern mac-offset (as many others are doing this way). So, perhaps in
> your case it might make sense to do that way? Anyway, it's a matter of
> a (bit of a) chaos in DT bindings, whatever you decide users will live
> with.

Not a pattern I want to standardize. Describing offsets is generally an 
indication of the compatible not being specific enough.

Rob
