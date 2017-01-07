Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1cPllY-0000Qb-Fk
 for linux-mtd@lists.infradead.org; Sat, 07 Jan 2017 07:50:19 +0000
Date: Sat, 7 Jan 2017 08:49:48 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Marek Vasut <marek.vasut@gmail.com>
Cc: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 Icenowy Zheng <icenowy@aosc.xyz>, Valdis.Kletnieks@vt.edu,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 07/15] mtd: nand: move Samsung specific
 init/detection logic in nand_samsung.c
Message-ID: <20170107084948.1d5d699c@bbrezillon>
In-Reply-To: <4982cf88-ff7e-20c9-a158-e1e3826c0762@gmail.com>
References: <1483448495-31607-1-git-send-email-boris.brezillon@free-electrons.com>
 <1483448495-31607-8-git-send-email-boris.brezillon@free-electrons.com>
 <09da7377-1323-0794-fe61-34fd06e35404@gmail.com>
 <20170104180813.700823eb@bbrezillon>
 <4982cf88-ff7e-20c9-a158-e1e3826c0762@gmail.com>
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

On Sat, 7 Jan 2017 00:53:24 +0100
Marek Vasut <marek.vasut@gmail.com> wrote:

> On 01/04/2017 06:08 PM, Boris Brezillon wrote:
> > On Wed, 4 Jan 2017 16:14:07 +0100
> > Marek Vasut <marek.vasut@gmail.com> wrote:
> >   
> >> On 01/03/2017 02:01 PM, Boris Brezillon wrote:  
> >>> Move Samsung specific initialization and detection logic into
> >>> nand_samsung.c. This is part of the "separate vendor specific code from
> >>> core" cleanup process.
> >>>
> >>> Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>    
> >>
> >> [...]
> >>  
> >>> diff --git a/drivers/mtd/nand/nand_ids.c b/drivers/mtd/nand/nand_ids.c
> >>> index b3a332f37e14..05e9366696c9 100644
> >>> --- a/drivers/mtd/nand/nand_ids.c
> >>> +++ b/drivers/mtd/nand/nand_ids.c
> >>> @@ -10,7 +10,7 @@
> >>>  #include <linux/mtd/nand.h>
> >>>  #include <linux/sizes.h>
> >>>  
> >>> -#define LP_OPTIONS NAND_SAMSUNG_LP_OPTIONS
> >>> +#define LP_OPTIONS 0
> >>>  #define LP_OPTIONS16 (LP_OPTIONS | NAND_BUSWIDTH_16)
> >>>  
> >>>  #define SP_OPTIONS NAND_NEED_READRDY
> >>> @@ -169,10 +169,12 @@ struct nand_flash_dev nand_flash_ids[] = {
> >>>  };
> >>>  
> >>>  /* Manufacturer IDs */
> >>> +extern const struct nand_manufacturer_ops samsung_nand_manuf_ops;    
> >>
> >> Is the extern needed ?  
> > 
> > Yes, unless you have another solution. If you remove the extern keyword
> > you just redeclare samsung_nand_manuf_ops here, which is not what we
> > want.  
> 
> Maybe some accessor function can help ?
> 

You mean, in nand_ids.c

    const struct nand_manufacturer_ops *get_samsung_nand_mafuf_ops();

    struct nand_manufacturers nand_manuf_ids[] = {
    ...
	{NAND_MFR_SAMSUNG, "Samsung", get_samsung_nand_mafuf_ops},
    ...
    };

and then, in nand_samsung.c

    const struct nand_manufacturer_ops *get_samsung_nand_mafuf_ops()
    {
	return &samsung_nand_mafuf_ops;
    }

What's the point of this extra indirection? I mean, in both cases you
use a symbol that is not part of the same source file, so you'll have
to define this symbol (using a function prototype or an extern object
definition).
Is this all about fixing checkpatch warnings, or do you have a problem
with objects shared between different source files?

Now, I agree that the current approach is not ideal. A real improvement
would be to let the NAND manufacturer drivers (nand_<vendor>.c) register
themselves to the core. Something similar to CLK_OF_DECLARE() or
IRQCHIP_DECLARE() for example. But that means creating a dedicated
section for the nand_manufs_id table, and it's a lot more invasive than
the current approach.
