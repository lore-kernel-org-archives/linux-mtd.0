Received: from mail-oi0-x231.google.com ([2607:f8b0:4003:c06::231])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1bDU9F-0000e2-BB
 for linux-mtd@lists.infradead.org; Thu, 16 Jun 2016 10:03:41 +0000
Received: by mail-oi0-x231.google.com with SMTP id d132so61189013oig.1
 for <linux-mtd@lists.infradead.org>; Thu, 16 Jun 2016 03:03:20 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAFLxGvzxEkRfGzxsxS3_xYupPvAXNO6X9AMi=6SQzXYqBLqiqQ@mail.gmail.com>
References: <1811946.TqycnYvpkR@pfaehler-pc>
 <CAFLxGvzxEkRfGzxsxS3_xYupPvAXNO6X9AMi=6SQzXYqBLqiqQ@mail.gmail.com>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Thu, 16 Jun 2016 12:03:19 +0200
Message-ID: <CAFLxGvwydtMa3wizdfC1K1Ti2pn=OuJ9UF2wTMFqt-kw2xFO3g@mail.gmail.com>
Subject: Re: UBI: recover_peb and power cut safety
To: =?UTF-8?B?SsO2cmcgUGbDpGhsZXI=?= <pfaehler@isse.de>,
 Artem Bityutskiy <dedekind1@gmail.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
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

Forgot to CC Artem.

On Thu, Jun 16, 2016 at 11:46 AM, Richard Weinberger
<richard.weinberger@gmail.com> wrote:
> J=C3=B6rg,
>
> On Thu, Jun 16, 2016 at 10:37 AM, J=C3=B6rg Pf=C3=A4hler <pfaehler@isse.d=
e> wrote:
>> Hi,
>>
>> I would greatly appreciate some clarification with respect to power cut =
safety
>> during writing of an erase block in UBI, specifically power cut safety o=
f
>> recover_peb.
>>
>> During a normal write operation (ubi_eba_write_leb in mtd/ubi/eba.c) UBI=
 tries
>> to move the contents of the block (and the new contents) to a new locati=
on via
>> recover_peb, if the write fails. However, recover_peb does not seem to u=
se the
>> capability to exchange the (logical) block atomically (as
>> ubi_eba_atomic_leb_change in mtd/ubi/eba.c does). Specifically, it does =
not
>> seem to write the amount of data and its checksum to the VID header. Thu=
s, if
>> the system crashes in the middle of recover_peb before the old/broken bl=
ock
>> could be erased, we are left with a newer version of the block (the sequ=
ence
>> number in the header is increased by recover_peb), but without having mo=
ved
>> all the contents of the old block. This would obviously lead to data los=
s.
>> Thus, It seems to me that recover_peb (and therefore ubi_eba_write_leb) =
is not
>> power cut safe or is there some other mechanism distinct from the one us=
ed by
>> ubi_eba_atomic_leb_change to achieve this? If not I would suggest using
>> ubi_eba_atomic_leb_change in ubi_eba_write_leb instead of recover_peb.
>
> Hmm, you are right, if ubi_eba_write() is facing -EIO from the MTD driver=
 we can
> lose the whole erase block upon power cut.
> So you found a bug. :-)
>
> Artem, can you tell more on this?
> I'd guess that recover_peb() is older than ubi_eba_atomic_leb_change() an=
d
> therefore it was not used.
> And nobody noticed so far since the condition is hard to hit.
>
> That said, switching to ubi_eba_atomic_leb_change() seems like a good
> plan to me.
> J=C3=B6rg, please send a patch and explain how you tested it.
>
> --
> Thanks,
> //richard



--=20
Thanks,
//richard
