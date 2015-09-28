Received: from mail-pa0-x230.google.com ([2607:f8b0:400e:c03::230])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZgMdV-0005m2-1J
 for linux-mtd@lists.infradead.org; Mon, 28 Sep 2015 00:49:45 +0000
Received: by pablk4 with SMTP id lk4so60387619pab.3
 for <linux-mtd@lists.infradead.org>; Sun, 27 Sep 2015 17:49:24 -0700 (PDT)
Date: Sun, 27 Sep 2015 17:49:22 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Robert Jarzmik <robert.jarzmik@free.fr>
Cc: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 David Woodhouse <dwmw2@infradead.org>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] mtd: nand: pxa3xx-nand: switch to dmaengine
Message-ID: <20150928004922.GA75400@google.com>
References: <1441545167-23383-1-git-send-email-robert.jarzmik@free.fr>
 <20150928001856.GB34421@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20150928001856.GB34421@google.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, Sep 27, 2015 at 05:18:56PM -0700, Brian Norris wrote:
> Sparse has one complaint, but I have no others:
> 
> On Sun, Sep 06, 2015 at 03:12:47PM +0200, Robert Jarzmik wrote:
> > diff --git a/drivers/mtd/nand/pxa3xx_nand.c b/drivers/mtd/nand/pxa3xx_nand.c
> > index 2f39bfe34584..1e9d462065e8 100644
> > --- a/drivers/mtd/nand/pxa3xx_nand.c
> > +++ b/drivers/mtd/nand/pxa3xx_nand.c
> > @@ -15,7 +15,9 @@
> ...
> > @@ -564,57 +567,61 @@ static void handle_data_pio(struct pxa3xx_nand_info *info)
> [...]
> > +static void start_data_dma(struct pxa3xx_nand_info *info)
> > +{
> > +	enum dma_data_direction direction;
> 
> I think this should be dma_transfer_direction. See warning below.

I just fixed this up and pushed to l2-mtd.git. I can revert and apply
something different if you'd like.

Regards,
Brian
