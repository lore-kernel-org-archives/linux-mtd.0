Received: from smtp5-g21.free.fr ([212.27.42.5])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NJozj-0005fQ-59
	for linux-mtd@lists.infradead.org; Sun, 13 Dec 2009 14:00:24 +0000
Message-ID: <4B24F36A.40108@eukrea.com>
Date: Sun, 13 Dec 2009 15:00:10 +0100
From: =?ISO-8859-1?Q?Eric_B=E9nard?= <eric@eukrea.com>
MIME-Version: 1.0
To: alfred steele <alfred.jaquez@gmail.com>
Subject: Re: [PATCH] mxc_nand: i.MX35 hardware ECC fixups
References: <804opb7d2y.fsf@merkur.tec.linutronix.de>	<528f13590911071823sa26e1ane027d51d16357c79@mail.gmail.com>	<80y6mg5e34.fsf@merkur.tec.linutronix.de>
	<528f13590912121558h26a95a1awcc2f8f384e8c3076@mail.gmail.com>
In-Reply-To: <528f13590912121558h26a95a1awcc2f8f384e8c3076@mail.gmail.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Alfred,

alfred steele a écrit :
> I am having a issue with using nandwrite mtd util and it so happens
> that the nandwrite gets stuck at a particular block and the sonsole
> hangs there forever.
> We are using the mx27(mxc) with a large size page NAND(4k). The annd
> write suceeds for the kernel MTD parition. I am suspecting my NAND
> driver is somehow obsolete. How do i find out as to what could be the
> root cause of the problem?
are you sure the i.MX27's NAND controler supports 4k NAND ?

 From the Reference Manual is only support 512 & 2k :
The NFC interfaces standard NAND Flash devices to the IC and hides the 
complexities of accessing the NAND Flash. It provides a glueless 
interface to both 8-bit and 16-bit NAND Flash parts with page sizes
of 512 bytes or 2 Kbytes, and densities up to 64 Gbits per 2-Kbyte page 
size NAND Flash, and 8 Gbits per 512 byte page size NAND Flash.

There is no mention of 4k NAND and the NFC's RAM buffer is only 2k + 64 
which may be not enough for 4k NAND (the v2 NFC has 4k + 512 and support 
4k).

Eric
