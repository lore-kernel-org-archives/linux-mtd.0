Received: from bes.se.axis.com ([195.60.68.10])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Xnon5-00008d-Be
 for linux-mtd@lists.infradead.org; Mon, 10 Nov 2014 13:13:56 +0000
Date: Mon, 10 Nov 2014 14:13:27 +0100
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: Juergen Borleis <jbe@pengutronix.de>
Subject: Re: [RFC/PATCH 0/5 v2] mtd:ubi: Read disturb and Data retention
 handling
In-Reply-To: <5460B10E.9060501@nod.at>
Message-ID: <alpine.DEB.2.02.1411101404180.23184@lnxricardw1.se.axis.com>
References: <201411101307.03225.jbe@pengutronix.de> <5460B10E.9060501@nod.at>
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-15"
Content-Transfer-Encoding: 8BIT
Cc: Richard Weinberger <richard@nod.at>,
 "jlauruhn@micron.com" <jlauruhn@micron.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "tlinder@codeaurora.org" <tlinder@codeaurora.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Mon, 10 Nov 2014, Richard Weinberger wrote:

> Am 10.11.2014 um 13:07 schrieb Juergen Borleis:
> 
> >
> > I have made some simple test by reading the first 2048 pages of my NAND in an
> > endless loop. Only reading, nothing else (made while the bootloader was run,
> > nothing else touches the NAND memory).
> >
> > Below a result of my test with a 512 MiB SLC NAND with 2kiB page size and
> > 128kiB block size:
> > ...
> >
> > You can see some pages start to suffer from read disturbance after about
> > 7,000 reads and fail after 200,000 reads, other pages start at 23,000 reads
> > but fails at 120,000 reads. There is no rule when a page starts to suffer
> > from read disturbance and how fast. So a simple read counter with a threshhold
> > to detect when to recover a page/block seems not helpful to me.
> >
> > More confusing: the same test running on a 256 MiB NAND shows a different
> > result with much less failures. After about 200,000 loops *all* pages are
> > still okay (or correctable). The max bit flips in one page were four.
> >
> > [...]

These are interesting figures. I must admit I've never seen anything quite 
so bad before.

We use 128 MiB and 256 MiB SLC NAND chips in our products, and as part of 
the device qualification we run a test on a couple of samples where we 
repeatedly read the first four blocks of the flash in an endless loop, and 
measure the number of correctable and uncorrectable errors that occur.

Normally, we can read millions of times before even getting a single bit 
flip. I've currently had a Macronix 128 MiB flash under test, which 
according to the data sheet requires 4-bit ECC, but after 68 million reads 
of the type just mentioned is still performing well with only single-bit 
errors in various places in the test area. (The fact that errors do start 
to occur after a while puts any suspicions of unexpected read caching to 
rest). Admittedly, this is all at room temperature, etc, and only a single 
sample, but it still is quite far from 200 000 reads. Other chips of the 
same sizes that we use which specify 1-bit ECC have a similar performance.

The fact that 512 MiB is worse than 256 MiB is not too surprising, there 
could well be a technology jump between those sizes, with smaller bit 
cells for the larger flash.

> Can you share your test program? I'd like to run it also on one of my boards.

Agreed, it would be interesting to see what the results would be here too.

/Ricard
-- 
Ricard Wolf Wanderlöf                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
