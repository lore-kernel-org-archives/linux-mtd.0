Received: from mga02.intel.com ([134.134.136.20])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SUFHt-0003dj-Fp
 for linux-mtd@lists.infradead.org; Tue, 15 May 2012 10:47:30 +0000
Message-ID: <1337079056.2528.158.camel@sauron.fi.intel.com>
Subject: Re: [RESEND PATCH V2 14/17] MTD: MIPS: lantiq: verify that the NOR
 interface is available on falcon soc
From: Artem Bityutskiy <dedekind1@gmail.com>
To: John Crispin <blogic@openwrt.org>
Date: Tue, 15 May 2012 13:50:56 +0300
In-Reply-To: <1337017363-14424-14-git-send-email-blogic@openwrt.org>
References: <1337017363-14424-1-git-send-email-blogic@openwrt.org>
 <1337017363-14424-14-git-send-email-blogic@openwrt.org>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-yIDHwD/xOLPxK6Aa6Kas"
Mime-Version: 1.0
Cc: linux-mips@linux-mips.org, linux-mtd@lists.infradead.org,
 Ralf Baechle <ralf@linux-mips.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-yIDHwD/xOLPxK6Aa6Kas
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2012-05-14 at 19:42 +0200, John Crispin wrote:
> When running on a FALC-ON SoC, we need to check the bootstrap options to =
see
> if NOR is available.
>=20
> Signed-off-by: John Crispin <blogic@openwrt.org>
> Cc: linux-mtd@lists.infradead.org

Acked-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>

--=20
Best Regards,
Artem Bityutskiy

--=-yIDHwD/xOLPxK6Aa6Kas
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJPsjUQAAoJECmIfjd9wqK09MkP/ROD0uVJvW4K4YbZmJtxuMvj
z9iJDqNSxDXxVofo6ykPrL3RjedwI0iYnu1A9cN2X3tzSu5DDzO8+xJ3JeENcuMR
x7prXmzaKViUtX9LtnaKXR/tGcJ9CWL5NqiqBo3ltrjsBWsehwW5RKFNLJV/2LJD
hes7Mytr6ua/3pwpuLEJMKhuLvH7fXWTa8Hhswoh1sBRT//qh1w1Ch1kviXdcvZL
2s/pBAdksnwmiQ9Z1I+b9SXEI8xbZ5bcolEeMXZn1tO1QHXf4+Ai3pDseqQm1PGh
HC6Co8D6cwHLhu7ZpcTaz/OE9rC7UKa5IunNgINeVvMeQskOnhwfUsp22GUt0Dcs
PeVwJxQcSx1EQWOojrPVQsoeXQP+NARQqswQkeFlzwjzW7VhizjanPi8JVT+evnG
nHczq6non40kPM6mQbFOSM4s+xk9HxmpWyqbFvk5tSI2LBMrUjCTYJNU/1sra1rJ
Th5NGz97NhPJcUbvEhmMDMTjw42eEJnA0iGbYTwD0EJItrzWWYolie1YJ/RrAaRu
H2A9kpUcXPqcQq6xfAERoNcd7YGJda6YqZK6NjX0i82anhiZi6WTGWfb/Xq8z7R0
X0X/OtRgSCKcwRDObJ4ItaWVTco7MDqjcmNs3lFnfKkIza1QmD7mAC1r7OmSmX3p
i9T0HcTnIGuCyVzm4AK6
=8K2j
-----END PGP SIGNATURE-----

--=-yIDHwD/xOLPxK6Aa6Kas--
