Received: from proxy.force.de ([158.116.254.130])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 189PGO-0002ki-00
	for <linux-mtd@lists.infradead.org>; Wed, 06 Nov 2002 12:26:29 +0000
Received: from ex-deu-munich02.force.de (ex-deu-munich02.force.de [10.254.2.10])
	by proxy.force.de (8.11.4/8.11.4) with ESMTP id gA6Cup224741
	for <linux-mtd@lists.infradead.org>; Wed, 6 Nov 2002 13:56:52 +0100 (MET)
Message-ID: <9CFB9DA5261CD611A29B00508B789048380A49@ex-deu-munich02.force.de>
From: "Gettert, Wolfram" <Wolfram.Gettert@fci.com>
To: "'linux-mtd@lists.infradead.org'" <linux-mtd@lists.infradead.org>
Subject: RE: MTD newbie wants programming a 28F800 with a 2.2.18 kernel
Date: Wed, 6 Nov 2002 13:56:46 +0100 
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

> -----Original Message-----
> From: J=F6rn Engel [mailto:joern@wohnheim.fh-wedel.de]
> Sent: Mittwoch, 6. November 2002 10:27
> To: Gettert, Wolfram
> Cc: 'linux-mtd@lists.infradead.org'
> Subject: Re: MTD newbie wants programming a 28F800 with a=20
> 2.2.18 kernel
>=20
>=20
> On Wed, 6 November 2002 09:25:25 +0100, Gettert, Wolfram wrote:
> > I am completely new to MTD. My job is to program a 28F800=20
> boot block flash
> > running a 2.2.18 kernel.
> > I am using  this patch mtd-patch-2.2.18-20001218-2230GMT.=20
> Since there is no
> > support for the 28F800 because it has CUI not CFI  I need=20
> to write the
> > driver for the CUI. I found the lart-driver (lart.c) in the=20
> 2.5.x sources
> > which can manage a 28F160 (which is compatible to 28F800).
> >=20
> > Do you know of any implementation of the lart-driver on a=20
> 2.2.x kernel?
> > Since the mtd_info structure has changed extensively from=20
> the 2.2.18-patch
> > to 2.5.x there is a lot of work to-do.
>=20
> As always, bugging the company to finally upgrade to a recent kernel
> is a good thing, although unrealistic. :-)
>=20
> Most of the mtd code in cvs should be running on any kernel from =
2.2.0
> up to 2.5.current. David has done an excellent job there. So you
> should take a peek into cvs, whenever you have a problem.
>=20
> Apart from that, try to cut down on the number of #ifdefs, consider
> sending a patch to David and good luck!
>=20
> J=F6rn
>=20
> --=20
> Everything should be made as simple as possible, but not simpler.
> -- Albert Einstein
>=20

Do you try to tell me not to use the patch but getting the most recent =
MTD
code from 2.5.x and get it running under 2.2.18?
Perhaps it's just the easiest way? Of course I get the best MTD code.


Wolfram
