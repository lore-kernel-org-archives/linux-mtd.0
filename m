Received: from rwcrmhc52.attbi.com ([216.148.227.88])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18ecmJ-0004hJ-00
	for <linux-mtd@lists.infradead.org>; Fri, 31 Jan 2003 15:08:27 +0000
Message-ID: <3E3A9B1F.F97D9D28@mvista.com>
Date: Fri, 31 Jan 2003 10:49:51 -0500
From: "George G. Davis" <gdavis@mvista.com>
MIME-Version: 1.0
To: Holger Schurig <h.schurig@mn-logistik.de>
CC: linux-mtd@lists.infradead.org
Subject: Re: mkfs.jffs2 buggy?
References: <200301311531.30295.h.schurig@mn-logistik.de>
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
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

Holger Schurig wrote:
> 
> When I compile mkfs.jffs2 from CVS HEAD, I get the following errors:
> 
> mkfs.jffs2.c: In function `write_regular_file':
> mkfs.jffs2.c:823: incompatible types in assignment
> mkfs.jffs2.c: In function `write_symlink':
> mkfs.jffs2.c:925: incompatible types in assignment
> mkfs.jffs2.c: In function `write_pipe':
> mkfs.jffs2.c:967: incompatible types in assignment
> mkfs.jffs2.c: In function `write_special_file':
> mkfs.jffs2.c:1007: incompatible types in assignment
> 
> Anyway, I somehow got it working, I think with a some older version.
> 
> $ mkfs.jffs2 -d rootfs -p 262144 -e 262144 -o /tftpboot/bdi/root.jffs2
> 
> and flash the result with
> 
> $ burner.py /tftpboot/bdi/root.jffs 0x140000
> ...
> 00440000: burning 262144 bytes to flash
> 00480000: reading 262144 bytes from flash (68.4 %)
> 00480000: erase flash
> 00480000: burning 262144 bytes to flash
> 004c0000: reading 262144 bytes from flash (73.7 %)
> 004c0000: erase flash
> 004c0000: burning 262144 bytes to flash
> 00500000: reading 262144 bytes from flash (78.9 %)
> 00500000: erase flash
> 00500000: burning 262144 bytes to flash
> ...
> 
> I get a strange error. Immediately after the flashing, I pressed reset and
> booted into Linux. Then I see:
> 
> Probing flash at physical address 0x00000000 (32-bit buswidth)
> Using buffer write method
> Using static partition definition
> Creating 3 MTD partitions on "Flash":
> 0x00000000-0x00040000 : "Bootloader"
> 0x00040000-0x00140000 : "Kernel"
> 0x00140000-0x02000000 : "Filesystem"
> ...
> NET4: Unix domain sockets 1.0/SMP for Linux NET4.0.
> NetWinder Floating Point Emulator V0.95 (c) 1998-1999 Rebel.com
> ffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x004c0000: 0x6574

'At'

> instead
> jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x004c0004: 0x665f

'b_'

> instead
> jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x004c0008: 0x6873

'hs'

> instead
> jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x004c000c: 0x3030

'00'

> instead
> jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x004c0010: 0x3030

'00'


Hmm, is that interesting or merely a coincidence?

--
Regards,
George


> instead
> JFFS2: Erase block at 0x004c0000 is not formatted. It will be erased
> 
> Shouldn't a sector that has been freshly created by mkfs.jffs2 have the right
> ID?
> 
> So, I re-flashed it again and looked at this address. At physically 0x4c0000 I
> see
> 
> $ telnet bdi
> bdi>mdb 0x004c0000
> 004c0000 : 85 19 03 20 0c 00 00 00  ... ....
> 004c0008 : b1 b0 1e e4 85 19 02 e0  ........
> 004c0010 : 03 09 00 00 16 a0 e5 91  ........
> 004c0018 : cb 02 00 00 38 00 00 00  ....8...
> 004c0020 : ed 81 00 00 00 00 00 00  ........
> 004c0028 : 24 1d 06 00 08 40 c3 3b  $....@.;
> 004c0030 : 08 40 c3 3b 08 40 c3 3b  .@.;.@.;
> 004c0038 : 00 70 03 00 bf 08 00 00  .p......
> 
> ... and that looks like a valid ID.
> 
> And also in root.fs at file offset 0x380000 = 3670016 I can see this.
> 
> Am I doing something wrong?  Maybe confusing physical and virtual addressed?
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
