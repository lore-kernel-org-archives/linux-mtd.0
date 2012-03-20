Received: from mga03.intel.com ([143.182.124.21])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1S9ySq-0001V4-82
 for linux-mtd@lists.infradead.org; Tue, 20 Mar 2012 12:47:00 +0000
Message-ID: <1332247725.11468.25.camel@sauron.fi.intel.com>
Subject: Re: [PATCH] support ONFI multi lun NAND
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Matthieu CASTET <matthieu.castet@parrot.com>
Date: Tue, 20 Mar 2012 14:48:45 +0200
In-Reply-To: <1332167725-7792-1-git-send-email-matthieu.castet@parrot.com>
References: <1332167725-7792-1-git-send-email-matthieu.castet@parrot.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-UyKJAVicc5ctTbPvXHV2"
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


--=-UyKJAVicc5ctTbPvXHV2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2012-03-19 at 15:35 +0100, Matthieu CASTET wrote:
> -	chip->chipsize =3D (uint64_t)le32_to_cpu(p->blocks_per_lun) * mtd->eras=
esize;
> +	chip->chipsize =3D (uint64_t)le32_to_cpu(p->blocks_per_lun) * mtd->eras=
esize
> +					* p->lun_count;

I've split this long line on 2 shorter:

+       chip->chipsize =3D le32_to_cpu(p->blocks_per_lun);
+       chip->chipsize *=3D (uint64_t)mtd->erasesize * p->lun_count;

And pushed to l2-mtd.git, thanks!

--=20
Best Regards,
Artem Bityutskiy

--=-UyKJAVicc5ctTbPvXHV2
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJPaHytAAoJECmIfjd9wqK0EYoP/1Usp4lGxvbauSXvtSwFM5fi
fTlZoqG5eNBvZAwt89MX4i+854Cc6H3RgJi0wSGnxPYaQUNHq4mdCNO2DibNDnIU
9/BNEk/ax2khA0zmv5AShw8zH80+5XmYIlR5MLEKDtctwCZOP0LhqqAWhmvlkoaD
ZPUwRm9Y6yZJoSySg7/6wyQoLLVRYRVuyXZ9qZxkjr+IxbaND4oRNgwguLIaxQDT
xJEvMmdN1oIoeETOmvPRhSiHYe/M/8xnqNOPQwa3cgTVC6HeNUFh2ieX5e/HoMkb
5O7z9sAHHlHMjz7/DOel7SiuYdRpsr/v4TNSebJGjsIg5MQZc+8wvTYZUPErlGZA
+xvHFB+ZkBfZPR6bW7yo0nnrz+M4S8ibyLX4RY/5RcVPOjLxjYo09CAgDjIuaqWb
U15hQUYNu5aEX+7GU66e6hFB2nhWwZ4jBlmoqF4jGTUbsZAaba5e3ifpc77m0mlu
NXR7baMUJFr9IPWUmpr0SRq18hOFaLz8R46c2grf9uWaDvveLuXsM9wk7UmAESlj
42QCKzEACq8qoOQNNnQq+PNsjvdKBNiHID4mOdcn94XyEM4rZLHUoZS0Nx5eSZ+5
WPoJwnlVIGj8S5afg/BxYbpvh7y6KXFUfPLLTb9PdbcJnQWfKv4dEgLT7mZONX/w
22kAq3myYnketXt01mlB
=enUZ
-----END PGP SIGNATURE-----

--=-UyKJAVicc5ctTbPvXHV2--
