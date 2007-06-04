Received: from main.gmane.org ([80.91.229.2] helo=ciao.gmane.org)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HvCH5-0003Al-RJ
	for linux-mtd@lists.infradead.org; Mon, 04 Jun 2007 09:07:09 -0400
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1HvCGu-0007Of-88
	for linux-mtd@lists.infradead.org; Mon, 04 Jun 2007 15:06:56 +0200
Received: from cpe.atm2-0-1021162.0x3ef28e62.banxx2.customer.tele.dk
	([62.242.142.98]) by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Mon, 04 Jun 2007 15:06:56 +0200
Received: from martin by cpe.atm2-0-1021162.0x3ef28e62.banxx2.customer.tele.dk
	with local (Gmexim 0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Mon, 04 Jun 2007 15:06:56 +0200
To: linux-mtd@lists.infradead.org
From: Martin Egholm Nielsen <martin@egholm-nielsen.dk>
Subject: [Yaffs1] mkyaffs exits with "MTD Erase failure"
Date: Mon, 04 Jun 2007 15:06:44 +0200
Message-ID: <f412p4$b20$1@sea.gmane.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
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

I have run into a problem: By "accident", we changed the die of our NAND 
  without paying attention to the new timing parameters.
Hence, the read-operation (with fixed timing!) reported ready before 
data was actually ready on the NAND. Consequently, this caused checksum 
errors, and several blocks was erroneously marked bad!

So, I fixed the timing in the kernel and tried erasing the flash again. 
But with no luck - mkyaffs refuses to erase/program the flash:

# flash_eraseall /dev/mtd0
....
Skipping bad block at 0x0179c000
Erasing 16 Kibyte @ 1ffc000 -- 99 % complete.
# mkyaffs -e /dev/mtd0
argc 3 sh 0 optcnt 2
Erasing and programming NAND
Erasing block at 0x080
Erasing block at 0x084000
...
Erasing block at 0x0874000
nand_erase: attempt to erase a bad block at page 0x000004e0

Erasing block at 0x087c000
...
Erasing block at 0x089c000

MTD Erase failure
: Input/output error
#


And then my question - why do I get the I/O error?

BR,
  Martin Egholm
