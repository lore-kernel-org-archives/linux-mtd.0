Received: from mail-pa0-x234.google.com ([2607:f8b0:400e:c03::234])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1auvxz-0000U1-2y
 for linux-mtd@lists.infradead.org; Tue, 26 Apr 2016 05:55:23 +0000
Received: by mail-pa0-x234.google.com with SMTP id r5so2539938pag.1
 for <linux-mtd@lists.infradead.org>; Mon, 25 Apr 2016 22:55:02 -0700 (PDT)
Date: Mon, 25 Apr 2016 22:54:58 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: Matthias Schiffer <mschiffer@universe-factory.net>,
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
Message-ID: <20160426055458.GB25981@localhost>
References: <1450205301-32207-1-git-send-email-computersforpeace@gmail.com>
 <56F6DB9C.5010305@universe-factory.net>
 <56F86443.4050901@universe-factory.net>
 <20160328205654.GJ2545@google.com> <56FBCAF4.5060801@atmel.com>
 <20160401202701.GC3645@localhost> <5702894A.1060102@atmel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5702894A.1060102@atmel.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Cyrille,

On Mon, Apr 04, 2016 at 05:33:30PM +0200, Cyrille Pitchen wrote:
> Le 01/04/2016 22:27, Brian Norris a écrit :
> > On Wed, Mar 30, 2016 at 02:47:48PM +0200, Cyrille Pitchen wrote:
> >> Just a general remark: maybe reading the JEDEC ID is not a so reliable mean to
> >> discover SPI flash hardware capabilities at runtime.
[...]

> >> Hence the JEDEC ID only provides information about the memory size and all
> >> SPI NOR memories of a given size actually share the same JEDEC ID.
> > 
[...] 
> Then, it seems you're right when you propose to more rely on the DT compatible
> string and add specific entries in the spi_nor_ids[] table with flags to
> declare the supported hardware capabilities.
> 
> I've tried this approach in v5 of my series for support of 4byte address op
> codes.

One note about this: I think this is something that Rafal (and I, to
some extent) was really trying to avoid: having to specify the exact
part number in every board file / DTS file -- as that makes it much more
difficult to support a lot of small variations to the same board. For
example, I believe some production lines like to swap out one or more
flash even on the same product, due to supply or other reasons.

That's not to say we can't do this (it's necessary to do *something*
more than just ID-based detection); but perhaps there's something we can
still do to minimize the damage? I don't have a lot of brilliant ideas
right now...

(Maybe this line of discussion should be carried to your other patch
thread.)

> >> Similar cases can also be found with other manufacturers: Micron, Winbond,
> >> Spansion... 
> >>
> >> Also the Macronix engineers asked us how software applications drive the (Q)SPI
> >> memories. I answered them that Linux or u-boot use a static table indexed by
> >> the JEDEC ID, which provides the hardware capabilities. I guess they didn't
> >> expect software developers to use the JEDEC ID for this purpose.
> >> Well, it's just a feeling.
> >>
> >> Then the Macronix engineers proposed to use the Serial Flash Discoverable
> >> Parameter (SFDP) tables to make the difference between memories sharing the
> >> same JEDEC ID. This might help us in some cases.
> >> However we should be cautious when using this standard: last year, I've tried
> >> to discover hardware parameters through these tables when I was working with
> >> Spansion and Micron memories. I found out the Parameter Table Pointers inside
> >> the SFDP Header were expressed as byte offset with one memory and as dword
> >> offset with the other.
> > 
> > Yeah, I noticed this. And I think one or more of them noticed their
> > error and fixed it in later revs, so you can't depend on a manufacturer
> > always having the same broken interpretation consistently.
> > 
> 
> Maybe some flags in specific entries to declare some implementation quirks ?

Perhaps, if we can figure out which ones are broken, and we know that
*all* flash with that ID are broken in the same way. (It'd really suck
if the same ID had two different SFDP implementation...)

> >> So I gave up using these tables since some memories diverged from the standard,
> >> which was "work in progress" at that time.
> >>
> >> Anyway if we cannot completely rely on the SFDP tables we could still use
> >> DT properties but we should no longer expect to guess all hardware parameters
> >> from the JEDEC ID alone.
> > 
> > In your conversations, did the vendors actually suggest a practical
> > method to differentiate flash? Since they've all screwed up SFDP, that's
> > not going to fly, unless we (e.g.) blacklist certain flash. Anyway, I'd
> > love to have some basic support for SFDP, even if we have to be
> > conservative at first. For one, I think it'd be fair to add another
> > compatible property "jedec,sfdp-vXXX", and then we only use that on
> > flash that support the actual spec.
> > 
> 
> Indeed Macronix suggested us to use the SFDP tables. I guess all manufacturers
> tend to implement the latest version of the SFDP standard even if it breaks
> compatibility with implementations of older memories.

Then maybe it's time we finally bite the bullet and try to phase in some
level of SFDP support. We probably don't want to (and can't) rely on it
unconditionally, but maybe we can start flagging off some entries which
should/shouldn't support SFDP (ideally, I'd like to flag those that
*don't* support the standard properly, as we can reasonably expect new
flash to get it correct now).

> To differentiate the MX25L25635E and MX25L25673G, they told us to combine

Why did you want to differentiate these? (I feel like I'm missing an
unstated detail here.)

> info read from both the SFDP tables and the Status Register: on 73G the
> Quad Enable bit is always set and cannot be cleared whereas this bit is cleared
> as a default factory setting.
> However we pointed out that this bit is non-volatile and will be set to 1
> during the very first boot so still cannot make the difference between the
> 35E and the 73G.
> Then they suggest us to try to clear the QE bit (only possible on 35E) but
> I don't think it can be considered as a clean implementation...
> 
> Also in this particular example, I don't see how the SFDP tables could help.

Yeah, I wasn't suggesting it for this case, exactly. But we're really
gonna have problems if we can't determine anything other than density
from ID.

[snip]

Brian
