Received: from smtp3.newsguy.com ([74.209.136.66] helo=smtp.newsguy.com)
 by casper.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RnxaE-0007bi-5C
 for linux-mtd@lists.infradead.org; Thu, 19 Jan 2012 19:23:40 +0000
Received: from [192.168.12.102] (239.sub-166-250-11.myvzw.com [166.250.11.239])
 by smtp.newsguy.com (8.14.3/8.14.3) with ESMTP id q0JJNNhQ081099
 (version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256 verify=NO)
 for <linux-mtd@lists.infradead.org>; Thu, 19 Jan 2012 11:23:24 -0800 (PST)
 (envelope-from mikedunn@newsguy.com)
Message-ID: <4F186D94.5010009@newsguy.com>
Date: Thu, 19 Jan 2012 11:23:00 -0800
From: Mike Dunn <mikedunn@newsguy.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: Re: identifying a flash file system
References: <CACJFQ2X831y+Kr2==4NS+Jz8wtOn+k5WMuidepjOQuRQ-SKO9Q@mail.gmail.com>
 <4F16DCC3.9040803@newsguy.com>
 <CACJFQ2Xv6vTV+nsjO6g43hwu35sjXgx_uHC5o9Bs2+SMfBe4WA@mail.gmail.com>
In-Reply-To: <CACJFQ2Xv6vTV+nsjO6g43hwu35sjXgx_uHC5o9Bs2+SMfBe4WA@mail.gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 01/18/2012 03:56 PM, Ballymunboy wrote:
> The flash ICs used on more recent 2Wire router boards are just
> common-or-garden NAND ICs with an ONFI interface.
>
> e.g. the Hynix HY27US08561A is found in the 2Wire 2701 router. [3]
>
> However, much earlier 2Wire boards (circa 2003 and earlier) used an
> mSys DiskOnChip for persistent storage.


Ah, I see.  More of a family of products having different BOMs.  You picked a
tough nut to crack.


>
> For example, the 2Wire 1800HG ADSL2 modem-router relied on the
> MD2811-D16-V3Q18-T, an IC from the DiskOnChip Millennium Plus
> series [4]


The Millenium Plus has inftl formatting.


>
> This is what made us wonder whether 2Wire is still using the
> m-Systems Flash Translation Layer from TrueFFS, but with
> ONFI-standard NAND flash, such as that Hynix device.


Makes sense.  Companies are likely to take the path of least resistance when it
comes to development.


>
> Floating around the internet is a "TrueFFS for Tornado Programmer's Guide".
> The Guide was published in 1999 by WindRiver. It documents the
> use of TrueFFS with flash devices other than those from the
> mSys DiskonChip family.
>
> In code accompanying that Guide, a number of examples are given.
> These illustrate the use of TrueFFS with a fairly wide range of flash
> devices, most (if not all) of which are now obsolete.


This is news to me (which should give you an idea of the extent of my
knowledge).  I didn't realize M-Sys made TrueFFS a separate product for generic
flash devices.


>>
>> So the magic string, at least in recent versions of TrueFFS is found in
>> the main part of the flash page rather than in the out-of-band extra bytes
>> to the page?


Correct, 'CNAND' resides in the first bytes of the page data, on the first page
of the block that contains the saftl volume header.  The rest of the volume
header structure data follows it on that page.  This applies to the saftl.  I
have little knowledge of inftl, but it has already been reverse-engineered, so
refer to the relevant code in the linux kernel.  I notice that inftl's magic
string is 'ANAND' or 'BNAND'; see find_media_headers() in
drivers/mtd/nand/diskonchip.c.

BTW, I see that inftl uses oob data.  saftl does not.  The "sa" stands for
"serial access", and was developed for MLC nand, where pages must be written
sequentially within a block, which is different from the earlier *ftl's.  I
guess by this point TrueFFS became strictly in-house to M-Sys, though I'm not sure.


> TrueFFS has got me really confused. It's still not clear to me what it
> actually does.
>
> In an ancient message from 2005 posted by Dan Brown to this list, Dan
> described TrueFFS as a "block-remapping pseudo-file system".. that sits
> on top of the MTD layer and provides an API for the higher-level file system
> such as FAT [5]


It is equivalent to UBI, which sits between mtd and ubifs.  There is a good
explanation of this on the linux-mtd site. 

What confused me is the relationship between nftl / inftl / saftl and TrueFFS. 
Esentially they are one and the same.  As TrueFFS evolved to support newer flash
technologies, the *ftl names and definitions changed.  They define the control
structures used by the FTL.  But the *ftl definitions (and the TrueFFS sdk) also
include stuff like boot methods and partitioning / volume headers, which are
technically outside the scope of what an FTL does (e.g., mtd now handles
partitioning, not UBI).


>
> That's why we wondered whether a regular file system from elsewhere in the
> BSD platform may have been borrowed for the TriMedia port of BSD.  That file
> system would sit on top of the TrueFFS layer, interfacing with it
> through the API.


Also makes sense.  I didn't think through my earlier reaction to this.


> The bootstrap sequence is unusual for TriMedia-based board.  The sequence has at
> least three stages to it.
>
> A boot ROM loads a minimal NAND driver into RAM.


FYI, this step is not included in the G4 device I've been working with.  These
devices have a 2K region that interfaces to the system bus at the reset vector
like a NOR flash, and this contains code which can read the rest of the flash.


>  That bootloader reads
> the contents
> of the flash header to find the offset and size of the next stage of
> the boot process.


This next stage of the bootloader is sometimes called the IPL (initial program
loader).


>
> Using those parameters read from the header, the object code for the
> next stage is
> copied from NAND into memory. That code is typically an OS bootloader or maybe
> the BSD kernel itself.


If it's the next stage of the bootloader, it's sometimes called the SPL
(secondary program loader).  There is a reference to a MDOC_LoadSPL() function
in the yahoo groups post.

I suspect the inftl kernel code will have a lot of useful info for you.  Good
luck and have fun.

Mike
