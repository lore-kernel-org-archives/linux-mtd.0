Received: from mail.kmu-office.ch ([2a02:418:6a02::a2])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zqpl7-0002NQ-A0
 for linux-mtd@lists.infradead.org; Mon, 26 Oct 2015 21:56:54 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Date: Mon, 26 Oct 2015 14:55:26 -0700
From: Stefan Agner <stefan@agner.ch>
To: richard.weinberger@gmail.com
Cc: linux-mtd@lists.infradead.org, U-Boot <u-boot@lists.denx.de>
Subject: Monster boot
Message-ID: <02c03a72e96d41b4c40e60efee4fd988@agner.ch>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Richard,

Just looked through the slides of your ELCE talk "Current challenges in
UBIFS". I would like to elaborate the issues wrt moster boot. I did not
attend the talk (sorry) and also was not able to find a video of it so
far, hence I don't know what has been said at the talk... So, the last
slide says:

* Don’t boot from UBIFS
* Your boot loader does not have to know UBIFS nor have full UBI support
* Use static volumes, you can read out a static UBI volume with 100 LoC
* Thomas Gleixner sent patches for u-boot

Can you elaborate why you disadvise booting from UBIFS?

Here is my analysis on that:

We switched to "monster boot" approach about one year ago. On the plus
side, U-Boot had already UBIFS read support and it works. Beside that,
it is basically the standard boot mode for distros on PC-like systems
(GRUB is able to read the kernel from a ext2/ext3 formatted /boot
partition, UEFI reads EFI boot loaders or the kernel with the EFI stub
from FAT partitions directly).

I see the obvious pain point: It makes the boot loader much more
complex... After all, we had some issues lately, especially with Fastmap
(e.g. PEB leaks). However, one thing was related to a driver issue, and
after backporting some Fastmap patches from Linux, Fastmap in U-Boot
seems to be stable now. Anyway, since these issues were within the
U-Boot UBI stack (and below), we would probably would have run into them
even when using static volumes (assuming using the full UBI stack of
U-Boot). But likely not if we would have used the minimal static volume
approach of Thomas Gleixner.... On the other hand, we did not had any
problems with the UBIFS part so far...
A fallback boot scheme is possible with UBIFS (just have a spare kernel
ready) but it suffer from the huge stack...

Another disadvantage with monster boot is that we can't replace the
kernel from U-Boot currently since there is no UBIFS write support,
however that is not really a problem.

On the advantage side, we do not loose any space (we would likely have
to create a larger than necessary Kernel volume to reserve some space in
case customers want to load a bigger kernel). And we can use one UBIFS
image for multiple modules (multiple device tree in /boot).

I also did some rough performance measurements, and it seems that the
overhead of mounting the UBIFS is not all that huge:
UBI Attach (without Fastmap): 1.57s
UBI Attach (with Fastmap): 0.25s
UBIFS Mount: 0.06s
Load kernel from FS: 380ms
Load DT from FS: 9ms

However, it seems that reading from UBIFS is somewhat slower compared to
reading from static volumes:
Load kernel from UBI 4.5MB: 316ms
Load kernel from UBI 24kB: 6ms

I used the size argument of the ubi read command to avoid reading the
whole static volume. This is somewhat ugly to handle since the size need
to be stored in environment variables... I am consider implementing a
bootubi command which would read only the effective size for a kernel,
device tree or initramfs by making use of the individual file headers.

I would be glad if you could comment whether I miss anything...

--
Stefan
