Received: from mail-ig0-x236.google.com ([2607:f8b0:4001:c05::236])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aZLJO-0000c9-KQ
 for linux-mtd@lists.infradead.org; Fri, 26 Feb 2016 16:32:15 +0000
Received: by mail-ig0-x236.google.com with SMTP id z8so39066954ige.0
 for <linux-mtd@lists.infradead.org>; Fri, 26 Feb 2016 08:31:54 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.00.1602261411591.15885@tp.orcam.me.uk>
References: <1452991370-20121-1-git-send-email-zajec5@gmail.com>
 <alpine.DEB.2.00.1601240345260.5958@tp.orcam.me.uk>
 <CACna6rzBTKXE6=ej-PY7V3facAR9kJ-Tq2LDc2EwszaTCK+2YA@mail.gmail.com>
 <alpine.DEB.2.00.1602261411591.15885@tp.orcam.me.uk>
Date: Fri, 26 Feb 2016 17:31:53 +0100
Message-ID: <CACna6rx5ajqRq3m4nLr8jRy+-RjCuTsSYCnjNhj6Q0F0LJtQYQ@mail.gmail.com>
Subject: Re: [PATCH] mtd: bcm47xxsflash: use ioremap_cachable() instead of
 KSEG0ADDR()
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
To: "Maciej W. Rozycki" <macro@imgtec.com>
Cc: Brian Norris <computersforpeace@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Javier Martinez Canillas <javier@osg.samsung.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Fengguang Wu <fengguang.wu@intel.com>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Luis de Bethencourt <luisbg@osg.samsung.com>, Jeremy Kerr <jk@ozlabs.org>,
 Neelesh Gupta <neelegup@linux.vnet.ibm.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Cyril Bur <cyrilbur@gmail.com>, Ralf Baechle <ralf@linux-mips.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 26 February 2016 at 15:18, Maciej W. Rozycki <macro@imgtec.com> wrote:
> On Fri, 26 Feb 2016, Rafa=C5=82 Mi=C5=82ecki wrote:
>
>> >> KSEG0ADDR was translating 0x1c000000 into 0x9c000000. With
>> >> ioremap_cachable we use MIPS's __ioremap (and remap_area_pages). This
>> >> results in different address (e.g. 0xc0080000) but it still should be
>> >> cached as expected and it was successfully tested with BCM47186B0.
>> >
>> >  This is due to this piece:
>> >
>> >         /*
>> >          * Map uncached objects in the low 512mb of address space usin=
g KSEG1,
>> >          * otherwise map using page tables.
>> >          */
>> >         if (IS_LOW512(phys_addr) && IS_LOW512(last_addr) &&
>> >             flags =3D=3D _CACHE_UNCACHED)
>> >                 return (void __iomem *) CKSEG1ADDR(phys_addr);
>> >
>> > special-casing uncached mapping only (replicated in 2 places).  I thin=
k
>> > there will really be no harm from returning a KSEG0 mapping for calls
>> > requesting a caching mode equal to `_page_cachable_default', which --
>> > depending on the cache architecture -- will have been either hardwired=
 or
>> > prearranged via Config.K0.  I think there's really no need to put pres=
sure
>> > on the TLB, which may be small, in cases where a fixed mapping will do=
.
>>
>> No, it isn't hitting condition you pointed. We call ioremap_cachable
>> which uses _page_cachable_default as a flag. This flag
>> (_page_cachable_default) isn't equal to the _CACHE_UNCACHED.
>
>  That's exactly what I wrote: code I quoted is "special-casing uncached
> mapping only" -- which as you have correctly observed does not apply afte=
r
> your change anymore.  Which is why previously you got an address in the
> unmapped KSEG1 segment and now you get an address in the mapped KSEG2
> rather than the unmapped KSEG0 segment.
>
>> Moreover code you pointed uses CKSEG1ADDR which would result in
>> setting bit KSEG1 (0xa0000000). As I pointed in the commit message
>> address it ORed with KSEG2 (0xc0000000).
>
>  It's not merely ORed, it's actually mapped via the TLB.
>
>  I hope this makes things clear.

Ah, sorry, I missed the point of your explanation. Now it's clear, thanks!

--=20
Rafa=C5=82
