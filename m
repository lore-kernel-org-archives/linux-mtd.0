Received: from mailrelay005.isp.belgacom.be ([195.238.6.171])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JeoNp-0003WW-6n
	for linux-mtd@lists.infradead.org; Thu, 27 Mar 2008 09:26:53 +0000
From: Laurent Pinchart <laurentp@cse-semaphore.com>
To: linux-mtd@lists.infradead.org
Subject: Re: [PATCH 1/2] [MTD] Add support for RAM & ROM mappings in
	=?iso-8859-1?q?the=09physmap=5Fof_MTD?= driver.
Date: Thu, 27 Mar 2008 10:26:51 +0100
References: <200803261344.03438.laurentp@cse-semaphore.com>
	<47EA6B11.7050804@ru.mvista.com>
	<777c028aa41fe870542afdb4fa7d2db6@kernel.crashing.org>
In-Reply-To: <777c028aa41fe870542afdb4fa7d2db6@kernel.crashing.org>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Message-Id: <200803271026.51555.laurentp@cse-semaphore.com>
Cc: Sergei Shtylyov <sshtylyov@ru.mvista.com>, ben@simtec.co.uk,
	David Gibson <david@gibson.dropbear.id.au>,
	Segher Boessenkool <segher@kernel.crashing.org>, linuxppc-dev@ozlabs.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wednesday 26 March 2008 16:34, Segher Boessenkool wrote:
> >>>      {
> >>> +        .compatible    =3D "physmap-ram",
> >>> +        .data        =3D (void *)"map_ram",
> >>> +    },
> >>> +    {
> >>> +        .compatible    =3D "physmap-rom",
> >>> +        .data        =3D (void *)"map_rom",
> >>> +    },
> >
> >> Why the cast?  It's redundant afaics.
> >
> >   To be in line with the surrounding code...
>=20
> I see _that_, but it's not a great argument IMNSHO.  Could I trick
> you into preceding this patch with a cleanup patch for the existing
> casts?

Ok. I'll submit a new patch as soon as we agree on a compatible name.

=2D-=20
Laurent Pinchart
CSE Semaphore Belgium

Chauss=E9e de Bruxelles, 732A
B-1410 Waterloo
Belgium

T +32 (2) 387 42 59
=46 +32 (2) 387 42 75
