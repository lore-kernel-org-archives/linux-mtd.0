Received: from mail-lb0-f177.google.com ([209.85.217.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SMCLj-0003Xr-Td
 for linux-mtd@lists.infradead.org; Mon, 23 Apr 2012 06:02:12 +0000
Received: by lbol5 with SMTP id l5so3968694lbo.36
 for <linux-mtd@lists.infradead.org>; Sun, 22 Apr 2012 23:02:09 -0700 (PDT)
Message-ID: <1335160773.28267.29.camel@brekeke>
Subject: Re: [PATCH] ubi: Do "dump_stack()" in case of the
 ubi_io_read()/ubi_io_write()/do_sync_erase() has an error
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Xiaoming Zhang <xiaoming1981.zhang@gmail.com>
Date: Mon, 23 Apr 2012 08:59:33 +0300
In-Reply-To: <CAGKjfA1YN6wrSpV3ZuvYfA=gW_hjBLPKTraudeL_FTUu2dTJ8Q@mail.gmail.com>
References: <CAGKjfA1YN6wrSpV3ZuvYfA=gW_hjBLPKTraudeL_FTUu2dTJ8Q@mail.gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-MFgl2HKt8fcssDtyx/Wq"
Mime-Version: 1.0
Cc: linux-mtd <linux-mtd@lists.infradead.org>, zxm927@163.com
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-MFgl2HKt8fcssDtyx/Wq
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2012-04-23 at 10:37 +0800, Xiaoming Zhang wrote:
> Hi Artem,
>=20
> As you suggested there's a patch to turn "ubi_dbg_dump_stack()" into
> "dump_stack()".
> This is generated and tested on Linux-2.6.31/mips. The test result:

Hi,

thanks, but would you please be kind enough to re-send it in a form
which I can just save and feed to git am. This e-mail has junk text
after the patch, and "Hi Artem" will need to be stripped. Thanks!

--=20
Best Regards,
Artem Bityutskiy

--=-MFgl2HKt8fcssDtyx/Wq
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJPlO/FAAoJECmIfjd9wqK0LjQP/1vwvGgiToIZLLaZ4BuXI5QZ
mbHDk59QpV5r5igW+mw/hljpM0od/FhMi9AJT5gLB3QiEf0QKRLGYdBQQszinXc/
z+L3lGE1UU+8BVBRiOPk5cx5GIvsOrH7FQA3qo/ug0VrwTL757MnHvUNjmdoguU7
j7xn/FNDWpH2dETYQG5J7kVBKhsFU8jicK8iFh5YKQHWFB0hKe+4Qt3qQ6g2kSEG
xmlqm/fdqgBiSQxAo44m6ilTCy/kVFR8mz48EI4WzBGus2yfSnblYYMzQxbYm0pf
r14YyBitDRpjB3/3uG4RIyjKHp3anqEXStFOLaIhIRzU7Zj3lLipAwoJIPHIl0po
NQ3Ax0wtMM95EGm7GUfPqgPXNItgkyQFZPMgVQrFOFxRI9hlGlUUN0nimvWAP245
YbkOaLwm6RF1xAmHlvdUkjzV+tTvfCMBHXKBe324XuTRJQZhDMMGhtBaYdGXymSP
37g1+RTe29dJj/F1r/SuUVqMJn/3d4Haxj8s7d/r9dQIkCNlu+jqmd41gIIy5Dvx
ua4+eJ/IktRfarj0eulvNwMRuWvaokcrs3kskMTJ/Gfaft/TxyXE7Wbw/A14fo5U
h99eFm24AAlJUdwoVFjCXykalCi2hziCdUfU2ezVTRVnJ9a2SJsYIrOqU5Yj3vT2
7hrqqJ9GQHsfF0Y9kcX1
=bSqJ
-----END PGP SIGNATURE-----

--=-MFgl2HKt8fcssDtyx/Wq--
