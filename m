Received: from wproxy.gmail.com ([64.233.184.196])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1FB7za-0004z7-Tu
	for linux-mtd@lists.infradead.org; Mon, 20 Feb 2006 05:10:09 -0500
Received: by wproxy.gmail.com with SMTP id i6so579397wra
	for <linux-mtd@lists.infradead.org>;
	Mon, 20 Feb 2006 02:10:04 -0800 (PST)
Message-ID: <c56937870602200210i2e35c47bk3285228e2babb02c@mail.gmail.com>
Date: Mon, 20 Feb 2006 15:40:04 +0530
From: "Santhosh N" <san.mlists@gmail.com>
To: linux-mtd@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Subject: Nand flash problem
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi All,

I am facing a problem in reading the NAND flash chip on our board.

I have PXA255 based board having NAND flash(Samsung K9F5608U0B, 32MiB
8-bit pagesize-512). I am trying to boot linux kernel 2.6.14 on it. I
have written a board based driver for the NAND flash.
After booting, the kernel throws out the messages "Bad eraseblock
<num> at <addr>" for the pages from 0 to 2139. This happens everytime
I try to boot. After this I decided to try out things in the
bootloader first, so that I can save time in transfering the binary.
The way the NAND flash chip is connected to the processor and the
things that I have tried are mentioned below.

The NAND flash chip is connected to the processor in the following way
on our board:
CLE,ALE   -->  Connected to address lines of the processor.
-RE         -->  nOE
-WE        -->  nWE
R/-B       <--  GPIO-18 (AltFnIN-1 =3D RDY)
-WP        -->  GPIO-41
-CE         -->  GPIO-78 (AltFnOut-2 =3D nCS2)
GND       -->  Low
The memory addresses 0x08000000, 0x08000008 and 0x08000010 are mapped
to I/O-RW, Command-W and Address-W respectively.

First I tried reading out the ID of the chip. On sending the
NAND_CMD_READID and address 0x00, the chip gives back the Manufacturer
ID and the Chip ID properly. On observing the I/O to the NAND flash
through an oscilloscope, I see that all the lines are behaving
properly.

After this, I tried to read the OOB area in the 0th page. On sending
the NAND_CMD_READOOB, the address(3 cycles) and reading back 16
bytes(with tR delay), the chip gives back 0x00 for all the bytes read.
I tried this for the first 2 pages in all the blocks on the chip. But
got the same result. This gives me the reason why, the kernel is
showing all the blocks as bad blocks. On observing the I/O to the NAND
flash through an ocsillscope, I noticed a strange thing happening. By
following the above sequence to read OOB area, I noticed that the -CE
is lowered by the processor, only while the command is sent. For all
the times, the address is written and the data is read back, the -CE
is maintained high. This means the NAND flash chip is not receiving
the address and the 16 bytes, read after this are junk.

Has anybody here, has faced a similar kind of problem? Is there
anything that I can do at the processor end, to handle the nCS2
properly?

Any inputs, for helping me to solve this problem are welcome.

Thanks in advance,
Santhosh N
