Received: from mga11.intel.com ([192.55.52.93])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SEbVy-000394-MI
 for linux-mtd@lists.infradead.org; Mon, 02 Apr 2012 07:17:23 +0000
Message-ID: <1333351234.5440.87.camel@sauron.fi.intel.com>
Subject: RE: Distinguishing bitflips due to read-disturb or due to wear-out
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Atlant Schmidt <aschmidt@dekaresearch.com>
Date: Mon, 02 Apr 2012 10:20:34 +0300
In-Reply-To: <0A40042D85E7C84DB443060EC44B3FD33511A52C65@dekaexchange07.deka.local>
References: <20120318115946.5614a889@pixies.home.jungo.com>
 <0A40042D85E7C84DB443060EC44B3FD33511A52C65@dekaexchange07.deka.local>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-IsiGxiC7ZUif5WBWiD6T"
Mime-Version: 1.0
Cc: Peter Barada <peter.barada@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 'Shmulik Ladkani' <shmulik.ladkani@gmail.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-IsiGxiC7ZUif5WBWiD6T
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2012-03-19 at 08:02 -0400, Atlant Schmidt wrote:
>   What I *THINK* UBI is missing is the keeping of
>   appropriate statistics on which PEBs have had what
>   history of "soft" failures. UBI always lives "in
>   the here and now" and makes its decisions on the
>   1 bit of data it has at the instant (the latest
>   operation on the PEB succeeded or failed). Instead,
>   UBI should know that (e.g.) PEB 1234 ended up giving
>   it problems in 14 out of last 16 writes to that PEB
>   and maybe that PEB isn't worth using right now based
>   on the fill-ratio of the entire flash chip.

Yes, this makes sense. I think we still have few some unused bytes in
the EC header - those could be used for these purposed.

--=20
Best Regards,
Artem Bityutskiy

--=-IsiGxiC7ZUif5WBWiD6T
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJPeVNCAAoJECmIfjd9wqK0hOUP/29YiodtVLSXiMOV+878RAVj
GOZDHybBQcrTOl0sbrzeE6LcNNxG0hslQX/8gqwL++a+K1TUi5Wbw25YKxv4u24C
K4SfznjmFwBYV0ESaVGkvKPMzDDCw+pWEI6ExbzY7Q6om3Fx0Px9RdO6SFttIqrr
DXxarPqd1PuQ20Qatrsg8+7CGoiDOWXK9AB/JUkEPhtp7VcZ5iTe90WKZuc/++n5
DWKDBXUDareDJHO/nHVr2vqP0cUoTGwV7eikeJM8bmEIboTY0k9dMypdRwxhzvLk
9j+1Pu0mUrDCjIiUybyoaJbjiCDtgm+TmAQgrModR6+pH4NFQz/xF8fg7LxEbZWB
BD6Sgfds0hK66duZ6fsrMhwdI2Iq/r8fcUC1Hto5cdoEuc/Wm/2S67vM2AN1sJHB
Mry0t5ArKzXcsclz770PKsAhsVc1cvzR4r5MzDPHP68u2k816BlnNT/0lzJQGSIv
Gj9/vEOo1G9I1oy5ay6/JkF0kagw24+rFzJwgcgrmBq3BWOrr/vAqpdmc485b/EN
uNZoAZgocKSv+vlT5vtj7RxHw2pjitFDovUaSZZ87cDVqG2v+JassIRUJ9zXbEl9
qRbud6qYk++JNzXGp3X1NQGvX850Wbt5amu3TC4bdwcKjCgdikP/1ahuZKaw9eJi
HPNYf9qVf0vGcVwSOtXD
=hMao
-----END PGP SIGNATURE-----

--=-IsiGxiC7ZUif5WBWiD6T--
