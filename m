Received: from myyr.colleduc.ee ([193.40.113.30] helo=kiire.colleduc.ee)
	by canuck.infradead.org with esmtps (Exim 4.42 #1 (Red Hat Linux))
	id 1CGw2P-0001LB-M4
	for linux-mtd@lists.infradead.org; Mon, 11 Oct 2004 05:00:15 -0400
Date: Mon, 11 Oct 2004 12:00:02 +0300 (EEST)
From: Kalev Lember <kalev@colleduc.ee>
To: Thomas Gleixner <tglx@linutronix.de>
In-Reply-To: <1097261009.11402.1703.camel@thomas>
Message-ID: <Pine.LNX.4.44.0410111142280.30772-100000@kiire.colleduc.ee>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Cc: Nicolas Pouillon <nipo@ssji.net>, linux-mtd@lists.infradead.org
Subject: Re: [PATCH]Probing at 0x0
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 8 Oct 2004, Thomas Gleixner wrote:

> On Fri, 2004-10-08 at 20:28, Kalev Lember wrote:
> > No, it is not supported. According to 
> > http://www.tri-m.com/products/msystems/files/specs/mddoc_spec.pdf the 32 
> > MB Millennium Plus has 16 bit data bus while the supported 16 MB Mil+ 
> > has 8 bit bus.
> 
> Hmm, I think you talk about different things.
> 
> >> This time, chip is probed as a DoC-Mil+ 32MB, driver complains about 
> >> it not being supported. It seems ok, and as mtd are much like rocket
> >> science to me, I'll wait a little until it is (i hope) supported...
> 
> The DoC has Doc-chip-ID 0x41 according to the datasheet.
> http://www.m-systems.com/files/documentation/doc/Mobile_Plus_32_64MB_DS_Rev1.7.pdf

Why do you think it has 0x41?

Quoting this message: 
http://lists.infradead.org/pipermail/linux-mtd/2004-October/010544.html :
> In CE, there are 32Mib for system rom, and 32Mib for user, and chip is
> alone on the board, so yes it is 64.  I have chip ref somewhere if it can

So I understand this is a 64 MB chip.

Quoting message 
http://lists.infradead.org/pipermail/linux-mtd/2004-October/010552.html :
> Things I can read on the chip (hoping i'm correct, it is not very
> readable) are:
> "M-Systems
> Disc-on-chip
> MD333-D64-V3-X

I think we have a typo here, the right marking should be MD3331-D64-V3-X. 
This is a Diskonchip Millennium Plus 64 MB according to 
http://www.m-systems.com/files/prodUpd_EOL/doc/PU0103_DOC_Plus_Packaging.pdf 
.


> from include/linux/mtd/doc2000.h
> #define DOC_ChipID_DocMilPlus32 0x40
> #define DOC_ChipID_DocMilPlus16 0x41
> 
> So how is it identified as a Mil+32 ? 

http://lists.infradead.org/pipermail/linux-mtd/2004-October/010584.html :

> This time, chip is probed as a DoC-Mil+ 32MB, driver complains about it
> not being supported. It seems ok, and as mtd are much like rocket

This proves that our chip id is 0x40, because in the diskonchip.c:
> case DOC_ChipID_DocMilPlus32:
> 	printk(KERN_ERR "DiskOnChip Millennium Plus 32MB is not supported, ignoring.\n");

this message is output if the diskonchip's id is DOC_ChipID_DocMilPlus32 
(0x40).


> The chip can be accessed in 16 bit mode, but it does not need the two
> parallel chip magic which are neccecary for the Mil+32.
> 
> Please correct me, if I'm wrong or talking about something different :)

I think you have a misunderstanding about the chip we have here. This is a 
64 MB device that must be accessed it 16 bit mode.

-- 
Best regards,
Kalev Lember
