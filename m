Received: from mail-oi0-x241.google.com ([2607:f8b0:4003:c06::241])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1blvus-0002X0-H8
 for linux-mtd@lists.infradead.org; Mon, 19 Sep 2016 10:35:15 +0000
Received: by mail-oi0-x241.google.com with SMTP id 2so11826655oif.2
 for <linux-mtd@lists.infradead.org>; Mon, 19 Sep 2016 03:34:54 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAFLxGvwsKqTVAgXyzOkjXcBmA-joyJPioD5-svhjXPU3NRi33Q@mail.gmail.com>
References: <1468961462-18082-1-git-send-email-zajec5@gmail.com>
 <CAFLxGvwsKqTVAgXyzOkjXcBmA-joyJPioD5-svhjXPU3NRi33Q@mail.gmail.com>
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Date: Mon, 19 Sep 2016 12:34:52 +0200
Message-ID: <CACna6rxRhv6dSxbdYD385310QY1kdupoCRvosP=cA-CF0u9=Lw@mail.gmail.com>
Subject: Re: [PATCH 1/2] mtd: add support for partition parsers
To: Richard Weinberger <richard.weinberger@gmail.com>
Cc: Brian Norris <computersforpeace@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 David Woodhouse <dwmw2@infradead.org>,
 open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 17 September 2016 at 12:00, Richard Weinberger
<richard.weinberger@gmail.com> wrote:
> On Tue, Jul 19, 2016 at 10:51 PM, Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail.c=
om> wrote:
>> This extends MTD subsystem by adding a support for partition parsers
>> that should be used for creating subpartitions. There are some types of
>> partitions that require splitting, like firmware containers.
>> It's common some home routers that a single firmware image gets flashed
>> to predefined partition and then we need to parse it dynamically.
>>
>> The reason for having such parsers is to share code. Right now we have
>> e.g. TRX parsing implemented in bcm47xxpart but this could be used in
>> more cases (e.g. on ramips which doesn't use bcm47xxpart or with DT).
>>
>> This implementation requires marking partition as requiring parsing with
>> a specific parser. This can be used right away with some parsers like
>> bcm47xxpart, in future we will hopefully also find a solution for doing
>> it with ofpart ("fixed-partitions").
>>
>> Signed-off-by: Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail.com>
>> ---
>> One thing I'm not proud of in this patch is struct mtd_partition casting
>> in order to be able to modify partition offset. It's marked as const so
>> it was the only way I could think of. Any better ideas? Currently parser
>> gets a single MTD and it doesn't have to deal with its offset, which I
>> kind of like as it simplifies things.
>
> I have to admit, I don't fully understand what you are trying to solve.
> Why are you introducing a new concept of partition parsing in patch 2/2?
> We have already one.
>
> Are you unhappy with the way parsers are _requested_?
> Currently MTD core tries cmdlinepart and ofpart, drivers can override tha=
t.
> Do you need a way to request a parser via DT or cmdline?

Actually I'm introducing a new concept in 1/2, the later 2/2 just adds
a first case using it.

Yes, I need parser(s) that can be requested in a slightly different
way. I didn't need to change parsers design (you can see my PATCH 2/2
uses standard struct mtd_part_parser). I just needed a way to call a
parser for a specified partition.

I'm working on a standalone TRX parser. Right now I need to request it
from bcm47xxpart. I need this as ramips arch will need TRX support as
well and I don't want to duplicate TRX support code.

In the future I'd like to use TRX from ofpart as well. I was hoping to
work on support for something like this:
partitions {
        compatible =3D "fixed-partitions";
        #address-cells =3D <1>;
        #size-cells =3D <1>;

        partition@0 {
                label =3D "bootloader";
                reg =3D <0x00000 0x40000>;
        };

        partition@40000 {
                label =3D "firmware";
                format =3D "trx";
                reg =3D <0x40000 0x1fb0000>;
        };

        partition@1ff0000 {
                label =3D "nvram";
                reg =3D <0x1ff0000 0x10000>;
        };
};

--=20
Rafa=C5=82
