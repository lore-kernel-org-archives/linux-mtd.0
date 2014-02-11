Received: from mail-ig0-x233.google.com ([2607:f8b0:4001:c05::233])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WDKBK-0003eO-HI
 for linux-mtd@lists.infradead.org; Tue, 11 Feb 2014 20:43:51 +0000
Received: by mail-ig0-f179.google.com with SMTP id c10so9667609igq.0
 for <linux-mtd@lists.infradead.org>; Tue, 11 Feb 2014 12:43:29 -0800 (PST)
Date: Tue, 11 Feb 2014 12:43:25 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Huang Shijie <b32955@freescale.com>
Subject: Re: [PATCH v2 0/5]  mtd: nand: support the JEDEC compliant nand.
Message-ID: <20140211204325.GL18440@ld-irv-0074>
References: <1391839441-21006-1-git-send-email-b32955@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1391839441-21006-1-git-send-email-b32955@freescale.com>
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Huang,

On Sat, Feb 08, 2014 at 02:03:56PM +0800, Huang Shijie wrote:
> Some vendors support the JEDEC standard only, such as Toshiba.
> We can get all the information for the JEDEC parameter page, just like
> we did with the ONFI parameter page.

It is heartening that they are finally wisening up for their MLC. I
don't believe Toshiba has plans to support this on their SLC, but we
can't have everything! SLC is more stable anyway, I think.

> This patch set adds the support for the JEDEC compliant nand chips.
> 
> You can download the JEDEC standard about the NAND in the:
>     www.jedec.org
> 
> My code references to the JESD230A, August 2013, revision 1.
> 
> Tested with Toshiba TH58TEG7DDKTA20(16K + 1280).
> (Unfortuately, this ECC info of its JEDEC parameter page is zero,
>  TOSHIBA FAE confirmed that they will fix it in future.)
> 
> v1 --> v2:
> 	[1] use the read_byte to replace the read_buf.
> 
> Huang Shijie (5):
>   mtd: nand: add the data structures for JEDEC parameter page
>   mtd: nand: add fields for JEDEC in nand_chip
>   mtd: nand: add a helper to get the supported features for JEDEC
>   mtd: nand: parse out the JEDEC compliant nand
>   mtd: nand: print out the right information for JEDEC compliant nand

Other than my comments on patches 2 and 4, ack'd by me. Thanks for the
work.

BTW, it looks like a few Micron parts I have actually support both ONFI
and JEDEC parameter pages. I'll see if I can test this out on them.

Brian
