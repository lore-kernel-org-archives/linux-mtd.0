Received: from mail-ot0-f195.google.com ([74.125.82.195])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cUGv7-0007mS-P8
 for linux-mtd@lists.infradead.org; Thu, 19 Jan 2017 17:54:47 +0000
Received: by mail-ot0-f195.google.com with SMTP id 73so5030447otj.1
 for <linux-mtd@lists.infradead.org>; Thu, 19 Jan 2017 09:54:25 -0800 (PST)
Date: Thu, 19 Jan 2017 11:54:23 -0600
From: Rob Herring <robh@kernel.org>
To: Cyrille Pitchen <cyrille.pitchen@atmel.com>
Cc: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
 Masahiko Iwamoto <iwamoto@allied-telesis.co.jp>,
 Jagan Teki <jagan@openedev.com>, Marek Vasut <marex@denx.de>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Sascha Hauer <kernel@pengutronix.de>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Mark Rutland <mark.rutland@arm.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: Re: [PATCH v3] mtd: spi-nor: add dt support for Everspin MRAMs
Message-ID: <20170119175423.uvjqtgkp2jns35hf@rob-hp-laptop>
References: <480df61d-c949-b3b0-61a4-d9db17f09e7d@atmel.com>
 <20170117110338.10756-1-u.kleine-koenig@pengutronix.de>
 <CACna6rwSZH8697px46KitcsFTROhqAQa2Cm2-RCTH=L_5nQFYg@mail.gmail.com>
 <82a0b0f7-a94b-70b5-1a5e-e5c04943a684@atmel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <82a0b0f7-a94b-70b5-1a5e-e5c04943a684@atmel.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Jan 17, 2017 at 02:57:22PM +0100, Cyrille Pitchen wrote:
> Le 17/01/2017 à 14:16, Rafał Miłecki a écrit :
> > On 17 January 2017 at 12:03, Uwe Kleine-König
> > <u.kleine-koenig@pengutronix.de> wrote:
> >> The MR25 family doesn't support JEDEC, so they need explicit mentioning
> >> in the list of supported spi IDs. This makes it possible to add these
> >> using for example:
> >>
> >>         compatible = "everspin,mr25h40";
> > 
> > (...)
> > 
> >> diff --git a/Documentation/devicetree/bindings/mtd/jedec,spi-nor.txt b/Documentation/devicetree/bindings/mtd/jedec,spi-nor.txt
> >> index 2c91c03e7eb0..3e920ec5c4d3 100644
> >> --- a/Documentation/devicetree/bindings/mtd/jedec,spi-nor.txt
> >> +++ b/Documentation/devicetree/bindings/mtd/jedec,spi-nor.txt
> >> @@ -14,6 +14,8 @@ Required properties:
> >>                   at25df641
> >>                   at26df081a
> >>                   mr25h256
> >> +                 mr25h10
> >> +                 mr25h40
> >>                   mx25l4005a
> >>                   mx25l1606e
> >>                   mx25l6405d
> > 
> > Uh, this is getting a never-ending-story...
> > If these chipsets don't support JEDEC, should we keep them in jedec,spi-nor.txt?
> > 
> 
> Maybe not but I think the new compatible strings should be documented
> somewhere. Currently jedec,spi-nor.txt already documents all the
> "m25p*-nonjedec" memories. So maybe just renaming the jedec,spi-nor.txt
> file into spi-nor.txt or mtd,spi-nor.txt could be a solution. Otherwise, we
> can let it as is. I have no idea of what would be the best solution.

As I read the description, the non-jedec chips don't support READ ID, 
but I would assume they otherwise follow the JEDEC spec(s)?

> To be honest, I don't always fully understand the DT policy/philosophy and
> its requirements. I just thought when a new property or a new value is
> introduced it has to be documented.
> Generally speaking, when DT is involved in some series of patches, it often
> generates many discussions about the proper way to do thinks and about
> choosing the best between many technically functional solutions.

Doesn't that apply to any code review? Sounds like the kernel process to 
me. If the DT review is more stringent, then I'll take that as a 
complement.

> If you think jedec,spi-nor.txt is not suited to document the new value for
> the compatible string, why not, I perfectly understand your point.
> 
> I don't mind choosing another way. I just want to be sure that, if not all,
> most of people agree on that solution and if possible, it is compliant with
> DT policy so everybody is happy and works together.
> That's why I involve DT people, even if it's a small detail, so they can
> advise us.
> 
> Anyway, at some point we have to take a decision to carry on thinks.
> So actually, I would like to avoid a never-ending story :)

I don't know what's the right answer here with regards to renaming or 
spliting things. In either case, that's a separate issue from this 
patch.

Rob
