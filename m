Received: from mga01.intel.com ([192.55.52.88])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SLvQd-0006Go-MO
 for linux-mtd@lists.infradead.org; Sun, 22 Apr 2012 11:58:08 +0000
Message-ID: <1335095871.2097.3.camel@golum>
Subject: Re: [PATCH] jffs2: refactor csize in jffs2_do_read_inode_internal()
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Xi Wang <xi.wang@gmail.com>
Date: Sun, 22 Apr 2012 14:57:51 +0300
In-Reply-To: <1334011379-24445-1-git-send-email-xi.wang@gmail.com>
References: <1334011379-24445-1-git-send-email-xi.wang@gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-OVsjIhBkTYFtVgD2UO9u"
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-OVsjIhBkTYFtVgD2UO9u
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2012-04-09 at 18:42 -0400, Xi Wang wrote:
> Replace the verbose `je32_to_cpu(latest_node->csize)' with a shorter
> variable `csize'.
>=20
> Also check for a bogus `csize' value 0xffffffff, which would turn the
> subsequent kmalloc(cisze + 1, ...) into kmalloc(0, ...).
>=20
> Signed-off-by: Xi Wang <xi.wang@gmail.com>

Please, introduce the variable in a separate patch.

WRT the csize check - you should compare it to something more sensible
than INT_MAX - try to dig the code and find out what is maximum value
JFFS2 expects.=20

--=20
Best Regards,
Artem Bityutskiy

--=-OVsjIhBkTYFtVgD2UO9u
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJPk/I/AAoJECmIfjd9wqK0Hc4P/iZ0v8PzP9f8nWbtFn2PLlAE
O5MjSFZm6dP9vdcxm16BE2Wpf5+/hqJ400bzlpInjJjMSyhk7eJ+ttlzhHZdG3Br
6dF+UOAHULqYherC5GvRWcLZI0swb+oF6v5OSlRr3vN89lQsjnMf90FlyaWtZtax
NFdcb1LHqJ+V2+gFLM2X4bBWT0JAsrsWUBvy6SjXF/j2XFyQqOEzRA6S8TsHJVJS
hjrmS98JOtRJVks0dC+hn29iiPPTJYvR78A/greAFnd6Iqvyp+my76LXuaFHSjJs
yNxlTIR8iie54jDFeeLojUqRaEYIXI1frjbg3N4wMrR7/kWu79pje48sJLc2p8YL
urcqt/sozSNNXdqNWX5TZ9nl5gMhUe9E2h/qI69EU2bpCJv5TmWcm5t7VSrevjEg
qQ/RNcaGnif5YAubI2fAWafIyovVksQ5aHZl26IgJCG4WalaAHrxn7yMP+Sjnf2D
RCDODYxNWgXefL0BOUtrB4pZQUq+tF+TpoPxMtQGt+OsvI+H7bqdnauVRP/pXJdb
2dt2j8/k3sBjVwol97p3zV2RMiX2vf2V+QIBFDFZGmDkfPRJm1VXUfMFoicvYTZ0
u8WA6drN45bi8kdYwhwcWl+jPOfyABolwVsP+Cp4+YYMWePlhX1Q6ZilcpcC9g80
9Dsur/JQaRPZsPZSm/SP
=okqu
-----END PGP SIGNATURE-----

--=-OVsjIhBkTYFtVgD2UO9u--
