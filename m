Received: from chilli.pcug.org.au ([203.10.76.44] helo=smtps.tip.net.au)
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1N5VPe-0000cV-II
	for linux-mtd@lists.infradead.org; Wed, 04 Nov 2009 02:15:58 +0000
Date: Wed, 4 Nov 2009 13:15:40 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Dominik Brodowski <linux@dominikbrodowski.net>
Subject: linux-next: pcmcia tree build failure
Message-Id: <20091104131540.f39af556.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
	micalg="PGP-SHA1";
	boundary="Signature=_Wed__4_Nov_2009_13_15_40_+1100_6pxCgNBd+MeBMsVq"
Cc: linux-next@vger.kernel.org, linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

--Signature=_Wed__4_Nov_2009_13_15_40_+1100_6pxCgNBd+MeBMsVq
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Dominik,

Today's linux-next build (x86_64 allmodconfig) failed like this:

drivers/telephony/ixj_pcmcia.c: In function 'ixj_probe':
drivers/telephony/ixj_pcmcia.c:35: error: 'link' undeclared (first use in t=
his function)

Caused by commit 990c0c8eeb34f62d062052d462feaa99715cb043 ("pcmcia: use
dynamic debug infrastructure, deprecate CS_CHECK (misc drivers)").

I have used the version of the pcmcia tree from next-20091102 for today.
Please build test.  :-(
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Wed__4_Nov_2009_13_15_40_+1100_6pxCgNBd+MeBMsVq
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAkrw48wACgkQjjKRsyhoI8wo+ACdGiea9nS6Z8lDTpWOCGCREpxh
4hMAnRSNpLE80hZN2xgDwvZUfLSRonwp
=H7Tk
-----END PGP SIGNATURE-----

--Signature=_Wed__4_Nov_2009_13_15_40_+1100_6pxCgNBd+MeBMsVq--
