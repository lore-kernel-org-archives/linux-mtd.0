Received: from gateway-1237.mvista.com ([12.44.186.158] helo=thud.mvista.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15Czke-0005zZ-00
	for <linux-mtd@lists.infradead.org>; Thu, 21 Jun 2001 09:23:44 +0100
Date: Thu, 21 Jun 2001 01:34:21 -0700
From: mferrell@mvista.com
To: David Woodhouse <dwmw2@infradead.org>
Cc: Darryl Dieckman <ddieckma@cliftonlabs.com>, linux-mtd@lists.infradead.org
Subject: Re: USB Device Support
Message-ID: <20010621013421.C20440@thud.mvista.com>
References: <02b301c0f9f9$63009790$0201a8c0@dieckman.net> <30891.993108683@redhat.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-md5;
	protocol="application/pgp-signature"; boundary="8NvZYKFJsRX2Djef"
Content-Disposition: inline
In-Reply-To: <30891.993108683@redhat.com>; from dwmw2@infradead.org on Thu, Jun 21, 2001 at 08:31:23AM +0100
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

--8NvZYKFJsRX2Djef
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

So far all the USB Storage interface devices I have played with, including
flash on USB, are all pretty much the same.  The Linux USB Storage drivers
export the device as a SCSI device to user land.  But then again, those are
still only the ones I have played with.  Maybe someone wanted to do somethi=
ng
different?  Would it even comply with USB spec if they did?

On Thu, Jun 21, 2001 at 08:31:23AM +0100, David Woodhouse wrote:
>=20
> ddieckma@cliftonlabs.com said:
> > I'm looking into the feasibility of developing a driver for a USB
> > FLASH storage device.
>=20
> Are you sure this USB device really looks like flash to the computer?
>=20
> I thought that USB devices, just like CompactFlash, had a kind of
> translation layer built in which does everything for you, including wear
> levelling. They just appear as a USB storage device, don't they?
>=20
> --
> dwmw2
>=20
>=20
>=20
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/

--=20
Mark Ferrell <mferrell@mvista.com>
Monta Vista Software Inc. <http://www.mvista.com>

--8NvZYKFJsRX2Djef
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.4 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE7MbGMxfbss44dZwgRAoblAKCpkcuJu49l2EhrD+i0/fHwKMfKAgCfSbvj
zVWj0Fu9alLLwDv/tRu9lU4=
=pN6q
-----END PGP SIGNATURE-----

--8NvZYKFJsRX2Djef--
