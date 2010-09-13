Received: from am1ehsobe002.messaging.microsoft.com ([213.199.154.205]
	helo=AM1EHSOBE002.bigfish.com)
	by bombadil.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1OvBt4-0002hP-RP
	for linux-mtd@lists.infradead.org; Mon, 13 Sep 2010 16:28:12 +0000
Received: from mail70-am1 (localhost.localdomain [127.0.0.1])	by
	mail70-am1-R.bigfish.com (Postfix) with ESMTP id D61BD87038E	for
	<linux-mtd@lists.infradead.org>; Mon, 13 Sep 2010 16:28:07 +0000 (UTC)
Received: from am1ehsmhs004.bigfish.com (unknown [10.3.201.240])	by
	mail70-am1.bigfish.com (Postfix) with ESMTP id E24331AF0051	for
	<linux-mtd@lists.infradead.org>; Mon, 13 Sep 2010 16:27:54 +0000 (UTC)
Received: from az33smr02.freescale.net (az33smr02.freescale.net
	[10.64.34.200])	by de01egw02.freescale.net (8.14.3/8.14.3) with ESMTP
	id o8DGRoLU024375	for <linux-mtd@lists.infradead.org>;
	Mon, 13 Sep 2010 09:27:51 -0700 (MST)
Received: from az33exm25.fsl.freescale.net (az33exm25.am.freescale.net
	[10.64.32.16])	by az33smr02.freescale.net (8.13.1/8.13.0) with ESMTP id
	o8DGRve1005544	for <linux-mtd@lists.infradead.org>;
	Mon, 13 Sep 2010 11:27:57 -0500 (CDT)
Date: Mon, 13 Sep 2010 11:27:49 -0500
From: Scott Wood <scottwood@freescale.com>
To: "Zang Roy-R61911" <r61911@freescale.com>
Subject: Re: [PATCH v2 3/3][MTD] P4080/mtd: Fix the freescale lbc issue with
	36bit mode
Message-ID: <20100913112749.2fb32b3d@schlenkerla.am.freescale.net>
In-Reply-To: <3850A844E6A3854C827AC5C0BEC7B60A1FC150@zch01exm23.fsl.freescale.net>
References: <AANLkTik3ViwjmOFfm6GUwmuzMkO75+2pCUdnC0z8A7Jb@mail.gmail.com>
	<3850A844E6A3854C827AC5C0BEC7B60A1FC150@zch01exm23.fsl.freescale.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: quoted-printable
Cc: Wood Scott-B07421 <B07421@freescale.com>, dedekind1@gmail.com,
	Lan Chunhe-B25806 <B25806@freescale.com>,
	linuxppc-dev@ozlabs.org, linux-mtd@lists.infradead.org,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	akpm@linux-foundation.org, dwmw2@infradead.org,
	Gala Kumar-B11780 <B11780@freescale.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 13 Sep 2010 00:22:10 -0700
"Zang Roy-R61911" <r61911@freescale.com> wrote:

>=20
>=20
> > -----Original Message-----
> > From: geert.uytterhoeven@gmail.com [mailto:geert.uytterhoeven@gmail.com=
] On
> > Behalf Of Geert Uytterhoeven
> > Sent: Thursday, September 09, 2010 19:06 PM
> > To: Zang Roy-R61911
> > Cc: linux-mtd@lists.infradead.org; Wood Scott-B07421; dedekind1@gmail.c=
om; Lan
> > Chunhe-B25806; linuxppc-dev@ozlabs.org; akpm@linux-foundation.org;
> > dwmw2@infradead.org; Gala Kumar-B11780
> > Subject: Re: [PATCH v2 3/3][MTD] P4080/mtd: Fix the freescale lbc issue=
 with
> > 36bit mode
> >=20
> > On Thu, Sep 9, 2010 at 12:20, Roy Zang <tie-fei.zang@freescale.com> wro=
te:
> > > From: Lan Chunhe-B25806 <b25806@freescale.com>
> > >
> > > When system uses 36bit physical address, res.start is 36bit
> > > physical address. But the function of in_be32 returns 32bit
> > > physical address. Then both of them compared each other is
> > > wrong. So by converting the address of res.start into
> > > the right format fixes this issue.
> >=20
> > > =A0/**
> > > + * fsl_lbc_addr - convert the base address
> > > + * @addr_base: base address of the memory bank
> > > + *
> > > + * This function converts a base address of lbc into the right forma=
t for
> > the BR
> > > + * registers. If the SOC has eLBC then it returns 32bit physical add=
ress
> > else
> > > + * it returns 34bit physical address for local bus(Example: MPC8641).
> > > + */
> > > +unsigned int fsl_lbc_addr(phys_addr_t addr_base)
> >     ^^^^^^^^^^^^
> > Shouldn't this be u32 or __be32, for consistency with the actual
> > comparisons below?
> __be32 is better.

I disagree, the return from this function is native-endian.  It should
be u32.

-Scott
