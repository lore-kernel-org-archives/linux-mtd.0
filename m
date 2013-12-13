Received: from mail-db8lp0185.outbound.messaging.microsoft.com
 ([213.199.154.185] helo=db8outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VrOtE-0000p3-4E
 for linux-mtd@lists.infradead.org; Fri, 13 Dec 2013 09:18:32 +0000
Date: Fri, 13 Dec 2013 16:49:41 +0800
From: Huang Shijie <b32955@freescale.com>
To: Huang Shijie <shijie8@gmail.com>
Subject: Re: [PATCH v1] mtd: gpmi: Bitflip support in erased regions
Message-ID: <20131213084938.GA7695@shlinux2.ap.freescale.net>
References: <1386619091-23992-1-git-send-email-eliedebrauwer@gmail.com>
 <20131211132455.GA1284@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20131211132455.GA1284@gmail.com>
Cc: dwmw2@infradead.org, Elie De Brauwer <eliedebrauwer@gmail.com>,
 linux-mtd@lists.infradead.org, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Dec 11, 2013 at 09:24:58PM +0800, Huang Shijie wrote:
> On Mon, Dec 09, 2013 at 08:58:10PM +0100, Elie De Brauwer wrote:
> > 
> > Quote datasheet:
> > "As the BCH decoder reads the data and parity blocks, it records a special condition, i.e.,
> > that all of the bits of a payload data block or metadata block are one, including any associated
> > parity bytes. The all-ones case for both parity and data indicates an erased block in the
> > NAND device."
> > 
> > Fortunately we can more or less tune this parameter by using the 
> > ERASE_THRESHOLD in HW_BCH_MODE register:
> > "This value indicates the maximum number of zero bits on a flash page for 
> > it to be considered erased. For SLC NAND devices, this value should be 
> 
> I met the "correct empty space" with a Toshiba SLC nand.
> The spec tells us it should be 0 for the SLC nand.	
> 
> I will double-check it tomorrow.

I confirm that a SLC nand can meet this issue too.

> 	
> > programmed to 0 (meaning that the entire page should consist of bytes of 
> > 0xFF. For MLC NAND devices, bit errors may occur on reads (even on blank 
> > pages), so this threshold can be used to tune the erased page checking 
> > algorithm."
> > 
> > So as my solution I'm setting this erase threshold to the ecc_strength 
> > derived from the geometry, meaning that I will tolerate the same number of 
> > bitflips the BCH block would consider correctable.
> > The side effect is that whever I'm reading a page (gpmi_ecc_read_page() ) 
A solution is to check the HW_BCH_STATUS0:ALLONES.

If it is all ones, we do not check it by software.


> > which the BCH block marked as "erased" I need to take a software approach. 
> > The software approach is inspired on what is currently
> > done in the omap2 driver (but not free from discussion). At that point I 
> > now that the page can contain up to ecc_strenght bitflips, so I need to 
> 
> The ecc_strength can be 40 sometimes.

The only problem is what is the proper value for ERASE_THRESHOLD.

still need more investigate.

thanks
Huang Shijie
