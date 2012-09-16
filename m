Received: from mail-bk0-f49.google.com ([209.85.214.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TDDGf-0002AN-Bx
 for linux-mtd@lists.infradead.org; Sun, 16 Sep 2012 11:44:06 +0000
Received: by bkcji2 with SMTP id ji2so2067646bkc.36
 for <linux-mtd@lists.infradead.org>; Sun, 16 Sep 2012 04:44:02 -0700 (PDT)
Message-ID: <1347795829.2032.1.camel@kyv>
Subject: Re: [PATCH V2] mtd: basic (read only) driver for BCMA serial flash
From: Artem Bityutskiy <dedekind1@gmail.com>
To: "John W. Linville" <linville@tuxdriver.com>
Date: Sun, 16 Sep 2012 14:43:49 +0300
In-Reply-To: <20120911132117.GA7015@tuxdriver.com>
References: <1346699237-414-1-git-send-email-zajec5@gmail.com>
 <1347358840.21359.67.camel@sauron.fi.intel.com>
 <CACna6ryroY=Xbv7+VsRfBYdhRd9P6uz935b9scQqCmTjneM7sQ@mail.gmail.com>
 <1347361186.26206.5.camel@sauron.fi.intel.com>
 <20120911132117.GA7015@tuxdriver.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-jC+TuOHHgIqhUXkyIy2r"
Mime-Version: 1.0
Cc: =?UTF-8?Q?Rafa=C5=82_Mi=C5=82ecki?= <zajec5@gmail.com>,
 linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-jC+TuOHHgIqhUXkyIy2r
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2012-09-11 at 09:21 -0400, John W. Linville wrote:
> OTOH, those exact commits are already in wireless-next (and in
> net-next).  That tree will not be rebased, so you can pull from it
> if you so choose.  But, it would generally be better if you only pull
> from head commits that are already in net-next "just in case". :-)

Thanks, I've pulled 'net-next' to my 'l2-mtd' tree instead, up to the
commit Rafa=C5=82 needs:

commit 70f389f0fbbde0d00a5ec4ba4817c09e80a3ae47
Merge: 44e42b9 371a004
Author: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
Date:   Sun Sep 16 14:42:38 2012 +0300

    Merge commit '371a00448f95adaa612cf1a0b31a11e7093bc706' of 'git://git.k=
ernel.org/pub/scm/linux/kernel/git/davem/net-next.git'
   =20
    We need the following 2 patches from the 'net-next' tree for the BCMA f=
lash
    driver:
   =20
    371a004 bcma: detect and register NAND flash device
    d57ef3a bcma: detect and register serial flash device
   =20
    and this is why we are merging the net-next tree (presumably persistent=
)
    up to commit '371a004'.
   =20
    Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>

--=20
Best Regards,
Artem Bityutskiy

--=-jC+TuOHHgIqhUXkyIy2r
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQVbt1AAoJECmIfjd9wqK0vlEP/3gkGNV6ghrMEsCXiCaDPDrD
rwsHA/JTKEAvM8cjLf9abe1zzcSK7c6DXIJW3v3yxOxrrVBDXJcxNPJrLSu8Gya0
ugb6twnhXxi47VC16AS+pngQKYsLaXEGdqesNPnrZv0tuGz9WoJzWcV8W3GWdjjX
5xEfZslIoDR83kpZOmUPh9I2xJAYj/OMLytz/OnzKewBCTqH+RvMWMPeTx9RKbsi
1Ab5VBajJ8AiRXXw1+C1E0XfZXsPUe14HnDIhRkjogVSS7KSXw8QY2xMqrYmtx2G
GtrqEli4bGzG7t5GxdHvM2mW1zsX6uc5OGx3+cffwq1XA7d/xWdexv7e45X1F1JN
25ITAjznZGG8O0DBR5jZ4Z119Nwx84or/Z3qQGpByhJXHUrWl7pCM2JW2gcwQcaP
68ukF6Ct1O1Rjj7vAxzbJVF5pWHsSmZ6JZ59vz5WIBORfTDwg4ZkdkeZT6pJR+6S
kSGaw4AFll+d6fDYXZu4cF5fhQZPKf+Bi5jk0wuKAqCVpZQbrRySvobHZrKBh3Fc
UabTSqb9boTHG/jARf3DC+4KEOjN7AaXeuiqZh5+8da0WZZ0ZQpUPU3jPhzG6ZOq
TNDRSHvhxoe/pcchmn8IDLa8Fg28CfN3r52ryt3eS8ITsX1CvGFy4o+jjnype0ju
wADSqeTLzsiYMfYZXTR6
=s2Vh
-----END PGP SIGNATURE-----

--=-jC+TuOHHgIqhUXkyIy2r--
