Received: from mail0.epfl.ch ([128.178.50.57])
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 17Sgeu-0001eS-00
	for <linux-mtd@lists.infradead.org>; Thu, 11 Jul 2002 17:19:12 +0100
Received: from fred by rhin with local (Exim 3.35 #1 (Debian))
	id 17Sget-00027e-00
	for <linux-mtd@lists.infradead.org>; Thu, 11 Jul 2002 18:19:11 +0200
Date: Thu, 11 Jul 2002 18:19:10 +0200
From: Frederic Gobry <frederic.gobry@smartdata.ch>
To: linux-mtd@lists.infradead.org
Subject: Re: mmap question
Message-ID: <20020711161909.GA8143@rhin>
References: <20020604132254.GA4911@rhin.smartdata.ch> <20020701131443.GA10227@rhin>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="17pEHd4RhPHOinZp"
Content-Disposition: inline
In-Reply-To: <20020701131443.GA10227@rhin>
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

--17pEHd4RhPHOinZp
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

I don't despair having an answer to at least one of my questions :-)

I implemented mmap on a mtd device (via a simple remap_page_range). I
have a userland program that opens and mmap a mtd device with success,
and can read-access it correctly. But once I perform a MEMERASE ioctl
or a simple write, the process only reads series of 0x80 bytes. If I
restart the process, it continues reading this value (even before any
erase/write operation) unless I reboot.

Do anybody have a clue about this behavior ?

My setup: ARM process (OMAP1510 board),  MTD device uses cfi_probe=20

Thanks in advance,
Fr=E9d=E9ric

--=20
Fr=E9d=E9ric Gobry    SMARTDATA    	 =20
      ---         http://www.smartdata.ch
Software Engineer Lausanne - Switzerland
                  +41 21 693 84 98
				 =20

--17pEHd4RhPHOinZp
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.7 (GNU/Linux)

iD8DBQE9La/9FjQHpltE9KURAuE1AJ92srVvLtDTAFnFFgo1VIrwspQxvwCeOt+M
il7I3odrnNmiVMwQfzCXytE=
=dEIF
-----END PGP SIGNATURE-----

--17pEHd4RhPHOinZp--
