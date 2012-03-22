Received: from mga14.intel.com ([143.182.124.37])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SAhhV-0007TB-Kv
 for linux-mtd@lists.infradead.org; Thu, 22 Mar 2012 13:05:10 +0000
Message-ID: <1332421678.18717.25.camel@sauron.fi.intel.com>
Subject: Re: UBIFS crash (was Re: Problems with mtd_oobtest)
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Matej Kupljen <matej.kupljen@gmail.com>
Date: Thu, 22 Mar 2012 15:07:58 +0200
In-Reply-To: <CAHMF36Fyb+X_tZjgs1Siu2p1Zbrmu-7TBL73Zf3Rjx3SiyeBjA@mail.gmail.com>
References: <CAHMF36G-dXbjZfBMnzEuqK_bkNM81+aCZW5gDHSAKEeyE8VKTg@mail.gmail.com>
 <1331559644.12037.33.camel@sauron.fi.intel.com>
 <CAHMF36ExY=Q2CFgF_V2dVZTsC_znNLGx6wk8GAh5SRKwjJXi3Q@mail.gmail.com>
 <CAHMF36EA-99oYmoBPuOjrohYefTMtoUQ6KLMrMw=XxGmWm3ehQ@mail.gmail.com>
 <1331619893.2443.10.camel@koala>
 <CAHMF36EpG5T2L3GDfgqPKA2XBqw2SipzX1OxXP0SDh==djgcsQ@mail.gmail.com>
 <1331628462.12037.56.camel@sauron.fi.intel.com>
 <CAHMF36G_iE3pEVh1WEVgm5H0p3wsePUxwu9-MCVB+v7vxFf4RQ@mail.gmail.com>
 <1331727617.3730.5.camel@sauron.fi.intel.com>
 <CAHMF36H_+ohHph_mn+iaVnH9Z_WQR0bkQT8Fv8s8cTHE5vV+fg@mail.gmail.com>
 <1331731119.3730.17.camel@sauron.fi.intel.com>
 <CAHMF36Fyb+X_tZjgs1Siu2p1Zbrmu-7TBL73Zf3Rjx3SiyeBjA@mail.gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-ReMXG37ka1yWE0iPg6pb"
Mime-Version: 1.0
Cc: linux-mtd <linux-mtd@lists.infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-ReMXG37ka1yWE0iPg6pb
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2012-03-22 at 13:17 +0100, Matej Kupljen wrote:
> Dear Artem,
>=20
> > Well, you can try the ones you used, or the fsstress test from the LTP
> > project, or I'd recommend to try the integck test from mtd-utils.
>=20
> I finally found some time again to do the tests and cross compiled latest
> mtd-utils form git. I booted form SD card, mounted the UBIFS and tried
> to run integck, as you suggested. But here is what I get:
>=20
> # ./integck /mnt/card/
> integck: error!: cannot find file-system info
> integck: error!: condition '0' failed in get_tested_fs_info() at integck.=
c:2942
> integck: error 0 (Success)
>=20
> Any known error?

Well, you can always use gdb and look what's going on. I do not think
you'll get _that_ level of support on this forum. But most probably this
is because /mnt/card is not a ubifs file-system.

--=20
Best Regards,
Artem Bityutskiy

--=-ReMXG37ka1yWE0iPg6pb
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJPayQuAAoJECmIfjd9wqK00n8QAKRJLTzdmp9sXatAA5fd1DcT
uzZb0qJI0gkUsYxh54oiKSy/xw43O/hH+Gnoeb5R5IqWOD09QwmasQNeNKdRb0xd
lH5Gxw5TukCHFJgUABlHlVGOCyQZRIIW6k9mIxhHFVl058wv0o1BL2dyj3l4vZD/
XtqQJ0YcIwnI4MCcTdXqnVbJkq+y5nW1V9ahRcQaFgnbEizOBRZiReiVzmKtKkV6
iqsb6hAMLX1SmFdV4DSrqfkZeLN1+r56RvXKvOOxgnCxGC4xRm3kcFcmNJYvbDfl
DGqp6xI6eNfOd2tjC7M5ZWbr2ZBmsBaH7+7kUSCPijGFDFpvbF9XPRYok9LWYl8P
SSdr8EGB/UIJevOxciD5hvVJGmjJu0IgH92NcNMy3vKgn5V0zYP7f54eBDyfvhdC
BpxW/jEHw4dM47WrenA2wtOwxdgu6UUe1zpt89ng5Ykmt/4yTvYT6+6RwUlJsau8
dCEfoLt+dPcDqESz9VV1reZ5KqkbHZN4vwALMMxnFbMRzLDfeYoT7gcORqD7fnsT
/ODizDbr+FzlZOnhikY7gtTCR4xD74Ze5cAl3bbCQbDBtMCQpEDxINDdWDqWA03D
b42nA/x02f5k/3rAc8+HH2CbBOEpZKixll/84qKkeyTj3t0vLxcTtvqGtYaqX1Ig
ly//zJH7hIU8IckJmIWa
=t7x5
-----END PGP SIGNATURE-----

--=-ReMXG37ka1yWE0iPg6pb--
