Received: from 71-19-161-253.dedicated.allstream.net ([71.19.161.253]
 helo=nsa.nbspaymentsolutions.com)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1W1j52-0003VY-3a
 for linux-mtd@lists.infradead.org; Fri, 10 Jan 2014 20:53:24 +0000
From: Bill Pringlemeir <bpringlemeir@nbsps.com>
To: Huang Shijie <b32955@freescale.com>
Subject: HW-ECC and erase detect [was: PATCH V2 fix mtd: gpmi: fix the
 bitflips for erased page]
References: <1389343044-22351-1-git-send-email-b32955@freescale.com>
 <1389343298-22473-1-git-send-email-b32955@freescale.com>
 <87eh4ftyja.fsf@nbsps.com>
Date: Fri, 10 Jan 2014 15:46:20 -0500
In-Reply-To: <87eh4ftyja.fsf@nbsps.com> (Bill Pringlemeir's message of "Fri,
 10 Jan 2014 14:41:29 -0500")
Message-ID: <8738kvimzn.fsf_-_@nbsps.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: linux-mtd@lists.infradead.org, eliedebrauwer@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


[cc trimmed]

> On 10 Jan 2014, b32955@freescale.com wrote:

>> This patch does a check for the uncorrectable failure in the following
>> steps:

On 10 Jan 2014, bpringlemeir@nbsps.com wrote:

> Another driver (which I was patterning off of) is the fsmc_nand.c and
> it's count_written_bits() routine.

> It has an interesting feature to pass the strength to the counting
> routine, so that it aborts early if more than 'strength' zeros are
> encountered.

I think 'fsmc_nand' will not detect the 'all ff data' and ECC failed
condition?  Also, it seems that UBI will write mostly xFF pages when
just an EC page/sub-page is marked, so these type of pages maybe fairly
common in practice.

It certainly would be a nice feature for a hardware ECC which writes to
the OOB data to have an 'erase detect' bit in the ECC status.  I looked
at some other MTD devices and it didn't seem they had to handle this.
Do some controller recognize an erased page and give an ECC status as
ok?

Fwiw,
Bill Pringlemeir.
