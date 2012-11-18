Received: from mail-la0-f49.google.com ([209.85.215.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Ta5Um-000236-PQ
 for linux-mtd@lists.infradead.org; Sun, 18 Nov 2012 14:05:17 +0000
Received: by mail-la0-f49.google.com with SMTP id r15so2943883lag.36
 for <linux-mtd@lists.infradead.org>; Sun, 18 Nov 2012 06:05:10 -0800 (PST)
Message-ID: <1353247498.1592.2.camel@kyv>
Subject: Re: [PATCH] mtd: de-select the chip when it is not used
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Huang Shijie <b32955@freescale.com>
Date: Sun, 18 Nov 2012 16:04:58 +0200
In-Reply-To: <1352449425-16496-1-git-send-email-b32955@freescale.com>
References: <1352449425-16496-1-git-send-email-b32955@freescale.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-WKnhYIhCC6rITT3o8EGS"
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org, computersforpeace@gmail.com,
 dwmw2@infradead.org, linux-kernel@vger.kernel.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-WKnhYIhCC6rITT3o8EGS
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2012-11-09 at 16:23 +0800, Huang Shijie wrote:
> When we scan several nand chips with nand_scan(), such as
>      .......................
>       nand_scan(*, 2);
>      .......................
>=20
> In nand_scan_ident(), the maxchips will become 2, so the current code
> will select chip 1 to read the device ID. But the chip 0 is still
> selected in this case.
>=20
> To make the logic clear, we'd better de-select the chip when it is not us=
ed.
>=20
> This patch de-select the nand chip if it is not used any more.
>=20
> Signed-off-by: Huang Shijie <b32955@freescale.com>

Pushed to l2-mtd.git, thanks!

--=20
Best Regards,
Artem Bityutskiy

--=-WKnhYIhCC6rITT3o8EGS
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQqOsKAAoJECmIfjd9wqK097oQAII5hnjUNqQvq+3s9h8d+O6X
SfYuy7hRLLVRaZnkpjmtU+bajA7C8J0lJza/f4oskiBNRMJ6R1fUS7le6se6StZy
EV1QC+ghUbHFQfHySTfkSPydaNHd4gkZUn0EK7ogu/bcR8cRMhB79Cab1iDqp287
8SUutD8dcCudlm6ezPndUpMFSBQEMDdQEqdpah9fR8JhYIdqQiBdrRQfqCVMvMWQ
MwtYx1CnXSpv3CjFR6fkM5q1QezscfsZOyd2a/VlgAqqNP+0yNLv+Ga5bSWsW/Bp
OMyPR8LsmAAQzOM3qz1z+ItDRDkdASF08qiCQaPcI4BoWtadHDMzQl7JOxAKXVsz
85eNTJfnUdLd1qxi8V7AV+MAAGQOjAkFDTqcV2mh/cCglZTKlYDuSkqFl5nM8KEe
SdUN7ZLe83dAGVXPtj74gr41kAJ3bb3+lR0nbDyjC80CvzGGgEeKz483ocNoIiPt
ZptLkt61av2zfMTi9A93RLFsOLyzg1bV6dW8zFnGJnpgNsrxz8I/4EUh21KH1pD2
TZs6YfRt+SUhswfWLYQeq2T0/g8q6WrtDnohyt4ISiZ9ON0P0XQD5t+6wjkJvEZs
UtrDqacmPGJ8DTSlqIuteJdeYURbR0H7kt5Rkj9G2R0Zf2x+1JEYXVLjIeA4EWj5
5Yzv85W+lk2hsshM+zWZ
=UbnZ
-----END PGP SIGNATURE-----

--=-WKnhYIhCC6rITT3o8EGS--
