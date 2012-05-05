Received: from mail-lpp01m010-f49.google.com ([209.85.215.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SQbRm-0000pe-32
 for linux-mtd@lists.infradead.org; Sat, 05 May 2012 09:38:38 +0000
Received: by lagy4 with SMTP id y4so3199340lag.36
 for <linux-mtd@lists.infradead.org>; Sat, 05 May 2012 02:38:34 -0700 (PDT)
Message-ID: <1336210702.2027.0.camel@koala>
Subject: Re: [PATCH 0/3] do not use s_dirt in JFFS2
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Date: Sat, 05 May 2012 12:38:22 +0300
In-Reply-To: <CAN8TOE_KZQqB6gqA1ccUfQ3v+n_ZN9Hm1Q63QDkhf9GGhj7eEQ@mail.gmail.com>
References: <1336152428-24242-1-git-send-email-dedekind1@gmail.com>
 <1336153306.23481.33.camel@sauron.fi.intel.com>
 <CAN8TOE_KZQqB6gqA1ccUfQ3v+n_ZN9Hm1Q63QDkhf9GGhj7eEQ@mail.gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-p7AZewDez16HzoBbQMru"
Mime-Version: 1.0
Cc: David Woodhouse <dwmw2@infradead.org>,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 Linux Kernel Maling List <linux-kernel@vger.kernel.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-p7AZewDez16HzoBbQMru
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2012-05-04 at 17:55 -0700, Brian Norris wrote:
> On Fri, May 4, 2012 at 10:41 AM, Artem Bityutskiy <dedekind1@gmail.com> w=
rote:
> > On Fri, 2012-05-04 at 20:27 +0300, Artem Bityutskiy wrote:
> >> This patch-set makes JFFS2 file-system stop using the VFS '->write_sup=
ers()'
> >> call-back because I plan to remove it once all users are gone.
> >
> > I'd really appreciate if someone on the MTD list tested these patches.
>=20
> Am I crazy, or did you send the cover letter without the patches?

Yeah, sorry, I copied the cover letter from FAT FS patches and did not
clean-it up well enough. This set has only 2 patches.

--=20
Best Regards,
Artem Bityutskiy

--=-p7AZewDez16HzoBbQMru
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJPpPUOAAoJECmIfjd9wqK0SsYQAKPLlglzmbHY4dBg1ITCMRVd
1HQcOtn/g+BGSnFv2MXzFCFipeRQhJFzZ/wFihuJ30Q6ZAFjfEKF/fWFPoKdkr1X
1f5PTpWADACdsfXO3nzp1dBbfq0kEWhSI59yCllCgl6PGnPNPpzPwTE5b/hy8yaW
EkyoOQ7BFV3M0V+X9ek3XWco64j4+PVjMfvaz3x9aQxOsmGaknI+N/LaUjtrzMiy
95PamuDF/vhGtUlQTahOkIKGccVMwbPFIcwEV2qRCnF/iS9jVPLEoq+fTQKXzO6k
+25IpHhba254XItUiGWMB56BAeSAOFmaEH9V6IhbUZ80q3l0BGIRkQCTlpcr2i/9
/kIp0Iann1EmrkfcBXK5KJXeYzMk6/xjSezrGfHNBVhShrr21AlAhvBAn6ghI/QX
rhT4UaHt9LaRGna9tDLYRPoHe++dtFgZK/3Vnq1UsOwwsB+v856NLxOYabbF/ySQ
Jk5TynyoayO3FPWDTclc7GN1ZEVaLjTiERqQuRLqGxBCmeWdKw/TbaReKwZofGfu
uZyxuf+6xsUrw08aG9EbzTzxS+EhFHMOEdzp5XUZALe4nk4RBxLlFeB7nlrG03Vt
B2yI/s6uKRAWz8Zj4yOfMSRh6vbZ6nP/suSmojrPDBShnZDAL+S/kufbaXKUv2xt
WXeAKg9gOhsTtXQqXrlM
=ftfZ
-----END PGP SIGNATURE-----

--=-p7AZewDez16HzoBbQMru--
