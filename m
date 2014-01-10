Received: from 71-19-161-253.dedicated.allstream.net ([71.19.161.253]
 helo=nsa.nbspaymentsolutions.com)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1W1i4L-0001xq-Qd
 for linux-mtd@lists.infradead.org; Fri, 10 Jan 2014 19:48:38 +0000
From: Bill Pringlemeir <bpringlemeir@nbsps.com>
To: Huang Shijie <b32955@freescale.com>
Subject: Re: [PATCH V2 fix] mtd: gpmi: fix the bitflips for erased page
References: <1389343044-22351-1-git-send-email-b32955@freescale.com>
 <1389343298-22473-1-git-send-email-b32955@freescale.com>
Date: Fri, 10 Jan 2014 14:41:29 -0500
Message-ID: <87eh4ftyja.fsf@nbsps.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
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

On 10 Jan 2014, b32955@freescale.com wrote:

> This patch does a check for the uncorrectable failure in the following
> steps:

> [0] set the threshold.  The threshold is set based on the truth: "A
> single 0 bit will lead to gf_len(13 or 14) bits 0 after the BCH do the
> ECC."

> For the sake of safe, we will set the threshold with half the gf_len,
> and do not make it bigger the ECC strength.

> [1] count the bitflips of the current ECC chunk, assume it is N.

> [2] if the (N <= threshold) is true, we continue to read out the page
> with ECC disabled. and we count the bitflips again, assume it is N2.

> [3] if the (N2 <= threshold) is true again, we can regard this is a
> erased page. This is because a real erased page is full of 0xFF(maybe
> also has several bitflips), while a page contains the 0xFF data will
> definitely has many bitflips in the ECC parity area.

> [4] if the [3] fails, we can regard this is a page filled with the
> '0xFF' data.

Sorry, I am a slow thinker.  Why do we bother with steps 0-2 at all?
Why not just read the page without ECC on an un-correctable error.
Another driver (which I was patterning off of) is the fsmc_nand.c and
it's count_written_bits() routine.

It has an interesting feature to pass the strength to the counting
routine, so that it aborts early if more than 'strength' zeros are
encountered.  If you remove steps 0-2, I think you end up with the same
results and just the code size and run time change.  For your cases,

 1) Erased NAND sector, it will be much faster.
 2) Un-correctable all xff it will be,
    a) just as fast for errors just above strength.
    b) slower for many errors.
 3) A read error with non-ff data.  Benefits from early abort due to
     strength exceeded.  Will be slower if step 0-2 omitted.

The case 2b should never happen for a properly functioning system.  If a
block has such a bad sector, it should be in the BB.  I guess checking
the ECCed data is of benefit for case 3.  However, the most common case
should be 1, an erased sector.  It will be common during UBI scanning on
boot up for instance.  2a and 3 are actually the same case with different
page data.

For certain, the short-circuit is a benefit if you leave the loop on the
ECCed data.  I think that the cases of permanent errors will be more
common that read errors that repair by re-writing data/migrating data.
So, I think that the probability is,

  1) Erased page
  2) Program error (just above strength)
  3) Read failure (just above strength).
  4) Errors far above strength (maybe impossible).

For the items 2,3 these will be migrated to the bad blocks so maybe they
are the same to us.  I think that as Elie noted, the erased page is the
really common item.  Wouldn't it be best to optimize for that?  Skipping
the first check also makes the run time for xFF and non-FF data closer
depending on an early abort of 'thresh' exceeded.

Thanks for some interesting code.

Bill Pringlemeir.
