Received: from www.strato-webmail.de ([81.169.148.109])
	by canuck.infradead.org with esmtps (Exim 4.42 #1 (Red Hat Linux))
	id 1CKCCc-0000zz-Nr
	for linux-mtd@lists.infradead.org; Wed, 20 Oct 2004 04:52:15 -0400
From: marcus@mikolaiczyk.de
To: linux-mtd@lists.infradead.org
Message-Id: <E1CKCCZ-0005xf-00@www.strato-webmail.de>
Date: Wed, 20 Oct 2004 10:52:11 +0200
Subject: 16Bit Bus with 8 Bit NAND?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi everybody,
I'm new to the embedded technologie and have a question concerning a setup
that uses the Infineon TC1130 (Microcontroller) together with NAND Flash.

The situation is that the TC1130 has an 16Bit EBU (External Bus Unit) to
connect to Flash, Disc On Chip, etc. devices. We disscuss the usage of 8
bit NAND Flash and realy don't have a clue if it's a problem that the bus
reads 16 Bit from an 8 Bit NAND.
The question is, what setup should be used to get this with Linux
working.
1. Does the Kernel (theh NAND Driver) automatically detect this and
'ignores' the 'empty 8 bit?
2. Or is it somehow configruable in the Driver befor comilation?
3. Or should we use 2 8bit NAND so that we've got 16bit - and is this
supported in  the NAND Driver?

I searched in the archive and found one note *) but only for 32 bit 8 bit,
and unfortunately with a 'hack' . 


*) "JFFS2 on big-endian system, 8-bit wide flash on 32-bit bus." 15.april
2004 , Joshua Lasmorie

Please help.

Best regards

Marcus Mikolaiczyk
