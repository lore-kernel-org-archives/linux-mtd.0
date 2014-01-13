Received: from ch1ehsobe003.messaging.microsoft.com ([216.32.181.183]
 helo=ch1outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1W2XcT-0002ln-Lf
 for linux-mtd@lists.infradead.org; Mon, 13 Jan 2014 02:51:18 +0000
Date: Mon, 13 Jan 2014 10:15:54 +0800
From: Huang Shijie <b32955@freescale.com>
To: Bill Pringlemeir <bpringlemeir@nbsps.com>
Subject: Re: HW-ECC and erase detect [was: PATCH V2 fix mtd: gpmi: fix the
 bitflips for erased page]
Message-ID: <20140113021552.GB17069@shlinux2.ap.freescale.net>
References: <1389343044-22351-1-git-send-email-b32955@freescale.com>
 <1389343298-22473-1-git-send-email-b32955@freescale.com>
 <87eh4ftyja.fsf@nbsps.com> <8738kvimzn.fsf_-_@nbsps.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <8738kvimzn.fsf_-_@nbsps.com>
Cc: linux-mtd@lists.infradead.org, eliedebrauwer@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Jan 10, 2014 at 03:46:20PM -0500, Bill Pringlemeir wrote:
> I think 'fsmc_nand' will not detect the 'all ff data' and ECC failed
> condition?  Also, it seems that UBI will write mostly xFF pages when
> just an EC page/sub-page is marked, so these type of pages maybe fairly
> common in practice.
> 
> It certainly would be a nice feature for a hardware ECC which writes to
> the OOB data to have an 'erase detect' bit in the ECC status.  I looked
> at some other MTD devices and it didn't seem they had to handle this.
> Do some controller recognize an erased page and give an ECC status as
> ok?
In fact, the gpmi can supports this feature by set the HW_BCH_MODE:ERASE_THRESHOLD.
but Elie had proved it is a IC bug.

I have issued a request to the hardware guy, and hope they can fix it in the
future.

thanks
Huang Shijie
