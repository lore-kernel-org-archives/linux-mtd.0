Received: from mail1.bluewin.ch ([195.186.1.74])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18eBtZ-0000fq-00
	for <linux-mtd@lists.infradead.org>; Thu, 30 Jan 2003 10:26:09 +0000
Subject: Re: NFTL not recognizing disk on chip in some cases
From: Raphael Hertzog <eng@eipm.ch>
To: David Woodhouse <dwmw2@infradead.org>
Cc: linux-mtd@lists.infradead.org
In-Reply-To: <Pine.LNX.4.44.0301300819250.4791-100000@imladris.demon.co.uk>
References: <Pine.LNX.4.44.0301300819250.4791-100000@imladris.demon.co.uk>
Content-Type: text/plain; charset=ISO-8859-1
Message-Id: <1043924186.9795.26.camel@localhost>
Mime-Version: 1.0
Date: 30 Jan 2003 11:56:26 +0100
Content-Transfer-Encoding: 8bit
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

Am Don, 2003-01-30 um 09.19 schrieb David Woodhouse:
> On 30 Jan 2003, Raphael Hertzog wrote:
> 
> > I'm happy to test any patch since I can reproduce the problem here very
> > regularly ... :-)
> 
> Index: drivers/mtd/nftlmount.c
> ===================================================================
> RCS file: /home/cvs/mtd/drivers/mtd/nftlmount.c,v
> retrieving revision 1.31
> diff -u -p -r1.31 nftlmount.c
> --- drivers/mtd/nftlmount.c	15 Nov 2002 16:34:43 -0000	1.31
> +++ drivers/mtd/nftlmount.c	30 Jan 2003 08:19:46 -0000
> @@ -137,7 +137,11 @@ static int find_boot_record(struct NFTLr
>  				printk(KERN_NOTICE "NFTL Media Headers at 0x%x and 0x%x disagree.\n",
>  				       nftl->MediaUnit * nftl->EraseSize, block * nftl->EraseSize);
>  				/* if (debug) Print both side by side */
> -				return -1;
> +				if (boot_record_count < 2) {
> +					/* We haven't yet seen two real ones */
> +					return -1;
> +				}
> +				continue;
>  			}
>  			if (boot_record_count == 1)
>  				nftl->SpareMediaUnit = block;

Ok. It effectively fixes the problem. It's not very nice since the
notice is still displayed ... but that doesn't matter much.

Thanks for the patch !

Cheers,
-- 
Raphaël Hertzog - EIPM SA
