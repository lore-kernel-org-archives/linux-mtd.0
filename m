Received: from ns1ca.ubisoft.qc.ca ([205.205.27.131])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16MXXz-0003gw-00
	for <linux-mtd@lists.infradead.org>; Fri, 04 Jan 2002 16:50:23 +0000
Message-ID: <9A1957CB9FC45A4FA6F35961093ABB8406456EDF@srvmail-mtl.montreal.ubisoft.org>
From: Patrick Allaire <pallaire@gameloft.com>
To: David Woodhouse <dwmw2@infradead.org>,
        Patrick Allaire
	 <pallaire@gameloft.com>
Cc: =?iso-8859-1?Q?Bj=F6rn_Eriksson?= <mdeans@algonet.se>,
        linux-mtd@lists.infradead.org
Subject: RE: From 2.4.9 to CVS ??? 
Date: Fri, 4 Jan 2002 12:01:14 -0500 
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

I really dont understand ... I have a sh link in /bin ... but it is not
found by the kernel ... and my cramfs didnt changed a bit !!!=20

in /bin, I have a link : sh -> busybox

Patrick Allaire
mailto:pallaire@gameloft.com
If you can see it, but it's not there, it's virtual.=20
If you can't see it, but it is there, it's hidden.=20
It you can't see it and it isn't there, it's gone.



> -----Original Message-----
> From: David Woodhouse [mailto:dwmw2@infradead.org]
> Sent: January 4, 2002 11:54 AM
> To: Patrick Allaire
> Cc: Bj=F6rn Eriksson; linux-mtd@lists.infradead.org
> Subject: Re: From 2.4.9 to CVS ???=20
>=20
>=20
>=20
> pallaire@gameloft.com said:
> >  No I dont have 'bad cramfs magic' !!! I tought it could be the =
case
> > ... but I looked at the mkcramfs.c from the 2.4.9 and 2.4.17 =
version
> > and there is no difference So the generated code should be=20
> the same.=20
>=20
> P'raps we started paying attention to execute bits on=20
> libraries between=20
> 2.4.9 and 2.4.17? I thought we did that a long time ago though.=20
>=20
> Put a statically linked shell in the cramfs and boot with=20
> that as init.=20
> Then try running /sbin/init and see what errors you get.
>=20
>=20
> --
> dwmw2
>=20
>=20
