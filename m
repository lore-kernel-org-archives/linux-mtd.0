Received: from [81.3.11.18] (helo=mail.ku-gbr.de)
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1D6r02-0001mV-5n
	for linux-mtd@lists.infradead.org; Thu, 03 Mar 2005 09:08:23 -0500
Date: Thu, 3 Mar 2005 15:08:17 +0100
From: Konstantin Kletschke <lists@ku-gbr.de>
To: linux-mtd@lists.infradead.org
Message-ID: <20050303140816.GA17270@synertronixx3>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Subject: xip AND sync burst modus
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


Hi people!

I am still desperately trying to get this XIP stuff stable running in 
conjuntion with the sync burst modus of intel K3 flash devices.

General I think the XIP Kernel runs well.
I set up the PageModeEmulation Mode between the flash device and the
i.MX microcontroller and a XIP Kernel is running fine with the root file
system on the same device, no problems.

But XIP is only saving time on my computer, if I succesfully enable the
sync burst modus of the flash interface.

Sometimes a XIP kernel boots with sync burst mode enabled but it breaks
while mounting the root filesystem, most often at the same place.
Of course I think I set up the sync burst modus wrong so the interface
is unstable and all is my fault.

But what I wonder is, when I put the xip Kernel into the
Flash in sync burst modus but mounted the root via nfs all worked very
fine, including mountig reading an writing jffs2 filesystems in the
flash device.
Also there are some other issues which are working well when sync burst modus
is enabled but should not when my setup is broken:

mtest in u-boot runs fine.

imls in u-boot _always_ looks like:

scb9328> imls     
Image at 10040000:
   Image Name:   Linux-2.6.10-rc2
   Image Type:   ARM Linux Kernel Image (uncompressed)
   Data Size:    1357940 Bytes =  1.3 MB              
   Load Address: 08008000               
   Entry Point:  08008000
   Verifying Checksum ... OK
   ^^^^^^^^^^^^^^^^^^
crc32 around varying regions with different length _always_ have same
checksums when repeated.

The mounting of the root file system breaks _always_ this way:

Probing scb9328_flash at physical address 0x10000000 (16-bit buswidth)
scb9328_flash: Found 1 x16 devices at 0x0 in 16-bit bank              
 Intel/Sharp Extended Query Table at 0x0031             
Using buffer write method                  
cfi_cmdset_0001: Erase suspend on write enabled
5 cmdlinepart partitions found on MTD device scb9328_flash
Creating 5 MTD partitions on "scb9328_flash":             
0x00000000-0x00020000 : "U-boot"             
0x00020000-0x00040000 : "U-boot_env"
0x00040000-0x00240000 : "kernel"    
0x00240000-0x00740000 : "root"  
0x00740000-0x01000000 : "fs"  
NET: Registered protocol family 2
IP: routing cache hash table of 512 buckets, 4Kbytes
TCP: Hash tables configured (established 1024 bind 2048)
jffs2_scan_dirent_node(): Name CRC failed on node at 0x00037448: Read 0x9acd7a6e, calculated 0x2dcc220b
jffs2_scan_dirent_node(): Name CRC failed on node at 0x0006c4ac: Read 0x03371d6d, calculated 0xb77e85a5
jffs2_scan_dirent_node(): Name CRC failed on node at 0x0008f20c: Read 0xb08c7dea, calculated 0xc2706a75
VFS: Mounted root (jffs2 filesystem).
Freeing init memory: 60K             
Kernel panic - not syncing: No init found.  Try passing init= option to kernel.

Reset, bootm:

jffs2_scan_dirent_node(): Name CRC failed on node at 0x00037448: Read 0x9acd7a6e, calculated 0x2dcc220b
Name for which CRC failed is (now) 'ld-uClibc-0.9.26r', ino #186
jffs2_scan_dirent_node(): Name CRC failed on node at 0x0006c4ac: Read 0x03371d6d, calculated 0xb77e85a5
Name for which CRC failed is (now) 'libresolv-0.—', ino #209
jffs2_scan_dirent_node(): Name CRC failed on node at 0x0008f20c: Read 0xb08c7dea, calculated 0xc2706a75
Name for which CRC failed is (now) 'modules.ieeeﬁ', ino #222
VFS: Mounted root (jffs2 filesystem).                       
Freeing init memory: 76K             
Kernel panic - not syncing: No init found.  Try passing init= option to kernel.


Regardeless if xip kernel, classic non xip kernel loaded per tftpboot
and started via bootm, classic setup with boot by copying and decompressing
into ram by u-boot.

Has anybody sync burst modus on intel K3 flash running with an ARM9
based microcontroller whome I can share experiences with?

As said. Of course my hardware setup may be broken, but there are so
many software constellations, which always breaks the same way! I would
100% blame hardware setup if things would break a little else every boot
or such...

Kind regards, Konsti

-- 
GPG KeyID EF62FCEF
Fingerprint: 13C9 B16B 9844 EC15 CC2E  A080 1E69 3FDA EF62 FCEF
