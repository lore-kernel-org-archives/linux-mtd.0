Received: from mail-ig0-x22f.google.com ([2607:f8b0:4001:c05::22f])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XelTE-0006bd-0J
 for linux-mtd@lists.infradead.org; Thu, 16 Oct 2014 13:52:00 +0000
Received: by mail-ig0-f175.google.com with SMTP id uq10so19457858igb.8
 for <linux-mtd@lists.infradead.org>; Thu, 16 Oct 2014 06:51:38 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1413460486.7906.216.camel@sauron.fi.intel.com>
References: <CACna6rxapt_J8qjMb37UnQ5iFE3DJ06U8nok_Fw=RO5UHs6Vsg@mail.gmail.com>
 <1413454168.7906.154.camel@sauron.fi.intel.com>
 <CACna6ryBtZd3rAD+gsi9s+hfdM-mSk1uKt7w=p0xM83yHKns-A@mail.gmail.com>
 <1413456043.7906.164.camel@sauron.fi.intel.com>
 <CACna6ry_vUS7ZnDG7k4=_q_vNkbn35mSm4V8u95KoienmrVPHw@mail.gmail.com>
 <1413458869.7906.199.camel@sauron.fi.intel.com>
 <CACna6rz_+EpVVOHZcQiE=_-KzHGxAoFj4DDuM6DcFFpqv6QH2Q@mail.gmail.com>
 <1413460486.7906.216.camel@sauron.fi.intel.com>
Date: Thu, 16 Oct 2014 15:51:38 +0200
Message-ID: <CACna6rwe46Umvt9SFYTsfEjUPU7yY7oyJXbdovYehQrNfLwNQA@mail.gmail.com>
Subject: Re: UBI: ignore/overwrite old data/PEBs after flashing
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
To: Artem Bityutskiy <dedekind1@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: Felix Fietkau <nbd@openwrt.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 16 October 2014 13:54, Artem Bityutskiy <dedekind1@gmail.com> wrote:
> On Thu, 2014-10-16 at 13:38 +0200, Rafa=C5=82 Mi=C5=82ecki wrote:
>> On 16 October 2014 13:27, Artem Bityutskiy <dedekind1@gmail.com> wrote:
>> > On Thu, 2014-10-16 at 13:17 +0200, Rafa=C5=82 Mi=C5=82ecki wrote:
>> >> On 16 October 2014 12:40, Artem Bityutskiy <dedekind1@gmail.com> wrot=
e:
>> >> > On Thu, 2014-10-16 at 12:29 +0200, Rafa=C5=82 Mi=C5=82ecki wrote:
>> >> >> On 16 October 2014 12:09, Artem Bityutskiy <dedekind1@gmail.com> w=
rote:
>> >> >> > Then the solution would be to pad your image with 0xFFs and writ=
e it.
>> >> >> > UBI will notice PEBs which do not contain UBI headers and will e=
rase
>> >> >> > them in background.
>> >> >>
>> >> >> That would be trivial trick to implement, however it's far from be=
ing
>> >> >> user friendly. Most devices have 128 MiB flash and our firmware
>> >> >> (OpenWrt) is only ~4 MiB big. It would be a waste of
>> >> >> space/bandwidth/time to provide firmware images padded with over 1=
20
>> >> >> MiB of 0xFF.
>> >> >
>> >> > Right, this is a work-around, and it is OK for a work-around to be
>> >> > suboptimal, generally speaking.
>> >> >
>> >> > If you want a more optimal work-around, it will be more intrusive. =
One
>> >> > idea would be to can create a small specialized kernel driver which=
 will
>> >> > start before UBI and clean-up your flash: erase PEBs you specify it=
.
>> >> > Something like 'mtd/flashcleaner.ko'.
>> >>
>> >> I'm not sure if something like this is possible. My driver would need
>> >> to have a very good understanding of UBI to know which PEBs to leave
>> >> and which to clean. I would need to find out which PEBs were recently
>> >> flashed (are part of the just-installed firmware) and which are left
>> >> from the previous installation.
>> >
>> > Why? All you need is to erase all PEBs which contain those "100MiB of
>> > rubbish". They will be sequential.
>>
>> The problem is all my 118 MiB UBI partition consist of PEBs with UBI
>> headers. This is because I was using firmware with UBI partition
>> before flashing the new firmware.
>
> Hmm, normally different images have different sequence numbers, because
> ubnize picks a random 64-bit number. And UBI will refuse attaching the
> flash if it finds out that there is more than one sequence number used.

I didn't know about that sequence number. Just tried it and it seems
to work indeed. I flashed firmware A on clean flash, then firmware B
and the firmware B complained:
[    1.314877] Reading 00680000 magic:55424923 version:1 image_seq: 3A7605B=
E
[    1.323836] Reading 006A0000 magic:55424923 version:1 image_seq: 3A7605B=
E
[    1.332787] Reading 006C0000 magic:55424923 version:1 image_seq: 3A7605B=
E
[    1.341739] Reading 006E0000 magic:FFFFFDFF version:FF image_seq: FFFFFF=
FF
[    1.350776] Reading 00700000 magic:55424923 version:1 image_seq: 749C546=
8
[    1.359720] Reading 00720000 magic:55424923 version:1 image_seq: 749C546=
8
[    1.368678] Reading 00740000 magic:55424923 version:1 image_seq: 749C546=
8

Unfortunately this won't work if we flash the same firmware twice (it
will contain the same sequence). Imagine someone flashing a stable
OpenWrt release, then breaking something and flashing the same image
again. It'll contain the same sequence number and my magic driver
won't clean the old data :(
