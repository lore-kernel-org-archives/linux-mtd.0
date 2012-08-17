Received: from mga01.intel.com ([192.55.52.88])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1T2Kz0-0001Ic-PZ
 for linux-mtd@lists.infradead.org; Fri, 17 Aug 2012 11:44:55 +0000
Message-ID: <1345204178.27859.61.camel@sauron.fi.intel.com>
Subject: Re: [PATCH 2/2] mtd: esb2rom: rework ROM scanning and resources
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Aaron Sierra <asierra@xes-inc.com>
Date: Fri, 17 Aug 2012 14:49:38 +0300
In-Reply-To: <848a19c3-8f67-44f1-89ec-ac89e3a95035@zimbra>
References: <848a19c3-8f67-44f1-89ec-ac89e3a95035@zimbra>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-bDXwIwinY8kLBU/QgfQp"
Mime-Version: 1.0
Cc: Guenter Roeck <guenter@roeck-us.net>, linux-mtd@lists.infradead.org,
 Lew Glendenning <lglendenning@lnxi.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-bDXwIwinY8kLBU/QgfQp
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2012-07-12 at 16:50 -0500, Aaron Sierra wrote:
> This patch collapses the various 4MB limit workarounds of the original
> driver to a single limit when probing the Decode Enable Register. This
> allows the driver to request an iomem region no larger than 4MB and no
> larger than needed. The Intel 3100 chipset hardware that I test on only
> has a 1MB ROM region and I experienced resource conflict warnings with
> the BIOS and a kernel call trace on each boot without this change.
>=20
> It also changes the way the ROM region is requested so that it requires
> less manual resource structure manipulation and no longer always fails
> for me.

If this is an independent fix, make it to go first, so it could be
applied independently. Also, if you want make it more probable that
someone review it - please, try to split it on several smaller patches.

--=20
Best Regards,
Artem Bityutskiy

--=-bDXwIwinY8kLBU/QgfQp
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQLi/SAAoJECmIfjd9wqK0mNAP/Ruz9br1REEf6z+iwlsYiHWY
z4TqPnf2QClfPH5psu3Ie/1hcwqvHtQW/Elgk1Zle3d79VZcOPiW2kMfeU9i3h+l
rwv36/3zuCgtwYNbVMU8UsNMcBuIaygW1a2t/ECSwTrK8pq2UQFd6C/maGgqPjrJ
IVEd1hjgXTEV/0AxrRvkG1sYEsbkXnbWxC+VmIU+6/1kZFCb4V1+eXxTRplUsK4V
Y8dBAzXKkZxpFylmdGz2+wELewTCW6baJOdIGtecVFoUelKh5aICD/IWruffubhF
WyYpIeXKPNPK5FNryfLIFclNB9XskBgm29u2gK2Vw33If5p1FKOrK+rqr6xCPOOu
r0N7JjlaMIdXoQY2kBr0H5/SPVIpZogaK2yImy5XOSjuHJkf7UKFXFFWIhcLB/LD
C8SX7HX8tdm0HlUt8k43aJJ+l/wiM770oqFNJOisjHJtEsbHGSh7sVY7MEXeysvY
bGLkfa+nqySGc+pidyBCj4dYcSIJdfCWf/LKu5fwNiiisSTaOUFuLRDMqqvBOPuS
BvaF9WJBvOZX+fqukAINxIcInkRkOdKsjhIM/dT5P3meNPxuNe9DOenby83cYVpe
eoXj5c8BKLzltfVkjzn3b9kGSOUznFJwv01MFz4U8fNfQGcOul76W/cTrs4y8doq
L9iLLDhGQ3K9pf/y3SWm
=YIjz
-----END PGP SIGNATURE-----

--=-bDXwIwinY8kLBU/QgfQp--
