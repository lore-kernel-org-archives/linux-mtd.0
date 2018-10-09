Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g9mqZ-0006JF-H1
 for linux-mtd@lists.infradead.org; Tue, 09 Oct 2018 07:54:37 +0000
Date: Tue, 9 Oct 2018 09:54:15 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>, Richard
 Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org, Rob Herring
 <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland
 <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar
 Gala <galak@codeaurora.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH 03/14] mtd: maps: physmap: Use platform_get_resource()
 to retrieve iomem resources
Message-ID: <20181009095415.0e6309a3@bbrezillon>
In-Reply-To: <CAPybu_2BECuV5SJaHPopj5+hVVU+7i4pw8CWGqh5rDZ_TALF8g@mail.gmail.com>
References: <20181008201027.17952-1-boris.brezillon@bootlin.com>
 <20181008201027.17952-4-boris.brezillon@bootlin.com>
 <CAPybu_2BECuV5SJaHPopj5+hVVU+7i4pw8CWGqh5rDZ_TALF8g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 9 Oct 2018 09:16:41 +0200
Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com> wrote:

> Hi Boris
> On Mon, Oct 8, 2018 at 10:10 PM Boris Brezillon
> <boris.brezillon@bootlin.com> wrote:
> >
> > Stop manipulating the dev->resource array directly and use the
> > platform_get_resource() helper instead.
> >
> > While at it, fix the loop check so that we never overflow the info->maps
> > and info->mtds array even if the number of resources attached to the
> > platform dev is higher than MAX_RESOURCES.
> >
> > Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
> > ---
> >  drivers/mtd/maps/physmap.c | 29 ++++++++++++++++++-----------
> >  1 file changed, 18 insertions(+), 11 deletions(-)
> >
> > diff --git a/drivers/mtd/maps/physmap.c b/drivers/mtd/maps/physmap.c
> > index 4010afee4a33..e5b15ec2cb04 100644
> > --- a/drivers/mtd/maps/physmap.c
> > +++ b/drivers/mtd/maps/physmap.c
> > @@ -122,23 +122,28 @@ static int physmap_flash_probe(struct platform_device *dev)
> >
> >         platform_set_drvdata(dev, info);
> >
> > -       for (i = 0; i < dev->num_resources; i++) {
> > +       for (i = 0; i < MAX_RESOURCES; i++) {
> > +               struct resource *res;
> > +
> > +               res = platform_get_resource(dev, IORESOURCE_MEM, i);
> > +               if (res)
> > +                       break;  
> 
> Maybe if (!res)

I'll fix that one.
