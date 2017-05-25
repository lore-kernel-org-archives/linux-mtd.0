Received: from mail-pf0-x241.google.com ([2607:f8b0:400e:c00::241])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dE01o-00040T-2k
 for linux-mtd@lists.infradead.org; Thu, 25 May 2017 21:10:41 +0000
Received: by mail-pf0-x241.google.com with SMTP id n23so41432539pfb.3
 for <linux-mtd@lists.infradead.org>; Thu, 25 May 2017 14:10:19 -0700 (PDT)
Date: Thu, 25 May 2017 14:10:16 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Andrea Adami <andrea.adami@gmail.com>
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>,
 Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org,
 =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Subject: Re: [PATCH v2 3/3] mtd: nand: tmio_nand.c: prefer sharpslpart MTD
 partition parser
Message-ID: <20170525211016.GE114788@google.com>
References: <1492860013-20848-1-git-send-email-andrea.adami@gmail.com>
 <1492860013-20848-4-git-send-email-andrea.adami@gmail.com>
 <20170525192515.GA114788@google.com>
 <CAAQYJAt0L=swoZhD+2nx7NQ+nCxGWh-71g2wgJsK=72nu=z18g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAAQYJAt0L=swoZhD+2nx7NQ+nCxGWh-71g2wgJsK=72nu=z18g@mail.gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, May 25, 2017 at 10:47:37PM +0200, Andrea Adami wrote:
> On Thu, May 25, 2017 at 9:25 PM, Brian Norris
> <computersforpeace@gmail.com> wrote:
> > On Sat, Apr 22, 2017 at 01:20:13PM +0200, Andrea Adami wrote:
> >> This is the specific parser for Sharp SL Series (Zaurus)
> >>
> >> Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
> >> ---
> >>  drivers/mtd/nand/tmio_nand.c | 4 +++-
> >>  1 file changed, 3 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/drivers/mtd/nand/tmio_nand.c b/drivers/mtd/nand/tmio_nand.c
> >> index fc5e773..f3612ac 100644
> >> --- a/drivers/mtd/nand/tmio_nand.c
> >> +++ b/drivers/mtd/nand/tmio_nand.c
> >> @@ -357,6 +357,8 @@ static void tmio_hw_stop(struct platform_device *dev, struct tmio_nand *tmio)
> >>               cell->disable(dev);
> >>  }
> >>
> >> +static const char * const probes[] = { "sharpslpart", NULL };
> >
> > This breaks anyone who might have used (or might want to use) the ofpart
> > or cmdlinepart parsers. At a minimum, you need to include those in your
> > array here.
> 
> I have been under the wrong assumption there is cmdlinepart as last
> option (if compiled) so I have taken a wrong example.
> Grepping in /mt for probes gives many examples: what if I change it with
> 
> static const char * const probes[] = { "sharpslpart", "cmdlinepart", NULL };
> 
> ofpart is utopic at the moment: these machines are not yet converted
> to devicetree and it will take a while.
> 
> With this patchset we can move a step forward DT, removing all the
> static partition definition from spitz.c, tosa.c, corgi.c and poodle.c
> 
> I don't dare adding ofpart here: this will be done once Zaurus pxa
> platform is moved to devicetree.

What's the harm in including ofpart? It will be silently skipped if you
don't have a conforming device tree.

> > But really, I'd rather not add any more parser listings like this in
> > drivers. Parser selection should be determined by the platform, not by
> > the driver. See my last response to Rafal, who is trying to extend
> > support for device-tree based listing of parsers:
> >
> > http://lists.infradead.org/pipermail/linux-mtd/2017-April/073729.html
> 
> Ok then but remember these are obsolete devices and as far as I know
> these nand drivers are only used on Zaurus devices. No future use I
> guess.

Yes, but the point is I don't want new examples of a bad pattern. And if
you ever do gain device tree support, I would then be "breaking" your
device tree if I dropped "sharpslpart" from your probe list.

> > He has some more work posted to the mailing list since then; search the
> > archives.
> >
> > I'll take a look at the parser itself, and maybe we can merge that. But
> > I'm not likely to merge this patch, in any form.
> >
> The little parser itself is universal for all Zaurus pxa variants.
> As said above, please consider we can remove many lines of board code.

Speaking of board code: since this is all initialized by board files,
why can't you put the "platform information" (i.e., the partition parser
type(s)) in the platform data? e.g, struct sharpsl_nand_platform_data or
struct tmio_nand_data. That'd resolve my concern about hardcoding lists
in the driver.

Brian
