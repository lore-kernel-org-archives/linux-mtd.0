Received: from mail-ie0-x22e.google.com ([2607:f8b0:4001:c03::22e])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XejOX-0005A9-TL
 for linux-mtd@lists.infradead.org; Thu, 16 Oct 2014 11:39:02 +0000
Received: by mail-ie0-f174.google.com with SMTP id tr6so3121949ieb.5
 for <linux-mtd@lists.infradead.org>; Thu, 16 Oct 2014 04:38:39 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1413458869.7906.199.camel@sauron.fi.intel.com>
References: <CACna6rxapt_J8qjMb37UnQ5iFE3DJ06U8nok_Fw=RO5UHs6Vsg@mail.gmail.com>
 <1413454168.7906.154.camel@sauron.fi.intel.com>
 <CACna6ryBtZd3rAD+gsi9s+hfdM-mSk1uKt7w=p0xM83yHKns-A@mail.gmail.com>
 <1413456043.7906.164.camel@sauron.fi.intel.com>
 <CACna6ry_vUS7ZnDG7k4=_q_vNkbn35mSm4V8u95KoienmrVPHw@mail.gmail.com>
 <1413458869.7906.199.camel@sauron.fi.intel.com>
Date: Thu, 16 Oct 2014 13:38:39 +0200
Message-ID: <CACna6rz_+EpVVOHZcQiE=_-KzHGxAoFj4DDuM6DcFFpqv6QH2Q@mail.gmail.com>
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

On 16 October 2014 13:27, Artem Bityutskiy <dedekind1@gmail.com> wrote:
> On Thu, 2014-10-16 at 13:17 +0200, Rafa=C5=82 Mi=C5=82ecki wrote:
>> On 16 October 2014 12:40, Artem Bityutskiy <dedekind1@gmail.com> wrote:
>> > On Thu, 2014-10-16 at 12:29 +0200, Rafa=C5=82 Mi=C5=82ecki wrote:
>> >> On 16 October 2014 12:09, Artem Bityutskiy <dedekind1@gmail.com> wrot=
e:
>> >> > Then the solution would be to pad your image with 0xFFs and write i=
t.
>> >> > UBI will notice PEBs which do not contain UBI headers and will eras=
e
>> >> > them in background.
>> >>
>> >> That would be trivial trick to implement, however it's far from being
>> >> user friendly. Most devices have 128 MiB flash and our firmware
>> >> (OpenWrt) is only ~4 MiB big. It would be a waste of
>> >> space/bandwidth/time to provide firmware images padded with over 120
>> >> MiB of 0xFF.
>> >
>> > Right, this is a work-around, and it is OK for a work-around to be
>> > suboptimal, generally speaking.
>> >
>> > If you want a more optimal work-around, it will be more intrusive. One
>> > idea would be to can create a small specialized kernel driver which wi=
ll
>> > start before UBI and clean-up your flash: erase PEBs you specify it.
>> > Something like 'mtd/flashcleaner.ko'.
>>
>> I'm not sure if something like this is possible. My driver would need
>> to have a very good understanding of UBI to know which PEBs to leave
>> and which to clean. I would need to find out which PEBs were recently
>> flashed (are part of the just-installed firmware) and which are left
>> from the previous installation.
>
> Why? All you need is to erase all PEBs which contain those "100MiB of
> rubbish". They will be sequential.

The problem is all my 118 MiB UBI partition consist of PEBs with UBI
headers. This is because I was using firmware with UBI partition
before flashing the new firmware.

So there is 118 MiB of space filled with UBI-header-ed PEBs, but only
first few first MiBs of PEBs are coming from the recently flashed
firmware. The rest of PEBs are old data (but they still contain UBI
headers).


> And of course this would be a one-time driver. You'd need to run it only
> on the very first boot.
>
> On the other hand, may be you can add an "wipe_rubbish" kind of UBI
> module parameter, which would make it to just erase any PEB containing
> "rubbish", i.e., anything without an EC header. My worry is that this
> could be potentially dangerous - if you have a PEB corrupted, and it
> contains precious data, UBI will just destroy the precious data instead
> of refusing the flash. So a feature like this would need to be used
> carefully.

If I could modify UBI this would be much easier. I was thinking about
appending a one special block to the ubinized image. This could be PEB
with UBI header containing some flag START_ERASING_FROM_HERE. Such a
flag could be removed after erasing rubbish to minimize the risk of
situation you described.

--=20
Rafa=C5=82
