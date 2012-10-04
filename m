Received: from mga02.intel.com ([134.134.136.20])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1TJna1-0002a9-P4
 for linux-mtd@lists.infradead.org; Thu, 04 Oct 2012 15:43:18 +0000
Message-ID: <1349365389.20373.72.camel@sauron.fi.intel.com>
Subject: Re: [PATCH] [MTD] slram: Invalid checking of absolute end address
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Jiri Engelthaler <engycz@gmail.com>
Date: Thu, 04 Oct 2012 18:43:09 +0300
In-Reply-To: <CAHODtZQEbc8d-U+MWY=dkZUfAJ-z0xOXMUXSWgg8Zotmicz0Ww@mail.gmail.com>
References: <CAHODtZT6UP4BCHuugpSr6q2=KoTDiGuW_hG_fqjWG7cXcTE35A@mail.gmail.com>
 <CAHODtZQEbc8d-U+MWY=dkZUfAJ-z0xOXMUXSWgg8Zotmicz0Ww@mail.gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-jNUSBilWyPV0fXeiuXon"
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-jNUSBilWyPV0fXeiuXon
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2012-09-20 at 16:49 +0200, Jiri Engelthaler wrote:
> Fixed parsing end absolute address
> Signed-off-by: Jiri Engelthaler <engycz@gmail.com>
> ---
> --- linux-3.2.28/drivers/mtd/devices/slram.c	2012-08-19 19:15:38.00000000=
0 +0200
> +++ linux-3.2.28.mod/drivers/mtd/devices/slram.c	2012-09-19
> 18:29:28.012740703 +0200
> @@ -266,7 +266,7 @@ static int parse_cmdline(char *devname,
>=20
>  	if (*(szlength) !=3D '+') {
>  		devlength =3D simple_strtoul(szlength, &buffer, 0);
> -		devlength =3D handle_unit(devlength, buffer) - devstart;
> +		devlength =3D handle_unit(devlength, buffer);
>  		if (devlength < devstart)
>  			goto err_out;

Pushed to l2-mtd.git, thanks!

--=20
Best Regards,
Artem Bityutskiy

--=-jNUSBilWyPV0fXeiuXon
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQba6NAAoJECmIfjd9wqK0ploQAJxeaE3uCrhImDoWogoXnZoq
C3zMSxmpdjpTdZFA1881LWPAumB/hacqyftB1R9rkaPPBEG27QaQmxbb2wFtXRda
v+Jx/RCzGmWW1w0fLC4oKIDqDUJ0GzLF0vuYGAIcKC49jpjPqxY3T5u18COnAXP4
0mnzlBy0kJnZKbOJa5sqLZWuJxiRCVEFjIvi895F2zd9lDHR8QGrvRNf20NrObfs
S5gX+TLF641HmpBtekspuiqeCB21n8A8tabYVt5xMsI1XmLeT46RywMfjdOTZLLJ
NZsxnV/2J4mcZuxUk5oULhnuLO5N+hI7QyxRPYjwbJSM1MFySExvpPZ80yj9nI1V
2wD5f//8W3lrXbYWqUiDBmCHn6SJ5aO9zGJzg6286eDOmqEMCpPJgPXO72BWFhnS
WK8DMyjr9fCgzCtwX3yOjKXuYSGoKyvtDnja1KsdxfvURgva0W+rlIJNVwPSS3aV
Mowma1DAZM1OH4hqLA6g+QWYp6f6FOFbv0f/Oq6lQLNaOujaykl9pISC0r0tlb6n
WZLvW2sAgzCXcWmlua78n9wYUfGrifrRhpVcAleLW/H1QFDYKqZj3OlxdDLTl8cn
8m3U1cHkOpub+T+TzNRlvbEmt09/3MbUmx/jhaC6pVxqwFjxKPDWRbnPtEJp1OrF
1EGVzOSfx0sgs5sRM448
=6vdS
-----END PGP SIGNATURE-----

--=-jNUSBilWyPV0fXeiuXon--
