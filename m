Received: from web10304.mail.yahoo.com ([216.136.130.82])
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 18VmJo-0006Jn-00
	for <linux-mtd@lists.infradead.org>; Tue, 07 Jan 2003 05:30:28 +0000
Message-ID: <20030107060117.4972.qmail@web10304.mail.yahoo.com>
Date: Mon, 6 Jan 2003 22:01:17 -0800 (PST)
From: Sanal Kumar <p_sanalk@yahoo.com>
Subject: Re: Accessing DiskonChip 
To: David Woodhouse <dwmw2@infradead.org>
Cc: linux-arm-kernel@lists.arm.linux.org.uk, linux-mtd@lists.infradead.org
In-Reply-To: <14808.1041861477@passion.cambridge.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

Hi David,

I have added following lines in the docprobe.c

static unsigned long __initdata doc_locations[] = {
--
--
#elif defined (__arm__)
	0x18000000,
#else
#warning ---
#endif
0};

So i think I dont need to define it in
CONFIG_MTD_DOCPROBE_ADDRESS.



And My log message is like this .

DiskOnChip Millennium found at address 0x18000000
Flash chip found: Manufacturer ID: 98, Chip ID: E6
(Toshiba TC58V64AFT/DC)
1 flash chips found. Total DiskOnChip size: 8 MiB

out-of-line wait
_DoC_WaitReady called for out-of-line wait
.
. _DoC_WaitReady called for out-of-line wait
Could not find valid boot record
Could not mount NFTL device


In Our board SA_A1 ->DOC_A0 .....  SA_A13->DOC_A12 ,So
there is <<1 .

I have changed the ReadDOC_ and WriteDOC_
in include/linux/mtd/doc2000.h 
#define ReadDOC_(adr,reg) readb(((unsigned
long)adr)+((reg(<<1));
#define WriteDOC_(d,adr,reg) writeb(d,((unsigned
long)adr)+((reg(<<1));


I am able to read & write to /dev/mtd0  using dd.

I have added nftl support. So i need to support make a
filesystem on disk on chip How can I do that.



Best Regards
Sanal.


--- David Woodhouse <dwmw2@infradead.org> wrote:
> 
> p_sanalk@yahoo.com said:
> > I am working on an Assabet like board. I am trying
> to make a
> > filesystem on msystem Disk on chip.(The board
> boots using ramdisk).
> 
> > I have added entries for mtd* and nftl* in in /dev
> 
> 
> You haven't set CONFIG_MTD_DOCPROBE_ADDRESS and
> since you're not on a 
> platform which has standard addresses at which to
> probe for a DiskOnChip, 
> the driver has no idea where to look for it. 
> 
> Set CONFIG_MTD_DOCPROBE_ADDRESS to the physical
> address at which the 
> DiskOnChip is mapped, and check the definitions of
> ReadDOC_ and WriteDOC_ 
> in include/linux/mtd/doc2000.h are correct for the
> way you've wired it up.
> 
> --
> dwmw2
> 
> 
> 
>
-------------------------------------------------------------------
> Subscription options:
>
http://lists.arm.linux.org.uk/mailman/listinfo/linux-arm-kernel
> FAQ/Etiquette:      
>
http://www.arm.linux.org.uk/armlinux/mailinglists.php
> 


__________________________________________________
Do you Yahoo!?
Yahoo! Mail Plus - Powerful. Affordable. Sign up now.
http://mailplus.yahoo.com
