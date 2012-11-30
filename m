Received: from mga11.intel.com ([192.55.52.93])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1TeP8P-00066f-8Q
 for linux-mtd@lists.infradead.org; Fri, 30 Nov 2012 11:51:57 +0000
Message-ID: <1354276363.30168.103.camel@sauron.fi.intel.com>
Subject: Re: [TRIVIAL PATCH] ubi/gluebi: Rename misleading variables
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Ezequiel Garcia <elezegarcia@gmail.com>
Date: Fri, 30 Nov 2012 13:52:43 +0200
In-Reply-To: <1353368120-5899-1-git-send-email-elezegarcia@gmail.com>
References: <1353368120-5899-1-git-send-email-elezegarcia@gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-SzhznWpAOQFq85PN5kiu"
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


--=-SzhznWpAOQFq85PN5kiu
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2012-11-19 at 20:35 -0300, Ezequiel Garcia wrote:
> Both names 'total_read' and 'total_written' are actually used
> as the number of bytes left to read and write.
> Fix this confusion by renaming both to 'bytes_left'.
>=20
> Cc: Artem Bityutskiy <dedekind1@gmail.com>
> Signed-off-by: Ezequiel Garcia <elezegarcia@gmail.com>

Pushed to linux-ubi, thanks!

--=20
Best Regards,
Artem Bityutskiy

--=-SzhznWpAOQFq85PN5kiu
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQuJ4LAAoJECmIfjd9wqK0vSoQAMj+n+/3SqKUNSH597smpZ4r
d/vAfyYRrSpUn93Z5Xu5l7fIaGBNTR/EAS0hT7+EzN+veohxi9Ntk4USzxYRl+Yt
0OGmDSpEB/O2bXbzfNnh8AOQdChNo78TK5cJlKYY0kKZOcHfvMkC10U/B4WbbfLe
abhGumZJ0+xUk1E58NK2nNMQoGcCReMdXhU5YDTXdwCBs7YHxTIVfU1A1+jrK942
jbKCn8RcQ/5VGUhahzGcSClT8WrIU/qh05nIXrsixNHEIs+YxjzSjC1l0Q7S7NL1
5YNljaTq0yvDY68OPEYvH8+fuTQn+0mSpVyQFeaV9X14EIY93PC89PxajTQE4xOU
PKl1gzvOhwONG24HN+bIU7u04FqGTWl6moWhiypHCY1ap+Thao3mHE8HIFaVgOTG
HJJRUPbhjpDCX8LMRBRLaV14o5Axv+s1J1L6apTbBgh806BGa3DM/EXHJ8DiZwj+
J2I8yLXqw3JoB8EX8X56tzjTsKgvXCjkRZ7LQzVKHKZhMQ/muHwrI+4tLT38iFTm
+OfQefpcXSdgkZQbC9eewukE7EiwOCHrQR2nYOktjboQFKFtbHUUc9mO4R939yUw
bN1ZXUK6kzlvcdAFnqjKQTWfV/KaJXSHpJy3/05q3dyf/23NAoa94Kjcq4zqlbX1
PABHKjyjfHxKRC94GRnp
=95XZ
-----END PGP SIGNATURE-----

--=-SzhznWpAOQFq85PN5kiu--
