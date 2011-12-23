Received: from mail-iy0-f177.google.com ([209.85.210.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Re6NW-00029I-3B
 for linux-mtd@lists.infradead.org; Fri, 23 Dec 2011 14:45:46 +0000
Received: by iadk27 with SMTP id k27so16516071iad.36
 for <linux-mtd@lists.infradead.org>; Fri, 23 Dec 2011 06:45:43 -0800 (PST)
Message-ID: <1324651638.1165.29.camel@sauron.fi.intel.com>
Subject: Re: [PATCH 1/2] MTD: pass driver methods through partition wrappers
 on unpartitioned devices
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Mike Dunn <mikedunn@newsguy.com>
Date: Fri, 23 Dec 2011 16:47:18 +0200
In-Reply-To: <4EF3BD2A.5020409@newsguy.com>
References: <1324406536-18250-1-git-send-email-mikedunn@newsguy.com>
 <1324406536-18250-2-git-send-email-mikedunn@newsguy.com>
 <1324559149.10300.93.camel@sauron.fi.intel.com>
 <1324577032.1165.15.camel@sauron.fi.intel.com>
 <4EF3BD2A.5020409@newsguy.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-0vtBujxuEEfzAg/opiKV"
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


--=-0vtBujxuEEfzAg/opiKV
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2011-12-22 at 15:28 -0800, Mike Dunn wrote:
> OK, thank you Artem.  I'll watch for it and follow up with a reworked pat=
ch 2.

I'm on it, but I think I've under-estimated the amount of work
and it won't be ready today.

--=20
Best Regards,
Artem Bityutskiy

--=-0vtBujxuEEfzAg/opiKV
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAABAgAGBQJO9JR2AAoJECmIfjd9wqK02okP/0MNN2F/Be7KXHuNCVHy5H1Q
z3M9NdvTS0Csvz98DGkMPfkhj6+NtxHjEmfLauZNaXly5CNClvU11XuPTtl7JnUR
OwpcFVyUQMUig6NeaqpzrDg6eZyg1ViY2X7RRjD8V5ipA8QsWR/Wuw6ohk3O5JlZ
6GyaGXSEpzU7UIwsoAD0F7Pki0ZeZmVCxO6lJ2A5Z8yOi2rLUDMnJ8bnJrLbDjyP
yPGLZQkigYyG+wmEG39Q0U3zmPXHuOINf53AJGPnpP4oq3LBV/woSgdnvQOLdmIs
lvH6c569XYoLuDCskdAh8s2GoOslVfxJOclClCJ+1VJg8GrjEvtjrXLUjfGLu84r
WmM6pXmeJ1afaj4998oDsR/f+pTRxH3LKE5iWkfJFu1dXt6gtBdS3srhkYgHjiOR
G6y0mtaaD/4eanBJaGlgv6/5euIN+WtSI7vhFVJOj+WRxqeQe7pC8LAjIxCt4PdO
phVKus1XvDFkqCZx4cIKnJs2uWX5mjLw7QgMXVlNNAoJuledOpmBQ6zlx6TgoUIe
pcRvh/HpuiEQ4qmfS7ns73MGIqyaP/OcdU+yzhNxH5LDb88SInccwsMzwrzevIwv
132Esuk9qBRKpIj4UAnhRRtVwlMzCWcRwIs1NMkb7FskdmPcIDjbYnxklQUGK6jQ
1q/wlSl4LiEGU5kbhxHv
=4fC1
-----END PGP SIGNATURE-----

--=-0vtBujxuEEfzAg/opiKV--
