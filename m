Received: from mail-iy0-f177.google.com ([209.85.210.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RnfMp-0003JL-DP
 for linux-mtd@lists.infradead.org; Wed, 18 Jan 2012 23:56:36 +0000
Received: by iagw33 with SMTP id w33so1345947iag.36
 for <linux-mtd@lists.infradead.org>; Wed, 18 Jan 2012 15:56:33 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <4F16DCC3.9040803@newsguy.com>
References: <CACJFQ2X831y+Kr2==4NS+Jz8wtOn+k5WMuidepjOQuRQ-SKO9Q@mail.gmail.com>
 <4F16DCC3.9040803@newsguy.com>
Date: Wed, 18 Jan 2012 23:56:33 +0000
Message-ID: <CACJFQ2Xv6vTV+nsjO6g43hwu35sjXgx_uHC5o9Bs2+SMfBe4WA@mail.gmail.com>
Subject: Re: identifying a flash file system
From: Ballymunboy <ballymunboy@gmail.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Mike,

Thank you for taking the time to reply :-)

On Wed, Jan 18, 2012 at 2:52 PM, Mike Dunn <mikedunn@newsguy.com> wrote:
> On 01/17/2012 07:12 PM, Ballymunboy wrote:
>> Hello,
>>
>> We have extracted the NAND flash contents from the TriMedia-based
>> routers from 2Wire.
>
>
> This is a Diskonchip flash?

The flash ICs used on more recent 2Wire router boards are just
common-or-garden NAND ICs with an ONFI interface.

e.g. the Hynix HY27US08561A is found in the 2Wire 2701 router. [3]

However, much earlier 2Wire boards (circa 2003 and earlier) used an
mSys DiskOnChip for persistent storage.

For example, the 2Wire 1800HG ADSL2 modem-router relied on the
MD2811-D16-V3Q18-T, an IC from the DiskOnChip Millennium Plus
series [4]

This is what made us wonder whether 2Wire is still using the
m-Systems Flash Translation Layer from TrueFFS, but with
ONFI-standard NAND flash, such as that Hynix device.

Floating around the internet is a "TrueFFS for Tornado Programmer's Guide".
The Guide was published in 1999 by WindRiver. It documents the
use of TrueFFS with flash devices other than those from the
mSys DiskonChip family.

In code accompanying that Guide, a number of examples are given.
These illustrate the use of TrueFFS with a fairly wide range of flash
devices, most (if not all) of which are now obsolete.

>> We would like to re-build the router's firmware. But, as yet, the
>> flash file system to those devices cannot be identified.
>>
>> There is a header found in the first half of page zero of the flash
>> device. =A0Fields in that header appear to reference two partitions - a
>> boot partition and a file system partition. =A0[1]
>>
>> There is a hunch that the devices are using the flash translation
>> layer from m-Systems TrueFFS =A0(now part of Sandisk). [2]
>
>
> The latest TrueFFS implementation uses the M-Sys proprietary "saftl"
> formatting. =A0Look for ASCII 'CNAND" at the start of the first page of a=
n erase
> block. =A0The page that starts with this magic string contains the TrueFF=
S/saftl
> media header, which has partitioning info, etc. =A0On my Palm Treo 680 wi=
th the
> diskonchip G4, it's on erase block 5. =A0The size of an erase block varie=
s among
> the diskonchip variants.

Aha! Thank you for the advice.

So the magic string, at least in recent versions of TrueFFS is found in
the main part of the flash page rather than in the out-of-band extra bytes
to the page?

>> The 2Wires are running an in-house flavour of BSD =A0(rtBSD/tm) so maybe
>> the file system itself is ported from elsewhere in the *BSD platform.
>
> Not likely. =A0If it's TrueFFS, it's M-Sys proprietary.
>

TrueFFS has got me really confused. It's still not clear to me what it
actually does.

In an ancient message from 2005 posted by Dan Brown to this list, Dan
described TrueFFS as a "block-remapping pseudo-file system".. that sits
on top of the MTD layer and provides an API for the higher-level file syste=
m
such as FAT [5]

That's why we wondered whether a regular file system from elsewhere in the
BSD platform may have been borrowed for the TriMedia port of BSD.  That fil=
e
system would sit on top of the TrueFFS layer, interfacing with it
through the API.
TrueFFS would invoke the MTD-layer functions, which 2Wire wrote for the
TriMedia, to perform the wear-leveling, garbage collection and fault recove=
ry.

That header we found in block 0 of the NAND flash image from a 2Wire 2701
has a content that is uncannily similar to the mSys flash header
discussed in 2004
by a poster to the TriMedia Users Support Group forum.  [6]


>>
>> Has anyone here worked with TrueFFS? =A0What would be the best method
>> for mounting the volume on a Linux PC for examination?
>
>
> Write an saftl implementation for linux mtd :) =A0I think this was done t=
o some
> degree for ntfl and inftl, the predecessors of saftl. =A0Header files des=
cribing
> the data in the aforementioned media header were provided to developers u=
nder
> NDA, and they're floating around out there. =A0But I don't think a full-b=
lown
> saftl filesystem is worth it unless there's a need to examine the existin=
g
> filesystem contents. =A0Ubifs has been working well on my diskonchip. =A0=
What would
> be useful is an mtd partition parser for saftl, though.

> Looks like a neat effort. =A0I don't recognize the data you dumped from p=
age 0.
> I'll compare it with what is on my device when I get a chance. =A0From pe=
rusing
> your blog, it appears you boot from a separate flash device, so the BOOTb=
oot
> string doesn't really make sense.

The bootstrap sequence is unusual for TriMedia-based board.  The sequence h=
as at
least three stages to it.

A boot ROM loads a minimal NAND driver into RAM. That bootloader reads
the contents
of the flash header to find the offset and size of the next stage of
the boot process.

Using those parameters read from the header, the object code for the
next stage is
copied from NAND into memory. That code is typically an OS bootloader or ma=
ybe
the BSD kernel itself.

> Thanks,
> Mike

Thanks Mike. Your time and wisdom is much appreciated :-)

Cheers, a

[1] http://hackingbtbusinesshub.wordpress.com/category/nand-flash/
[2] http://www.texim-europe.com/promotion/119/trueffs%20product%20brief.pdf
[3] https://docs.google.com/open?id=3D0B6wW18mYskvBY2M4Njk0YTEtYjI4ZC00NWUw=
LWFjZmEtNjA1NmUwZWQ2ZTY3
[4] http://hackingbtbusinesshub.wordpress.com/2011/09/02/pcb-photos-of-the-=
2wire-1800hg-medusa-cpu-trimedia-vliw-core/
[5] http://lists.infradead.org/pipermail/linux-mtd/2005-October/014131.html
[6] http://tech.groups.yahoo.com/group/trimedia/message/6367?source=3D1&var=
=3D0&l=3D1
