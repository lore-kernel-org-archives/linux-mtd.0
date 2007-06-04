Received: from main.gmane.org ([80.91.229.2] helo=ciao.gmane.org)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HvDu9-0006nA-LJ
	for linux-mtd@lists.infradead.org; Mon, 04 Jun 2007 10:52:56 -0400
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1HvDpJ-0003YE-7Q
	for linux-mtd@lists.infradead.org; Mon, 04 Jun 2007 16:46:33 +0200
Received: from cpe.atm2-0-1021162.0x3ef28e62.banxx2.customer.tele.dk
	([62.242.142.98]) by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Mon, 04 Jun 2007 16:46:33 +0200
Received: from martin by cpe.atm2-0-1021162.0x3ef28e62.banxx2.customer.tele.dk
	with local (Gmexim 0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Mon, 04 Jun 2007 16:46:33 +0200
To: linux-mtd@lists.infradead.org
From: Martin Egholm Nielsen <martin@egholm-nielsen.dk>
Subject: Re: [Yaffs1] mkyaffs exits with "MTD Erase failure"
Date: Mon, 04 Jun 2007 16:36:23 +0200
Message-ID: <f41817$vir$1@sea.gmane.org>
References: <f412p4$b20$1@sea.gmane.org>
	<Pine.LNX.4.64.0706041549010.3966@lnxricardw.se.axis.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
In-Reply-To: <Pine.LNX.4.64.0706041549010.3966@lnxricardw.se.axis.com>
Sender: news <news@sea.gmane.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

Ricard Wanderlof wrote:
> On Mon, 4 Jun 2007, Martin Egholm Nielsen wrote:
>> I have run into a problem: By "accident", we changed the die of our
>> NAND without paying attention to the new timing parameters. Hence,
>> the read-operation (with fixed timing!) reported ready before data
>> was actually ready on the NAND. Consequently, this caused checksum 
>> errors, and several blocks was erroneously marked bad!
>> 
>> So, I fixed the timing in the kernel and tried erasing the flash
>> again. But with no luck - mkyaffs refuses to erase/program the
>> flash:

> Mtd refuses to erase blocks that have been marked bad. There is no 
> workaround on a running kernel, but it is possible to patch the
> kernel to do this.

But as you see, flash_eraseall on the same device works perfectly fine:

flash_eraseall /dev/mtd0
....
Skipping bad block at 0x0179c000
Erasing 16 Kibyte @ 1ffc000 -- 99 % complete.


> The patch depends on whether or not you have a flash-based bad block
> table. Most do, but my only experience has been without the
> flash-based BBT. In this case, you simply remove the if clause around
> nand_block_checkbad() in mtd/nand/nand_base:nand_erase_nand(),
> recompile, and use that kernel to erase the blocks that have
> accidentally been marked bad.

I have a kernel with this patch, yes - and it does work. However, then I 
remove the factory-marked ones, as well. Not a good idea!


// Egholm
