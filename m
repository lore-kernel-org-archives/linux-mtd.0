Received: from mail-pf0-x232.google.com ([2607:f8b0:400e:c00::232])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1akeDv-0003r1-7L
 for linux-mtd@lists.infradead.org; Mon, 28 Mar 2016 20:57:20 +0000
Received: by mail-pf0-x232.google.com with SMTP id 4so146200082pfd.0
 for <linux-mtd@lists.infradead.org>; Mon, 28 Mar 2016 13:56:58 -0700 (PDT)
Date: Mon, 28 Mar 2016 13:56:54 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Matthias Schiffer <mschiffer@universe-factory.net>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 Daniel Kurtz <djkurtz@chromium.org>, Marek Vasut <marex@denx.de>,
 Bayi Cheng <bayi.cheng@mediatek.com>,
 =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 Felix Fietkau <nbd@openwrt.org>,
 Eddie Huang =?utf-8?B?KOm7g+aZuuWCkSk=?= <eddie.huang@mediatek.com>,
 Milton Chiang =?utf-8?B?KOaxn+aYjuaZjyk=?= <Milton.Chiang@mediatek.com>,
 Gernot Hoyler <Gernot.Hoyler@spansion.com>
Subject: Re: [PATCH for-4.4 1/2] mtd: spi-nor: fix Spansion regressions
 (aliased with Winbond)
Message-ID: <20160328205654.GJ2545@google.com>
References: <1450205301-32207-1-git-send-email-computersforpeace@gmail.com>
 <56F6DB9C.5010305@universe-factory.net>
 <56F86443.4050901@universe-factory.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <56F86443.4050901@universe-factory.net>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Mar 28, 2016 at 12:52:51AM +0200, Matthias Schiffer wrote:
> On 03/26/2016 07:57 PM, Matthias Schiffer wrote:
> > On 12/15/2015 07:48 PM, Brian Norris wrote:
> >> Spansion and Winbond have occasionally used the same manufacturer ID,
> >> and they don't support the same features. Particularly, writing SR=0
> >> seems to break read access for Spansion's s25fl064k. Unfortunately, we
> >> don't currently have a way to differentiate these Spansion and Winbond
> >> parts, so rather than regressing support for these Spansion flash, let's
> >> drop the new Winbond lock/unlock support for now. We can try to address
> >> Winbond support during the next release cycle.
> >>
> >> Original discussion:
> >>
> >> http://patchwork.ozlabs.org/patch/549173/
> >> http://patchwork.ozlabs.org/patch/553683/
> >>
> > 
> > I have a few devices with a s25fl064k lying around, and I was not able to
> > reproduce this issue. I've re-applied "mtd: spi-nor: disable protection for
> > Winbond flash at startup" and the flash is readable just fine.
> > 
> > On the contrary, I've come across a board with a s25fl064k that comes up
> > locked, so removing the protection bits would be necessary. (I was not yet
> > able to check if the patch actually fixes writing to the flash on this
> > board, as I don't have access to the device myself, but I hope to get a
> > response on that soon.)
> > 
> > Regards,
> > Matthias
> > 
> 
> I made the mistake of trusting the kernel log and OpenWrt Wiki when making
> my previous tests.
> 
> All of the boards I was talking about in my last mail actually have a
> Winbond w25q64, not a s25fl064k (two board I tested the patch on, and the
> board that was reported to come up locked). The kernel detects the w25q64
> as s25fl064k, as these two flash chips have the same JEDEC ID 0xef4017.

That's interesting; I didn't notice we had duplicate entries for the
same ID. But apparently, the committers did:

  commit f2df1ae3fe8d ("mtd: m25p80: Add support for two new Spansion
  SPI devices (S25FL-K)")
  ...
  "Note that both parts exhibit a Winbond manufacturer ID so they might
  also be added to that section."

But this is interesting: I see the latest datasheet for Spansion
s25fl064k says it supports the Block Protect bits in the Status
Register, so presumably *some* version of s25fl064k should support
write_sr(nor, 0) to unlock it at boot...

If Felix's initial report is indeed correct, then I think we have:
(1) Spansion s25fl064k without Block Protect support (that breaks if you
    try to write SR=0)
(2) Spansion s25fl064k with Block Protect support (that requires you to
    unlock at boot by writing SR=0 (?))
(3) Winbond w25q64 with Block Protect support (that requires you to
    unlock at boot by writing SR=0)

And (1)-(3) all report the same ID, and (1) is incompatible with (2) and
(3). Am I right? Are flash vendors really this insane? Should we all
just give up and go home?

Brian
