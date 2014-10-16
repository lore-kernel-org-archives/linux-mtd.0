Received: from mga14.intel.com ([192.55.52.115])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XejeM-00036A-Gy
 for linux-mtd@lists.infradead.org; Thu, 16 Oct 2014 11:55:23 +0000
Message-ID: <1413460486.7906.216.camel@sauron.fi.intel.com>
Subject: Re: UBI: ignore/overwrite old data/PEBs after flashing
From: Artem Bityutskiy <dedekind1@gmail.com>
Reply-To: dedekind1@gmail.com
To: =?UTF-8?Q?Rafa=C5=82_Mi=C5=82ecki?= <zajec5@gmail.com>
Date: Thu, 16 Oct 2014 14:54:46 +0300
In-Reply-To: <CACna6rz_+EpVVOHZcQiE=_-KzHGxAoFj4DDuM6DcFFpqv6QH2Q@mail.gmail.com>
References: <CACna6rxapt_J8qjMb37UnQ5iFE3DJ06U8nok_Fw=RO5UHs6Vsg@mail.gmail.com>
 <1413454168.7906.154.camel@sauron.fi.intel.com>
 <CACna6ryBtZd3rAD+gsi9s+hfdM-mSk1uKt7w=p0xM83yHKns-A@mail.gmail.com>
 <1413456043.7906.164.camel@sauron.fi.intel.com>
 <CACna6ry_vUS7ZnDG7k4=_q_vNkbn35mSm4V8u95KoienmrVPHw@mail.gmail.com>
 <1413458869.7906.199.camel@sauron.fi.intel.com>
 <CACna6rz_+EpVVOHZcQiE=_-KzHGxAoFj4DDuM6DcFFpqv6QH2Q@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
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

On Thu, 2014-10-16 at 13:38 +0200, Rafał Miłecki wrote:
> On 16 October 2014 13:27, Artem Bityutskiy <dedekind1@gmail.com> wrote:
> > On Thu, 2014-10-16 at 13:17 +0200, Rafał Miłecki wrote:
> >> On 16 October 2014 12:40, Artem Bityutskiy <dedekind1@gmail.com> wrote:
> >> > On Thu, 2014-10-16 at 12:29 +0200, Rafał Miłecki wrote:
> >> >> On 16 October 2014 12:09, Artem Bityutskiy <dedekind1@gmail.com> wrote:
> >> >> > Then the solution would be to pad your image with 0xFFs and write it.
> >> >> > UBI will notice PEBs which do not contain UBI headers and will erase
> >> >> > them in background.
> >> >>
> >> >> That would be trivial trick to implement, however it's far from being
> >> >> user friendly. Most devices have 128 MiB flash and our firmware
> >> >> (OpenWrt) is only ~4 MiB big. It would be a waste of
> >> >> space/bandwidth/time to provide firmware images padded with over 120
> >> >> MiB of 0xFF.
> >> >
> >> > Right, this is a work-around, and it is OK for a work-around to be
> >> > suboptimal, generally speaking.
> >> >
> >> > If you want a more optimal work-around, it will be more intrusive. One
> >> > idea would be to can create a small specialized kernel driver which will
> >> > start before UBI and clean-up your flash: erase PEBs you specify it.
> >> > Something like 'mtd/flashcleaner.ko'.
> >>
> >> I'm not sure if something like this is possible. My driver would need
> >> to have a very good understanding of UBI to know which PEBs to leave
> >> and which to clean. I would need to find out which PEBs were recently
> >> flashed (are part of the just-installed firmware) and which are left
> >> from the previous installation.
> >
> > Why? All you need is to erase all PEBs which contain those "100MiB of
> > rubbish". They will be sequential.
> 
> The problem is all my 118 MiB UBI partition consist of PEBs with UBI
> headers. This is because I was using firmware with UBI partition
> before flashing the new firmware.

Hmm, normally different images have different sequence numbers, because
ubnize picks a random 64-bit number. And UBI will refuse attaching the
flash if it finds out that there is more than one sequence number used.

Anyway, let's assume the worst case - you have all 100MiB of PEBs
contain UBI headers with the same sequence number. Now you flash your
18MiB image with the same sequence number.

UBI may actually even attach it without complaining. But it will be
completely messed up, you may find random data in your LEBs.

Very bed. Yr cannot fix this from within UBI, because for UBI all blocks
will look valid. So it will mix the new and old data in a random way. Or
it will fail if it find an inconsistency.

> So there is 118 MiB of space filled with UBI-header-ed PEBs, but only
> first few first MiBs of PEBs are coming from the recently flashed
> firmware. The rest of PEBs are old data (but they still contain UBI
> headers).

Yeah, so the point is that if you know that the last PEB of the new
image is X, you may erase all PEBs after X using the 'flashcleaner'
driver.

> If I could modify UBI this would be much easier. I was thinking about
> appending a one special block to the ubinized image. This could be PEB
> with UBI header containing some flag START_ERASING_FROM_HERE. Such a
> flag could be removed after erasing rubbish to minimize the risk of
> situation you described.

This sounds like an elegant solution.

But what if the image contains fastmap?
