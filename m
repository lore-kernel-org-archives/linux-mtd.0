From: hno@marasystems.com (Henrik Nordstrom)
Date: 19 Mar 2003 15:34:10 +0100
Subject: DoC firmware
In-Reply-To: <3E78BCBE.7020303@exaband.net>
References: <3E78BCBE.7020303@exaband.net>
Message-ID: <1048084450.9196.29.camel@henrik.marasystems.com>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

There is two tricky parts here if you want to use JFFS2 with DOC as boot
device.

a) How to get the kernel loaded

b) The DOC support in JFFS2.

When using JFFS2 you do not use the NFTL translation layer, and instead
use the flash directly as a mtd device.

However, both the M-Sys firmware and the GRUB firmware for DOC assumes
NFTL is used, and that there is a standard filesystem ontop of NFTL.

If you do not want to use the DOC as a boot device then the setup should
be fairly straight forward if you consider the DOC as just a mtd flash
device and ignore NFTL, firmware etc.. but I am a little bit unsure
about the JFFS2 support for DOC flash memory so there might be a
slightly bumpy road to get it actually running. Others on this list
probably know more.

By careful partitioning of the flash you should be able to combine both
boot firmware, JFFS2 and a NFTL block disk area on the same DOC into a
setup which uses the best of all three: GRUB firmware for booting the
system, NTFL for /boot where the kernel is stored, and JFFS2 for /

Regards
Henrik


ons 2003-03-19 klockan 19.53 skrev mahipal.rao:
> I have formated the new M-sys DOC2000 of 32Mb with mke2fs.
> Before doing that i have done "ntfl_format" 
> 
> I have gone through the documentation of mtd-jffs-howto in which 
> it was warned to take suggestion from the ppl in the list.
> 
> Now, can i reload the firmware back in to the DOC2000.
> I want to put embedded linux in to the chip and boot with that.
> Is it possible to simply mkfs.jffs2 and put every thing on to the 
> chip and run lilo/grub to have linux on DOC.
> 
> TIA
> 
> Mahipal
> 
> 
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
-- 
Henrik Nordstrom <hno@marasystems.com>
MARA Systems AB
