Received: from mga01.intel.com ([192.55.52.88])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XejE5-0001OR-6M
 for linux-mtd@lists.infradead.org; Thu, 16 Oct 2014 11:28:13 +0000
Message-ID: <1413458869.7906.199.camel@sauron.fi.intel.com>
Subject: Re: UBI: ignore/overwrite old data/PEBs after flashing
From: Artem Bityutskiy <dedekind1@gmail.com>
Reply-To: dedekind1@gmail.com
To: =?UTF-8?Q?Rafa=C5=82_Mi=C5=82ecki?= <zajec5@gmail.com>
Date: Thu, 16 Oct 2014 14:27:49 +0300
In-Reply-To: <CACna6ry_vUS7ZnDG7k4=_q_vNkbn35mSm4V8u95KoienmrVPHw@mail.gmail.com>
References: <CACna6rxapt_J8qjMb37UnQ5iFE3DJ06U8nok_Fw=RO5UHs6Vsg@mail.gmail.com>
 <1413454168.7906.154.camel@sauron.fi.intel.com>
 <CACna6ryBtZd3rAD+gsi9s+hfdM-mSk1uKt7w=p0xM83yHKns-A@mail.gmail.com>
 <1413456043.7906.164.camel@sauron.fi.intel.com>
 <CACna6ry_vUS7ZnDG7k4=_q_vNkbn35mSm4V8u95KoienmrVPHw@mail.gmail.com>
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

On Thu, 2014-10-16 at 13:17 +0200, Rafał Miłecki wrote:
> On 16 October 2014 12:40, Artem Bityutskiy <dedekind1@gmail.com> wrote:
> > On Thu, 2014-10-16 at 12:29 +0200, Rafał Miłecki wrote:
> >> On 16 October 2014 12:09, Artem Bityutskiy <dedekind1@gmail.com> wrote:
> >> > Then the solution would be to pad your image with 0xFFs and write it.
> >> > UBI will notice PEBs which do not contain UBI headers and will erase
> >> > them in background.
> >>
> >> That would be trivial trick to implement, however it's far from being
> >> user friendly. Most devices have 128 MiB flash and our firmware
> >> (OpenWrt) is only ~4 MiB big. It would be a waste of
> >> space/bandwidth/time to provide firmware images padded with over 120
> >> MiB of 0xFF.
> >
> > Right, this is a work-around, and it is OK for a work-around to be
> > suboptimal, generally speaking.
> >
> > If you want a more optimal work-around, it will be more intrusive. One
> > idea would be to can create a small specialized kernel driver which will
> > start before UBI and clean-up your flash: erase PEBs you specify it.
> > Something like 'mtd/flashcleaner.ko'.
> 
> I'm not sure if something like this is possible. My driver would need
> to have a very good understanding of UBI to know which PEBs to leave
> and which to clean. I would need to find out which PEBs were recently
> flashed (are part of the just-installed firmware) and which are left
> from the previous installation.

Why? All you need is to erase all PEBs which contain those "100MiB of
rubbish". They will be sequential.

And of course this would be a one-time driver. You'd need to run it only
on the very first boot.

On the other hand, may be you can add an "wipe_rubbish" kind of UBI
module parameter, which would make it to just erase any PEB containing
"rubbish", i.e., anything without an EC header. My worry is that this
could be potentially dangerous - if you have a PEB corrupted, and it
contains precious data, UBI will just destroy the precious data instead
of refusing the flash. So a feature like this would need to be used
carefully.
