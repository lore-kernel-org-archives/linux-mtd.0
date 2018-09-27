Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g5S6l-0002nR-7q
 for linux-mtd@lists.infradead.org; Thu, 27 Sep 2018 08:57:21 +0000
Date: Thu, 27 Sep 2018 10:56:30 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Daniel Mack <daniel@zonque.org>, linux-mtd@lists.infradead.org,
 chris.packham@alliedtelesis.co.nz, stable@vger.kernel.org
Subject: Re: [PATCH v2] mtd: rawnand: marvell: check for RDY bits after
 enabling the IRQ
Message-ID: <20180927105630.19fc1ff8@bbrezillon>
In-Reply-To: <20180927101145.4c2d1159@xps13>
References: <20180927071751.21513-1-daniel@zonque.org>
 <20180927101145.4c2d1159@xps13>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 27 Sep 2018 10:11:45 +0200
Miquel Raynal <miquel.raynal@bootlin.com> wrote:

> Hi Daniel,
> 
> Daniel Mack <daniel@zonque.org> wrote on Thu, 27 Sep 2018 09:17:51
> +0200:
> 
> > At least on PXA3xx platforms, enabling RDY interrupts in the NDCR register
> > will only cause the IRQ to latch when the RDY lanes are changing, and not
> > in case they are already asserted.
> > 
> > This means that if the controller finished the command in flight before
> > marvell_nfc_wait_op() is called, that function will wait for a change in
> > the bit that can't ever happen as it is already set.
> > 
> > To address this race, check for the RDY bits after the IRQ was enabled,
> > and complete the completion immediately if the condition is already met.
> > 
> > This fixes a bug that was observed with a NAND chip that holds a UBIFS
> > parition on which file system stress tests were executed. When
> > marvell_nfc_wait_op() reports an error, UBI/UBIFS will eventually mount
> > the filesystem read-only, reporting lots of warnings along the way.
> > 
> > Fixes: 02f26ecf8c77 mtd: nand: add reworked Marvell NAND controller driver
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Daniel Mack <daniel@zonque.org>
> > ---  
> 
> Sorry I haven't had the time to check on my Armada, but you figured it
> out, and the fix looks good to me!
> 
> Acked-by: Miquel Raynal <miquel.raynal@bootlin.com>
> 
> Boris, do you plan to send another fixes PR of can I take it into
> the nand/next branch?

Queued to mtd/master.

Thanks,

Boris
