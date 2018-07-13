Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fe4rE-0008GR-L2
 for linux-mtd@lists.infradead.org; Fri, 13 Jul 2018 20:40:06 +0000
Received: by mail-wr1-x42f.google.com with SMTP id h10-v6so26278533wre.6
 for <linux-mtd@lists.infradead.org>; Fri, 13 Jul 2018 13:39:53 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <b90d2024-6b20-7b94-65f8-d5e1547ab001@lassacher.co.at>
References: <b90d2024-6b20-7b94-65f8-d5e1547ab001@lassacher.co.at>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Fri, 13 Jul 2018 22:39:51 +0200
Message-ID: <CAFLxGvyrm6rqOVV1U70A9DXgpzSRqdCQYjeci7gZB7bzrGOZNg@mail.gmail.com>
Subject: Re: Writing to UBIFS leads to all threads accessing files are stuck
 in nand_get_device
To: Sebastian Lassacher <sebastian@lassacher.co.at>
Cc: "linux-mtd @ lists . infradead . org" <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Sebastian,

On Fri, Jul 13, 2018 at 1:04 PM, Sebastian Lassacher
<sebastian@lassacher.co.at> wrote:
> Hi there,
>
> I ran into troubles when writing files on an UBIFS volume.
> This happens on three different systems with similar conditions.
> Since they where installed on customer sides I'm not sure what caused
> the problems in the first place.
> My theory is that all three suffered from a power cut.
>
> As reported by the command df there should be enough space:
> Filesystem                Size      Used Available Use% Mounted on
> none                     26.5M         0     26.5M   0% /dev
> ubi0:root               441.6M    101.4M    340.2M  23% /mnt/images
>
> But when I write to to the UBIFS, some processes get stuck, for instance:
> From ash inside an initramfs those commands working fine and no errors
> are reported:
> $ mount -t ubifs -o noatime,nodiratime,chk_data_crc ubi0:root /mnt/images
> $ ls -l /mnt/images/test
> $ dd if=/dev/urandom of=/mnt/images/test/urandom_1k bs=1k count=1
>
> After a few minutes I ran to be sure the the background sync has already
> started:
> $ ls -l /mnt/images/test
> and it did not return which later on got me this:
> [  480.130000] INFO: task ls:149 blocked for more than 120 seconds.
> [  480.130000]       Not tainted 4.4.66-SEM #15
> [  480.140000] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs"
> disables this message.
> [  480.140000] ls              D c044cc28     0   149      1 0x00000000
> [  480.150000] Backtrace:
> [  480.150000] [<c044ca14>] (__schedule) from [<c044cf9c>]
> (schedule+0xa0/0xb8)
> [  480.160000]  r10:c2312000 r9:c25b9aa8 r8:c22b4a98 r7:00000015
> r6:ffffe000 r5:c20fa818
> [  480.170000]  r4:c25b8000
> [  480.170000] [<c044cefc>] (schedule) from [<c02e5ec8>]
> (nand_get_device+0xf8/0x110)
> [  480.180000]  r5:c20fa818 r4:c22b4a90
> [  480.180000] [<c02e5dd0>] (nand_get_device) from [<c02ea410>]
> (nand_read+0x28/0x84)
> [  480.190000]  r9:00000000 r8:01400000 r7:00000000 r6:08c06000
> r5:c25b9af4 r4:c20fab70
> [  480.200000] [<c02ea3e8>] (nand_read) from [<c02df6fc>]
> (part_read+0x50/0x88)
> [  480.200000]  r7:000001e0 r6:00000000 r5:00000000 r4:c2312000
> [  480.210000] [<c02df6ac>] (part_read) from [<c02dcca0>]
> (mtd_read+0x6c/0xa4)
> [  480.220000]  r9:00000000 r8:07806000 r6:00000043 r5:00000000 r4:173fa000
> [  480.220000] [<c02dcc34>] (mtd_read) from [<c02dcd28>]
> (mtd_read_slc_mode+0x50/0xe0)
> [  480.230000]  r10:c25b9c24 r9:00000000 r8:07806000 r7:000001e0
> r6:00000043 r5:00000043
> [  480.240000]  r4:c2312000
> [  480.240000] [<c02dccd8>] (mtd_read_slc_mode) from [<c02fe8fc>]

Huh?
This function is not part of mainline.

Does the problem also arise on a pristine kernel?

-- 
Thanks,
//richard
