Received: from mail1.danielvalve.com ([12.19.96.6] helo=mail1.danielind.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15AC30-00038Q-00
	for <linux-mtd@lists.infradead.org>; Wed, 13 Jun 2001 15:55:06 +0100
Message-ID: <3B27809B.FA5183@daniel.com>
Date: Wed, 13 Jun 2001 10:02:52 -0500
From: Vipin Malik <vipin.malik@daniel.com>
MIME-Version: 1.0
To: Xavier DEBREUIL <xde@inventel.fr>
CC: linux-mtd@lists.infradead.org
Subject: Re: root jffs2
References: <3B273827.33CC03BB@inventel.fr>
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
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

I read the messages where you solved this problem, but let me add a side
note just for future reference:

JFFS can *NOT* be mounted on a device that has either 1. Not been erased OR
2. Not been initialized with
a JFFS image (using the external tool).

That is why it finds all those "dirty" sectors and no free space.

On the other hand, JFFS2 *can* be mounted on a device that has not been
initialized. It will detect the
"dirty" sectors and just format them- resulting in a blank fs the first
time you mount it.

This also means that if you accidentally mount a JFFS2 fs on a device that
has an existing JFFS fs on it
it will format the entire device- without warning!

Vipin





Xavier DEBREUIL wrote:

> I have managed to mount the jffs2 as root filesystem (yes I know many
> did it but I encountered problems here and there...)
> Nevertheless, some kernel messages are a little amazing :
>
> (root=1F01 and not root=/dev/mtdblock1...)
>
> ...
> root_device_name : 1F01
> mtdblock_open
> ok
> mtdblock: read on "cramfs partition" at 0x400, size 0x400
> mtdblock: read on "cramfs partition" at 0x0, size 0x1000
> mtdblock: read on "cramfs partition" at 0x1000, size 0x1000
> mtdblock: read on "cramfs partition" at 0x2000, size 0x1000
> mtdblock: read on "cramfs partition" at 0x3000, size 0x1000
> wrong magic
> JFFS: Trying to mount device 1f:01.
> jffs_build_fs()
> jffs_create_control()
> jffs_scan_flash(): start pos = 0x0, end = 0x300000
> check_partly_erased_sector():checking sector which contains offset 0x0
> for flipping bits..
> check_partly_erased_sector():checking sector which contains offset
> 0x1000 for flipping bits..
> ...
> blahblah...
> ...
> check_partly_erased_sector():Done checking all sectors till offset
> 0x300000 for flipping bits.
> *************** Dirty flash memory or bad inode: hexdump(pos = 0x0, len
> = 128):
> 0: 8519 02e0 4400 0000 1dfb f798 0100 0000  ...àD....û÷.....
> 16: 0100 0000 ed41 0000 f501 f501 0000 0000  ....íA..õ.õ.....
> 32: de1d 1d3b 4228 263b 4228 263b 0000 0000  Þ..;B(&;B(&;....
> 48: 0000 0000 0000 0000 0000 0000 0000 0000  ................
> 64: 3c72 4031 8519 01e0 2b00 0000 e66e 267d  <r@1...à+...æn&}
> 80: 0100 0000 0200 0000 0200 0000 4228 263b  ............B(&;
> 96: 0304 0000 5f5a ae8b dee2 4e56 6c69 62ff  ...._Z®.ÞâNVlibÿ
> 112: 8519 02e0 4400 0000 1dfb f798 0200 0000  ...àD....û÷.....
> jffs_scan_flash(): 0xffffffff at pos 0x11afc.
> jffs_scan_flash():0xffffffff ended at pos 0x11b00.
> Dirty space: Starting 0x11afc for 0x4 bytes
> *************** Dirty flash memory or bad inode: hexdump(pos = 0x11b00,
> len = 128):
> 72448: 8519 01e0 3100 0000 1dd9 8242 0200 0000  ...à1....Ù.B....
> 72464: 0900 0000 0a00 0000 eb1d 1d3b 090a 0000  ........ë..;....
> ...
>
> seems that many things are dirty though I have never mounted it
> before...
>
> ...
> jffs_scan_flash(): 0xffffffff at pos 0x2e000c.
> jffs_scan_flash():0xffffffff ended at pos 0x300000.
> Free space (#24) found but *Not* accepted: Starting 0x2e000c for 0x1fff4
> bytes
> Dirty space: Starting 0x2e000c for 0x1fff4 bytes
> jffs_scan_flash(): Did not find even a single chunk of free space. This
> is BAD!
> jffs_scan_falsh():Free size accounting screwed
> jfffs_scan_flash():free_chunk_size1 == 0x300000, free_chunk_size2 ==
> 0x0, fmc->free_size == 0x0
> jffs_cleanup_control()
> ----> !!!!!
> ----> JFFS: Failed to mount device 1f:01.
> ----> VFS: Mounted root (jffs2 filesystem) readonly.
> ----> !!!!!
> Freeing init memory: 48K
> serial console detected.  Disabling virtual terminals.
> init started:  BusyBox v0.51 (2001.06.05-17:42+0000) multi-call binary
>
> So, on the one hand, it indicates that it failed to mount the device on
> 1F01 but afterwards, it managed to mount the jffs2 filesystem as root
> fs. Is it a known behaviour or do I have to modify some parameters ?
>
> Xavier
> 
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
