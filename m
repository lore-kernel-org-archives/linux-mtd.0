Received: from cs2875-45.austin.rr.com ([24.28.75.45] helo=localhost.localdomain)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 14y3Zw-00017q-00
	for <linux-mtd@lists.infradead.org>; Fri, 11 May 2001 04:26:56 +0100
Received: from troche.org (IDENT:root@matrix [127.0.0.1])
	by localhost.localdomain (8.11.0/8.11.0) with ESMTP id f4B3Ti002409
	for <linux-mtd@lists.infradead.org>; Thu, 10 May 2001 22:29:45 -0500
Message-ID: <3AFB5CA7.A413ECCF@troche.org>
Date: Thu, 10 May 2001 22:29:43 -0500
From: Edmund Troche <edmund@troche.org>
Reply-To: edmund@troche.org
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: Errors getting JFFS to work
References: <A3E34B558F5CD211B4980008C7A4A99003163ECC@sparrow.eng.gilbarco.com>
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

Hi,

I've been following the mtd-howto instructions on how to get JFFS mounted in a
DoC, but with no luck so far, perhaps I'm missing something that might be
obvious to some of you. In a nutshell, I have a 386EX board with a 8MB DoC
2000, which I have had running with Linux 2.4.3 and the M-Systems code. I would
very much prefer to use the MTD code instead of the M-Systems code, therefore
I've been trying to get this working for the last couple of nights. The kernel
( 2.4.3) has the MTD support compiled in, no modules. When I boot it recognizes
the DoC correctly and it seems like I can ntfl_format and fdisk without
problems. The problems seems to start when I try to copy and image created with
mkfs.jffs into the mtd character device 0. Below I have attached some of the
terminal output from some of my commands. The utilities are being built from a
"util" directory that I created under my 2.4.3 kernel distribution (
/usr/src/linux/util ) according to the README in the mtd/util directory. So I
imagine my utilities are using the distribution header files. If anyone needs
some more information regarding this, please let me know and I will be happy to
provide it.


Thanks for your help.

Edmund



----------------------------- TERMINAL OUTPUT ---------------------------

/ # ./fdisk /dev/nftla

Command (m for help): p

Disk /dev/nftla: 16 heads, 1 sectors, 1020 cylinders
Units = cylinders of 16 * 512 bytes

     Device Boot    Start       End    Blocks   Id  System
/dev/nftla1             1      1020      8159+  83  Linux

Command (m for help): q

/ # cp /jffs.image /dev/mtd0
MTD_open
MTD_ioctl
Invalid ioctl 5401 (MEMGETINFO = 80204d01)
MTD_write
.......
....... (lots of MTD_write)
.......
MTD_write
ECC needs a full sector write (adr: 9de00 size 134)
MTD_close
/ # mount -t jffs /dev/mtdblock0 /mnt/jffs
mtdblock_open
ok
JFFS: Trying to mount device 1f:00.
jffs_scan_flash(): start pos = 0x0, end = 0x800000
check_partly_erased_sector():checking sector which contains offset 0x0 for
flipp
ing bits..
Kernel panic: Didn't read all bytes in flash_safe_read(). Returned 0

-----------------------------------------------------------------------
