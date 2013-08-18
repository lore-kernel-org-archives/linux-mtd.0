Received: from mail-pa0-x22a.google.com ([2607:f8b0:400e:c03::22a])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VAsfg-0005lq-6m
 for linux-mtd@lists.infradead.org; Sun, 18 Aug 2013 02:24:48 +0000
Received: by mail-pa0-f42.google.com with SMTP id lj1so3371136pab.29
 for <linux-mtd@lists.infradead.org>; Sat, 17 Aug 2013 19:24:26 -0700 (PDT)
Date: Sun, 18 Aug 2013 10:29:13 -0400
From: Huang Shijie <shijie8@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH v4 6/6] mtd: update the ABI document about the ecc step
 size
Message-ID: <20130818142911.GA3615@gmail.com>
References: <1376619009-8622-1-git-send-email-b32955@freescale.com>
 <1376619009-8622-7-git-send-email-b32955@freescale.com>
 <1376660759.2089.358.camel@sauron.fi.intel.com>
 <20130817032644.GA27332@gmail.com>
 <20130817181447.GC5034@norris.computersforpeace.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20130817181447.GC5034@norris.computersforpeace.net>
Cc: Huang Shijie <b32955@freescale.com>, linux-mtd@lists.infradead.org,
 dwmw2@infradead.org, pekon@ti.com, Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, Aug 17, 2013 at 11:14:47AM -0700, Brian Norris wrote:
> On Fri, Aug 16, 2013 at 11:26:47PM -0400, Huang Shijie wrote:
> 
> I took pieces of your message and rewrote it myself. Diff pasted below
> (I edited ecc_strength to be less redundant and added a few details that
> were worth mentioning). Let me know if you want to revise it, but I'll

thanks a lot!

I really appreciate it. I always feel embarrassed when i descibe
something in English :(


> push it to l2-mtd.git.
> 
> Brian
> 
> ---
>  Documentation/ABI/testing/sysfs-class-mtd | 18 +++++++++++++++---
>  1 file changed, 15 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/ABI/testing/sysfs-class-mtd b/Documentation/ABI/testing/sysfs-class-mtd
> index 3105644..a795582 100644
> --- a/Documentation/ABI/testing/sysfs-class-mtd
> +++ b/Documentation/ABI/testing/sysfs-class-mtd
> @@ -128,9 +128,8 @@ KernelVersion:	3.4
>  Contact:	linux-mtd@lists.infradead.org
>  Description:
>  		Maximum number of bit errors that the device is capable of
> -		correcting within each region covering an ecc step.  This will
> -		always be a non-negative integer.  Note that some devices will
> -		have multiple ecc steps within each writesize region.
> +		correcting within each region covering an ECC step (see
> +		ecc_step_size).  This will always be a non-negative integer.
>  
>  		In the case of devices lacking any ECC capability, it is 0.
>  
> @@ -173,3 +172,16 @@ Description:
>  		This is generally applicable only to NAND flash devices with ECC
>  		capability.  It is ignored on devices lacking ECC capability;
>  		i.e., devices for which ecc_strength is zero.
> +
> +What:		/sys/class/mtd/mtdX/ecc_step_size
> +Date:		May 2013
> +KernelVersion:	3.10
> +Contact:	linux-mtd@lists.infradead.org
> +Description:
> +		The size of a single region covered by ECC, known as the ECC
> +		step.  Devices may have several equally sized ECC steps within
> +		each writesize region.  The step size counts only the data area,
> +		not the spare area.

Maybe this sentence is not accurate enough.

As far as i know, when the gpmi does the hardware ECC, the last ECC step
will use parts of the spare area. Just like:

----------------------------------------------------------------------------------
	 *    |                          P                            |
	 *    |<----------------------------------------------------->|
	 *    |                                                       |
	 *    |                                        (Block Mark)   |
	 *    |                      P'                      |      | |     |
	 *    |<-------------------------------------------->|  D   | |  O' |
	 *    |                                              |<---->| |<--->|
	 *    V                                              V      V V     V
	 *    +---+----------+-+----------+-+----------+-+----------+-+-----+
	 *    | M |   data   |E|   data   |E|   data   |E|   data   |E|     |
	 *    +---+----------+-+----------+-+----------+-+----------+-+-----+
	 *                                                   ^              ^
	 *                                                   |      O       |
	 *                                                   |<------------>|
	 *
	 *	P : the page size for BCH module.
	 *	E : The ECC strength.
	 *	G : the length of Galois Field.
	 *	N : The chunk count of per page.
	 *	M : the metasize of per page.
	 *	C : the ecc chunk size, aka the "data" above.
	 *	P': the nand chip's page size.
	 *	O : the nand chip's oob size.
	 *	O': the free oob.
----------------------------------------------------------------------------------
 In this diagram, the "O" stands for the spare area, and the last ECC
 step will use part of the spare area, the "Block Mark" is the boundary
 for the page and OOB.

thanks
Huang Shijie
