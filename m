Received: from mail-gy0-f177.google.com ([209.85.160.177])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OdjJv-0000MM-GH
	for linux-mtd@lists.infradead.org; Tue, 27 Jul 2010 12:31:44 +0000
Received: by gyf2 with SMTP id 2so1557880gyf.36
	for <linux-mtd@lists.infradead.org>;
	Tue, 27 Jul 2010 05:31:42 -0700 (PDT)
MIME-Version: 1.0
Date: Tue, 27 Jul 2010 14:31:41 +0200
Message-ID: <AANLkTikBRe_bfGC+5c9z6GVNUgPYgEW=d0=x2gaM3X7Z@mail.gmail.com>
Subject: Flashing UBI-images with nandwrite
From: Leo Barnes <barnes.leo@gmail.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello!

I have a question about how ubifs handles completely empty blocks (or
rather: is it possible to flash ubi images with nandwrite). This is
the situation:

I have created a ubifs-image from a root directory using mkfs.ubifs
and then created a ubi-image containing one dynamic volume based on
this image with ubinize. The normal way to flash images to my device
is through a bootloader which I suspect flashes the images with a tool
similar to nandwrite. This means that if I use the bootloader to flash
images, all blocks that are not filled with data will be completely
empty, as opposed to when using ubiformat which flashes in the EC
header in all blocks, even those containing no data. Should ubifs/ubi
be able to spot these blocks and assign them to the volume with the
autoresize flag set? If this should be possible, I might have stumbled
upon a bug. This is what happens:

1. Create an ubifs image with mkfs.ubifs.
2. Create an ubi image with ubinize, containing one dynamic volume
with autoresize set.
3. Clear the mtd-partition with flash_eraseall.
4. Write image to flash using nandwrite.
5. Mount ubifs-volume
6. Unmount ubifs-volume. This fails with the following debug info in
the kernel log:

<3>[  557.690704] UBI error: ubi_io_read: error -74 while reading
126976 bytes from PEB 10:4096, read 32768 bytes
<7>[  557.690948] UBIFS DBG (pid 415): dbg_check_ltab_lnum: ubi_read
failed, LEB 8, error -5
<3>[  557.691131] UBIFS error (pid 415): dbg_check_ltab: failed at LEB 8
<3>[  557.691253] UBIFS error (pid 415): do_commit: commit failed, error -5
<4>[  557.691467] UBIFS warning (pid 415): ubifs_ro_mode: switched to
read-only mode, error -5
<4>[  557.691680] [<c0330630>] (dump_stack+0x0/0x14) from [<c014030c>]
(ubifs_ro_mode+0x64/0x74)
........
<4>[  557.708282] [<c00d1e14>] (sys_umount+0x0/0x33c) from
[<c0023e80>] (ret_fast_syscall+0x0/0x2c)
<5>[  557.709411] UBIFS: un-mount UBI device 1, volume 0
<7>[  557.709625] UBIFS DBG (pid 413): ubifs_bg_thread: background
thread "ubifs_bgt1_0" stops
<7>[  557.710083] UBIFS DBG (pid 415): ubifs_umount: un-mounting UBI
device 1, volume 0

When I flash the same image using ubiformat, everything works fine.
Should it be possible to flash ubi-images using nandwrite?

Best regards,
//Leo
