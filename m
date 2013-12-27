Received: from tx2ehsobe001.messaging.microsoft.com ([65.55.88.11]
 helo=tx2outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VwRXr-0004Ry-TR
 for linux-mtd@lists.infradead.org; Fri, 27 Dec 2013 07:09:20 +0000
Date: Fri, 27 Dec 2013 14:37:26 +0800
From: Huang Shijie <b32955@freescale.com>
To: <dwmw2@infradead.org>
Subject: Re: [PATCH 0/5] mtd: nand: support the JEDEC compliant nand.
Message-ID: <20131227063724.GA27153@shlinux2.ap.freescale.net>
References: <1388121286-32620-1-git-send-email-b32955@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <1388121286-32620-1-git-send-email-b32955@freescale.com>
Cc: computersforpeace@gmail.com, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Dec 27, 2013 at 01:14:41PM +0800, Huang Shijie wrote:
> Some vendors support the JEDEC standard only, such as Toshiba.
> We can get all the information for the JEDEC parameter page, just like
> we did with the ONFI parameter page.
> 
> This patch set adds the support for the JEDEC compliant nand chips.
> 
> You can download the JEDEC standard about the NAND in the:
>     www.jedec.org
> 
> My code references to the JESD230A, August 2013, revision 1.
> 
> Tested with Toshiba TH58TEG7DDKTA20(16K + 1280).
> (Unfortuately, this ECC info of its JEDEC parameter page is zero,
>  i hope toshiba can fix it in future.)
this Toshiba chip is just a sample for us. so i think Toshiba will fix it
when the chip is on sale.

I also tested this patch set with Micron MT29F64G08CBABAWP which supports
both the ONFI and JEDEC. It is okay.

thanks
Huang Shijie
