Received: from mga02.intel.com ([134.134.136.20])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1T483b-0000pd-3w
 for linux-mtd@lists.infradead.org; Wed, 22 Aug 2012 10:21:03 +0000
Message-ID: <1345631149.2848.138.camel@sauron.fi.intel.com>
Subject: Re: [PATCH MTD-UTILS 0/5] sync with 3.6-rc1 and introduce
 max_beb_per1024 in UBI_IOCATT
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Richard Genoud <richard.genoud@gmail.com>
Date: Wed, 22 Aug 2012 13:25:49 +0300
In-Reply-To: <1345627680-8166-1-git-send-email-richard.genoud@gmail.com>
References: <1345627680-8166-1-git-send-email-richard.genoud@gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-Xh2vUkj+wGRudQ2RHXZq"
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org, Shmulik Ladkani <shmulik.ladkani@gmail.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-Xh2vUkj+wGRudQ2RHXZq
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2012-08-22 at 11:27 +0200, Richard Genoud wrote:
> Hi Artem,
> Here are the patches for the introduction of max_beb_per1024 in ubiattach=
.
> The first patch is just a sync of ubi-user.h with the vanilla 3.6-rc1
> (So after this patch, the mtd-utils won't build any more)
> The second one supresses dtype parameter, as it is obsolete now.
> The third syncs with somes defines and struct renames in the ubi-user.h
> (Now it compiles again)
> The fourth syncs ubi-user.h with the one in linux-ubi/master
> And finally the last one instroduce max_beb_per1024.

I squashed patches 1-3 and pushed to mtd-utils. I also changed all __s32
and the like back to int32_t, because on older systems these linux types
are not available in the system headers. I also did few minor
modifications, and pushed to mtd-utils.git, thanks!

--=20
Best Regards,
Artem Bityutskiy

--=-Xh2vUkj+wGRudQ2RHXZq
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQNLOtAAoJECmIfjd9wqK0DB8QAJE8NpYB8GT2A/Xo+DCnDkB+
YjgZc02bjjUMFIPet3jz7qyotZhugII16q4ZrppOCOzLB9rQ19tAPxBSjvgCp89o
XrFXM2DSGcKwqPNBi2oscrh+C/+Y4Hx6otw/UOmC98wdHgz3OvdZ5Quc5hxnYeUG
3dS1HarqX2IZkZzsfQcAbrCB9KNO50Ou4NSK6iJHIYTq0Xd+YLx1h/G4re86s6LC
P4ZgiqVw36nLMkmzd21kJ8HT0+L2vsGYhBJ/4LosD5VMag3GigvBuF0LDaDdxEGL
pIG42JZ9mPXZruQDi+fFh2MFB7w9nuKTBUM95D+pSympQCRtqBIJ+/YM5iOMoUxk
dMCoZ2XgTUL3NVRG+yKMBMRykMgQQ8IlpMk2pIndh0PC08dDo1D6ip2gWBpPMsNb
1+/GOh5UEt9ZgMaQ4TadWowdWz2/ck6YM1/zhG48DbCZqqNkY9LpIRDyFWnz2Thm
e2ATNNNUPQinL/uI/ivBTF1aEwIT40MmCNQydPKFfXjwcraEsAWryCROFtjksyZs
BRfsq138iylFdomgPYYUULFm5PBUAVfPSjj9vBUdztB4YVRz4aMuuEw38bfKr1H9
szK7fGKFMc8DTAgRP73Ory15rO6FjkiS7E7Q3dhFAkT3395TTVbf+hax5MGJXRK7
UN2Hh6FK4tE+UGuXQbAY
=DEhy
-----END PGP SIGNATURE-----

--=-Xh2vUkj+wGRudQ2RHXZq--
