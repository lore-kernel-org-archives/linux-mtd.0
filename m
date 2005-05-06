Received: from mail2.racnet.net ([213.144.11.11])
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1DU2zO-0001GS-NL
	for linux-mtd@lists.infradead.org; Fri, 06 May 2005 09:35:35 -0400
Message-ID: <427B72A9.1090305@rac.de>
Date: Fri, 06 May 2005 15:35:37 +0200
From: Marcus Mikolaiczyk <m.mikolaiczyk@rac.de>
MIME-Version: 1.0
To: tglx@linutronix.de
References: <425E37FF.5040703@rac.de> <425E41D8.5070408@setabox.com>	
	<425E4576.7030603@rac.de> <427B3E53.3090803@rac.de>
	<1115381403.19236.8.camel@tglx>
In-Reply-To: <1115381403.19236.8.camel@tglx>
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: Nand Flash not found.
Reply-To: m.mikolaiczyk@rac.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> {"NAND 256MiB 3,3V 8-bit", 	0xDA, 0, 256, 0, ..
> 
> Thats the entry from nand_ids.c

Thats related to the actual version. I know that it's not supported
anymore, but I have to use kernel 2.4.19 cause the Linux for this
microcontroller (Infineon tc1130) is ported only this kernel version.
Comparing those structs there is a difference.
I didn't find the latest patch 2.4.27. The link  on the website doesn't
work cause the file doesn't exist:
ftp://ftp.uk.linux.org/pub/people/dwmw2/mtd/cvs/mtd-snapshot-20050304.tar.bz2
I suppose a type cause ther is a file
ftp://ftp.uk.linux.org/pub/people/dwmw2/mtd/cvs/mtd-snapshot-20050403.tar.bz2
I'll try this one.

for the old structure I would propose something like:

{"NAND 256MiB 3,3V 8-bit", 	0xDA, 0, 0x20000, 0),
erasesize=128K =0x20000
pagesize=0 (device pagesize = 2k != 256bytes)
chipshift???


Any mappings between the "new - old" structure which could help?
new 	-	old
-------------------
name	-	name
id	-	id
pagesize-	?
chipsize-	?
?	-	chipshift
erasesize-	erasesize
?	-	page256
options	-	?


> Using the virtual address instead of the physical address might be
> helpful.
Sorry - my mistake.

Thanks Marcus
