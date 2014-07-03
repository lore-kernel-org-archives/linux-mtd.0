Received: from mail-lb0-f173.google.com ([209.85.217.173])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1X2flB-0003ET-DC
 for linux-mtd@lists.infradead.org; Thu, 03 Jul 2014 12:05:05 +0000
Received: by mail-lb0-f173.google.com with SMTP id s7so77214lbd.18
 for <linux-mtd@lists.infradead.org>; Thu, 03 Jul 2014 05:04:39 -0700 (PDT)
MIME-Version: 1.0
Date: Thu, 3 Jul 2014 14:04:39 +0200
Message-ID: <CANdawSFXV7irURe37uejLd+WUSyMEJirsYam9mxrozvQPR2i0g@mail.gmail.com>
Subject: MTD traces on operation with filesystem
From: Joaquim Duran <jduran.gm@gmail.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Dear all,

My name is Joaquim Duran. We're using Linux to develop and embedded
device (linux v3.0 on an ARM device based on DM37x with flash). We've
some stability problem with the flash contents, so we would like to
trace the write operations to flash.

To print traces, we've changed the variable 'mtd_debug_verbose' to
0x7. With this configuration, we get traces when we access to the
flash when using the /dev/mtdblockX' device file, like:

dd if=uImage of=/dev/mtdblock3 bs=131072
[...]
[ 107.481018] mtdblock: write on "kernel" at 0x362c00, size 0x200
[ 107.487182] mtdblock: write on "kernel" at 0x362e00, size 0x200
[ 107.493438] mtdblock: write on "kernel" at 0x363000, size 0x200
[ 107.499664] mtdblock: write on "kernel" at 0x363200, size 0x200
[ 107.505859] mtdblock: write on "kernel" at 0x363400, size 0x200
[ 107.512084] mtdblock: write on "kernel" at 0x363600, size 0x200
[ 107.518280] mtdblock: write on "kernel" at 0x363800, size 0x200
[ 107.524475] mtdblock: write on "kernel" at 0x363a00, size 0x200
[ 107.530700] mtdblock: write on "kernel" at 0x363c00, size 0x200
[ 107.537017] mtdblock: write on "kernel" at 0x363e00, size 0x200
[ 107.543334] mtdblock: write on "kernel" at 0x364000, size 0x200
[...]

but not if I do write operation using the file system:

dd if=/dev/urandom of=test.txt bs=1024 count=4096

Maybe should I flush the MTD cache? How can I get the traces?

Thanks and Best Regards,

Joaquim Duran
