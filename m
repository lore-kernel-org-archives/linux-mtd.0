Received: from rwcrmhc53.attbi.com ([204.127.198.39])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17zehX-0003Vu-00
	for <linux-mtd@lists.infradead.org>; Thu, 10 Oct 2002 15:54:11 +0100
Received: from there ([12.245.142.8]) by rwcrmhc53.attbi.com
          (InterMail vM.4.01.03.27 201-229-121-127-20010626) with SMTP
          id <20021010145337.UXLR28530.rwcrmhc53.attbi.com@there>
          for <linux-mtd@lists.infradead.org>;
          Thu, 10 Oct 2002 14:53:37 +0000
Content-Type: text/plain;
  charset="iso-8859-1"
From: Mark Meade <mark@lakeshoremicro.com>
To: linux-mtd@lists.infradead.org
Date: Thu, 10 Oct 2002 10:52:52 -0400
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: GRUB on DoC Millennium/2000 - Instructions (Revised)
Message-Id: <20021010145337.UXLR28530.rwcrmhc53.attbi.com@there>
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

This is a revision of the instructions originally posted at:
http://lists.infradead.org/pipermail/linux-mtd/2002-June/005240.html

The new additions in this revision include instructions for using the latest 
version of the M-Sys DFORMAT utility to install GRUB and NFTL format in one 
shot, and also a slightly revised method for using doc_loadbios and 
nftl_format when necessary.

If anyone has any comments or suggestions for improvements, please let me 
know.

--------------------------------------------------------------

Booting GRUB on the DiskOnChip 2000 and Millennium 
Mark Meade <mark@lakeshoremicro.com> 
 
Revision 0.2: 10 October 2002 
 
0.  Preliminaries 
 
The following procedure was done on a desktop PC, using an 8MB DiskOnChip 
Millennium and the M-Sys PCI Evaluation card.  A DOS partition was used to 
run the M-Sys utilities.  This procedure was also verified with a 32MB DoC 
2000. 
 
The Linux kernel must have the following MTD options either built-in or 
compiled as modules: 
 
        MTD Support: 
                MTD, Debugging, Direct char device access, 
                NFTL, NFTL write support 
 
                CONFIG_MTD=y 
                CONFIG_MTD_DEBUG=y 
                CONFIG_MTD_CHAR=y 
                CONFIG_NFTL=y 
                CONFIG_NFTL_RW=y 
 
        Self-contained MTD Device Drivers: 
                M-Systems DiskOnChip 2000 and Millennium 
 
                CONFIG_MTD_DOC2000=y 
                CONFIG_MTD_DOCPROBE=y 
 
In the following examples, a Linux kernel called "vmlinuz-doc" was created, 
with the above MTD options built-in.  This kernel can be used for both 
configuring the DiskOnChip, and for booting from it directly. 
 
These instructions cover two slightly different scenarios:  1) using a kernel 
that includes the latest MTD code (CVS), and 2) using an unmodified 2.4.18 
kernel.   
 
The first option is highly recommended - option #2 requires the use of older 
versions of the M-Sys utilities, and can be more problematic.  With option #2 
it is best to compile the MTD options as modules, rather than built-in to the 
kernel. 
 
Unfortunately, both procedures require the use of a DOS partition.  However, 
as of this writing, using the M-Sys DOS utilities is the quickest, most 
reliable way to install GRUB.  Ideally, the DOS utilities should only need to 
be used once, for the initial GRUB install and NFTL format.  Once GRUB is 
installed and booting, partitions can be created and deleted, file systems 
created, etc., using the usual Linux tools. 
 
-------------------------------------------

Section #1: Kernel with latest MTD code 
 
1.  Save DoC contents, and the Bad Block Table 
 
Get the latest version of the DOS based M-Systems DiskOnChip Software 
Utilities from www.m-sys.com.  If desired, the GETIMAGE utility can be used 
to save the current contents of the DoC: 
 
        getimage /win:xxxx <filename> 
 
(where xxxx is the DoC base memory address in hex (window), for example: 
/win:d000) 
 
**IMPORTANT**: Save the Bad Block Table!  Before attempting to boot with 
GRUB, make sure that the bad block table has been saved.  Doing this insures 
you can always restore the BBT in the event of the DoC being corrupted or 
completely erased: 
 
        dformat /win:xxxx /noformat /log:<filename.txt> 
 
This creates a text file containing a list of all the bad blocks on the DoC.  
 The dformat "uselog" option may be used to restore the BBT if needed: 
 
        dformat /win:xxxx /noformat /uselog:<filename.txt> 
 
The DINFO utility is useful for displaying some detailed information about 
the DoC and the bad block table: 
 
        dinfo 
        dinfo /BBT 
 
2.  Patch GRUB 
 
Reboot into Linux, and get the latest grub sources (CVS): 
 
        mkdir grub-doc 
        cd grub-doc 
        cvs -d:pserver:anoncvs@subversions.gnu.org:/cvsroot/grub login 
                <just hit enter when prompted for password> 
        cvs -z3 -d:pserver:anoncvs@subversions.gnu.org:/cvsroot/grub co grub 
 
Patch GRUB with DiskOnChip updates: 
 
        cd grub 
        patch -p0 -i grub-2002-10-08-doc.patch 
 
This patch may fail on the "ChangeLog" or "AUTHORS" file, but all other files 
should patch correctly.  Make sure that the files in stage1 and stage2 
directories patch correctly. 
 
3.  Build GRUB: 
 
The GRUB code currently requires automake version 1.5 and autoconf version 
2.53.  On some systems, this can be specified by exporting 
WANT_AUTOMAKE_1_5=1 and WANT_AUTOCONF_2_5=1. 
 
        aclocal && automake --add-missing && autoconf 
 
If there are any error messages here, they are probably due to version 
incompatibilities with automake and/or autoconf. 
 
Now, configure GRUB with the following options (for example): 
 
        ./configure --enable-diskonchip-mil \ 
                --enable-diskonchip-biosnetboot \ 
                --enable-diskonchip-ctrlbypass \ 
                --enable-ext2fs \ 
                --disable-ffs --disable-xfs --disable-jfs --disable-vstafs \ 
                --disable-reiserfs --disable-minix --disable-fat 
 
If you have a DoC 2000, use "--enable-diskonchip-2000" instead of "-mil".   
The "README_DiskOnChip" in the grub directory has more information regarding 
the ./configure options, and also some details on the DoC booting process. 
 
Selecting "--enable-diskonchip-biosnetboot" causes the GRUB/DoC code to hook 
INT 18H, which is historically known as the "BASIC interrupt" or "Diskless 
Boot Interrupt".  Using this option with the DoC on a PC is useful because 
you change easily change the boot sequence back to the hard drive when 
needed.  Selecting this option in many BIOSes usually involves changing the 
first boot device to "NETWORK". 
 
If the BIOS does not have a NETWORK boot option, disable the "biosnetboot" 
option.  Instead of using INT 18H, the GRUB/DoC code will hook the INT 19H 
(bootstrap) handler.  On my PC, taking over the bootstrap handler overrides 
any boot sequence options in the BIOS setup.   
 
The downside of using INT 19H is that a misconfigured DoC can render your 
machine unbootable.  For this reason, the "--enable-diskonchip-ctrlbypass" 
option is highly recommended until you are sure that the DoC boots correctly. 
 When the CTRL key is held during booting, this option will bypass the DoC 
entirely by restoring the original bootstrap handler. 
 
This is obviously preferable to the other option -- physically removing the 
DoC (or eval-board) to get the PC to boot from the hard drive again.  In that 
case, it is necessary to "hotplug" the DoC *after* the PC has booted, into a 
powered up eval board.   
 
Now that all the DoC options are set, simply type: 
 
        make 
 
If the build is successful, there should be a file named "grub_firmware" in 
the /stage1 directory. 
 
4.  Copy GRUB to DOC 
 
Copy the grub_firmware to a floppy diskette, or to a partition that is 
accessable by DOS.  Reboot into DOS. 
 
Use DFORMAT to load GRUB and also to format the DiskOnChip: 
 
        DFORMAT /win:xxxx /BDKF0:grub_firmware 
 
This utility automatically adjusts for the size of grub_firmware, so 
specifying the length of the boot image file is not necessary.  There is 
another DFORMAT option that can be used to leave a little extra room for 
booting firmware in the future, if desired: 
 
        DFORMAT /win:xxxx /BDKF0:grub_firmware /BDKL0:<size>     
 
5.  TURN OFF PC! 
 
**IMPORTANT** - The PC should be turned off (not just rebooted) after running 
DFORMAT.  This may not be necessary on all types of hardware, but it was 
required on my PC.  From M-Systems application note DOC-044: 
 
The boot block is implemented as a XIP block located between the flash media 
and the system bus.  After the DiskOnChip Millennium powers-on, or when its 
reset signal is negated, the contents of the first page of flash memory are 
copied into the Boot Block. 
 
My PC must not be "negating the reset signal" to the DoC on a normal reboot 
-- a full power cycle is required to copy the flash memory to the boot block. 
 
6.  Change Boot Sequence 
 
If you used the "biosnetboot" option when configuring Grub, you'll need to 
change the boot sequence:  In the BIOS setup, select NETWORK (or NIC, or its 
equivalent) as the first boot device.  If "biosnetboot" was not used, no BIOS 
setup changes should be needed. 
 
7.  Verify GRUB boot 
 
The PC should now boot from the DiskOnChip.  The BIOS may say something like 
"Searching for boot record from Network...".  The first DoC messages 
displayed should be: 
 
        MESSAGE       MEANING 
        ---------------   ------------------------------------------------ 
        DoC found       (BIOS detected the DoC Extension) 
        DoC Mil D000  (BIOS jumped to DoC boot interrupt) 
        E698               (DoC Chip ID and Manufacturer code, for example) 
        Grub:               (Jumping to stage2) 
 
        DiskOnChip 2000 found at d0000    (first stage 2 message) 
 
When the boot process completes, there might be a "grub>" command line.  We 
haven't installed a kernel or a "menu.lst" file on the DiskOnChip yet, so 
this step is just to verify that the "grub_firmware" was installed correctly, 
and that the DoC will boot. 
 
If you are already using GRUB on a hard drive, it's possible that the DoC 
GRUB will locate and use the menu.lst file in the /boot/grub directory on the 
drive.  In this case, you should have the GRUB boot selection menu as usual 
-- GRUB booted from the DoC, but loaded the boot options from the hard drive. 
 
At this point, you can either reboot again, change the boot sequence back to 
IDE (or whatever), and boot back into Linux.  Alternatively, if you know 
where your kernel and root filesystem is on the hard drive, simply type 
something like: 
 
        kernel (hd0,0)/vmlinuz-doc root=/dev/hda2 
        boot 
 
If Grub doesn't boot, the informational messages may help determine why, or 
where the failure occurred.  Remember, if the 
"--enable-diskonchip-ctrlbypass" option was specified, holding the ctrl-key 
during boot should bypass the DoC entirely. 
 
8.  Get the latest MTD sources: 
 
        cvs -d :pserver:anoncvs@cvs.infradead.org:/home/cvs login  
        (password = anoncvs) 
        cvs -z3 -d :pserver:anoncvs@cvs.infradead.org:/home/cvs co mtd 
 
Alternatively, there are daily CVS snapshots available as .tar.bz2 files at: 
 
        ftp://ftp.uk.linux.org/pub/people/dwmw2/mtd/cvs/ 
 
Patch a kernel, select the various DiskOnChip MTD options as specified above, 
and build a new kernel.  Reboot. 
 
9.  Verify FAT Partition 
 
You should now be able to partition the DiskOnChip, and create the 
appropriate file systems.  The DFORMAT command used earlier should have 
created one FAT partition on the DoC.  To verify this, try: 
 
        mkdir /mnt/doc 
        mount /dev/nftla1 /mnt/doc 
        umount /mnt/doc 
 
If the mount is not successful, you might need to run the ./MAKEDEV script to 
create the proper device MTD device entries in the /dev directory.  This 
MAKEDEV utility is available in the MTD archives. 
 
The other common cause of failure at this point is the use of earlier MTD 
versions -- for instance, a unmodified 2.4.18 kernel will not be successful 
in mounting this FAT partition.  If the "dmesg" output has a message that 
says something like "we don't support a unit size factor != 1", then you 
definitely need to update the MTD code in the kernel. 
 
10.  Create ext2 partition on the DiskOnChip 
 
To boot directly from the DoC, we'll need to create an ext2 partition, and 
install the kernel and GRUB menu.lst file: 
 
        fdisk /dev/nftla                 
        d 1 <enter>             (delete fat partition created by DFORMAT) 
        n p 1 <enter> <enter>   (new primary partition, using defaults) 
        w                               (save new partition info) 
 
        mke2fs /dev/nftla1       
        mount -t ext2 /dev/nftla1 /mnt/doc 
        mkdir -p /mnt/doc/boot/grub 
        cp /boot/vmlinuz-doc /mnt/doc/boot 
 
Now create a "menu.lst" file in /mnt/doc/boot/grub.  This file should contain 
the following: 
 
        timeout 10 
        default 0 
 
        title DiskOnChip Boot 
        kernel (dc0,0)/boot/vmlinuz-doc root=/dev/hdaX 
 
Where hdaX is the hard drive that contains your root Linux filesystem.  You 
could also add another entry to the file to boot directly from the hard 
drive, if desired. 
 
Umount the /mnt/doc directory, and reboot the PC. 
 
At this point, the PC should boot entirely from the DoC, and attempt to mount 
the root filesystem on your hard drive.  If this works, the next step to a 
fully self-contained boot is to create a full root filesystem or ramdisk on 
the DoC.  Once that has been done, change the "root=/dev/hdaX" option to 
"root=/dev/ntfla1". 
 
-------------------------------------------

Section #2: Unmodified 2.4.18 Kernel 
 
1.  Verify TrueFFS Driver Version 
 
The newer versions (5.0 or later) of the M-Systems DOC firmware will not work 
correctly with the MTD drivers in 2.4.18.  An earlier version (4.2) is 
required. 
 
Using version 4.2 of the DOS TrueFFS utilities available from M-Systems 
(www.m-sys.com), verify that the DOC is recognized, and that the firmware 
version is 4.2: 
 
        dinfo 
 
If the firmware version is 5.0 or later, run the DFORMAT utility: 
 
        dformat /win:xxxx /s:doc42.exb 
 
2.  Save the Bad Block Table (BBT) 
 
See step #1, in Section #1, above. 
 
3.  Patch and Build GRUB 
 
Follow steps #2 and #3 in Section #1, above. 
 
4.  Get the latest MTD sources: 
 
See step #8, in Section #1, above.  Later steps in this procedure will be 
much easier if the the MTD/DiskOnChip portions are compiled as modules, 
rather than built-in to the kernel.  If the modules are built-in, make sure 
to reboot after each each subsequent step. 
 
5.  Copy GRUB to DOC 
 
        insmod mtdcore 
        insmod mtdchar 
        insmod docecc 
        insmod doc2000 
        insmod docprobe 
 
        cd mtd/util 
        make doc_loadbios 
        ./doc_loadbios /dev/mtd0 grub_firmware 
 
If an error is reported regarding /dev/mtd0, you might need to run the 
./MAKEDEV script to create the proper device MTD device entries in the /dev 
directory. 
 
6.  NFTL Format 
 
        ./nftl_format /dev/mtd0 98304 
 
The "start offset" of 98304 insures that the grub_firmware is not 
overwritten.  This offset should be larger than the size of the grub_firmware 
file, and probably should be a multiple of 16k. 
 
As nftl_format runs, there should be notices about "skipping bad zone 
(factory marked)".  The bad zone values should be identical to the values in 
the file created in step #2. 
 
NOTE:  There should be no need to run the "eraseall" utility.  This can be 
dangerous as it will complete erase the DoC, including the bad block table -- 
saving the BBT as described earlier is highly recommended. 
 
7.  Create ext2 partition on the DiskOnChip 
 
To boot directly from the DoC, we'll need to create an ext2 partition, and 
install the kernel and GRUB menu.lst file: 
 
        insmod nftl 
        fdisk /dev/nftla                 
        n p 1 <enter> <enter>   (new primary partition, using defaults) 
        w                               (save new partition info) 
 
        rmmod nftl 
        insmod nftl 
 
        mke2fs /dev/nftla1       
        mount -t ext2 /dev/nftla1 /mnt/doc 
        mkdir -p /mnt/doc/boot/grub 
        cp /boot/vmlinuz-doc /mnt/doc/boot 
 
Note that the nftl module is reloaded *after* doing the fdisk.  This is done 
to insure that the new partition information is recognized by the nftl module 
-- if this isn't done, very bad things may occur.   
 
NOTE:  There is a patch available that adds an IOCTL command to the nftl 
driver, and also a modification to the nftl_format command.  This would make 
it unnecessary to unload the nftl module during nftl_format and after fdisk.  
If this patch has not already been applied to the MTD CVS, it can be found 
at: 

      http://lists.infradead.org/pipermail/linux-mtd/2002-August/005831.html 
 
8.  Create menu.lst file 
 
Create a "menu.lst" file, as described step #10 in section #1, above.   
 
9.  Reboot with GRUB 
 
After completing steps #1-#8, it may be necessary to turn off the PC before 
booting Grub from the DiskOnChip.  See Step #5 in section #1 for the details. 
 
Credits: 
 
Thanks to Ilguiz Latypov <ilatypov@infradead.org> for reviewing these 
instructions, and for answering many questions related to GRUB on the 
DiskOnChip.   
 
Karim Yaghmour (karim@opersys.com) added the "ctrl-key bypass" feature -- I'm 
sure this has already saved many people lots of grief and aggravation. 
 
David Woodhouse <dwmw2@infradead.org> created the original DoC/GRUB patch. 
