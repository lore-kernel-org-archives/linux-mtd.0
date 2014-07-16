Received: from mga11.intel.com ([192.55.52.93])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1X7IM8-0000EK-OD
 for linux-mtd@lists.infradead.org; Wed, 16 Jul 2014 06:06:21 +0000
Message-ID: <1405490755.1829.16.camel@sauron.fi.intel.com>
Subject: Re: Where is the "scrubbing" threshold set in UBI? Can it be easily
 varied?
From: Artem Bityutskiy <dedekind1@gmail.com>
Reply-To: dedekind1@gmail.com
To: Atlant Schmidt <aschmidt@dekaresearch.com>
Date: Wed, 16 Jul 2014 09:05:55 +0300
In-Reply-To: <0A40042D85E7C84DB443060EC44B3FD36D986A2F14@dekaexchange07.deka.local>
References: <0A40042D85E7C84DB443060EC44B3FD36D986A2F14@dekaexchange07.deka.local>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Andrew Coll <acoll@dekaresearch.com>,
 "'linux-mtd@lists.infradead.org'" <linux-mtd@lists.infradead.org>,
 Cale Surgen <csurgen@dekaresearch.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2014-07-03 at 10:07 -0400, Atlant Schmidt wrote:
> Folks:
> 
>   Within the UBI layer, where is the threshold set that
>   determines how many bit-flips must occur on a read
>   before the block is "scrubbed" (stored into another
>   location)?

Are you now talking about the MTD layer, and the amount of bits
corrected by an ECC? In that case, see what Pekon answered. There is a
configurable threshold and MTD won't tell UBI that there were bit-flips
unless the amount of bits corrected in an ECC "step" is greater or
equivalent to the threshold. This is documented.

>   And is this done on a page-by-page basis or on a
>   whole-LEB/PEB basis?

On the MTD/NAND driver level, there is a notion of ECC step. One NAND
page may consist of a single or multiple ECC steps...

UBI has no idea about ECC steps, though. It just schedules a PEB for
scrubbing if it gets -EUNCLEAN from MTD when it reads the PEB.

>  That is, if a single page has
>   more than threshold number of bit flips, will just
>   that page be relocated or will the entire LEB be
>   relocated to another PEB? 

Entire PEB will be copied to another PEB, and the LEB will be re-mapped
from the old PEB to the new PEB, and the old PEB will be erased.

-- 
Best Regards,
Artem Bityutskiy
