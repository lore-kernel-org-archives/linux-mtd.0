Received: from 213-239-205-147.clients.your-server.de ([213.239.205.147]
	helo=mail.tglx.de)
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1FITfa-0002fQ-2o
	for linux-mtd@lists.infradead.org; Sun, 12 Mar 2006 11:43:54 -0500
From: Thomas Gleixner <tglx@linutronix.de>
To: "Alexey, Korolev" <alexey.korolev@intel.com>
In-Reply-To: <44072B84.9040803@intel.com>
References: <1140437503.2480.711.camel@localhost.localdomain>
	<44072B84.9040803@intel.com>
Content-Type: text/plain
Date: Sun, 12 Mar 2006 17:44:10 +0100
Message-Id: <1142181850.19916.507.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: [PATCH] Fixup in NAND bad block management + fix
	ofmisspring.(nand_base.c)
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2006-03-02 at 20:29 +0300, Alexey, Korolev wrote:
> > When the ST chips have the bad block pos at offset 0 in general then we
> > want a generic solution which fixes up the nand_scan_bbt code as well
> > instead of requiring a seperate board driver supplied badblock_pattern.
> >
> Generic solution would be great. 

Yes. And no other solution will make it into the kernel. Board level
fixes for chip level problems are not acceptable.

> But this solution will require 
> inforamtion about BB positioning for all chips.
> At present time I don't have info about BB positioning for all chips. I 
> wonder if BB positioning is somehow standardized?

Yes it is. And according to the ST datasheet it is simply at offset 0x05
for 8 bit devices and offset 0x00 for 16 bit devices.

> I'm not sure that it will be possible to avoid board driver supplied 
> badblock_patterns at all.

Fixup the offsets in nand_scan and tweak nand_bbt_default. Again this is
a chip problem not a board problem. Chips are handled by the generic
nand_base and nand_bbt code to avoid code duplication all over the
place.

>  > And you believe that your patch is the only way to solve that trivial
>  > problem ?
> 
> Imo the latest nand_base code has some inconsistence.
> If mem based BBT is used, this case Bad block scanning is based on data 
> from bad block pattern, but writing is based on data of badblockpos 
> variable.

Well, thats true, but this can be fixed with two lines of code.

> I guess it's not good to have two variables responsible for one thing if 
> they are used at the same time. Moreover this code doesn't work if 
> somebody specified BB pattern different from default.
> My patch resolves this inconsistence, logically it works rather clear 
> a) if pattern is specified we will use pattern for both read and write.
> b) if not we will use the "badblockpos" variable.
> I'd like to know do you have any objections to the patch? IMO it should 
> not break anything. But it resolves the described inconsistence.
> 
> > Your patch is bogus anyway, as the else path will _NEVER_ be executed.
> > this->badblock_pattern is never NULL.
> >
> That is incorrect. This->badblock_pattern can be NULL.  According to the 
> nand_base code if NAND_SKIP_BBTSCAN option is given and pattern is not 
> defined in low level driver the nand_scan_bbt function will not be 
> executed and no code will define badblock_pattern.

Did not think about this weird scenario as I never imagined a usecase.
It still does not need all that hacks. A simple fixup of badblockpos is
enough.

	tglx
