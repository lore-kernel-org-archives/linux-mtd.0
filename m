Received: from user11.ucall.net ([63.126.131.11] helo=guinan.diversehost.net)
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 17cBrh-0007Wq-00
	for <linux-mtd@lists.infradead.org>; Tue, 06 Aug 2002 22:27:41 +0100
Subject: [Fwd: Re: boot from diskonchip millenium]
From: Glen <mtd@empireenterprises.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Date: 06 Aug 2002 17:26:53 -0400
Message-Id: <1028669214.1719.1.camel@glen>
Mime-Version: 1.0
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

Thank you for your help thus far.  


> This always happens when the grub_firmware was compiled by
> running aclocal/autoconf/automake commands from README_DiskOnChip and
> specifying the --enable-diskonchip-mil option.  [The latest patches are
> 0.92 and 2002-07-29].

This is what I did, with the 0.92 patch; are you saying I should have
done otherwise?  

I started from scratch, and recompiled everything, reformatted, and the
like.  Now I get the following message:  


DoC Mil D000
E698
Jumping to Grub
Attempting to open /boot/grub/menu.lst on drive 0xe0, partition 0xff
Unknown ChipID a0 at c8000
DiskOnChip Millennium found at d0000
floor 0, chip 0; manufacturer: Toshiba
Chip: Toshiba TC58V64AFT/DC, total size: 8MiB
	erase unit: 8192 bytes, page: 512 byes
unknown manufacturer code: 0x43
Total of 1 chips found - total capacity 8 MiB
Scanning for NFTL Media Header
NFTL Media Header found in flash sector 208
nftl_rawread(): error 16 in memcpy() or earlier, press any key


Interestingly enough, after I boot the machine to the HDD by entering
the commands in grub manually, I no longer have a nftl partition.  

Does grub write to the DOC upon booting? 


-g


On Tue, 2002-08-06 at 14:04, Ilguiz Latypov wrote:
> 
> On 6 Aug 2002, Glen wrote:
> 
> > Attempting to open /boot/grub/menu.lst 0x0 0x0
> > Attempting to open /boot/grub/menu.lst 0x0 0x1
> 
> I believe there were attempts to open configuration file on disk 0xe0
> (DiskOnChip fake BIOS drive number just for the GRUB's internal BIOS disk
> access API).  This always happens when the grub_firmware was compiled by
> running aclocal/autoconf/automake commands from README_DiskOnChip and
> specifying the --enable-diskonchip-mil option.  [The latest patches are
> 0.92 and 2002-07-29].
>  
> > Ideas??
> 
> If you created a partition within NFTL layer, the "root (dc0,0)" command 
> would be worth trying.
> 
> Ilguiz
> 
> 
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
> 
