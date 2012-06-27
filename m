Received: from mga01.intel.com ([192.55.52.88])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SjstN-0006US-4o
 for linux-mtd@lists.infradead.org; Wed, 27 Jun 2012 14:06:50 +0000
Message-ID: <1340806219.3070.23.camel@sauron.fi.intel.com>
Subject: Re: UBIFS fails to mount on second boot
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Iwo <Iwo.Mergler@netcomm.com.au>
Date: Wed, 27 Jun 2012 17:10:19 +0300
In-Reply-To: <CAEZtdFU1cET8=kViUsR0Oq3q0ckcFLuKsd_Hc5WHo_uhFiKVBw@mail.gmail.com>
References: <CAEZtdFU1cET8=kViUsR0Oq3q0ckcFLuKsd_Hc5WHo_uhFiKVBw@mail.gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-lfZXqtvvUF/+YDdwkGar"
Mime-Version: 1.0
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-lfZXqtvvUF/+YDdwkGar
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, 2012-06-25 at 15:23 +1000, Iwo wrote:
> I'm trying to use a UBIFS partition as the linux root filesystem.
> After flashing the
> UBI image, the system boots successfully and is functional.
>=20
> On the second boot, however, mounting of the UBIFS fails and the kernel p=
anics.

So this is reproducible? Can you provide me the ubifs image?

> It is possible to avoid the failure by performing a large number of files=
ystem
> operations (i.e. file system benchmark) during the first session.

Hmm, sounds strange.

> Has anyone seen this before? Suggestions?

Similar issue was reported once and the reported disappeared:
http://lists.infradead.org/pipermail/linux-mtd/2012-June/042046.html

> The hardware is a TI am335x processor with a 256MB, 2K pages, 128K erase =
block
> NAND flash.

SLC flash?

Did you validate your flash with MTD tests?

> As is all too common, the flash supports sub-pages, the driver does
> not. Thus, I'm
> forcing the VID header offset to 2048.

This means the driver is buggy: it does not support sub-pages but still
reports that it does. Just fix it instead.

> The kernel is a 3.1.0 with TI patches and UBI+UBIFS patches from
> git://git.infradead.org/~dedekind/ubifs-v3.1.git today. I had to change
> IS_ENABLED(DEBUG_FS) to IS_ENABLED(CONFIG_DEBUG_FS)
> to make that compile. The original v3.1.0 UBI/UBIFS code exhibited
> the same behaviour though.

I'll fix the IS_ENABLED stuff, sorry for that.

> The image is generated like so (using the latest MTD tools GIT):
>=20
>  mkfs.ubifs -d staging -F -o root.ubifs -m 0x800 -e 126976 -c 511

Did you try to mount an empty volume and let UBIFS auto-format it, and
then reproduce the issue?

--=20
Best Regards,
Artem Bityutskiy

--=-lfZXqtvvUF/+YDdwkGar
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJP6xRLAAoJECmIfjd9wqK0jg4QAJRIHjWNhCFTN9vaiMWaTUKn
2Lw5IWDzg/DNpAHItC6w2whasQ2rz+ImdMkXSfUvQYB2Z3nXzopuDB/VLit8lreK
0zDuV+Ax1dtDJZ6bXvzrucDdsvouOz0q6cAWHm1gNPo8lpSRcmDJ9SjmM/Jm9/Sg
ngPG/On/eZIIs/dMDZ7VDIFRXD7JQTRwKUn6hqYS/otqFvwijAlUawCwtaVQQyNV
3XWLtR7VenvkpAtdnmNX/xu7OPgjL/x0yqdvaPKPH+lU71Z18nNDpDB1XBTPR3zt
DSKbgTmqIKfZeKIdX6pvHfXS+KYGqm0IpX2EgRwPWQNYiGg4AGDIPwK+rMOHs/zg
EffC0xp0HOSmd13J2OFRw27GSxjsltB61yb5B2u4DnhjKsBnRGLTH7Y56MqG/MRS
O3wl7IWFV42jX39kcl6aNR4GbJz4Yo+UZZBV9Xa1wK/vk1k/Dp7deCZPXK8fKSLu
S2mtbUNLeL+v5jF3qzTZh+Pk3ANaBXZvmptAdb0pOCwpKy/ber8XNUu3wcLsRZOa
0DE+GD6YkklN92MoADTPq39DYPKXrnxPnIR3uMzmhd0nQHlHTQuPcHdSkKq5n6Gw
pWLF3IOYfvem0jFc3vXXOHfr6owU2QLOp1MB6ofmLPjYpWIfsfoILA7h6a1HL0l4
Fdj3ma20q83ZIjMKifoS
=RwIl
-----END PGP SIGNATURE-----

--=-lfZXqtvvUF/+YDdwkGar--
