Received: from mail0.epfl.ch ([128.178.50.57])
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 17P10v-0002Uz-00
	for <linux-mtd@lists.infradead.org>; Mon, 01 Jul 2002 14:14:45 +0100
Received: from fred by rhin with local (Exim 3.35 #1 (Debian))
	id 17P10u-0002fI-00
	for <linux-mtd@lists.infradead.org>; Mon, 01 Jul 2002 15:14:44 +0200
Date: Mon, 1 Jul 2002 15:14:43 +0200
From: Frederic Gobry <frederic.gobry@smartdata.ch>
To: linux-mtd@lists.infradead.org
Subject: Re: mmap question
Message-ID: <20020701131443.GA10227@rhin>
References: <20020604132254.GA4911@rhin.smartdata.ch>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="2fHTh5uZTiUOsy+g"
Content-Disposition: inline
In-Reply-To: <20020604132254.GA4911@rhin.smartdata.ch>
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

--2fHTh5uZTiUOsy+g
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

I follow-up to my own question: I've managed to use mmap with jffs2
quite successfully, but now I would like to directly use MTD (so that
I can handle the way sectors are erased / written to in order to
ensure good atomicity).

I've seen that the MTD char driver does not provide mmap support. In
order to implement it, I would like to know if I can use the 'point'
function of the mtd_info structure to get the physical address of the
flash device. From the documentation

  "For devices which are entirely memory-mapped and which can be
   mapped directly into user-space page tables, we may support
   execute-in-place (XIP) mapping of data on the flash. The precise
   semantics of this are yet to be defined, so it's probably best just
   not to either implement or attempt to use these two functions right
   at the moment."

So, is it the correct way to go ?

Thanks,

Fr=E9d=E9ric

--2fHTh5uZTiUOsy+g
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.7 (GNU/Linux)

iD8DBQE9IFXDFjQHpltE9KURAranAJ43zT6YSjoffD2vXtXY2hAwVOUTuACeML/9
Fo1xwBZjc66T7CJEYQzaaic=
=TgFZ
-----END PGP SIGNATURE-----

--2fHTh5uZTiUOsy+g--
