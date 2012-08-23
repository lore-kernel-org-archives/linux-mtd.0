Received: from mga02.intel.com ([134.134.136.20])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1T4U42-0005IS-M5
 for linux-mtd@lists.infradead.org; Thu, 23 Aug 2012 09:50:59 +0000
Message-ID: <1345715732.2848.224.camel@sauron.fi.intel.com>
Subject: Re: [PATCH MTD-UTILS v2 4/4] ubiattach: fail if kernel ignores
 max_beb_per1024
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Richard Genoud <richard.genoud@gmail.com>
Date: Thu, 23 Aug 2012 12:55:32 +0300
In-Reply-To: <1345651477-5301-5-git-send-email-richard.genoud@gmail.com>
References: <1345651477-5301-1-git-send-email-richard.genoud@gmail.com>
 <1345651477-5301-5-git-send-email-richard.genoud@gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-E/8LhB7EN1i8sVvlkawI"
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


--=-E/8LhB7EN1i8sVvlkawI
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2012-08-22 at 18:04 +0200, Richard Genoud wrote:
> If the kernel doesn't know the max_beb_per1024 parameter in the attach
> ioctl, but the call still succeeded ubi_attach and ubi_attach_mtd will
> return 1 instead of 0.
>=20
> In this case, the ubiattach command will detach the device and fail with
> an error message.
>=20
> Signed-off-by: Richard Genoud <richard.genoud@gmail.com>

Pushed with some amendments, thanks!
> +	} else if (err =3D=3D 1) {
> +		/*
> +		 * The kernel did not support the max_beb_per1024 parameter.
> +		 */
> +		(void) ubi_detach_mtd(libubi, args.node, req.mtd_num);
> +		errmsg("Your UBI driver does not allow changing the reserved PEBs coun=
t, probably you run an old kernel ? The support was added in kernel version=
 3.7.");
> +		goto out_libubi;

Here I've removed the ubi_detach_mtd() call and the goto. Since we have
already spent energy for attaching, I think it is nicer to just print a
warning and not detach, and let the user decide if he wants to detach.

--=20
Best Regards,
Artem Bityutskiy

--=-E/8LhB7EN1i8sVvlkawI
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQNf4UAAoJECmIfjd9wqK0j34QALF5kFqT9v2avTg1ykYuWqzk
3hMs+RqTLNKMO7SbUS4zWeZSPQZ33kLSkhTaJhgzPG9JF/A+UD3eD3ZtVCnBFjqZ
BCJ8V+m6v4L603ZDNn/A86XmcxwOK4BiGYXaMH168PQ/SNRCxz2WJPtuYZarf2kk
yYyt0IaFaI5V8e6cmctRH/PDDjC2DtUc+hdM/hT+vY2AnbrdySg9uZ6g7YQnbo5D
qkm+jFwbsRDaL06iWso+bzAhS9uCbphBUyZXzYsSX/i+P9EjU4+6YIk0JuFlx9Eg
ZutwJjtmdCx2Nqm7aLuMXZyeD1ZNOrzJ91dPxOl+D0garDlNNV+Zgu2N/HUMgi1R
LPQwS8aF9cdk9rwb7IKESrWcb4wFn89wiaJCUBOqanws3VkCU41Ne6+CgbEFZHOq
9VRrrrDneirjgRqVlCZip3YFXKNwZYZP2Z82uXE3i88Hwrbg9ZtRqqfzYylMxa1Q
hizZyP57XUCt+IE1tLiQBrSWcOaX3epTp8pJAF/Zbgr3W5TqDQwtRWfQ/4mvzZxK
4bM2N1JB7MnSSXFseVTxq6hirAEsckPcl8eZ0BJX1l8nXd4kWE9dcl2WZB+Kdo8Z
UJJhqhESa03c3gFPoD/A+w7D4mkvJTMUucejUco43BrJBdYsImPbaQfprPN7L24x
70QpypJoAnduW3ZCyi0a
=EKAC
-----END PGP SIGNATURE-----

--=-E/8LhB7EN1i8sVvlkawI--
