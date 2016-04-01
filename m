Received: from zimbra.real-time.com ([63.170.91.9])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1alpPJ-0000JC-1q
 for linux-mtd@lists.infradead.org; Fri, 01 Apr 2016 03:05:58 +0000
Date: Fri, 1 Apr 2016 14:05:04 +1100
From: James Cameron <quozl@laptop.org>
To: Cyrille Pitchen <cyrille.pitchen@atmel.com>
Cc: Brian Norris <computersforpeace@gmail.com>,
 Matthias Schiffer <mschiffer@universe-factory.net>,
 Marek Vasut <marex@denx.de>, Gernot Hoyler <Gernot.Hoyler@spansion.com>,
 Felix Fietkau <nbd@openwrt.org>,
 =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 Milton Chiang =?utf-8?B?KOaxn+aYjuaZjyk=?= <Milton.Chiang@mediatek.com>,
 linux-kernel@vger.kernel.org, Bayi Cheng <bayi.cheng@mediatek.com>,
 linux-mtd@lists.infradead.org, Daniel Kurtz <djkurtz@chromium.org>,
 Eddie Huang =?utf-8?B?KOm7g+aZuuWCkSk=?= <eddie.huang@mediatek.com>,
 "Nicolas.FERRE@atmel.com" <Nicolas.FERRE@atmel.com>
Subject: Re: [PATCH for-4.4 1/2] mtd: spi-nor: fix Spansion regressions
 (aliased with Winbond)
Message-ID: <20160401030504.GG726@us.netrek.org>
References: <1450205301-32207-1-git-send-email-computersforpeace@gmail.com>
 <56F6DB9C.5010305@universe-factory.net>
 <56F86443.4050901@universe-factory.net>
 <20160328205654.GJ2545@google.com> <56FBCAF4.5060801@atmel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <56FBCAF4.5060801@atmel.com>
Sender: quozl@laptop.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Mar 30, 2016 at 02:47:48PM +0200, Cyrille Pitchen wrote:
> Hi all,
> 
> [...] 
> > But this is interesting: I see the latest datasheet for Spansion
> > s25fl064k says it supports the Block Protect bits in the Status
> > Register, so presumably *some* version of s25fl064k should support
> > write_sr(nor, 0) to unlock it at boot...
> > 
> > If Felix's initial report is indeed correct, then I think we have:
> > (1) Spansion s25fl064k without Block Protect support (that breaks if you
> >     try to write SR=0)
> > (2) Spansion s25fl064k with Block Protect support (that requires you to
> >     unlock at boot by writing SR=0 (?))
> > (3) Winbond w25q64 with Block Protect support (that requires you to
> >     unlock at boot by writing SR=0)
> > 
> > And (1)-(3) all report the same ID, and (1) is incompatible with (2) and
> > (3). Am I right? Are flash vendors really this insane? Should we all
> > just give up and go home?
> > 
> 
> Just a general remark: maybe reading the JEDEC ID is not a so reliable mean to
> discover SPI flash hardware capabilities at runtime.
> 
> Two weeks ago some Macronix people came to Atmel to present us next evolutions
> of SPI flashes. We took this opportunity to ask them some questions and one of
> them was about memories with different hardware capabilities sharing the very
> same JEDEC ID. One example is Macronix MX25L25635E vs MX25L25673G.
> 
> They explained to us that for Macronix memories, the 2byte product ID is to be
> split into a 1byte code for the memory type and a second byte for the memory
> denstity. For instance:
> C2: Manufacturer ID, Macronix
> 20: Memory Type, SPI NOR flash
> 19: Memory density, 256Mib
> 
> Hence the JEDEC ID only provides information about the memory size and all
> SPI NOR memories of a given size actually share the same JEDEC ID.

Yes, that's true.

(Reference: Open Firmware SPI Flash driver used at OLPC.)

> 
> Similar cases can also be found with other manufacturers: Micron, Winbond,
> Spansion... 
> 
> Also the Macronix engineers asked us how software applications drive the (Q)SPI
> memories. I answered them that Linux or u-boot use a static table indexed by
> the JEDEC ID, which provides the hardware capabilities. I guess they didn't
> expect software developers to use the JEDEC ID for this purpose.
> Well, it's just a feeling.
> 
> Then the Macronix engineers proposed to use the Serial Flash Discoverable
> Parameter (SFDP) tables to make the difference between memories sharing the
> same JEDEC ID. This might help us in some cases.
> However we should be cautious when using this standard: last year, I've tried
> to discover hardware parameters through these tables when I was working with
> Spansion and Micron memories. I found out the Parameter Table Pointers inside
> the SFDP Header were expressed as byte offset with one memory and as dword
> offset with the other.
> So I gave up using these tables since some memories diverged from the standard,
> which was "work in progress" at that time.

Yes, I too was unable to use SFDP; some devices didn't have them, some
didn't seem to be good data.

> 
> Anyway if we cannot completely rely on the SFDP tables we could still use
> DT properties but we should no longer expect to guess all hardware parameters
> from the JEDEC ID alone.

We solved this problem by not using our SPI Flash from the kernel, but
that's not the best outcome.  ;-)

> 
> Best regards,
> 
> Cyrille

-- 
James Cameron
http://quozl.netrek.org/
