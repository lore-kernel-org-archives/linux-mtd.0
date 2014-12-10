Received: from mail-vc0-x232.google.com ([2607:f8b0:400c:c03::232])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Xyeh9-00081o-2i
 for linux-mtd@lists.infradead.org; Wed, 10 Dec 2014 10:40:36 +0000
Received: by mail-vc0-f178.google.com with SMTP id hq11so1255026vcb.37
 for <linux-mtd@lists.infradead.org>; Wed, 10 Dec 2014 02:40:11 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <loom.20141210T102753-582@post.gmane.org>
References: <loom.20141210T102753-582@post.gmane.org>
Date: Wed, 10 Dec 2014 11:40:11 +0100
Message-ID: <CAFLxGvwqdi6T9zg_QH5Uw3D7R0dUPbX0G-7wDX6p47RBWoSdFw@mail.gmail.com>
Subject: Re: UBI errors when "ls -l"
From: Richard Weinberger <richard.weinberger@gmail.com>
To: Yan <ykong@sierrawireless.com>
Content-Type: text/plain; charset=UTF-8
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Dec 10, 2014 at 10:34 AM, Yan <ykong@sierrawireless.com> wrote:
> My Kernel version is:
> Linux swi-mdm9x15 3.4.91-yocto-standard #7 PREEMPT Wed Dec 10 17:39:02 HKT 2014
> armv7l GNU/Linux

Is this a vanilla kernel or does it carry tons of vendor patches?

> I am trying to mount ubifs. It seems mount ubifs image successfully, but when
> access ubifs, it will print out lots of error msgs.
> This is steps I do:
> (1)make ubifs.image. I make ubifs image from *.conf (I tried use "mkfs.ubifs"
> and "ubinize" to make image directly, the same error msgs ).
> IMAGE_FSTYPES += "ubi"
> MKUBIFS_ARGS = "-m 4096 -e 253952 -c 2047"
> UBINIZE_ARGS = "-m 4096 -p 256KiB -s 4096"
>
> (2)mount ubifs In Linux shell.
> mkdir -p /mnt/ubifs
> flash_erase /dev/mtd3 0 0 -N
> dd if=/mnt/flash/ubi.img of=/dev/mtd3 bs=4096

Please use ubi tools to flash the image.
(dd should work, but just in case...)

> ubiattach /dev/ubi_ctrl -m 3 -O 4096

Why do you need -O?
Looks fishy.

> ubiblkvol -a /dev/ubi0_0
> mount -t ubifs ubi0:swi-mdm9x15-rootfs /mnt/ubifs
>
> (3)After step (2), ubifs can be mounted successfully. But when I access ubifs,
> such as when I input "ls", it will show lots of error msgs. But after printing
> out error msgs, finally it will show directory.
> By the way, I tried to use nandsim to debug the ubi image in Ubuntu, it is OK.
> I think there is something wrong in Kernel configuration.
> Could you please help me? Thank you very much!
> Error msgs and Kernel configuration attached.
>
> error msgs:
> [ 1126.270349] UBI assert failed in ubi_io_read at 213 (pid 427)

What is line 213 in your drivers/mts/ubi/io.c?

-- 
Thanks,
//richard
