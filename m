Received: from mga02.intel.com ([134.134.136.20])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SDb6V-0003Mj-8n
 for linux-mtd@lists.infradead.org; Fri, 30 Mar 2012 12:38:55 +0000
Message-ID: <1333111321.5440.29.camel@sauron.fi.intel.com>
Subject: Re: [PATCH] UBI: allow atomic updates to sychronously erase old PEB
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Joel Reardon <joel@clambassador.com>
Date: Fri, 30 Mar 2012 15:42:01 +0300
In-Reply-To: <alpine.DEB.2.00.1203301433270.10066@eristoteles.iwoars.net>
References: <alpine.DEB.2.00.1203291653210.912@eristoteles.iwoars.net>
 <4F748CD6.4080704@parrot.com>
 <alpine.DEB.2.00.1203301413080.10066@eristoteles.iwoars.net>
 <1333110503.5440.24.camel@sauron.fi.intel.com>
 <alpine.DEB.2.00.1203301433270.10066@eristoteles.iwoars.net>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-xNYMSv0O6nG03DmufvMS"
Mime-Version: 1.0
Cc: "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Matthieu CASTET <matthieu.castet@parrot.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-xNYMSv0O6nG03DmufvMS
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2012-03-30 at 14:33 +0200, Joel Reardon wrote:
> Just for 'blocking', or also all the 'erase's.

Not sure I can provide a general definition :-) But use it for waiting
for erase of the previous block to finish. It is also coherent with the
'mtd_sync()' name.

--=20
Best Regards,
Artem Bityutskiy

--=-xNYMSv0O6nG03DmufvMS
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJPdaoZAAoJECmIfjd9wqK0mykP/i19z3dbCh6BdLfBv0wJtfYN
CTpzla1fDUD5TrhmwOjRTMH13V8NIYUB2dHdbmS1hqD3d4Fm7CNuHg72cHJZrl78
FEgVgSFjAEaBc+amKv4Aw1Km21LPblnFGYedIZq1evzRcFtlDZ16tcZfiabJdZeT
pOQXHwXW4aBBaBnU0XjSqyMpMeQMnDmJ667L+T8C2tTgTZacmcYMabiac/n/GF1I
Ri41wqaHnegBa2AFR0u+VQFI2hlEK+IKJ3PRIO/raducLF9yBJoX3XfaOlYECmfZ
YAqtUew2OO3BdxDJDXQvj/dxyxWDuDp+WjODTOQF/QcwBVonFN7y5QklSk3RKD3k
yn4aMXYDLjQ44eGPDuW2jtT+vGBjA30EI/i4BpOyP4JBR4q31yd8lK+tUFxFiqeU
Ve1xpUSd+RQdF1WvQa+rKecf/FvQvLMKsFoDyiW7hnWrQU59+jrvSxJ04Y2Lb82S
GziOypnZcJsdBxHLx7LQd6GyDJVnzwmnU+nRoGatCdCyDnipXAwLdA+TmtwXklix
rSsEaMQqGvkG4KeFUD8J06GvkANeJhU1C6P+hCdwTUXDhKI2OhxEgjtMIzsjgdHc
YgZ1P0ktI6rmovHLFpmzVrax10qPq2x7paU8Ho2qpIdMzuu6MhfNIt7IW+mhPsr5
x+DBcSyHD6WvjAMWe/c/
=Qx4i
-----END PGP SIGNATURE-----

--=-xNYMSv0O6nG03DmufvMS--
