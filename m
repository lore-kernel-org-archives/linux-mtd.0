Received: from ns1ca.ubisoft.qc.ca ([205.205.27.131])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16MZWp-0003qj-00
	for <linux-mtd@lists.infradead.org>; Fri, 04 Jan 2002 18:57:19 +0000
Message-ID: <9A1957CB9FC45A4FA6F35961093ABB840645704B@srvmail-mtl.montreal.ubisoft.org>
From: Patrick Allaire <pallaire@gameloft.com>
To: David Woodhouse <dwmw2@infradead.org>,
        Patrick Allaire
	 <pallaire@gameloft.com>
Cc: =?iso-8859-1?Q?Bj=F6rn_Eriksson?= <mdeans@algonet.se>,
        linux-mtd@lists.infradead.org
Subject: RE: From 2.4.9 to CVS ??? 
Date: Fri, 4 Jan 2002 14:07:46 -0500 
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

Ok ... I found ... I reread David's email ... the libs needs to have =
the
executable attributes !!!

thank you all !

Patrick Allaire
mailto:pallaire@gameloft.com
If you can see it, but it's not there, it's virtual.=20
If you can't see it, but it is there, it's hidden.=20
It you can't see it and it isn't there, it's gone.



> -----Original Message-----
> From: David Woodhouse [mailto:dwmw2@infradead.org]
> Sent: January 4, 2002 12:02 PM
> To: Patrick Allaire
> Cc: Bj=F6rn Eriksson; linux-mtd@lists.infradead.org
> Subject: Re: From 2.4.9 to CVS ???=20
>=20
>=20
>=20
> pallaire@gameloft.com said:
> > I really dont understand ... I have a sh link in /bin ... but it is
> > not found by the kernel ... and my cramfs didnt changed a bit !!!=20
>=20
> > in /bin, I have a link : sh -> busybox
>=20
> Is it statically linked?
>=20
> --
> dwmw2
>=20
>=20
