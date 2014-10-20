Received: from mail-ig0-x22e.google.com ([2607:f8b0:4001:c05::22e])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XgHso-0007X8-1V
 for linux-mtd@lists.infradead.org; Mon, 20 Oct 2014 18:40:43 +0000
Received: by mail-ig0-f174.google.com with SMTP id a13so5932761igq.1
 for <linux-mtd@lists.infradead.org>; Mon, 20 Oct 2014 11:40:18 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1413812845.7906.291.camel@sauron.fi.intel.com>
References: <CACna6rxapt_J8qjMb37UnQ5iFE3DJ06U8nok_Fw=RO5UHs6Vsg@mail.gmail.com>
 <1413454168.7906.154.camel@sauron.fi.intel.com>
 <CACna6ryBtZd3rAD+gsi9s+hfdM-mSk1uKt7w=p0xM83yHKns-A@mail.gmail.com>
 <1413456043.7906.164.camel@sauron.fi.intel.com>
 <CACna6ry_vUS7ZnDG7k4=_q_vNkbn35mSm4V8u95KoienmrVPHw@mail.gmail.com>
 <1413458869.7906.199.camel@sauron.fi.intel.com>
 <CACna6rz_+EpVVOHZcQiE=_-KzHGxAoFj4DDuM6DcFFpqv6QH2Q@mail.gmail.com>
 <1413460486.7906.216.camel@sauron.fi.intel.com>
 <CACna6rwe46Umvt9SFYTsfEjUPU7yY7oyJXbdovYehQrNfLwNQA@mail.gmail.com>
 <1413812845.7906.291.camel@sauron.fi.intel.com>
Date: Mon, 20 Oct 2014 20:40:17 +0200
Message-ID: <CACna6rwUiZ64Z5sDQOn5Mmd5CVXbrx++SBZWFMUb723gJJSLbg@mail.gmail.com>
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

On 20 October 2014 15:47, Artem Bityutskiy <dedekind1@gmail.com> wrote:
> On Thu, 2014-10-16 at 15:51 +0200, Rafa=C5=82 Mi=C5=82ecki wrote:
>> Unfortunately this won't work if we flash the same firmware twice (it
>> will contain the same sequence). Imagine someone flashing a stable
>> OpenWrt release, then breaking something and flashing the same image
>> again. It'll contain the same sequence number and my magic driver
>> won't clean the old data :(
>
> Yes, flashing with ubiformat would be fine, because it changes the
> sequence number on-the-fly. With industial flashers, you'd need to erase
> the flash.
>
> Now you say you do not have the erase operation. You idea of a
> "IMAGE_ENDS_HERE" bit seems to be nice, and you could implement it, but
> you should think about the fastmap case too. Probably you need to do
> nothing, because fastmap will only refer the PEBs within the image, and
> the PEBs outside of the image will be scheduled for erasure. But you
> should verify this.

So far I've implemented it for OpenWrt needs with a hacky patch you
can see there:
http://git.openwrt.org/?p=3Dopenwrt.git;a=3Dcommitdiff;h=3D21741f060cab636c=
04d61ae696cd933adfea6e16
(it expects a PEB with 0xdeadc0de in place of UBI's magic).

I'll try to work on a clean solution when a find a bit of time. I
still need to learn about fastmap.

--=20
Rafa=C5=82
