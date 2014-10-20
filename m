Received: from mga03.intel.com ([134.134.136.65])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XgDJN-0007Xz-QF
 for linux-mtd@lists.infradead.org; Mon, 20 Oct 2014 13:47:50 +0000
Message-ID: <1413812845.7906.291.camel@sauron.fi.intel.com>
Subject: Re: UBI: ignore/overwrite old data/PEBs after flashing
From: Artem Bityutskiy <dedekind1@gmail.com>
Reply-To: dedekind1@gmail.com
To: =?UTF-8?Q?Rafa=C5=82_Mi=C5=82ecki?= <zajec5@gmail.com>
Date: Mon, 20 Oct 2014 16:47:25 +0300
In-Reply-To: <CACna6rwe46Umvt9SFYTsfEjUPU7yY7oyJXbdovYehQrNfLwNQA@mail.gmail.com>
References: <CACna6rxapt_J8qjMb37UnQ5iFE3DJ06U8nok_Fw=RO5UHs6Vsg@mail.gmail.com>
 <1413454168.7906.154.camel@sauron.fi.intel.com>
 <CACna6ryBtZd3rAD+gsi9s+hfdM-mSk1uKt7w=p0xM83yHKns-A@mail.gmail.com>
 <1413456043.7906.164.camel@sauron.fi.intel.com>
 <CACna6ry_vUS7ZnDG7k4=_q_vNkbn35mSm4V8u95KoienmrVPHw@mail.gmail.com>
 <1413458869.7906.199.camel@sauron.fi.intel.com>
 <CACna6rz_+EpVVOHZcQiE=_-KzHGxAoFj4DDuM6DcFFpqv6QH2Q@mail.gmail.com>
 <1413460486.7906.216.camel@sauron.fi.intel.com>
 <CACna6rwe46Umvt9SFYTsfEjUPU7yY7oyJXbdovYehQrNfLwNQA@mail.gmail.com>
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

On Thu, 2014-10-16 at 15:51 +0200, Rafał Miłecki wrote:
> Unfortunately this won't work if we flash the same firmware twice (it
> will contain the same sequence). Imagine someone flashing a stable
> OpenWrt release, then breaking something and flashing the same image
> again. It'll contain the same sequence number and my magic driver
> won't clean the old data :(

Yes, flashing with ubiformat would be fine, because it changes the
sequence number on-the-fly. With industial flashers, you'd need to erase
the flash.

Now you say you do not have the erase operation. You idea of a
"IMAGE_ENDS_HERE" bit seems to be nice, and you could implement it, but
you should think about the fastmap case too. Probably you need to do
nothing, because fastmap will only refer the PEBs within the image, and
the PEBs outside of the image will be scheduled for erasure. But you
should verify this.

Artem.
