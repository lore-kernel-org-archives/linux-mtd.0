Received: from outmail1.freedom2surf.net ([194.106.33.237]
	helo=outmail.freedom2surf.net)
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1BwVXD-00050j-Tz
	for linux-mtd@lists.infradead.org; Sun, 15 Aug 2004 20:39:38 -0400
Received: from wirenth (i-195-137-81-187.freedom2surf.net [195.137.81.187])
	by outmail.freedom2surf.net (8.12.10/8.12.10) with SMTP id
	i7G0dYnF005802
	for <linux-mtd@lists.infradead.org>; Mon, 16 Aug 2004 01:39:34 +0100
Date: Mon, 16 Aug 2004 01:39:33 +0100
From: Ian Molton <spyro@f2s.com>
To: linux-mtd@lists.infradead.org
Message-Id: <20040816013933.163a101d.spyro@f2s.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Subject: Support of stupid devices
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi.

Im porting linux to the toshiba e7xx and 8xx PDAs which contain a nand flash controller.

Im not certain, but it appears the controllerhas an odd quirk meaning byte-reads of the data register dont work as the linux mtd code expects.

AFAICT if I read a word (after issuing a chipid command) I get:

0xYYZZ75ec   -- this is good - Samsung, 32MB device.

if I do two byte reads I get 0xec 0xec.

a halfword access gets me 0xYYZZ.

a misaligned (by one byte) word access gives me 0xecYYZZ75, but this fails to work for byte accesses. halfword misaligned accesses are just weird.

so basically, the only way to read the chipid is to do:

a word access to the data reg and then shift the data out

or

a word access (and mask off the high 3 bytes followed by a misaligned word access and mask off the upper 3 bytes.

clearly the former solution is the better one, but this doesnt fit in the nand driver model very well (read_byte() et.al.)

the chip is a TC6393XB (system on chip) and the flash is a samsung K9F5608UOC YCBO
