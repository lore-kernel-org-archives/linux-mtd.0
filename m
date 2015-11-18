Received: from mail-pa0-x236.google.com ([2607:f8b0:400e:c03::236])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zz8eD-0000j5-Di
 for linux-mtd@lists.infradead.org; Wed, 18 Nov 2015 19:44:06 +0000
Received: by pabfh17 with SMTP id fh17so56091955pab.0
 for <linux-mtd@lists.infradead.org>; Wed, 18 Nov 2015 11:43:43 -0800 (PST)
Date: Wed, 18 Nov 2015 11:43:40 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Javier Martinez Canillas <javier@osg.samsung.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 devicetree@vger.kernel.org
Subject: Re: [PATCH 3/3] doc: dt: mtd: stop referring to driver code for
 spi-nor IDs
Message-ID: <20151118194340.GF140057@google.com>
References: <1447713292-91525-1-git-send-email-computersforpeace@gmail.com>
 <1447713292-91525-4-git-send-email-computersforpeace@gmail.com>
 <564B3407.2020403@osg.samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <564B3407.2020403@osg.samsung.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

On Tue, Nov 17, 2015 at 11:04:55AM -0300, Javier Martinez Canillas wrote:
> On 11/16/2015 07:34 PM, Brian Norris wrote:
> > diff --git a/Documentation/devicetree/bindings/mtd/jedec,spi-nor.txt b/Documentation/devicetree/bindings/mtd/jedec,spi-nor.txt
> > index 2bee68103b01..2c91c03e7eb0 100644
> > --- a/Documentation/devicetree/bindings/mtd/jedec,spi-nor.txt
> > +++ b/Documentation/devicetree/bindings/mtd/jedec,spi-nor.txt
> > @@ -1,15 +1,61 @@
> > -* MTD SPI driver for ST M25Pxx (and similar) serial flash chips
> > +* SPI NOR flash: ST M25Pxx (and similar) serial flash chips
> >  
> >  Required properties:
> >  - #address-cells, #size-cells : Must be present if the device has sub-nodes
> >    representing partitions.
> >  - compatible : May include a device-specific string consisting of the
> > -               manufacturer and name of the chip. Bear in mind the DT binding
> > -               is not Linux-only, but in case of Linux, see the "m25p_ids"
> > -               table in drivers/mtd/devices/m25p80.c for the list of supported
> > -               chips.
> > +               manufacturer and name of the chip. A list of supported chip
> > +               names follows.
> 
> Here says that the compatible string consists of manufacturer and name...
> 
> >                 Must also include "jedec,spi-nor" for any SPI NOR flash that can
> >                 be identified by the JEDEC READ ID opcode (0x9F).
> > +
> > +               Supported chip names:
> > +                 at25df321a
> > +                 at25df641
[...]
> +
> 
> ... but the entries in the list don't have a manufacturer. I know this is
> due backward compatibility because as we discussed in the thread mentioned
> in the cover letter, the SPI core didn't use the manufacturer and that
> implementation detail leaked into the DTBs.
> 
> But I think that either only the correct list with vendor should be added
> to the DT binding docs (but make sure that backward compatibility in the
> driver and SPI core is maintained) or both the wrong and correct list should
> be documented and the former be marked as deprecated.

First, note that the list says "Supported chip *names*" (not "Supported
compatible values"). It does not attempt to specify the full compatible
value, and that's intentional.

Second, I believe it is hard to determine after-the-fact what all the
reasonable pairings of vendors might be. For some of these parts,
various companies have produced parts under the same chip ID -- usually
because one company bought another. For most chips though, this probably
isn't a problem, so I could probably pick reasonable vendor pairings.

IOW, there isn't just "a wrong" and "a correct" list; there's a
(probably?) correct list and an enormous space of "I don't know what
people might have put here" list. It's nearly unbounded, but even a
reasonable list might get pretty large. So in practice, we'd essentially
be sacrificing completeness for...what reason?

> > +               The following chip names have been used historically to
> > +               designate quirky versions of flash chips that do not support the
> > +               JEDEC READ ID opcode (0x9F):
> > +                 m25p05-nonjedec
> > +                 m25p10-nonjedec
> > +                 m25p20-nonjedec
> > +                 m25p40-nonjedec
> > +                 m25p80-nonjedec
> > +                 m25p16-nonjedec
> > +                 m25p32-nonjedec
> > +                 m25p64-nonjedec
> > +                 m25p128-nonjedec
> > +
> 
> Same here, I would prefer if the DT binding make it clear that not having
> a vendor is wrong and is only documented to maintain backward compatibility.

The doc never says anything about not including the vendor. It says

  "May include a device-specific string consisting of the manufacturer
  and name of the chip"

and it lists the chip names. So if someone is actually following the
documentation, they will include a vendor. The vendor names are not
listed because they're really not relevant to the implementation. But I
could try to include them.

> >  - reg : Chip-Select number
> >  - spi-max-frequency : Maximum frequency of the SPI bus the chip can operate at
> >  
> > 

So, what makes sense? I can make a separate list of vendors (my
preference), or even try to pair up vendors with chip names (even if
it's sometimes an N:1 relationship). But I don't see that really buying
us much, since the implementation never has (and probably never will)
enforce this. What do you think?

Regards,
Brian
