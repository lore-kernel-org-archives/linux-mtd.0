Received: from petasus.ims.intel.com ([62.118.80.130])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1FErcX-0000ir-KG
	for linux-mtd@lists.infradead.org; Thu, 02 Mar 2006 12:29:50 -0500
Message-ID: <44072B84.9040803@intel.com>
Date: Thu, 02 Mar 2006 20:29:40 +0300
From: "Alexey, Korolev" <alexey.korolev@intel.com>
MIME-Version: 1.0
To: tglx@linutronix.de, linux-mtd@lists.infradead.org
References: <1140437503.2480.711.camel@localhost.localdomain>
In-Reply-To: <1140437503.2480.711.camel@localhost.localdomain>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: 
Subject: Re: [PATCH] Fixup in NAND bad block management + fix
	ofmisspring.(nand_base.c)
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Thomas,

> Without thinking too much about the problem, there _are_ at least two
> sane places to fix that.
>
> 1. nand_scan() can handle this based on chip id and/or manufacturer id
> 2. nand_scan_bbt() can do the fixup as well
>
> When the ST chips have the bad block pos at offset 0 in general then we
> want a generic solution which fixes up the nand_scan_bbt code as well
> instead of requiring a seperate board driver supplied badblock_pattern.
>
Generic solution would be great. But this solution will require 
inforamtion about BB positioning for all chips.
At present time I don't have info about BB positioning for all chips. I 
wonder if BB positioning is somehow standardized?
I'm not sure that it will be possible to avoid board driver supplied 
badblock_patterns at all.

 > And you believe that your patch is the only way to solve that trivial
 > problem ?

Imo the latest nand_base code has some inconsistence.
If mem based BBT is used, this case Bad block scanning is based on data 
from bad block pattern, but writing is based on data of badblockpos 
variable.
I guess it's not good to have two variables responsible for one thing if 
they are used at the same time. Moreover this code doesn't work if 
somebody specified BB pattern different from default.
My patch resolves this inconsistence, logically it works rather clear 
a) if pattern is specified we will use pattern for both read and write.
b) if not we will use the "badblockpos" variable.
I'd like to know do you have any objections to the patch? IMO it should 
not break anything. But it resolves the described inconsistence.

> Your patch is bogus anyway, as the else path will _NEVER_ be executed.
> this->badblock_pattern is never NULL.
>
That is incorrect. This->badblock_pattern can be NULL.  According to the 
nand_base code if NAND_SKIP_BBTSCAN option is given and pattern is not 
defined in low level driver the nand_scan_bbt function will not be 
executed and no code will define badblock_pattern.

Thanks,
Alexey
