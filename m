Received: from am1ehsobe002.messaging.microsoft.com ([213.199.154.205]
 helo=am1outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1W2XXl-0002hT-Dn
 for linux-mtd@lists.infradead.org; Mon, 13 Jan 2014 02:46:26 +0000
Date: Mon, 13 Jan 2014 10:10:54 +0800
From: Huang Shijie <b32955@freescale.com>
To: Bill Pringlemeir <bpringlemeir@nbsps.com>
Subject: Re: [PATCH V2 fix] mtd: gpmi: fix the bitflips for erased page
Message-ID: <20140113021052.GA17069@shlinux2.ap.freescale.net>
References: <1389343044-22351-1-git-send-email-b32955@freescale.com>
 <1389343298-22473-1-git-send-email-b32955@freescale.com>
 <87eh4ftyja.fsf@nbsps.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <87eh4ftyja.fsf@nbsps.com>
Cc: Vikram.Narayanan@in.bosch.com, eliedebrauwer@gmail.com,
 computersforpeace@gmail.com, dwmw2@infradead.org,
 linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Jan 10, 2014 at 02:41:29PM -0500, Bill Pringlemeir wrote:
> On 10 Jan 2014, b32955@freescale.com wrote:
> 
> > This patch does a check for the uncorrectable failure in the following
> > steps:
> 
> > [0] set the threshold.  The threshold is set based on the truth: "A
> > single 0 bit will lead to gf_len(13 or 14) bits 0 after the BCH do the
> > ECC."
> 
> > For the sake of safe, we will set the threshold with half the gf_len,
> > and do not make it bigger the ECC strength.
> 
> > [1] count the bitflips of the current ECC chunk, assume it is N.
> 
> > [2] if the (N <= threshold) is true, we continue to read out the page
> > with ECC disabled. and we count the bitflips again, assume it is N2.
> 
> > [3] if the (N2 <= threshold) is true again, we can regard this is a
> > erased page. This is because a real erased page is full of 0xFF(maybe
> > also has several bitflips), while a page contains the 0xFF data will
> > definitely has many bitflips in the ECC parity area.
> 
> > [4] if the [3] fails, we can regard this is a page filled with the
> > '0xFF' data.
> 
> Sorry, I am a slow thinker.  Why do we bother with steps 0-2 at all?
> Why not just read the page without ECC on an un-correctable error.
Nearly all the nand chips (<19nm) have the read-retry feature.

The steps 0-2 is for the read-retry shortcut.
If we remove steps 0-2, the read-retry will have to read out the buffer
with ECC disabled for each times the uncorrectable error occur, it will
slower the READ-Retry. :)

Most of the read-retry may need 8 times ECC reads or even more. So we'd
better keep the steps 0-2.

> Another driver (which I was patterning off of) is the fsmc_nand.c and
> it's count_written_bits() routine.
I think it is okay to add the similar shortcut code for steps 0-2.
I will add it in the next version.

thanks
Huang Shijie
