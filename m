Received: from 235-216.205.122.dellhost.com ([216.205.122.235] helo=imagequestdesign.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17KMGs-0004vp-00
	for <linux-mtd@lists.infradead.org>; Tue, 18 Jun 2002 17:55:58 +0100
Content-Type: text/plain;
  charset="iso-8859-1"
From: Mark Meade <mark@lakeshoremicro.com>
To: linux-mtd@lists.infradead.org
Subject: Re: GRUB on DoC Millennium/2000 - Instructions
Date: Tue, 18 Jun 2002 12:55:17 -0400
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-Id: <200206181253609.SM02488@there>
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

My apologies for screwing up the attachment.  Here it is in text:

Booting GRUB on the DiskOnChip Millennium

1.  Preliminaries

The following procedure was done on a desktop PC, using an 8MB DoC Millennium 
and the M-Sys ISA Evaluation card.  A DOS partition was used to run the M-Sys 
utilities, prior to installing GRUB.   This procedure *might* work with a DoC 
2000 -- but it has not been verified.

The Linux kernel must have the following MTD options either built-in or 
compiled as modules:

        MTD Support: MTD, Debugging, Direct char device access, NFTL, NTFL 
        write support:

                CONFIG_MTD=y
                CONFIG_MTD_DEBUG=y
                CONFIG_MTD_CHAR=y
                CONFIG_NFTL=y
                CONFIG_NFTL_RW=y

        Self-contained MTD Device Drivers: M-Systems DiskOnChip 2000 and 
        Millennium:

                CONFIG_MTD_DOC2000=y  
                CONFIG_MTD_DOCPROBE=y

In the following examples, a 2.4.18 kernel called "vmlinuz-doc" with the 
above MTD options built-in was used.

2.  Save DoC contents, and the Bad Block Table

Get the latest version of the DOS based M-Systems DiskOnChip Software 
Utilities from www.m-sys.com.  If desired, the GETIMAGE utility can be used 
to save the current contents of the DoC:

        getimage /win:xxxx <filename>

(where xxxx is the DoC base memory address in hex (window), for example: 
/win:d000)

**IMPORTANT**: Save the Bad Block Table!  Before attempting to boot with 
GRUB, make sure that the bad block table has been saved.  Doing this insures 
you can always restore the BBT in the event of the DoC being corrupted or 
completely erased:

        dformat /win:xxxx /noformat /log:<filename.txt>

This creates a text file containing a list of all the bad blocks on the DoC.  
 The dformat "uselog" option may be used to restore the BBT if needed.

        dinfo /BBT

will also display some detailed information about the DoC and the bad block 
table.  

3.  Verify TrueFFS Driver Version

The newer versions (5.0 or later) of the M-Systems DOC firmware may not work 
correctly with the latest version of the MTD drivers. This has something to 
do with the "UnitSizeFactor != 1" problem documented elsewhere.  An earlier 
version (4.2) seems to work fine.

Using version 4.2 of the DOS TrueFFS utilities available from M-Systems 
(www.m-sys.com), verify that the DOC is recognized, and that the firmware 
version is 4.2:

        dinfo

If the firmware version is 5.0 or later, run the DFORMAT utility:

        dformat /win:xxxx /s:doc42.exb

4.  Patch and compile GRUB

Get the latest grub sources:

        mkdir grub-doc
        cd grub-doc
        ftp alpha.gnu.org
        cd gnu/grub
        get grub-0.92.tar.gz
        tar xzvf grub-0.92.tar.gz

Get the latest MTD sources:

        cvs -d :pserver:anoncvs@cvs.infradead.org:/home/cvs login 
        (password = anoncvs)
        cvs -z3 -d :pserver:anoncvs@cvs.infradead.org:/home/cvs co mtd

Patch GRUB with DiskOnChip updates:

        cd grub-0.92
        patch -p0 -i ../mtd/patches/grub-2002-02-19-doc.patch

This patch may fail on the "ChangeLog" file, but all other files should patch 
correctly.  The 2002-02-19-doc patch was originally a patch against grub 
version 0.90.

5.  Build GRUB:

        aclocal && automake && autoconf

If there are any error messages here, you'll probably need up update automake 
and autoconf to the latest versions.

        ./configure --enable-diskonchip-mil512 --enable-ext2fs 
--enable-diskonchip-biosnetboot \
                --disable-ffs --disable-xfs --disable-jfs --disable-vstafs 
--disable-reiserfs --disable-minix --disable-fat
        make

See "README_DiskOnChip" for more information regarding the ./configure 
options, specifically the difference between "-mil256" and "-mil512".

6.  Copy GRUB to DOC

        cd ../mtd/util
        make doc_loadbios
        ./doc_loadbios /dev/mtd0 ../../grub-0.92/stage1/grub_firmware

If an error is reported regarding /dev/mtd0, you might need to run the 
./MAKEDEV script to create the proper device MTD device entries in the /dev 
directory.

7.  TURN OFF PC!

**IMPORTANT** - The PC should be turned off (not just rebooted) after running 
doc_loadbios.  This may not be necessary on all types of hardware, but it was 
required on my PC.  From M-Systems application note DOC-044:

The boot block is implemented as a XIP block located between the flash media 
and the system bus.  After the DiskOnChip Millennium powers-on, or when its 
reset signal is negated, the contents of the first page of flash memory are 
copied into the Boot Block.

The "doc_loadbios" utility copies data to this first page of flash memory.  
My PC must not be "negating the reset signal" to the DoC on a normal reboot 
-- a full power cycle is required to copy the flash memory to the boot block.

8.  Change Boot Sequence

In the BIOS setup, select NETWORK (or NIC, or its equivalent) as the first 
boot device.

Selecting "--enable-diskonchip-biosnetboot" causes the GRUB/DoC code to hook 
INT 18H, which is historically known as the "BASIC interrupt" or "Diskless 
Boot Interrupt".  Using this option with the DoC on a PC is useful because 
you change easily change the boot sequence back to the hard drive when needed.

If the BIOS does not have a NETWORK boot option, it may be possible to 
disable the "biosnetboot" option, rebuild GRUB, and copy grub_firmware to the 
DoC again.  In this case, the GRUB/DoC code will hook the INT 19H (bootstrap) 
handler.  This doesn't work at all on my PC, but theoretically it should 
override any boot sequence options in the BIOS setup.  

The downside of this option (in a PC environment, anyway) is that you may 
need to physically remove the DoC (or eval-board) to get the PC to boot from 
the hard drive again.  If that happens, it may be necessary to reinstall the 
DoC *after* the PC has booted, into a powered up eval board.  Of course, this 
is *not* recommended, but it has been done...

9.  Verify GRUB boot

The PC should now boot from the DiskOnChip.  The BIOS may say something like 
"Searching for boot record from Network...".  The first DoC messages 
displayed should be:

        DoC Mil D000
        Jumping to Grub
        DiskOnChip Millennium found at d0000

Where D000 is the "window" described earlier.

When the boot process completes, there should be a "grub>" command line.  We 
haven't installed a kernel or a "menu.lst" file on the DiskOnChip yet, so 
this step is just to verify that the "grub_firmware" was installed correctly, 
and that the DoC will boot.

At this point, you can either reboot again, change the boot sequence back to 
IDE (or whatever), and boot back into Linux.  Alternatively, if you know 
where your kernel and root filesystem is on the hard drive, simply type 
something like:

        kernel (hd0,0)/vmlinuz-doc root=/dev/hda2
        boot

10.  Partition the DiskOnChip

        fdisk /dev/nftla

If /dev/nftla is recognized, there will probably be one FAT12 partition on 
the DiskOnChip.  In this case, it won't be necessary to run the Linux 
"nftl_format" or "eraseall" utilities.  Use fdisk to delete this partition, 
and continue with step #11.

NOTE:  The "eraseall" utility can be dangerous as it will complete erase the 
DoC, including the bad block table -- saving the BBT as described in step #2 
is highly recommended.

If /dev/ntfla is NOT recognized, use the nftl_format program:

        ./nftl_format /dev/mtd0 98304

The "start offset" of 98304 insures that the grub_firmware is not 
overwritten.  As nftl_format runs, there should be notices about "skipping 
bad zone (factory marked)".  The bad zone values should be identical to the 
values in the file created in step #2.

After nftl_format is complete, reboot the PC.

11.  Create ext2 partition

To boot directly from the DoC, we'll need to create an ext2 partition, and 
install the kernel and GRUB menu.lst file:

        fdisk /dev/nftla                
        n p 1 <enter> <enter>   (create new primary partition, using defaults)
        w                       	     (save new partition info)

        mke2fs /dev/nftla1      
        mkdir /mnt/doc
        mount -t ext2 /dev/nftla1 /mnt/doc
        mkdir -p /mnt/doc/boot/grub
        cp /boot/vmlinuz-doc /mnt/doc/boot

Now create a "menu.lst" file in /mnt/doc/boot/grub.  This file should contain 
the following:

        timeout 10
        default 0

        title DoC Millennium Boot
        kernel (dc0,0)/boot/vmlinuz-doc root=/dev/hdaX

Where hdaX is the hard drive that contains your root Linux filesystem.  You 
could also add another entry to the file to boot directly from the hard 
drive, if desired.

Umount the /mnt/doc directory, and reboot the PC.

At this point, the PC should boot entirely from the DoC, and attempt to mount 
the root filesystem on your hard drive.  If this works, the next step to a 
fully self-contained boot is to create a full root filesystem or ramdisk on 
the DoC.  Once that has been done, change the "root=/dev/hdaX" option to 
"root=/dev/ntfla1".

Credits:

Thanks to Ilguiz Latypov <ilatypov@superbt.com> for reviewing these 
instructions, and for answering many questions related to GRUB on the 
DiskOnChip.
