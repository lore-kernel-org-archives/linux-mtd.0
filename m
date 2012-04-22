Received: from mail-lb0-f177.google.com ([209.85.217.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SLxnQ-00014M-4B
 for linux-mtd@lists.infradead.org; Sun, 22 Apr 2012 14:29:48 +0000
Received: by lbol5 with SMTP id l5so3628637lbo.36
 for <linux-mtd@lists.infradead.org>; Sun, 22 Apr 2012 07:29:46 -0700 (PDT)
Message-ID: <1335104830.28267.16.camel@brekeke>
Subject: Re: [PATCH 1/1] Remove UBIFS_FS_XATTR config option.
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Subodh Nijsure <subodh.nijsure@gmail.com>
Date: Sun, 22 Apr 2012 17:27:10 +0300
In-Reply-To: <1334419797-28995-1-git-send-email-snijsure@grid-net.com>
References: <1334419797-28995-1-git-send-email-snijsure@grid-net.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-sUApMPphhm3s8kyVBo/T"
Mime-Version: 1.0
Cc: Subodh Nijsure <snijsure@grid-net.com>, linux-mtd@lists.infradead.org,
 Adrian Hunter <adrian.hunter@intel.com>, linux-kernel@vger.kernel.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-sUApMPphhm3s8kyVBo/T
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, 2012-04-14 at 09:09 -0700, Subodh Nijsure wrote:
> Remove CONFIG_UBIFS_FS_XATTR configuration option and associated
> UBIFS_FS_XATTR ifdefs.
>=20
> Testing:
>        Tested using integck while using nandsim on x86 & MX28 based=20
>        platform with Micron MT29F2G08ABAEAH4 nand.
>=20
> Signed-off-by: Subodh Nijsure <snijsure@grid-net.com>

Ok, while babies are sleeping I had time to handle my inbox. Pushed to
linux-ubifs.git, thanks!

--=20
Best Regards,
Artem Bityutskiy


--=-sUApMPphhm3s8kyVBo/T
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJPlBU/AAoJECmIfjd9wqK0df8P/2ASR9oO47/Z/VZDApcNT1ju
n1yUyQKN81zsn6LqFwQ1uL/TIUHT/X3TYd4hi1EpzztFocEIAgWJRk/cpOyxTbkP
UozLFLhbwP+m9PqOLXDNgAr3FCS+ZjMERVl0SJw52YLWhRvm73m362J10MUaGPPV
OcFRorgxyjGvSN+EQ4QgeXMqvx+93IYnCsPNICegQSFURKBTtMU95qjMgSPXDRAe
00CPZBCfvNLfN7+yqgH71sH1HfspK5HhLA3CgDiscy0bI+LQTUzrQwLxdpBnk9no
c5SY3InnCNMyPX4rklbLhN7/ABfYft3p9vnsOW4UneOXnNBSYZT0Sq9WfM3X9QAY
b/aqESuTjyoJt2dIcznZjjtaxCTDE/+giQkxNVnh/1PVgtk3XA6sKfYaPU3wfP0j
KoCRnfoesoH58sbA4uFzwFzfVX6NTm6eK12eMU4kEfbWU+OxoutUnAswj3av4sGZ
DkymCDT/YKP+u5rtelwQwiB3YCxXhFhumjrEtTC0dFV8+C3G5FlxJiNBNuBpa/jt
qUO7HwRxcQwF1ZmyFmN6X4JDa/JhTBbt8NLGI9jvYlsuKrxiGcpYs0ckKVeWDHBy
3nAD7BLm0KRkEeHMvziJM+IPFew08vd3/8lDU8sQL5nuOrVPQcLq8Izgp1F014kx
hj2/5LRLf5pGIEdy91i7
=YStA
-----END PGP SIGNATURE-----

--=-sUApMPphhm3s8kyVBo/T--
