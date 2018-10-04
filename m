Received: from mail-qt1-x82f.google.com ([2607:f8b0:4864:20::82f])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g86rk-0001xS-Mw
 for linux-mtd@lists.infradead.org; Thu, 04 Oct 2018 16:52:46 +0000
Received: by mail-qt1-x82f.google.com with SMTP id c56-v6so10614461qtd.11
 for <linux-mtd@lists.infradead.org>; Thu, 04 Oct 2018 09:52:33 -0700 (PDT)
MIME-Version: 1.0
From: Romain Izard <romain.izard.pro@gmail.com>
Date: Thu, 4 Oct 2018 18:52:21 +0200
Message-ID: <CAGkQfmN6PguBRdL68ZRuOEgC2GWEW4-XxeE3=7epLGODTqHqeQ@mail.gmail.com>
Subject: Nandsim, UBIFS and memory concerns
To: linux-mtd <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On a regular but slow basis, I get report of devices based on UBIFS running
Linux 4.14 where the file system gets corrupted during an update. The update
process creates new files with temporary names to replace existing files,
and uses renames to replace these files atomically. What is observed is that
in some cases, the update log describes all steps for a complete update, and
yet some files contain the new version while others contain an older
version. Moreover, it seems that some files with temporary names that should
have been renamed are visible.

As the update process is also able to use tmpfs to create files, and will
use a large part of the available memory, I fear that this issue is related
with the behaviour of UBIFS in low memory conditions. I'm wondering about
UBIFS losing some parts of the log when a ENOMEM condition occurs during its
operations or when the OOM killer targets a process that is doing some UBIFS
processing.

To study this more easily, I started to create a QEMU image to be able to
easily test these conditions. While QEMU has a small MTD emulation support,
it will not work with x86 machines; but those run much faster than emulated
architectures, so I decided to use nandsim instead.

Starting from the qemu_x86_64_defconfig in Buildroot v2018.08, I have
modified the kernel configuration to add support for MTD, NAND flash,
Nandsim, UBI and UBIFS; the whole system was inserted as an initramfs
without modules in the kernel image to keep things simple; ttyS0 is also
selected as the default port for getty.

The command line used to start QEMU is:

qemu-system-x86_64 -nographic -m 64M -M q35 \
  -kernel output-x86/images/bzImage \
  -drive file=mtdfile.bin,if=virtio,format=raw \
  -net nic,model=virtio -net user \
  -append 'nandsim.id_bytes=0x20,0xaa,0,0x15
nandsim.cache_file=/dev/vda console=ttyS0'

The "mtdfile.bin" is a 256 MiB + 8 MiB file, with the same size as the NAND
flash chip described by the ID bytes. From the documentation and the code, I
expected that all accesses to the NAND would be simulated as read and writes
to this file through the /dev/vda device. But what I observe is that the
file is not touched when calling "ubiattach -m0", when observed from within
or from without QEMU.

Here, I am quite confused, as the use by nandsim of filp_open, kernel_read
and kernel_write look quite normal, and I do not see why the accesses are
only happening in RAM (as otherwise it would not possible to use UBI on
nandsim at all) but do not end up on the disk. When enabling the nandsim
debug traces, I can observe traces that match the cache_file mode.

As an additional effect of this, the memory for the system is very quickly
consumed by nandsim, and it makes it difficult to work with UBIFS to analyse
my original problem.

My questions are the following:
- Has UBIFS been tested in low memory conditions? Is there a suitable test
  suite to verify that everything works correctly?
- Is the nandsim file mode working as expected?  What can I do to be sure
  that the read and writes are committed to the file?

Best regards,
-- 
Romain Izard
