Received: from mail-iy0-f177.google.com ([209.85.210.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RdhpP-0000mf-0b
 for linux-mtd@lists.infradead.org; Thu, 22 Dec 2011 12:32:55 +0000
Received: by iadk27 with SMTP id k27so14382937iad.36
 for <linux-mtd@lists.infradead.org>; Thu, 22 Dec 2011 04:32:51 -0800 (PST)
Message-ID: <1324557264.10300.86.camel@sauron.fi.intel.com>
Subject: Re: [PATCH 1/2] MTD: pass driver methods through partition wrappers
 on unpartitioned devices
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Mike Dunn <mikedunn@newsguy.com>
Date: Thu, 22 Dec 2011 14:34:24 +0200
In-Reply-To: <1324406536-18250-2-git-send-email-mikedunn@newsguy.com>
References: <1324406536-18250-1-git-send-email-mikedunn@newsguy.com>
 <1324406536-18250-2-git-send-email-mikedunn@newsguy.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-Kml8BDteg9gKCqpYjF8s"
Mime-Version: 1.0
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Lars-Peter Clausen <lars@metafoo.de>, Scott Branden <sbranden@broadcom.com>,
 Wan ZongShun <mcuos.com@gmail.com>,
 Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>,
 Manuel Lauss <manuel.lauss@googlemail.com>,
 Haojian Zhuang <haojian.zhuang@gmail.com>,
 Kyungmin Park <kyungmin.park@samsung.com>, linux-mtd@lists.infradead.org,
 Ralf Baechle <ralf@linux-mips.org>, Jiandong Zheng <jdzheng@broadcom.com>,
 Andres Salomon <dilinger@queued.net>, Olof Johansson <olof@lixom.net>,
 Jamie Iles <jamie@jamieiles.com>, Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, Vimal Singh <vimal.newwork@gmail.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-Kml8BDteg9gKCqpYjF8s
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2011-12-20 at 10:42 -0800, Mike Dunn wrote:
> Ensure driver methods always go through the wrapper functions in the
> partitioning code by creating a single "partition" on otherwise unpartiti=
oned
> devices.
>=20
> Tested with nandsim, onenand_sim, and the diskonchip g4 nand driver (curr=
ently
> out-of-tree).
>=20
> Signed-off-by: Mike Dunn <mikedunn@newsguy.com>

Looks good to me in general. Does it change anything from the user-space
POW (API/ABI)?

One thing to be aware of: some drivers do like this:

drivers/mtd/maps/plat-ram.c:

        /* check to see if there are any available partitions, or wether
         * to add this device whole */

        err =3D mtd_device_parse_register(info->mtd, pdata->probes, 0,
                        pdata->partitions, pdata->nr_partitions);
        if (!err)
                dev_info(&pdev->dev, "registered mtd device\n");

        if (pdata->nr_partitions) {
                /* add the whole device. */
                err =3D mtd_device_register(info->mtd, NULL, 0);
                if (err) {
                        dev_err(&pdev->dev,
                                "failed to register the entire device\n");
                }
        }

Could you please:
1. Try to find drivers like this and kill the redundant mtd_device_register=
()
   call.
2. There is no guarantee you will find all. So you could add a check in
   mtd_device_parse_register() which would print a warning if the device is
   added for the second time and return. So the code would work and people
   would be able to notice the warning and fix up the driver.

> -		add_mtd_device(&slave->mtd);
> +		ret =3D add_mtd_device(&slave->mtd);
> +		if (ret =3D=3D 1)
> +			return -ENODEV;

Is this an unrelated change? Would you separate it out?

--=20
Best Regards,
Artem Bityutskiy

--=-Kml8BDteg9gKCqpYjF8s
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAABAgAGBQJO8yPQAAoJECmIfjd9wqK0M90P/iJWAyFctkLSeBNPyMdkg4zt
Lq9vdLlbot6JRGOgs3kNGLfQiUPzMPwYJIcYXyzSj/nS5+HtIwZWRRs0qhIQaMRh
q3Qi6YlkAf0XJ3/LhU7MMsj1RxpLLj1oDGegMYfWhnflmYovhzOo+iksSdDLY14M
kKH3t1uHyrmBstWgA1MbomYHJrHCLfANQOUM2KLFkvEkVRKQOxp3+AojWAfxtiPC
NPufbG3iN97XM4gACCYynRbJhoXZkZH7QrqJciVPtyEvRorwFksa1QwNjzDAzAJX
kbBSV3cOBBgwqNfLluTcF2fxxlkcFjN4AGmuvI9YAVxQmr1jCjxj7K8mNutIv79L
AHyX/Z9dy5z3xbFqmC++NKy1hC6MP/OKs2FGGC6Dj0xOmP3DDRr9qigHljE23XDG
5ofhTDpO7lEKnkB8/NMW1kR7EDEpF8Nt+S1CeLVjb/e1vWk9UbB6TNzABghJt63j
SXiwH+0XXXXU2K/HiQCkV1fec+L6G1ZA0J4RL3epyDSjdulV77vuAfqAFomnojAF
n7LITE+kQzE/KTzoC8s1YYHoLTTYpEkFhen9NNfnd89huGejLRhZnv6dVALjmEjK
LDBYEwVATRrPlUrAXi+q0tVJjwpOhVPQcmrO2M1NniCfq+FPUQ7jg7j04NtgwKwA
mikRfK1B8Y2Q1j8ngqaM
=b5YE
-----END PGP SIGNATURE-----

--=-Kml8BDteg9gKCqpYjF8s--
