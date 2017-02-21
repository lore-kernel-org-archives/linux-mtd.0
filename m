Date: Tue, 21 Feb 2017 12:06:48 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Marc Gonzalez <marc_gonzalez@sigmadesigns.com>
Cc: Richard Weinberger <richard@nod.at>, <linux-mtd@lists.infradead.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Sergio Prado
 <sergio.prado@e-labworks.com>, "Wenyou Yang" <wenyou.yang@atmel.com>, Josh
 Wu <rainyfeeling@outlook.com>, David Woodhouse <dwmw2@infradead.org>, Brian
 Norris <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>,
 "Cyrille Pitchen" <cyrille.pitchen@atmel.com>, Krzysztof Kozlowski
 <krzk@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [RESEND PATCH 1/3] mtd: nand: Pass the CS line to
 ->setup_data_interface()
Message-ID: <20170221120648.19e0d32c@bbrezillon>
In-Reply-To: <a5a9d822-a73c-4fd1-201c-7a17d9517f24@sigmadesigns.com>
References: <1487625149-7234-1-git-send-email-boris.brezillon@free-electrons.com>
 <1487625149-7234-2-git-send-email-boris.brezillon@free-electrons.com>
 <a5a9d822-a73c-4fd1-201c-7a17d9517f24@sigmadesigns.com>
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

On Tue, 21 Feb 2017 11:57:23 +0100
Marc Gonzalez <marc_gonzalez@sigmadesigns.com> wrote:

> On 20/02/2017 22:12, Boris Brezillon wrote:
> 
> > Some NAND controllers can assign different NAND timings to different
> > CS lines. Pass the CS line information to ->setup_data_interface() so
> > that the NAND controller driver knows which CS line is concerned by
> > the setup_data_interface() request.  
> 
> I'm confused, because I thought I was already doing that.
> On my platform, I have different timings for each chip.
> (thus, for each CS, right?)
> 
> In chip->select_chip, I program the appropriate timings
> which the controller will be using.
> 
> What am I missing?

Maybe you don't have multi-dies chips, which is the case I'm fixing
here. If you have 2 separate chips, the existing hook should work just
fine.

> 
> > diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
> > index c8894f31392e..d62a1c7c5c5c 100644
> > --- a/drivers/mtd/nand/nand_base.c
> > +++ b/drivers/mtd/nand/nand_base.c
> > @@ -1100,8 +1102,10 @@ static int nand_init_data_interface(struct nand_chip *chip)
> >  		if (ret)
> >  			continue;
> >  
> > -		ret = chip->setup_data_interface(mtd, chip->data_interface,
> > -						 true);
> > +		/* Pass -1 to only */  
> 
> "Pass -1 to only" what?
> 
> I suppose -1 means NAND_DATA_IFACE_CHECK_ONLY since
> #define NAND_DATA_IFACE_CHECK_ONLY -1
> 
> Maybe you meant "Pass -1 to check only" here?
> The comment may need a slight rework.

Yep, didn't finish my sentence.
Since I decided to define a macro with a self-descriptive name, I
don't think I need this comment anymore.

> 
> > +		ret = chip->setup_data_interface(mtd,
> > +						 NAND_DATA_IFACE_CHECK_ONLY,
> > +						 chip->data_interface);
> >  		if (!ret) {
> >  			chip->onfi_timing_mode_default = mode;
> >  			break;  
