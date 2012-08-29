Received: from mga11.intel.com ([192.55.52.93])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1T6hdY-0004Zl-N1
 for linux-mtd@lists.infradead.org; Wed, 29 Aug 2012 12:44:49 +0000
Message-ID: <1346244570.2848.470.camel@sauron.fi.intel.com>
Subject: Re: [PATCH v2 3/6] mtd: mtd_nandecctest: rewrite the test routine
From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
To: Akinobu Mita <akinobu.mita@gmail.com>
Date: Wed, 29 Aug 2012 15:49:30 +0300
In-Reply-To: <1345982808-11440-4-git-send-email-akinobu.mita@gmail.com>
References: <1345982808-11440-1-git-send-email-akinobu.mita@gmail.com>
 <1345982808-11440-4-git-send-email-akinobu.mita@gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-Qxd8qcQ2TNV2eK4GDIvN"
Mime-Version: 1.0
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org
Reply-To: artem.bityutskiy@linux.intel.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-Qxd8qcQ2TNV2eK4GDIvN
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, 2012-08-26 at 21:06 +0900, Akinobu Mita wrote:
> This rewrites the entire test routine in order to make it easy to add mor=
e
> tests by later changes and minimize duplication of each tests as much as
> possible.
>=20
> Signed-off-by: Akinobu Mita <akinobu.mita@gmail.com>
> Cc: David Woodhouse <dwmw2@infradead.org>
> Cc: linux-mtd@lists.infradead.org
> Cc: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
> ---
>  drivers/mtd/tests/mtd_nandecctest.c | 136 +++++++++++++++++++++++++++---=
------
>  1 file changed, 104 insertions(+), 32 deletions(-)

This patch is still too large for me to review. Could you please split
it further?

--=20
Best Regards,
Artem Bityutskiy

--=-Qxd8qcQ2TNV2eK4GDIvN
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQPg/aAAoJECmIfjd9wqK0XhMQAMhEdMiSbPUI6ekdBcnR8bGO
24233/iVrE2DhsH/7ZIqc19JtfgtBITzGkJJk6Tm6581mCl0TZomGeR+JQUNsemI
PLgFfUPdEV6DHKy707pjLKQmm+JeQs3SdiRg7Qce1ynr5c9oCv/p0rcnOrlW/hoB
SKC/wdnarEYz45WOJ57ilFcl5DQZRnx58br8sA1gg5BPuP36ZTBkqns4Hzw7JfQq
E6DpJV7fgEzzsME5iS1vdplOcwvGAeU/VdeRAh/tVph8iaGeXmvmKAtzaIUQgEeX
TWE0AmbcarVqzp3r6ag/M7/PzGCxcBUIpgUpgZVJY3a0+GUv5CKaakQMKNIkNiRi
+GLOO5TQLo7MBIShI5egczwxyh4IgqXkVXXSKBRBfgIDqw3sswR4sNkCyO86ILJP
3+FLc/TAk5j/CPt85GkFRwdQxc7w3zpu1OVsUF2nI6GVhTNEQ0akh2d6oBi4oZDW
2BLNk2KFb91RugP3miE5TEOmBRDDbd2/hlWc7z/S0XlWnE/ksDN9rjO8shI/QaEy
5rjkNFd83DRLhLJF3gNgq9033CgngyGo08sPAVFJW2h3Ou0pDMKia+KsxKA4LImg
BS7wIo+rPcQlkjdH5IONIv5TqXacvZ9Vo5V0dHeU9VojuFCPK2MFY7hW1RX7YzLO
E5QgPKBElf+2Msc1k2CQ
=mzfY
-----END PGP SIGNATURE-----

--=-Qxd8qcQ2TNV2eK4GDIvN--
