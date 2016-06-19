Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1bEYBt-0000OO-6U
 for linux-mtd@lists.infradead.org; Sun, 19 Jun 2016 08:34:50 +0000
Date: Sun, 19 Jun 2016 10:34:24 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Richard Weinberger <richard@nod.at>
Cc: David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org, Hans de Goede
 <hdegoede@redhat.com>, linux-kernel@vger.kernel.org, Aleksei Mamlin
 <mamlinav@gmail.com>
Subject: Re: [PATCH v2 00/15] mtd: nand: allow vendor specific
 detection/initialization
Message-ID: <20160619103424.0b8b77ac@bbrezillon>
In-Reply-To: <5765C6A6.3070206@nod.at>
References: <1465390849-13199-1-git-send-email-boris.brezillon@free-electrons.com>
 <5765C6A6.3070206@nod.at>
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

On Sun, 19 Jun 2016 00:09:42 +0200
Richard Weinberger <richard@nod.at> wrote:

> Am 08.06.2016 um 15:00 schrieb Boris Brezillon:
> > Hello,
> > 
> > This patch series is a step forward in supporting vendor-specific
> > functionalities.
> > This series is mainly moving vendor-specific initialization or
> > detection code out of the core, but also introduces an infrastructure
> > allowing support for vendor-specific features.
> > 
> > While those features might seem useless to most users, some of them are
> > actually required on modern MLC/TLC NANDs (this is the case of read-retry
> > support, which AFAICT has not been standardized by the JEDEC consortium).
> > 
> > Now, let's detail what's inside this patch-set.
> > 
> > Patches 1 to 4 are simple reworks simplifying auto-detection function
> > prototypes, and clarifying their purpose.
> > 
> > Patch 5 is introducing the vendor-specific initialization
> > infrastructure.
> > 
> > Patch 6 is removing the MTD_NAND_IDS Kconfig option to avoid creating
> > a nand_ids.ko module when MTD_NAND is enabled as a module. This prevents
> > a future cross-dependency between nand.ko where all vendor specific
> > code will rely and nand_ids.ko which will reference vendor-specific ops
> > in its manufacturer table, which in turn is referenced by the core code
> > linked in nand.ko.
> > 
> > Patches 7 to 12 are moving vendor-specific code into their respective
> > nand_<vendor>.c files.
> > 
> > Patch 13 is taking a patch proposed by Hans and adding support for ECC
> > requirements extraction from the samsung extended IDs. It seems to apply
> > to all Samsung MLCs, but even if it's not the case, the detection code
> > should be improved to support the new formats.
> > 
> > Patch 14 is adding support for advanced NAND ID decoding to the Hynix
> > driver (OOB size, ECC and scrambling requirements extraction). Again
> > this detection code might be incomplete, but I'd like people to extend
> > it if required rather than adding new full-id entries in the nand_ids
> > table.
> > 
> > And finally, patch 15 is showing how useful this vendor-specific stuff
> > can be by implementing read-retry support for Hynix 1x nm MLCs. And
> > trust me, you don't want to try using such a NAND without read-retry
> > support ;).
> > 
> > As always, I'm open to any suggestion to improve this vendor-specific
> > infrastructure, so please review the code :).  
> 
> Series looks good to me. :-)
> 
> BTW: I wonder whether this work can also be used to support
> Micron On-Die-ECC and Toshiba BENAND in a proper way.

Hehe, I was almost sure someone would ask this question, and yes this
infrastructure would partly solve the problem, but this would still
require patching NAND controller drivers.

Here are the aspects I can remember (there might be others):

1/ Some drivers are just supporting a limited set of NAND operations in
   their ->cmdfunc() implementation, which means they're unlikely to
   support the private ENABLE/DISABLE_ECC commands.
2/ We'd have to add a new ECC mode (NAND_ECC_ON_DIE?), and patch NAND
   controller drivers to not blindly set NAND_ECC_HW.
3/ NAND controller drivers should not change any of the chip->ecc.xxx
   fields if NAND_ECC_ON_DIE has been selected.

So, nothing impossible here, but this clearly requires some work.
Moreover, I'm planning to rework this whole ECC thing at some point, to
let the core select the mode (and appropriate implementation) instead of
leaving this responsibility to the NAND controller driver. Note that
this should not dissuade you from adding on-die ECC support before this
change, I'm just sharing my plans.
