Received: from mail-lb0-x22a.google.com ([2a00:1450:4010:c04::22a])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1b5ToK-0006zy-Rx
 for linux-mtd@lists.infradead.org; Wed, 25 May 2016 08:05:01 +0000
Received: by mail-lb0-x22a.google.com with SMTP id k7so12989825lbm.0
 for <linux-mtd@lists.infradead.org>; Wed, 25 May 2016 01:04:39 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <57448675.9010904@nod.at>
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
Date: Wed, 25 May 2016 09:04:38 +0100
Message-ID: <CABatt_zSUbwETQwD5-yJmzH8JvbdLfBXK9V3XnMZw6HmZ2+=7w@mail.gmail.com>
Subject: Re: UBIFS assert when rebooting a read only ubifs when it's been
 remounted r/w
From: Martin Townsend <mtownsend1973@gmail.com>
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

On Tue, May 24, 2016 at 5:51 PM, Richard Weinberger <richard@nod.at> wrote:
> Am 24.05.2016 um 16:12 schrieb Martin Townsend:
>> aaarrgh, sums my day up so far, try this one, I've just tested and at
>> least it started downloading the file.
>> http://tempsend.com/32760A445F
>
> That worked.
> Can you please share your NAND id bytes or the flash geometry?
>
This should be the part, it's the 4Gbit device.
https://www.micron.com/parts/nand-flash/mass-storage/mt29f4g08abadawp
Page size x8: 2112 bytes (2048 + 64 bytes)
Block size: 64 pages (128K + 4K bytes)
Plane size: 2 planes x 2048 blocks per plane
Device size: 4Gb: 4096 blocks

- Martin.
> Thanks,
> //richard
