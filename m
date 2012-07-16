Received: from co202.xi-lite.net ([149.6.83.202])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1Sqlrb-00009y-NP
 for linux-mtd@lists.infradead.org; Mon, 16 Jul 2012 14:01:38 +0000
Date: Mon, 16 Jul 2012 16:01:21 +0200
From: Ivan Djelic <ivan.djelic@parrot.com>
To: Mike Dunn <mikedunn@newsguy.com>
Subject: Re: [PATCH 8/8] mtd: nand: use ECC, if present, when scanning OOB
Message-ID: <20120716140121.GB9278@parrot.com>
References: <1340408145-24531-1-git-send-email-computersforpeace@gmail.com>
 <1340408145-24531-9-git-send-email-computersforpeace@gmail.com>
 <4FFBDDB0.6010605@parrot.com>
 <CAN8TOE8g9FjgJuj+1RuQx3afaY_Huo29PZBNvXVt2-p17OF_tQ@mail.gmail.com>
 <50032194.9040703@newsguy.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <50032194.9040703@newsguy.com>
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

On Sun, Jul 15, 2012 at 10:01:24PM +0200, Mike Dunn wrote:
> On 07/13/2012 10:39 AM, Brian Norris wrote:
> > 
> > I have an out-of-tree driver that corrects OOB bitflips. Is there
> > really no other HW out there that corrects OOB errors?
> 
> 
> The diskonchip g3 and g4 devices use a hw-generated hamming byte to protect the
> first eight oob bytes (those not used for page data ecc) with ecc of one bit
> strength, but neither driver implements the correcting algorithm yet.
> 
> 
> > 
> > Anyway, I understand that my driver is an outlier here, but I don't
> > see a real disadvantage in these changes. But on the positive side, I
> > expect that in the future, more drivers/HW will either want to stop
> > using OOB for anything at all or will want ECC protection for OOB.
> > 
> >> This can also work when nand_do_read_ops is used (ops->datbuf != NULL). But it
> >> is hard to see case where it can correct bit flip in bad block marker. Do you
> >> have any exemple ?
> > 
> > First of all, this has no effect if the driver does not protect OOB
> > with ECC (i.e., for OOB-only reads, MTD_OPS_PLACE_OOB == MTD_OPS_RAW).
> > So the following argument only applies when OOB is ECC-protected.
> > 
> > Consider a *good* block that is written with filesystem data. On
> > bootup, Linux may scan this block's BBM to check if it is bad. If a
> > bitflip occurs in the bad block marker, then it may be erroneously
> > considered bad.
> 
> 
> Yeah, this is a strong argument for ecc on oob-only reads.

Hello Mike,

I think it is a strong argument for a robust reading of BBM, rather than an argument
for ECC on OOB-only reads. By "robust reading", I mean simply looking at the Hamming weight of the
marker (the number of 1s in the BBM) rather than its value, as done in nand_block_bad() by setting chip->badblockbits.

This robust reading is trivially implemented, does not depend on OOB ecc availability,
and benefits all drivers. Even if your driver implements OOB ECC, it may not work
on an erased block with a bitflip in its BBM (because erased data may not have a valid
ECC). Moreover, reading just the OOB region with ECC may require a full page read on some drivers
(when OOB and data are parts of the same codeword).

To me, the only strong reason for wanting OOB ECC is the implementation of YAFFS2 or similar filesystems
which require OOB metadata protection. But maybe I'm missing some other use cases ?

What do you think ?

BR,
-- 
Ivan
