Received: from thorgal.et.tudelft.nl ([130.161.40.91])
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1Aw4pH-0001I4-3H
	for linux-mtd@lists.infradead.org; Wed, 25 Feb 2004 19:36:11 +0000
Mime-Version: 1.0
Message-Id: <a06002005bc62a78212ec@[130.161.115.44]>
In-Reply-To: <Pine.LNX.4.58.0402251827300.29757@hex>
References: <a06002001bc6281361918@[130.161.115.44]>
 <1077731948.7826.792.camel@hades.cambridge.redhat.com>
 <Pine.LNX.4.58.0402251827300.29757@hex>
Date: Wed, 25 Feb 2004 20:35:51 +0100
To: jasmine@linuxgrrls.org
From: "J.D. Bakker" <bakker@thorgal.et.tudelft.nl>
Content-Type: text/plain; charset="us-ascii" ; format="flowed"
cc: linux-mtd@lists.infradead.org
Subject: Re: Handling multiple NAND chips -- take 2
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

At 6:29 PM +0000 25/2/04, jasmine@linuxgrrls.org wrote:
>  > I think that's acceptable. It's _definitely_ OK on NOR. On NAND we may
>>  be sharing some control lines between different chips, but I still think
>>  it's OK and we can deal with that in the board-level driver.
>
>What if you have a board with an onboard NAND (for the OS) and a
>SmartMedia slot?  That's surprisingly common.  It's very difficult to buy
>consistent Smartmedia cards, too-  they often have different parts in
>them during a run.

That's true, but would you want the SmartMedia card to be part of the 
linear array ? What I'm doing here is to do for NAND devices what the 
linear (or possibly RAID0) driver does for disks. In both cases is 
the array size/configuration fixed on creation, in neither case will 
you have anything useful/usable when one of the components goes away.

It could well make sense to treat the (hot-plugged) SM card as a 
separate entity, with its own partitions and all. This, however, is 
not what I'm trying to achieve. What I want is the reverse, deal with 
multiple NAND chips as if they were one, larger, NAND device. I can't 
see how hot-plugging et al would be useful in such a scenario (but 
I'm open to any and all demonstrations of the narrow-mindedness of 
such an approach).

>  > > chip = global_page_addr / pages_per_chip;
>>  > page = global_page_addr % pages_per_chip;
>>
>>  I think so. I prefer it to the other.
>
>divide not shift?

I'd gladly shift if anyone can guarantee that pages_per_chip is a 
power of two, for all present, past and future NAND devices. 
Seriously, I don't know NAND well enough to know if this is true or 
not.

JDB.
-- 
Jan-Derk Bakker, bakker@mmc.et.tudelft.nl

The lazy man's proverb:
     'There's no business like slow business !'
