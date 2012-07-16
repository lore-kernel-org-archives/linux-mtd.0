Received: from co202.xi-lite.net ([149.6.83.202])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1Sqsvi-0007b0-Sz
 for linux-mtd@lists.infradead.org; Mon, 16 Jul 2012 21:34:14 +0000
Date: Mon, 16 Jul 2012 23:34:02 +0200
From: Ivan Djelic <ivan.djelic@parrot.com>
To: Mike Dunn <mikedunn@newsguy.com>
Subject: Re: [PATCH 8/8] mtd: nand: use ECC, if present, when scanning OOB
Message-ID: <20120716213402.GB10244@parrot.com>
References: <1340408145-24531-1-git-send-email-computersforpeace@gmail.com>
 <1340408145-24531-9-git-send-email-computersforpeace@gmail.com>
 <4FFBDDB0.6010605@parrot.com>
 <CAN8TOE8g9FjgJuj+1RuQx3afaY_Huo29PZBNvXVt2-p17OF_tQ@mail.gmail.com>
 <50032194.9040703@newsguy.com> <20120716140121.GB9278@parrot.com>
 <50045F48.6050702@newsguy.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <50045F48.6050702@newsguy.com>
Cc: Artem Bityutskiy <dedekind1@gmail.com>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Matthieu Castet <matthieu.castet@parrot.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Shmulik Ladkani <shmulik.ladkani@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Jul 16, 2012 at 08:36:56PM +0200, Mike Dunn wrote:
> Hi Ivan, thanks again for the comments.
> 
> On 07/16/2012 07:01 AM, Ivan Djelic wrote:
> > On Sun, Jul 15, 2012 at 10:01:24PM +0200, Mike Dunn wrote:
> >
> >> Yeah, this is a strong argument for ecc on oob-only reads.
> > 
> > Hello Mike,
> > 
> > I think it is a strong argument for a robust reading of BBM, rather than an argument
> > for ECC on OOB-only reads. By "robust reading", I mean simply looking at the Hamming weight of the
> > marker (the number of 1s in the BBM) rather than its value, as done in nand_block_bad() by setting chip->badblockbits.
> > 
> > This robust reading is trivially implemented, does not depend on OOB ecc availability,
> > and benefits all drivers. Even if your driver implements OOB ECC, it may not work
> > on an erased block with a bitflip in its BBM (because erased data may not have a valid
> > ECC). 
> 
> 
> This is a certainty, no?  Erased, by definition, includes any ecc bytes.

If you add the right polynomial[1] to your Hamming or BCH code, then you can make
sure the ECC of an erased page (possibly with OOB bytes) is actually a sequence of 0xff bytes.
This trick enables bitflip correction on data that has never been programmed.
Take a look at nand_ecc.c:63 (or nand_bch.c:62) for an example.
This trick is not possible on all hardware ECC engines.
 
> 
> > Moreover, reading just the OOB region with ECC may require a full page read on some drivers
> > (when OOB and data are parts of the same codeword).
> > 
> > To me, the only strong reason for wanting OOB ECC is the implementation of YAFFS2 or similar filesystems
> > which require OOB metadata protection. But maybe I'm missing some other use cases ?
> > 
> > What do you think ?
> 
> 
> If we assume the oob bytes on the first page of a good block can contain
> anything, won't simply counting the bits make the risk of falsly identifying a
> bb marker unacceptably high?

Counting bits on a BBM marker byte basically gives a 4-bitflip protection on a _single_ byte, which is
*extremely* unlikely. If you assume an erased good block can contain garbage in its OOB region, then
it can indeed be wrongly identified as a bad block; but this is also true if you use OOB ECC
(e.g. exceeding correction capacity).
In practice, since the bad block marker byte is normally never programmed to anything other than 0xff,
there is no reason why we should find garbage in it (even if a power failure occurs during an
erase/program operation).
BR,

-- 
Ivan

[1] this polynomial is simply the inverted ecc of an erased ecc block
