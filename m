Received: from co1ehsobe004.messaging.microsoft.com ([216.32.180.187]
 helo=co1outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1W1RpN-0006eu-Og
 for linux-mtd@lists.infradead.org; Fri, 10 Jan 2014 02:28:06 +0000
Date: Fri, 10 Jan 2014 09:53:13 +0800
From: Huang Shijie <b32955@freescale.com>
To: Bill Pringlemeir <bpringlemeir@nbsps.com>
Subject: Re: [PATCH] mtd: gpmi: fix the bitflips for erased page
Message-ID: <20140110015311.GA24914@shlinux2.ap.freescale.net>
References: <1388784439-23004-1-git-send-email-eliedebrauwer@gmail.com>
 <1389251514-30153-1-git-send-email-b32955@freescale.com>
 <87ppo09avr.fsf@nbsps.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <87ppo09avr.fsf@nbsps.com>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Jan 09, 2014 at 03:08:08PM -0500, Bill Pringlemeir wrote:
> On  9 Jan 2014, b32955 at freescale.com wrote:
> 
> > ---
> > drivers/mtd/nand/gpmi-nand/gpmi-nand.c | 44 ++++++++++++++++++++++++++++++++
> > 1 files changed, 44 insertions(+), 0 deletions(-)
> 
> [snip]
> 
> > +	if (flip_bits < threshold) {
> 
> Isn't it "if (flip_bits <= threshold)"?
thanks. 
I agree the (flip_bits <= threshold) is better.

Huang Shijie
