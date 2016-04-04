Received: from eusmtp01.atmel.com ([212.144.249.243])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1an6Vm-0002N9-9v
 for linux-mtd@lists.infradead.org; Mon, 04 Apr 2016 15:33:56 +0000
Subject: Re: [PATCH for-4.4 1/2] mtd: spi-nor: fix Spansion regressions
 (aliased with Winbond)
To: Brian Norris <computersforpeace@gmail.com>
References: <1450205301-32207-1-git-send-email-computersforpeace@gmail.com>
 <56F6DB9C.5010305@universe-factory.net>
 <56F86443.4050901@universe-factory.net> <20160328205654.GJ2545@google.com>
 <56FBCAF4.5060801@atmel.com> <20160401202701.GC3645@localhost>
CC: Matthias Schiffer <mschiffer@universe-factory.net>, Marek Vasut
 <marex@denx.de>, Gernot Hoyler <Gernot.Hoyler@spansion.com>, Felix Fietkau
 <nbd@openwrt.org>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 =?UTF-8?B?TWlsdG9uIENoaWFuZyAo5rGf5piO5pmPKQ==?=
 <Milton.Chiang@mediatek.com>, <linux-kernel@vger.kernel.org>, Bayi Cheng
 <bayi.cheng@mediatek.com>, <linux-mtd@lists.infradead.org>, Daniel Kurtz
 <djkurtz@chromium.org>, =?UTF-8?B?RWRkaWUgSHVhbmcgKOm7g+aZuuWCkSk=?=
 <eddie.huang@mediatek.com>, "Nicolas.FERRE@atmel.com"
 <Nicolas.FERRE@atmel.com>
From: Cyrille Pitchen <cyrille.pitchen@atmel.com>
Message-ID: <5702894A.1060102@atmel.com>
Date: Mon, 4 Apr 2016 17:33:30 +0200
MIME-Version: 1.0
In-Reply-To: <20160401202701.GC3645@localhost>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Brian,

Le 01/04/2016 22:27, Brian Norris a écrit :
> On Wed, Mar 30, 2016 at 02:47:48PM +0200, Cyrille Pitchen wrote:
>> Hi all,
>>
>> [...] 
>>> But this is interesting: I see the latest datasheet for Spansion
>>> s25fl064k says it supports the Block Protect bits in the Status
>>> Register, so presumably *some* version of s25fl064k should support
>>> write_sr(nor, 0) to unlock it at boot...
>>>
>>> If Felix's initial report is indeed correct, then I think we have:
>>> (1) Spansion s25fl064k without Block Protect support (that breaks if you
>>>     try to write SR=0)
>>> (2) Spansion s25fl064k with Block Protect support (that requires you to
>>>     unlock at boot by writing SR=0 (?))
>>> (3) Winbond w25q64 with Block Protect support (that requires you to
>>>     unlock at boot by writing SR=0)
>>>
>>> And (1)-(3) all report the same ID, and (1) is incompatible with (2) and
>>> (3). Am I right? Are flash vendors really this insane? Should we all
>>> just give up and go home?
>>>
>>
>> Just a general remark: maybe reading the JEDEC ID is not a so reliable mean to
>> discover SPI flash hardware capabilities at runtime.
>>
>> Two weeks ago some Macronix people came to Atmel to present us next evolutions
>> of SPI flashes. We took this opportunity to ask them some questions and one of
>> them was about memories with different hardware capabilities sharing the very
>> same JEDEC ID. One example is Macronix MX25L25635E vs MX25L25673G.
>>
>> They explained to us that for Macronix memories, the 2byte product ID is to be
>> split into a 1byte code for the memory type and a second byte for the memory
>> denstity. For instance:
>> C2: Manufacturer ID, Macronix
>> 20: Memory Type, SPI NOR flash
>> 19: Memory density, 256Mib
>>
>> Hence the JEDEC ID only provides information about the memory size and all
>> SPI NOR memories of a given size actually share the same JEDEC ID.
> 
> That doesn't seem to be true though. There are flash entries for
> Macronix with different ID's, but the same density. So maybe they mean
> that *some* SPI NOR memories of a given size share the same JEDEC ID?
> 

Yes you're right.
The Memory Type and the Memory Density bytes are assigned by the manufacturers.
I guess they just set the values they want following their own logic.
For instance mx25l25635e, mx25l25655e and mx25l25673g all use 0x19 for the
Memory Density however both the 35e and 73g use 0x20 for the Memory Type
whereas the 55e use 0x26 instead. Why? I don't know.
Maybe different product families or hardware technologies.


> Anyway, even if they keep this pattern for the first 3 bytes, isn't it
> possible for them to include extra bytes to differentiate? Or, you know,
> support a standard like SFPD properly. But there are understood (but not
> insurmountable) problems with that. (And anyway, SFDP doesn't tell us
> all the things we need.)
> 

I guess it could be possible for them, for instance Spansion does (did?) so.
However I don't expect other manufacturers to change their naming policy.
My understanding is that they assume this is not an issue since we know what
the actual part number of the memory is embedded in our board so we shouldn't
need to read the JEDEC ID to guess this part number at runtime.

Then, it seems you're right when you propose to more rely on the DT compatible
string and add specific entries in the spi_nor_ids[] table with flags to
declare the supported hardware capabilities.

I've tried this approach in v5 of my series for support of 4byte address op
codes.

>> Similar cases can also be found with other manufacturers: Micron, Winbond,
>> Spansion... 
>>
>> Also the Macronix engineers asked us how software applications drive the (Q)SPI
>> memories. I answered them that Linux or u-boot use a static table indexed by
>> the JEDEC ID, which provides the hardware capabilities. I guess they didn't
>> expect software developers to use the JEDEC ID for this purpose.
>> Well, it's just a feeling.
>>
>> Then the Macronix engineers proposed to use the Serial Flash Discoverable
>> Parameter (SFDP) tables to make the difference between memories sharing the
>> same JEDEC ID. This might help us in some cases.
>> However we should be cautious when using this standard: last year, I've tried
>> to discover hardware parameters through these tables when I was working with
>> Spansion and Micron memories. I found out the Parameter Table Pointers inside
>> the SFDP Header were expressed as byte offset with one memory and as dword
>> offset with the other.
> 
> Yeah, I noticed this. And I think one or more of them noticed their
> error and fixed it in later revs, so you can't depend on a manufacturer
> always having the same broken interpretation consistently.
> 

Maybe some flags in specific entries to declare some implementation quirks ?

>> So I gave up using these tables since some memories diverged from the standard,
>> which was "work in progress" at that time.
>>
>> Anyway if we cannot completely rely on the SFDP tables we could still use
>> DT properties but we should no longer expect to guess all hardware parameters
>> from the JEDEC ID alone.
> 
> In your conversations, did the vendors actually suggest a practical
> method to differentiate flash? Since they've all screwed up SFDP, that's
> not going to fly, unless we (e.g.) blacklist certain flash. Anyway, I'd
> love to have some basic support for SFDP, even if we have to be
> conservative at first. For one, I think it'd be fair to add another
> compatible property "jedec,sfdp-vXXX", and then we only use that on
> flash that support the actual spec.
> 

Indeed Macronix suggested us to use the SFDP tables. I guess all manufacturers
tend to implement the latest version of the SFDP standard even if it breaks
compatibility with implementations of older memories.

To differentiate the MX25L25635E and MX25L25673G, they told us to combine
info read from both the SFDP tables and the Status Register: on 73G the
Quad Enable bit is always set and cannot be cleared whereas this bit is cleared
as a default factory setting.
However we pointed out that this bit is non-volatile and will be set to 1
during the very first boot so still cannot make the difference between the
35E and the 73G.
Then they suggest us to try to clear the QE bit (only possible on 35E) but
I don't think it can be considered as a clean implementation...

Also in this particular example, I don't see how the SFDP tables could help.

Nevertheless, SFDP tables might help with other topics such as what procedures
to use to enable the Quad Enable bit (if it exists), to enter/leave for 4-4-4
and 0-4-4 (XIP) modes.

Latest version of the SFDP tables uses bits in some words to declared the
supported procedures. It is not stated explicitly but there is almost one
bit/procedure per manufacturer. Some procedures are almost the same except
some tiny change, which looks like a bug fixup.

One procedure asks to always write 2 bytes during Write Status operations
otherwise SR2 is implicitly reset hence clearing the QE bit.
Its variant claims it is allowed the write only one byte for Write Status,
SR2 being left unchanged.
The manufacturer is not provided but the procedures match the one implemented
in the spi-nor framework to enable the QE bit in Spansion memories.


> Also rather than adding a ton of new DT properties, I think it might
> make more sense to just add more DT compatible matches for the actual
> part number (they're not going to start re-using part numbers are
> they??). That way we don't rely on the DT writer to get every little
> detail right, when the driver *should* be able to hold this info.
> 
> Brian
> 

Best regards,

Cyrille
