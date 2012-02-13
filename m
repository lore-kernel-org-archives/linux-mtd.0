Received: from mail-pz0-f49.google.com ([209.85.210.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RwwS1-00067X-OT
 for linux-mtd@lists.infradead.org; Mon, 13 Feb 2012 14:00:18 +0000
Received: by dakp5 with SMTP id p5so5511134dak.36
 for <linux-mtd@lists.infradead.org>; Mon, 13 Feb 2012 06:00:16 -0800 (PST)
Message-ID: <1329141752.22240.153.camel@sauron.fi.intel.com>
Subject: Re: [PATCH] mtd: unify initialization of erase_info->fail_addr
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Shmulik Ladkani <shmulik.ladkani@gmail.com>
Date: Mon, 13 Feb 2012 16:02:32 +0200
In-Reply-To: <20120209153629.16bb9b01@pixies.home.jungo.com>
References: <20120209153629.16bb9b01@pixies.home.jungo.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-irB1Gvt5sacrouOlLKNS"
Mime-Version: 1.0
Cc: dwmw2@infradead.org, linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-irB1Gvt5sacrouOlLKNS
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2012-02-09 at 15:36 +0200, Shmulik Ladkani wrote:
> From: Shmulik Ladkani <shmulik.ladkani@gmail.com>
>=20
> Initialization of 'erase_info->fail_addr' to MTD_FAIL_ADDR_UNKNOWN prior
> erase operation is duplicated accross several MTD drivers, and also taken
> care of by some MTD users as well.
>=20
> Harmonize it: initialize 'fail_addr' within 'mtd_erase()' interface.
>=20
> Signed-off-by: Shmulik Ladkani <shmulik.ladkani@gmail.com>

Could you please re-send this one and

[PATCH] sfc: mtd: Use MTD_FAIL_ADDR_UNKNOWN instead of 0xffffffff

as a single patch or a series of 2 patches?

--=20
Best Regards,
Artem Bityutskiy

--=-irB1Gvt5sacrouOlLKNS
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAABAgAGBQJPORf4AAoJECmIfjd9wqK0KpYP/jozj5kQQHdePFrurljW6RgG
3p0f9wnhF30ECMvpiKOqw5P7ADo+NeNWbhnbdPJ1aePgmBky9SnU1BL689+aZhgM
4TR/h64k+kDS44/uKm7VrqSZlEw+7I2Ya1+CF+bxNQyZRWI/jhv9qSWWh1sVbAow
xei7ziFe274fIQa+QNAivu/BhM9HvRvuULrUYgwT2leMCne/cko22XIjoT6EH4Yv
uLqfwIkTDXaWPv/CqIcB+/vz7iXbM4II7/icDuCyTlIXNJoyCZqLjJxcX3QmP4y1
/MjIR7K/jfAMOdCZG9YZuaC3r6iiRTHDElDbgIdOCuVI4IH9CIigIEzal6vG9gjx
InmiTIz5JvVfTQXs/V4lIoTBQHOUgejgtZdkr+z8hExRLhqk6rOgMPEEPqKHurZi
fdva2tkfyTU0/GgyFryRk8csFiPkCivaq2nQIf1bXYvOaIpo9DZA1MOFXUMhGi15
WRQctsMdwHuxZCEBXevGdZVAB/UKMeBYKV0sFhFd1pfUW7N9DWVR+e5rX/vi0kDK
UC836zBPsdu+wqRzkC/uQLcYkzqcFvqJ11xvrTVBzZiKCS0VP5ViY5N8ZQZ4d+cZ
O9fTam7eWLwaXjbZ5uzfhbG5EluihNzXCoHwXRRRMLZmDxKejTWb6Lsiclt1keza
gb1DXfWXW0x3oEtjuJ2+
=pfs7
-----END PGP SIGNATURE-----

--=-irB1Gvt5sacrouOlLKNS--
