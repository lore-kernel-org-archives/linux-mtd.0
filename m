Received: from mail-lf0-x235.google.com ([2a00:1450:4010:c07::235])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1buJGi-0000Kw-6j
 for linux-mtd@lists.infradead.org; Wed, 12 Oct 2016 13:08:25 +0000
Received: by mail-lf0-x235.google.com with SMTP id b81so74146232lfe.1
 for <linux-mtd@lists.infradead.org>; Wed, 12 Oct 2016 06:08:02 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CABatt_zSUbwETQwD5-yJmzH8JvbdLfBXK9V3XnMZw6HmZ2+=7w@mail.gmail.com>
References: <CABatt_xjhTpaUitXP_az+cOFEVA=eUedayFggrrH=Z7ZdBWUYg@mail.gmail.com>
 <CAFLxGvx9bnh6z1hkMXzdvynBOdDca6HJziEKG5pH95e+Ttaa8Q@mail.gmail.com>
 <CABatt_wMSQd7Tc=gP0rO53UghqjdaTonFFj4R_qu8zFJyfyz3A@mail.gmail.com>
 <573C4033.6010906@nod.at>
 <CABatt_wF4Vb0R=xiQapY4Q1ieBJ7Sjcvg3XXsE6QxWrACwchgw@mail.gmail.com>
 <573EC17D.40809@nod.at>
 <CABatt_wQfDFN4U5SgOLrcxWNiZYVRQ4eGy1LQmdRJJN-qncUHw@mail.gmail.com>
 <CABatt_zj+0Vr9PjM64VMYk-Gx+UGW-Xo6vJFNLJ1DsPNm0LPHQ@mail.gmail.com>
 <574360B5.1040505@nod.at>
 <CABatt_xRU57kp1gWwS+gNbSM7_j=ZWAZnQqZ_gjhSGV-+ytMEA@mail.gmail.com>
 <57441937.9070302@nod.at>
 <CABatt_w4qzj9sqn9gQPMYe7c5y9hPCUws5QJNK_q6Kz+mMuMbw@mail.gmail.com>
 <57444876.7090405@nod.at>
 <CABatt_zXcp59i+6AYo=BuSYYQu-cP==r5V5jFOruUcoHeKGrfg@mail.gmail.com>
 <57445A52.3010704@nod.at>
 <CABatt_xe6SEmsSLfSrbC2LNv6WTK=Ltkj8ZqLja+pHXqMqSv-g@mail.gmail.com>
 <57448675.9010904@nod.at>
 <CABatt_zSUbwETQwD5-yJmzH8JvbdLfBXK9V3XnMZw6HmZ2+=7w@mail.gmail.com>
From: Martin Townsend <mtownsend1973@gmail.com>
Date: Wed, 12 Oct 2016 14:07:59 +0100
Message-ID: <CABatt_yZvNUDVsE9PNztv+fgaTq-JfV0SRm224Y3Uq+T=k4zPQ@mail.gmail.com>
Subject: Re: UBIFS assert when rebooting a read only ubifs when it's been
 remounted r/w
To: Richard Weinberger <richard@nod.at>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Richard,

On Wed, May 25, 2016 at 9:04 AM, Martin Townsend
<mtownsend1973@gmail.com> wrote:
> On Tue, May 24, 2016 at 5:51 PM, Richard Weinberger <richard@nod.at> wrote:
>> Am 24.05.2016 um 16:12 schrieb Martin Townsend:
>>> aaarrgh, sums my day up so far, try this one, I've just tested and at
>>> least it started downloading the file.
>>> http://tempsend.com/32760A445F
>>
>> That worked.
>> Can you please share your NAND id bytes or the flash geometry?
>>
> This should be the part, it's the 4Gbit device.
> https://www.micron.com/parts/nand-flash/mass-storage/mt29f4g08abadawp
> Page size x8: 2112 bytes (2048 + 64 bytes)
> Block size: 64 pages (128K + 4K bytes)
> Plane size: 2 planes x 2048 blocks per plane
> Device size: 4Gb: 4096 blocks
>
> - Martin.
>> Thanks,
>> //richard

I know many months have passed but I'm looking back into the UBIFS
assert that keeps occurring on our board. We have since moved over to
4.1 LTSI kernel and the problem still occurs. Did you manage to
reproduce this assert with the image I sent or has there has been a
patch submitted recently that may fix this, or if not I'm happy to put
some more printk's in to get some more analysis if the image does show
the problem.

The original assert was

[    4.077496] [<c0013550>] (show_stack) from [<c05f4428>]
(dump_stack+0x20/0x28)
[  OK  ] Started Journal Service.
[    4.099269] [<c05f4408>] (dump_stack) from [<c029ba8c>]
(ubifs_remount_fs+0x558/0x800)
[    4.107743] [<c029b534>] (ubifs_remount_fs) from [<c013dd70>]
(do_remount_sb+0x6c/0x1d8)
[    4.121587]  r9:ee112c40 r8:00000000 r7:00000000 r6:00000000
r5:00000000 r4:ee112c00
[    4.129451] [<c013dd04>] (do_remount_sb) from [<c015d1f8>]
(do_mount+0x810/0xcb0)
[    4.151530]  r8:00000021 r7:ee112c00 r6:ee05c850 r5:00000060 r4:00000000
[    4.158342] [<c015c9e8>] (do_mount) from [<c015da1c>] (SyS_mount+0x9c/0xc8)
[    4.181549]  r10:00000000 r9:ee2ba000 r8:c0ed0021 r7:7f5ed788
r6:00000000 r5:ee2d5480
[    4.189471]  r4:ee2d5440
[    4.208415] [<c015d980>] (SyS_mount) from [<c000f8e0>]
(ret_fast_syscall+0x0/0x3c)
[    4.221613]  r8:c000fa84 r7:00000015 r6:7f5ed778 r5:00000000 r4:00000000

Cheers, Martin.
