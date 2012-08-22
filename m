Received: from mga01.intel.com ([192.55.52.88])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1T46Xy-0005ws-VE
 for linux-mtd@lists.infradead.org; Wed, 22 Aug 2012 08:44:19 +0000
Message-ID: <1345625343.2848.129.camel@sauron.fi.intel.com>
Subject: Re: [PATCH v3 4/6] UBI: replace MTD_UBI_BEB_LIMIT with module
 parameter
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Richard Genoud <richard.genoud@gmail.com>
Date: Wed, 22 Aug 2012 11:49:03 +0300
In-Reply-To: <CACQ1gAiEBmUMWXr=FWmXqJUZ=ZwyLTCqKmUAMYpfJZBNJTPYSA@mail.gmail.com>
References: <1345478416-23900-1-git-send-email-richard.genoud@gmail.com>
 <1345478416-23900-5-git-send-email-richard.genoud@gmail.com>
 <1345557295.2848.112.camel@sauron.fi.intel.com>
 <CACQ1gAiEBmUMWXr=FWmXqJUZ=ZwyLTCqKmUAMYpfJZBNJTPYSA@mail.gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-orKyRQKmIvFl7KgSyjfv"
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


--=-orKyRQKmIvFl7KgSyjfv
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2012-08-22 at 10:32 +0200, Richard Genoud wrote:
> Looking for consistency, I made a quick git grep "\<printk( *KERN_" |
> wc -l
> the answer is  > 32000
> Looks like I found something to do if I'm getting bored with
> openstreetmap :)

Well, now I am talking about consistency within UBI only, withing the
project. I think that function is the only one which uses plain printk
in UBI. I do not remember the details, but there were some issues using
the UBI wrappers like 'ubi_msg' in this function because it is called
very early during boot time (when UBI is compiled-in). And I just did
not know about pr_err() that time, or pr_err() did not exist. So you can
just amend this single function if you wish.
>=20
--=20
Best Regards,
Artem Bityutskiy

--=-orKyRQKmIvFl7KgSyjfv
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQNJ0AAAoJECmIfjd9wqK0hgMP+gNO8Y6YrGMhRNvcjZJHHA0b
/SWqDY35sGn1WzP89tTp7VzgoJnQAZx4PPzhmpG2nsXrFigOtsPJkm9n0f5QtkpR
eDanybLL5uu7LfU5K918UuDXS94J9jIhitxA7CGGghnLkMP7+uMvQ3tmyrk7F98O
ud+z2XUfDrACWzMbcG+FBY/8j8EqLhJH8nLvEq7fZT82IKRkbXjuO+wTpUTpOK3J
G+WwpjCitWZkzNGM7nCKD9odmScIlxu2bpUmM+7khOGlxcS/ubTU3jLIvOJGUFZO
CKyjY6Yo5FpGh5ROghPmzN/gZf5gXpkPGdyMVCydsTAj83rgL1ecpTpcxvuMMusq
Pbu10xtSLv4MiWp5Jt9bKrN1gpFDoy90uYWKvk1BORsRttFY8O2E0pFp433OSMgh
tnrEeRu5VncAZHXIoZfT9WlxE6QeJcp+aa8giv1v3kxOdJFDbcXe56ZerLdBJOZo
+Y7V84WSP+1KWA1HxGiAH8uYSR3LiCdlfFmUzo6hztl+0/FYbwq9jw6DU/5gwRzz
c0PaD3odIi2QvdzjoxEoTvMxvXJp2ogSk+YB0Po+cT/0eeRzp79gxSPOCNuEyZsm
TY4H+ftqGWulJF1s+B1FfpZgtvHU6krwEEkZxKCkN4Zbu+CIKuA6/s+omeyS1Fbc
ldkMlgBH8BSrRLvF56Pg
=tO28
-----END PGP SIGNATURE-----

--=-orKyRQKmIvFl7KgSyjfv--
