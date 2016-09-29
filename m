Received: from mail-db5eur01on0067.outbound.protection.outlook.com
 ([104.47.2.67] helo=EUR01-DB5-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bpjWg-0002te-IV
 for linux-mtd@lists.infradead.org; Thu, 29 Sep 2016 22:09:59 +0000
From: Han Xu <han.xu@nxp.com>
To: Albert ARIBAUD <albert.aribaud@3adev.fr>, Han Xu <xhnjupt@gmail.com>
CC: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: Re: [PATCH 1/2] fsl-quadspi: fix QUAD read, add NORMAL, DUAL and FAST
 reads
Date: Thu, 29 Sep 2016 22:09:33 +0000
Message-ID: <DB5PR0401MB184590EED7EB8A68E7352E8997CE0@DB5PR0401MB1845.eurprd04.prod.outlook.com>
References: <20160927055957.427-1-albert.aribaud@3adev.fr>
 <20160928200652.GA31901@shlinux2>,
 <20160928234546.6df9c893.albert.aribaud@3adev.fr>
In-Reply-To: <20160928234546.6df9c893.albert.aribaud@3adev.fr>
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Albert ARIBAUD <albert.aribaud@3adev.fr>
Sent: Wednesday, September 28, 2016 3:45 PM
To: Han Xu
Cc: linux-mtd@lists.infradead.org; devicetree@vger.kernel.org; Han Xu
Subject: Re: [PATCH 1/2] fsl-quadspi: fix QUAD read, add NORMAL, DUAL and F=
AST reads

Hello Han,

Le Thu, 29 Sep 2016 04:06:52 +0800, Han Xu <xhnjupt@gmail.com> a =E9crit :

> Too much changes in one patch, need to split to several patches.

Will do.

> > +#define QUADSPI_SPTRCLR                    0x15c
> > +#define QUADSPI_SPTRCLR_BFPTRC_SHIFT               0
> > +#define QUADSPI_SPTRCLR_BFPTRC_MASK                (0x1 << QUADSPI_SPT=
RCLR_BFPTRC_SHIFT)
> > +
>
> offset 0x15c is SR register for i.MX, not sure where does SPTRCLR come fr=
om

It's a typo -- should have been 0x16c, not 0x15c. It is the Vybrid's
Sequence Pointer Clear Register. Apparently, the bad register write did
not screw thing up enough to cause any visible issue. Thanks for
pointing it out.

> > +    /* use 24-bit addresses for up to 16MB, 32-bit above 16MB */
> > +   if (q->nor_size <=3D SZ_16M)
> > +           addrlen =3D ADDR24BIT;
> > +   else
> > +           addrlen =3D ADDR32BIT;
>
> A better patch fetch info from nor structure, refer to
> https://patchwork.ozlabs.org/patch/613429/

v3 (https://patchwork.kernel.org/patch/9287005/) seems poised to go in
at some point. I can base my patches above it. I will mention the
dependency in my series' cover letter.

> > + * When using two ports, the SEQID to use for one port might differ fr=
om
> > + * the one to use for the other (e.g., if one port can do 4-pad reads =
but
> > + * the other cannot). So we set up a basic mode here (SEQID_READ) and =
we
> > + * will set up the proper SEQID for the port right before doing the AH=
B
> > + * access(es).
> >   */
>
> It's rare to find this use case, considering the amount of lut is only 16=
,
> please don't add two many luts in this way. I will send a patch soon for
> dynamic lut change, please add these extra luts in dynamic lut list.

I'm fine with switching to a dynamic LUT list; this matches the "two
ports with different characteristics" well. Is the patch already
available somewhere so that I can rebase over it in advance?

Just sent the patch out, refer to https://patchwork.ozlabs.org/patch/676791=
/

> >     /* Read out the data directly from the AHB buffer.*/
> > -   memcpy(buf, q->ahb_addr + q->chip_base_addr + from - q->memmap_offs=
,
> > -           len);
> > +   memcpy(buf, q->ahb_addr + nor_ofs + from, len);
>
> No much diff from the previous implementation

Still, it simplifies the memcpy source address computation.

> > +           ret =3D spi_nor_scan(nor, NULL, readmode);
>
> Not necessary, can fetch info from nor structure
> https://patchwork.ozlabs.org/patch/613429/

Ditto.

Thanks for your review!

Cordialement,
Albert ARIBAUD
3ADEV
