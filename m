Received: from mail-we0-x22a.google.com ([2a00:1450:400c:c03::22a])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UcuaA-0006m1-4h
 for linux-mtd@lists.infradead.org; Thu, 16 May 2013 09:34:42 +0000
Received: by mail-we0-f170.google.com with SMTP id u54so2598880wes.1
 for <linux-mtd@lists.infradead.org>; Thu, 16 May 2013 02:34:20 -0700 (PDT)
MIME-Version: 1.0
Sender: jphilippe.francois@gmail.com
In-Reply-To: <20980858CB6D3A4BAE95CA194937D5E73E9C4F04@DBDE04.ent.ti.com>
References: <1368684720-26763-1-git-send-email-pekon@ti.com>
 <1368684720-26763-3-git-send-email-pekon@ti.com>
 <CAGGh5h16kxdPRtPQ4vRzLA4iMxjTurPpdzBiEHaM9zb+y8fJBg@mail.gmail.com>
 <20980858CB6D3A4BAE95CA194937D5E73E9C4EC5@DBDE04.ent.ti.com>
 <CAGGh5h3WGGRcQgpns7EOso1yqvrzKmCAbQo9XZoMyhv0Q1KT4Q@mail.gmail.com>
 <20980858CB6D3A4BAE95CA194937D5E73E9C4F04@DBDE04.ent.ti.com>
Date: Thu, 16 May 2013 11:34:20 +0200
Message-ID: <CAGGh5h2TWvf+N0gRxQQX8KHav4qwxa=BDHuYYa9f49rmQCKMUw@mail.gmail.com>
Subject: Re: [PATCH 2/2] ARM: OMAP2+: cleaned-up DT support of various ECC
 schemes
From: jean-philippe francois <jp.francois@cynove.com>
To: "Gupta, Pekon" <pekon@ti.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: "arnd@arndb.de" <arnd@arndb.de>, Tony Lindgren <tony@atomide.com>, "Balbi,
 Felipe" <balbi@ti.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

2013/5/16 Gupta, Pekon <pekon@ti.com>:
>
>> 2013/5/16 Gupta, Pekon <pekon@ti.com>:
>> >> >
>> >>
>> >> OMAP_ECC_BCH4_CODE_HW_DETECTION_SW and
>> >> OMAP_ECC_BCH4_CODE_HW
>> >> seems to exist in the code, but are not in the changelog, and not in
>> >> the device tree binding documentation.
>> >>
>> >
>> > Yes, I plan to omit them from code also, in next series as it does not
>> > make sense to support both BCH4 and BCH8 at same time, when most
>> > users would opt for BCH8.
>> > Also, BCH4 was kept for legacy purposes, and was not tested on all
>> devices.
>> > Therefore I have purposely omitted it from documentation.
>> >
>>
>> We have shipped devices with BCH4 nand.  This would be a regression
>> for us.
>>
> [Pekon]: May I know the following details so that I can prioritize BCH4 t=
esting
> - Which TI device have you productized ?

dm3730

> - Which kernel version you are using ? (Is it from mainline or SDK releas=
e)

3.6.11, currently moving to 3.9

> - Which BCH4 ECC implementation you are using ?
>         BCH4_HW (using both GPMC and ELM H/W engines)
>         BCH4_HW_DETECTION_SW (using GPMC H/W and bch.h S/W libraries)

I guess it is BCH4_HW_DETECTION_SW. Here is the relevant part of the
machine board file patch :

+static struct omap_nand_platform_data cydm_nand_data =3D {
+     .cs =3D 0,
+     .ecc_opt =3D OMAP_ECC_BCH4_CODE_HW,
+};



> - Is there a specific reason why        you opted for BCH4 instead of BCH=
8 ?
>         (Though its only recent that OMAP_ECC_BCHx support is mainlined
>         But, BCH8 support was available in TI SDK releases from quite som=
etime.)
>

No, I figured BCH4 was sufficient for my nand. In fact my previous ecc
scheme (1 bit hamming) was not
offering enough protection. I started investigating bch, and read that
while the ti dvsdk bch code
for computing the bch was ok, the error correction code was not, and
the new BCH4 scheme
resulted in all FF OOB data for an empty page, which was great. There
was no real reason for
choosing BCH4 over BCH8, but I thought the simpler the better.

> I'll try to see if I can help you here, but going forward its always reco=
mmended
> to use higher ECC schemes (like BCH8), so that flash's lifetime is extend=
ed on field.
>

>
>> Regards,
>> Jean-Philippe Fran=C3=A7ois.
>>
> with regards, pekon
