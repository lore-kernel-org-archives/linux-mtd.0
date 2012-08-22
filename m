Received: from mga11.intel.com ([192.55.52.93])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1T4AVJ-0001Rf-8u
 for linux-mtd@lists.infradead.org; Wed, 22 Aug 2012 12:57:53 +0000
Message-ID: <1345640538.2848.175.camel@sauron.fi.intel.com>
Subject: Re: UBIFS corruption after software upgrade
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Russell Zuck <rzuck@cincinnatitechnologies.com>
Date: Wed, 22 Aug 2012 16:02:18 +0300
In-Reply-To: <500F0D81.8050902@cincinnatitechnologies.com>
References: <500F0D81.8050902@cincinnatitechnologies.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-HPHg/O8G+Htic/Dm0EKh"
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


--=-HPHg/O8G+Htic/Dm0EKh
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2012-07-24 at 17:02 -0400, Russell Zuck wrote:
> I am attempting to troubleshoot an issue where the root partition=20
> (ubi0_0) of my embedded platform becomes corrupted after a few upgrades=
=20
> of our system software.
>=20
> Upgrade Process:
> 1. upgrade daemon checks for upgrades, from a file server, periodically.
> 2. If available, the upgrade daemon retrieves the upgrade package (just=
=20
> a tarball) and unpacks it.  The tarball contains several install=20
> scripts, a version file, and another tarball that contains all of our=20
> system software, required config files, and lib dependencies.
> 3. The upgrade daemon is triggered to deploy the upgrade package.
> 4. Deploy
> 	a. run pre-install script
> 	b. run install script. This just unpacks the system software tarball=20
> onto the existing root filesystem.
> 	c. run the post-install script
> 	d. cleanup the upgrade staging directory
> 	e. reboot
>=20
> Upgrade Process Variations:
> 1. Terminate all system software before deploying the upgrade package
> 2. sync after unpacking the system software package
> 3. sync again before rebooting

Well, I do not see anything which could corrupt the file-system from the
description.

> UBIFS extra self-checks: I mounted the debugfs but don't know how to=20
> make use of of the self-checks.

You just need to enable them by writing 1 to the corresponding files.
See http://www.linux-mtd.infradead.org/faq/ubifs.html#L_how_debug

--=20
Best Regards,
Artem Bityutskiy

--=-HPHg/O8G+Htic/Dm0EKh
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQNNhaAAoJECmIfjd9wqK03wUQAKL0lGMnr7acfNcsoMl9EUM4
2skhQUGWEwrrnYdW8HfEIVcQt9bjZ/WcQcGNJQUnP7tlQb9Zp3EAhGfaZmTRhgV8
qDYHiCwzrSJ3XI/p3GjiVgxX2/ggXdZ4INjCefW4DUdIvIZAW4tUgsmdjfvpKCnE
J8AgovBv/5dtA37efNoa5CWYqxwhVurhvAmzzP8NJhoQhkUoP3D4G2nly0NrZmUR
X79KkrviZPfeKvX2Wk8/4puLe3Qx+RXnva3OwQSACO8BlxIVwm9uB0nfoA278ELP
TevKvG+wsrkGFrpRCZpeP5Q0pTi8Jtjx7yuUzciNMHdBLwXWYogVVN9AnYtXuXPX
X4IUEh5Uj9b0tS3Pb7ahpzS0TJ83SnW+rmwSho28ljZ8jGaG7OA7v0A7YsmEtdVY
HBBoqf/f0Vwgc/39hEj6fVul7KSO6Woy24+c4UIlb9qMmrLa5UqrhKg1G5ZHxMOo
JrRthqKHXUduHJUXphpE1fnKAq2/lheKbcXynkyxp/zn+7fh0jhqxEQIethkWCgE
u/SEwn5JhiIGcpo6UIEPBpNP8V6ILd6Ks8h4L0SL4CH9oRmaw5mzqp1J8yw6czbj
+yVZtiyiWV578kb2Q6LDs3xkftPqUAuQO+K8Xmg7tNb18/uirf9q5Nm2XxFf1eh9
0MOpWWuqf97xBOI57VQ4
=zxXP
-----END PGP SIGNATURE-----

--=-HPHg/O8G+Htic/Dm0EKh--
