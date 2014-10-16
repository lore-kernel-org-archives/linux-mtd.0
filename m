Received: from mail-ie0-x231.google.com ([2607:f8b0:4001:c03::231])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Xej4H-0005l8-Ui
 for linux-mtd@lists.infradead.org; Thu, 16 Oct 2014 11:18:06 +0000
Received: by mail-ie0-f177.google.com with SMTP id rd18so3038818iec.8
 for <linux-mtd@lists.infradead.org>; Thu, 16 Oct 2014 04:17:44 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1413456043.7906.164.camel@sauron.fi.intel.com>
References: <CACna6rxapt_J8qjMb37UnQ5iFE3DJ06U8nok_Fw=RO5UHs6Vsg@mail.gmail.com>
 <1413454168.7906.154.camel@sauron.fi.intel.com>
 <CACna6ryBtZd3rAD+gsi9s+hfdM-mSk1uKt7w=p0xM83yHKns-A@mail.gmail.com>
 <1413456043.7906.164.camel@sauron.fi.intel.com>
Date: Thu, 16 Oct 2014 13:17:44 +0200
Message-ID: <CACna6ry_vUS7ZnDG7k4=_q_vNkbn35mSm4V8u95KoienmrVPHw@mail.gmail.com>
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

On 16 October 2014 12:40, Artem Bityutskiy <dedekind1@gmail.com> wrote:
> On Thu, 2014-10-16 at 12:29 +0200, Rafa=C5=82 Mi=C5=82ecki wrote:
>> On 16 October 2014 12:09, Artem Bityutskiy <dedekind1@gmail.com> wrote:
>> > Then the solution would be to pad your image with 0xFFs and write it.
>> > UBI will notice PEBs which do not contain UBI headers and will erase
>> > them in background.
>>
>> That would be trivial trick to implement, however it's far from being
>> user friendly. Most devices have 128 MiB flash and our firmware
>> (OpenWrt) is only ~4 MiB big. It would be a waste of
>> space/bandwidth/time to provide firmware images padded with over 120
>> MiB of 0xFF.
>
> Right, this is a work-around, and it is OK for a work-around to be
> suboptimal, generally speaking.
>
> If you want a more optimal work-around, it will be more intrusive. One
> idea would be to can create a small specialized kernel driver which will
> start before UBI and clean-up your flash: erase PEBs you specify it.
> Something like 'mtd/flashcleaner.ko'.

I'm not sure if something like this is possible. My driver would need
to have a very good understanding of UBI to know which PEBs to leave
and which to clean. I would need to find out which PEBs were recently
flashed (are part of the just-installed firmware) and which are left
from the previous installation.


> May be you can invent an nice UBI feature to do this, but so far I feel
> like a separate driver should be a better way to go.

--=20
Rafa=C5=82
