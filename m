Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1cX5tu-0003sM-Ue
 for linux-mtd@lists.infradead.org; Fri, 27 Jan 2017 12:45:12 +0000
Date: Fri, 27 Jan 2017 13:44:48 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Marek Vasut <marek.vasut@gmail.com>
Cc: Shailendra Verma <shailendra.v@samsung.com>, Richard Weinberger
 <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 p.shailesh@samsung.com, ashish.kalra@samsung.com, Shailendra Verma
 <shailendra.capricorn@gmail.com>
Subject: Re: [PATCH] Mtd: nand - Fix possible NULL derefrence.
Message-ID: <20170127134448.67c1d128@bbrezillon>
In-Reply-To: <9a682616-d1c3-a096-0736-fa23aca10299@gmail.com>
References: <CGME20170127112921epcas1p45999b22222202e8d98b6aecfc3cbeb39@epcas1p4.samsung.com>
 <1485516553-4438-1-git-send-email-shailendra.v@samsung.com>
 <9a682616-d1c3-a096-0736-fa23aca10299@gmail.com>
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

On Fri, 27 Jan 2017 13:24:18 +0100
Marek Vasut <marek.vasut@gmail.com> wrote:

> On 01/27/2017 12:29 PM, Shailendra Verma wrote:
> > of_match_device could return NULL, and so can cause a NULL
> > pointer dereference later.
> > 

That's a purely hypothetical bug since the core already matched
against one of the compatible in the of_match table to decide to attach
the device to this driver. Having of_match_device() return NULL here
means something went seriously wrong (memory corruption ?).

This being said, I'm not strongly opposed to this patch. Just a minor
comment below.

Thanks,

Boris

> > Signed-off-by: Shailendra Verma <shailendra.v@samsung.com>  
> 
> Nice find, but can you split this into two patches ? And the prefix is
> 'mtd' without capital letter.
> 
> Thanks
> 
> > ---
> >  drivers/mtd/nand/mxc_nand.c  |    4 ++++
> >  drivers/mtd/nand/vf610_nfc.c |    4 ++++
> >  2 files changed, 8 insertions(+)
> > 
> > diff --git a/drivers/mtd/nand/mxc_nand.c b/drivers/mtd/nand/mxc_nand.c
> > index d7f724b..ca1b8ad 100644
> > --- a/drivers/mtd/nand/mxc_nand.c
> > +++ b/drivers/mtd/nand/mxc_nand.c
> > @@ -1596,6 +1596,10 @@ static int __init mxcnd_probe_dt(struct mxc_nand_host *host)
> >  	if (!np)
> >  		return 1;
> >  
> > +	if (!of_id) {
> > +		dev_err(host->dev, "Error: No device match found\n");
> > +		return -ENODEV;
> > +	}

Add an empty line here.

> >  	host->devtype_data = of_id->data;
> >  
> >  	return 0;
> > diff --git a/drivers/mtd/nand/vf610_nfc.c b/drivers/mtd/nand/vf610_nfc.c
> > index 3ad514c..0e09c11 100644
> > --- a/drivers/mtd/nand/vf610_nfc.c
> > +++ b/drivers/mtd/nand/vf610_nfc.c
> > @@ -674,6 +674,10 @@ static int vf610_nfc_probe(struct platform_device *pdev)
> >  	}
> >  
> >  	of_id = of_match_device(vf610_nfc_dt_ids, &pdev->dev);
> > +	if (!of_id) {
> > +		dev_err(&pdev->dev, "Error: No device match found\n");
> > +		return -ENODEV;
> > +	}

Ditto.

> >  	nfc->variant = (enum vf610_nfc_variant)of_id->data;
> >  
> >  	for_each_available_child_of_node(nfc->dev->of_node, child) {
> >   
> 
> 
