Received: from smartdatapc1.epfl.ch ([128.179.50.2] helo=rhin.smartdata.ch)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17FEH2-00050L-00
	for <linux-mtd@lists.infradead.org>; Tue, 04 Jun 2002 14:22:56 +0100
Received: (from fred@localhost)
	by rhin.smartdata.ch (8.11.1/8.11.1) id g54DMsP04920
	for linux-mtd@lists.infradead.org; Tue, 4 Jun 2002 15:22:54 +0200
Date: Tue, 4 Jun 2002 15:22:54 +0200
From: Frederic Gobry <frederic.gobry@smartdata.ch>
To: linux-mtd@lists.infradead.org
Subject: mmap question
Message-ID: <20020604132254.GA4911@rhin.smartdata.ch>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="NzB8fVQJ5HfG6fxh"
Content-Disposition: inline
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

--NzB8fVQJ5HfG6fxh
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

I need to port an in-memory database so that it can use mtd
devices. The program currently uses mmap in order to access a file as
permanent storage. I discovered that using this capability is not
possible on jffs2, as mmap does not accept MAP_SHARED.

In my framework, write operations are performed by explicit calls, but
the data must be readable as if it were in a direct-access
memory. Would it be possible to do that on jffs2 (for instance,
open/write/close sessions to modify the data, but with immediate
update on the mmapped version of the file)

Alternatively, would it possible to use a raw MTD device to provide
the equivalent service ? I don't need filesystem semantic, as the
program already considers the data as a sequence of pages on a
flash-like device.

Thanks for any suggestion,

Fr=E9d=E9ric

--=20
Fr=E9d=E9ric Gobry    SMARTDATA    	 =20
      ---         http://www.smartdata.ch
Software Engineer Lausanne - Switzerland
                  +41 21 693 84 98

--NzB8fVQJ5HfG6fxh
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.7 (GNU/Linux)

iD8DBQE8/L8uFjQHpltE9KURAkzOAJ9IQfPNxzPRL/s/w729WQwxvcjVZgCg1+nZ
k5KQsCl+NW9lt+dxs6ndSdo=
=wII0
-----END PGP SIGNATURE-----

--NzB8fVQJ5HfG6fxh--
