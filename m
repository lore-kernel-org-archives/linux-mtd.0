Received: from mail.free-electrons.com ([62.4.15.54])
 by casper.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1coR20-0008R6-3m
 for linux-mtd@lists.infradead.org; Thu, 16 Mar 2017 08:45:13 +0000
Date: Thu, 16 Mar 2017 09:44:50 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>, Richard Weinberger
 <richard@nod.at>, linux-mtd@lists.infradead.org, David Woodhouse
 <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Marek
 Vasut <marek.vasut@gmail.com>, Cyrille Pitchen <cyrille.pitchen@atmel.com>
Cc: Icenowy Zheng <icenowy@aosc.xyz>, Valdis.Kletnieks@vt.edu, Aleksei
 Mamlin <mamlinav@gmail.com>, Hans de Goede <hdegoede@redhat.com>,
 linux-kernel@vger.kernel.org, Thomas Petazzoni
 <thomas.petazzoni@free-electrons.com>
Subject: Re: [PATCH v6 00/17] mtd: nand: allow vendor specific
 detection/initialization
Message-ID: <20170316094450.6a9e286d@bbrezillon>
In-Reply-To: <1483956264-3335-1-git-send-email-boris.brezillon@free-electrons.com>
References: <1483956264-3335-1-git-send-email-boris.brezillon@free-electrons.com>
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

+Thomas who is currently working on on-die ECC support for a Micron
NAND and is basing his work on this series.

On Mon,  9 Jan 2017 11:04:07 +0100
Boris Brezillon <boris.brezillon@free-electrons.com> wrote:

> Hello,
> 
> I know I said it would be the last round, but I decided to change a few
> things after Marek's review.
> 
> Marek, Richard, I dropped your R-b/A-b tags on "mtd: nand: Add
> manufacturer specific initialization/detection steps" (patch 8) and
> "mtd: nand: Kill the MTD_NAND_IDS Kconfig option" (patch 6) since they
> changed a bit in v6.
> Can you have a look?
> 
> Marek, I did not address your concern regarding the use of the extern
> keyword for struct nand_manufacturer_ops defs. Let me know if this is
> something you really find important, and why. If you have a good reason
> to hide these objects behind an accessor, I might reconsider your
> suggestion.
> 
> This patch series is a step forward in supporting vendor-specific
> functionalities.
> This series is mainly moving vendor-specific initialization or
> detection code out of the core, but also introduces an infrastructure
> allowing support for vendor-specific features.
> 
> While those features might seem useless to most users, some of them are
> actually required on modern MLC/TLC NANDs (this is the case of read-retry
> support, which AFAICT has not been standardized by the JEDEC consortium).
> 
> Now, let's detail what's inside this patch-set.
> 
> Patches 1 to 5 are simple reworks simplifying auto-detection function
> prototypes, and clarifying their purpose.
> 
> Patch 6 is removing the MTD_NAND_IDS Kconfig option to avoid creating
> a nand_ids.ko module when MTD_NAND is enabled as a module. This prevents
> a future cross-dependency between nand.ko where all vendor specific
> code will rely and nand_ids.ko which will reference vendor-specific ops
> in its manufacturer table, which in turn is referenced by the core code
> linked in nand.ko.
> 
> Patch 7 is hiding NAND manufacturer table internals and exposing a
> helper to get a nand_manufacturer object from a manufacturer ID.
> 
> Patch 8 is introducing the vendor-specific initialization
> infrastructure.
> 
> Patches 9 to 14 are moving vendor-specific code into their respective
> nand_<vendor>.c files.
> 
> Patch 15 is taking a patch proposed by Hans and adding support for ECC
> requirements extraction from the samsung extended IDs. It seems to apply
> to all Samsung MLCs, but even if it's not the case, the detection code
> should be improved to support the new formats.
> 
> Patch 16 is adding support for advanced NAND ID decoding to the Hynix
> driver (OOB size, ECC and scrambling requirements extraction). Again
> this detection code might be incomplete, but I'd like people to extend
> it if required rather than adding new full-id entries in the nand_ids
> table.
> 
> And finally, patch 17 is showing how useful this vendor-specific stuff
> can be by implementing read-retry support for Hynix 1x nm MLCs. And
> trust me, you don't want to try using such a NAND without read-retry
> support ;).
> 
> As always, I'm open to any suggestion to improve this vendor-specific
> infrastructure, so please review the code :).

Applied, after fixing the bug reported by Julia.

I might decide to drop these patches if someone reports a regression,
hence the decision to apply them quite early in nand/next.
