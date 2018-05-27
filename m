Received: from mail1.bemta12.messagelabs.com ([216.82.251.6])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fN5FT-0003Wj-R4
 for linux-mtd@lists.infradead.org; Sun, 27 May 2018 23:38:53 +0000
From: IKEGAMI Tokunori <ikegami@allied-telesis.co.jp>
To: Boris Brezillon <boris.brezillon@bootlin.com>
CC: Joakim Tjernlund <Joakim.Tjernlund@infinera.com>, PACKHAM Chris
 <chris.packham@alliedtelesis.co.nz>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>, "cyrille.pitchen@wedev4u.fr"
 <cyrille.pitchen@wedev4u.fr>, "dwmw2@infradead.org" <dwmw2@infradead.org>,
 "computersforpeace@gmail.com" <computersforpeace@gmail.com>,
 "boris.brezillon@free-electrons.com" <boris.brezillon@free-electrons.com>,
 "richard@nod.at" <richard@nod.at>, "marek.vasut@gmail.com"
 <marek.vasut@gmail.com>
Subject: RE: [PATCH v6 0/5] mtd: cfi_cmdset_0002: Change write and erase
 functions
Date: Sun, 27 May 2018 23:31:55 +0000
Message-ID: <TY1PR01MB0954F27EB0BAC45D3D44ACC9DC6F0@TY1PR01MB0954.jpnprd01.prod.outlook.com>
References: <20180515171120.5629-1-smtpuser@allied-telesis.co.jp>
 <f74834424cb3f1f86e8803884b53be5f62d15c94.camel@infinera.com>
 <TY1PR01MB0954DBEFF399886473C1242FDC690@TY1PR01MB0954.jpnprd01.prod.outlook.com>
 <20180527173905.6e9df536@bbrezillon>
In-Reply-To: <20180527173905.6e9df536@bbrezillon>
Content-Language: ja-JP
Content-Type: text/plain; charset="us-ascii"
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

Hi Boris-san,

Yes I have just sent v7 version patches so please review them.

Regards,
Ikegami

> -----Original Message-----
> From: Boris Brezillon [mailto:boris.brezillon@bootlin.com]
> Sent: Monday, May 28, 2018 12:39 AM
> To: IKEGAMI Tokunori
> Cc: Joakim Tjernlund; PACKHAM Chris; linux-mtd@lists.infradead.org;
> cyrille.pitchen@wedev4u.fr; dwmw2@infradead.org;
> computersforpeace@gmail.com; boris.brezillon@free-electrons.com;
> richard@nod.at; marek.vasut@gmail.com
> Subject: Re: [PATCH v6 0/5] mtd: cfi_cmdset_0002: Change write and erase
> functions
>=20
> On Fri, 25 May 2018 03:03:28 +0000
> IKEGAMI Tokunori <ikegami@allied-telesis.co.jp> wrote:
>=20
> > Hi Boris-san,
> >
> > Could you please apply the patches if no problem?
>=20
> Actually I never received your v6, and I can't find it in linux-mtd
> either. Interestingly, it's in patchwork, so maybe a problem on my side.
>=20
> > Or still should we wait if any other comment?
>=20
> Not really, maybe add the Cc:stable tag if you think this is needed.
>=20
> > Let me confirm these things since we are waiting to apply them for our
> product problem as resolution.
> >
> > By the way I think that the commit message of patches can be changed to
> Jocke-san as "Reviewed-by" from "Cc" as below.
> >   - Cc: Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
> >   + Reviewed-by: Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
> >
> > Since actually the changes have been reviewed by him as the mail below.
>=20
> Normally you should wait for an official "Reviewed-by" tag. I just
> asked Joakim.
>=20
> > Also our company mail system has been changed so now I can send the pat=
ches
> with my email address as sender instead of the smtpuser address.
>=20
> That's appreciated.
>=20
> > If needed I will resend patches or send them as new version patches aga=
in
> to change the commit message and send address.
>=20
> Yes please, send a new version.
>=20
> Thanks,
>=20
> Boris
