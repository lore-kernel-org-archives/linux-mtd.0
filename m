Received: from thorgal.et.tudelft.nl ([130.161.40.91])
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1Aw36j-0000MS-Q6
	for linux-mtd@lists.infradead.org; Wed, 25 Feb 2004 17:46:05 +0000
Mime-Version: 1.0
Message-Id: <a06002001bc6281361918@[130.161.115.44]>
Date: Wed, 25 Feb 2004 18:44:48 +0100
To: linux-mtd@lists.infradead.org
From: "J.D. Bakker" <bakker@thorgal.et.tudelft.nl>
Content-Type: text/plain; charset="us-ascii" ; format="flowed"
Subject: Handling multiple NAND chips -- take 2
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

[Recap: I started a thread on handling multi-NANDs on July 25th last 
year. The consensus then was that it Could Be Done, and CVS is 
halfway there (mostly wrt the chip numbers in the read/write/etc 
functions in nand.c). So now I have a board with a driver (which I'll 
happily submit if anyone wants it); all eight chips are detected on 
startup, and yaffs over mtd works just fine for the single chip 
scenario. Time to get the other seven to earn their pay]


Hi all,

I'd like to add support for multiple NAND chips to 
drivers/mtd/nand/nand.c . I have gone over the current code (and the 
docs on the website), but I'd like to check some assumptions before I 
start coding (and possibly make a major fool of myself).

This is the plan; fire at will.

* Assumption: all devices are the same type and size.
* No support (yet) for building a wider data bus through putting 
multiple devices in parallel
* All detected devices are concatenated and represented as one large 
linear array of pages
* All devices are soldered to a motherboard. We are not interested in 
taking devices out of the array.
* No optimizations (yet) wrt accessing device n while device m is 
busy. Easier to get working code fast than to get fast code working, 
and I don't see a way to take advantage of parallelism without 
modifying higher layers


The general idea is to take a 'global' page_addr and turn it into a 
(chip,page) tuple like this:

chip = global_page_addr / pages_per_chip;
page = global_page_addr % pages_per_chip;

Does that look sane ?

JDB


[actually, I might end up implementing it the other way around, ie:

chip = global_page_addr % number_of_chips;
page = global_page_addr / number_of_chips;

Advantages: (1) higher likelihood of usable parallelism later on due 
to data locality, and (2) since number_of_chips will be << 
number_of_pages, the divide may end up cheaper, especially if I were 
to cheat and specify that number_of_chips must be a power of two. But 
that's starting to sound like premature optimizations...]
-- 
LART. 250 MIPS under one Watt. Free hardware design files.
http://www.lart.tudelft.nl/
