Received: from smtp.fh-landshut.de ([193.175.141.50])
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1BIDZA-0003gs-Cm
	for linux-mtd@lists.infradead.org; Mon, 26 Apr 2004 22:23:04 +0100
Received: from fh-landshut.de (sw-gate1.fh-landshut.de [193.175.141.2])
	i3QLN3O27874
	for <linux-mtd@lists.infradead.org>; Mon, 26 Apr 2004 23:23:03 +0200
Message-ID: <408D7DC3.3020002@fh-landshut.de>
Date: Mon, 26 Apr 2004 23:23:15 +0200
From: Oliver Korpilla <okorpil@fh-landshut.de>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Interleaved flash chips - basic understanding question
Reply-To: okorpil@fh-landshut.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello!

I have this 4MB of flash device - a Am29LV800BT on my board.

AMD lists the chips as this:

http://www.amd.com/us-en/FlashMemory/ProductInformation/0,,37_1447_1623_1468%5E1532,00.html

These devices are 16-Bit accessible, mine is 64-bit accessible.

My device is 4 MB = 32 M-Bit = 4 * 8 M-Bit => consists of 4 of these 
chips listed above, I guess.

And the bigger erase regions on the single devices are 64KB, and mine 
are 4*64 KB= 256 KB

If I understand this right, with a serial setup two flash chips simply 
have an address space double as long with the same access width.

My device is interleaved, so if I write a 64-bit date is it actually 
distributed like this - 16 Bit into 1st chip, 16 Bit into 2nd, ... ??? 
And if I erase the 1st region on my device, are then all the 4 first 
regions erased??

Am I understanding this right?

Am I required to access a 64-bit-width interleaved flash in 64-bit wide 
accesses or can I use "smaller" ones (8, 16, 32 bit)??


Now how to configure the device? How can I make it work, if the driver 
seems to be broken (cfi_cmdset_0002.c v 1.62, v 1.93 and v 1.98 don't 
seem to work)? (If I set width in octetts, as configurable in 2.4.25, to 
8 this doesn't even compile, but 4 does)

Thanks in advance,
Oliver Korpilla
