Received: from mga14.intel.com ([143.182.124.37])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UhakI-0006WW-Lo
 for linux-mtd@lists.infradead.org; Wed, 29 May 2013 07:24:31 +0000
Message-ID: <1369812433.5446.226.camel@sauron.fi.intel.com>
Subject: Re: UBI torture_peb() bad block detection problem
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Qiang Yu <yuq825@gmail.com>
Date: Wed, 29 May 2013 10:27:13 +0300
In-Reply-To: <CAKGbVbtp4FBauCFNGSPTQSk_Dz4ELa7Gn31UByTMaFSk_vF1eg@mail.gmail.com>
References: <CAKGbVbtp4FBauCFNGSPTQSk_Dz4ELa7Gn31UByTMaFSk_vF1eg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, 2013-04-27 at 21:57 +0800, Qiang Yu wrote:
> Hi guys,
> 
> I'm writing MTD driver for Allwinner A10 nand controller. Now there is
> a problem with the UBI torture_peb() function. From the code and UBI
> doc, a PEB will be treated as bad when read with bit-flip after erase.

The assumption that the MTD driver covers empty ereaseblocks with ECC,
so the erased areas are also protected. And the driver reports bit-flips
only if the amount of bits flipped is above the "safe" threshold, see
'mtd_read()':

return ret_code >= mtd->bitflip_threshold ? -EUCLEAN : 0;

So, your driver tells UBI: hey, this area has a dangeours amount of
bit-flips. And UBI knows that it just erased it, so the reaction is -
let me assume it is bad.

So you should invent something in your driver to make it protect empty
NAND pages. Try to google, there were discussions about this.

> But with SAMSUNG K9GBG08U0A flash chip, sometimes the bit-flip does
> happen even after being erased.

The assumption is that it should be corrected by ECC. -EUCLEAN should
not be reported if it is harmless. It should only be reported if there
are too many bit-flips.

-- 
Best Regards,
Artem Bityutskiy
