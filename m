Message-ID: <1348499187.4880.66.camel@sauron.fi.intel.com>
Subject: Re: [PATCH v3 1/2] ARM: Remove bcmring NAND driver
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Christian Daudt <csd@broadcom.com>
Date: Mon, 24 Sep 2012 18:06:27 +0300
In-Reply-To: <1348263626-3087-2-git-send-email-csd@broadcom.com>
References: <1348263626-3087-1-git-send-email-csd@broadcom.com>
 <1348263626-3087-2-git-send-email-csd@broadcom.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-tPMpZpgzqSA6nJaNlAxR"
Mime-Version: 1.0
Cc: Arnd Bergmann <arnd@arndb.de>, Will Deacon <will.deacon@arm.com>,
 cdaudt@gmail.com, "arm@kernel.org" <arm@kernel.org>,
 linux-mtd@lists.infradead.org, "JD \(Jiandong\) Zheng" <jdzheng@broadcom.com>,
 Olof Johansson <olof@lixom.net>, linux-arm-kernel@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-tPMpZpgzqSA6nJaNlAxR
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2012-09-21 at 14:40 -0700, Christian Daudt wrote:
> This driver is being removed as part of the cleanup of the bcmring
> SoC from mainline as it is no longer maintained.
>=20
> Signed-off-by: Christian Daudt <csd@broadcom.com>
> Reviewed-by: Jiandong Zheng <jdzheng@broadcom.com>
> Acked-by: Will Deacon <will.deacon@arm.com>

Pushed this patch to l2-mtd.git. But if you decide to merge it via
Arnd's tree (probably better idea) - let me know, I'll drop it.

--=20
Best Regards,
Artem Bityutskiy

--=-tPMpZpgzqSA6nJaNlAxR
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQYHbzAAoJECmIfjd9wqK0vPwP/2zg4PFI/+G2KrQnpCYuO9EV
4C/fecVtxDqZwrXOiohWGdrdHI2oBA9YjRfFUqzvZy1vVNb8zt7bP/+wRAQlikzH
cVIS0HT1L0PLkVQB/GoVTQ3XtCpnEWs+/Y62m89PnsSTKSQzheAhQv7yHhzYt6zc
NJfaml7OvkJHQnh2E0Yk8SId6vngSKRSdTJ4aZligQRkhy0d5xA8Uw1lZNpIs7mg
XZAsf0kT3N3CmMETlEb0KeCPp2TdD+2KTpn2NrWA1wkfdRqJ180HzPX3eEMIU0/G
89AODYh+Ch9mK4H+Gu6rugW73/L8+yKdTVgkYBxq/2c0FrlRHiw6C+kmXOBzACNI
kIlnGa3/7Wia+Kqary78WK6JImaDuE88sfdJVR0UKvo+/fWbwroE2VoBbxSoHM66
45/YK9lnKQZnfIM6+OmUPjhCcNwrUX7hXjG2oliH2gsUWaORjx+nT8LVoRuh3Wi+
noMDQHf7lIHrUr1qSlorUq4oHgs9AJ3YEeZHstMjPgZBHZ2GVVQxpdXXW8lRbSol
zE2W5VEisKv+JSpFnSnyZj73nsmeMhCBXFr6zHEZaYn+Ue1upqoH8sESRhVc7o+W
oN490ufTdHc2bX2bFuHqFZzQ1L+UyZiU+hyVNlbuiUrJBHRAOc9kJlTidWhzi39r
wAXIbJcqsj+ZHGRo5tWZ
=TmAw
-----END PGP SIGNATURE-----

--=-tPMpZpgzqSA6nJaNlAxR--
