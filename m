Received: from mga09.intel.com ([134.134.136.24])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1Tfndk-0006K2-Vl
 for linux-mtd@lists.infradead.org; Tue, 04 Dec 2012 08:14:05 +0000
Message-ID: <1354608901.11583.56.camel@sauron.fi.intel.com>
Subject: Re: [PATCH 2/2] ubi: Dont call ubi_self_check_all_ff() in
 __wl_get_peb()
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Richard Weinberger <richard@nod.at>
Date: Tue, 04 Dec 2012 10:15:01 +0200
In-Reply-To: <1354607777.11583.50.camel@sauron.fi.intel.com>
References: <1354548780.11583.21.camel@sauron.fi.intel.com>
 <1354564667-9549-1-git-send-email-richard@nod.at>
 <1354564667-9549-3-git-send-email-richard@nod.at>
 <1354607777.11583.50.camel@sauron.fi.intel.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-Zb5rmd7cD0x8Svnq7cBn"
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org, zsadecki@itwatchdogs.com
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-Zb5rmd7cD0x8Svnq7cBn
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2012-12-04 at 09:56 +0200, Artem Bityutskiy wrote:
> On Mon, 2012-12-03 at 20:57 +0100, Richard Weinberger wrote:
> > As ubi_self_check_all_ff() might sleep we are not allowed
> > to call it from atomic context.
> > For now we call it only from ubi_wl_get_peb().
> > There are some code paths where it would also make sense,
> > but these paths are currently atomic and only enabled
> > when fastmap is used.
> >=20
> > Signed-off-by: Richard Weinberger <richard@nod.at>
>=20
> Can you confirm that you enabled the 3 debugging options I sent and
> tested both FM and non-FM configurations with those options enabled?

Let me elaborate why I am asking.

1. If you did the tests and with this fix the debugging stuff works
fine, then it is OK to take this patch now and let you improve the FM
debugging coverage a bit later.

2. If you did not verify, then the assumption is _may_ be broken anyway,
then I would prefer to not take this patch, because I consider it to be
a band aid.

--=20
Best Regards,
Artem Bityutskiy

--=-Zb5rmd7cD0x8Svnq7cBn
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQvbEFAAoJECmIfjd9wqK0FD0P/2KBdAZY7MRzBqq4gCQUxlRl
g09p0I3sQmS59W5oz6kakhtwc8CSFnPTnp8AmWFb9EpQ+JRg5XL26MIle4nh5Mdn
9s/KY1BWod3CTEqXL/kxd+GauoKcT26GT34ZK8FlOWxiTFhpdxERRamwy3x6agV0
7g+lc8ijhOEQ8bcTNwg1ndQZoAIccvtlB+YWHxAHWL1PRl9SABY7Ye/Ung5S9KSv
sff7nDA4LreHQXRSvyMGza0p9fP29ckC7u3eNkkWn1hFijeG1f4YmeVGkyYjAIVM
wOYkCICupjQCz2NbK42lHp7tqw+J03WtVt6OG0WKhnEDtmePep1oOVHxCYtKMW1i
SixC1MPxyGONNmnhtleEmwA3Ts6bc8zPc+26haQJQcIW27kobSKxbrL9HE3bK6vx
p/qMYV39RQPdLOQJc2MzQepdhpKCj1uNjGJoPiuu/rFkTvld4WUeVNVDrRdnSNfG
EkM7Nn8KxQY1lsaiul7dwwZ0tiTBScRI5EzT/emjMa+JYoO+5nPSEcLt/fH+1aGm
g9DEWUsx9WXG3eCaaoDUaEkiLrRQkxc95zjzXndydGi8pAH2qpwWnDLRWNLVz/+t
5QQ763V+Re6KoI69CK7Zx/DZ84n+6e4XNL/XmCug7XmOK9mKvSw3bSY0Va3IKSOn
dIHidSgsKLUB6TG+ri1u
=Or4z
-----END PGP SIGNATURE-----

--=-Zb5rmd7cD0x8Svnq7cBn--
