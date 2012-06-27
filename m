Received: from mail-wi0-f169.google.com ([209.85.212.169])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SjjdB-0001y8-VH
 for linux-mtd@lists.infradead.org; Wed, 27 Jun 2012 04:13:31 +0000
Received: by wibhm2 with SMTP id hm2so1497770wib.0
 for <linux-mtd@lists.infradead.org>; Tue, 26 Jun 2012 21:13:28 -0700 (PDT)
Message-ID: <1340770405.2317.10.camel@koala>
Subject: Re: [PATCH 13/21] UBI: Fastmap: Introduce WL pool Signed-off-by:
 Richard Weinberger <richard@nod.at>
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Richard Weinberger <richard@nod.at>
Date: Wed, 27 Jun 2012 07:13:25 +0300
In-Reply-To: <1339584138-69914-14-git-send-email-richard@nod.at>
References: <1339584138-69914-1-git-send-email-richard@nod.at>
 <1339584138-69914-14-git-send-email-richard@nod.at>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-DxSDjPmiPspZtLg2ym1R"
Mime-Version: 1.0
Cc: adrian.hunter@intel.com, Heinz.Egger@linutronix.de,
 linux-mtd@lists.infradead.org, tim.bird@am.sony.com, tglx@linutronix.de,
 shmulik.ladkani@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-DxSDjPmiPspZtLg2ym1R
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2012-06-13 at 12:42 +0200, Richard Weinberger wrote:
> Signed-off-by: Richard Weinberger <richard@nod.at>
> ---
>  drivers/mtd/ubi/build.c     |    4 ++
>  drivers/mtd/ubi/fastmap.c   |   51 ++++++++++++++++----------
>  drivers/mtd/ubi/ubi-media.h |    2 +
>  drivers/mtd/ubi/ubi.h       |    1 +
>  drivers/mtd/ubi/wl.c        |   82 +++++++++++++++++++++++++++++++++++++=
+----
>  5 files changed, 112 insertions(+), 28 deletions(-)

Hi, I've rebased the fastmap branch against v3.5-rc4, and your patches
do not apply cleanly anymore, because there are collisions with Joel's
changes which were merged recently. I've applied everything up to this
patch and pushed out. Could you please re-base and re-send your queue?
Thanks!

--=20
Best Regards,
Artem Bityutskiy

--=-DxSDjPmiPspZtLg2ym1R
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJP6ohlAAoJECmIfjd9wqK0/5oP/1fcr7bXV+q9ZbN3FQdr8ZEU
4B1nqSQoGoSAOigEx+xaXuyrATCXj2BhzD+o7AyXC/8IJ7Gn+4cmKSM+KIDCC28G
rWGZd9TkUkomCkNvCd9t0hq5nwjJOwtq3JehnNYIPLmbTKA50VBFIhfnY0yEeFy7
flsVQOt0kGL/DWCdSfmZ1ZASPy9o1oNr+F2J9TikWtwshZOaN4HPv7MZQ54h7OZX
pAEzadWDb0ADRicjkgKLU5FGzP/NLGb5iWjMLMxHfC0ABtlftp4LS8NeTNab93hc
uLce7elZqdA/dexHrWr58MQrLZYVThGAWJtcyR9NdaCORhTpRYSmnMjJWZ/BBng1
MdcO9c7eyjpStnkopIDybQ33t3c0L8mEd08oeMlYLM6+4mbx41MjN7mj3KklMJcq
Qf/EbZAXjwNNn4o3d3jsNGYfp3cvo+eeqpbqPio3U3q6GZUZbKnnCJNa2dyzjq8E
IZHTtcoWmHyrg1vdLs67AHwZ0rBtxy0O+O7gqZgm+vpD38rxKKv35A6Nf8fMFUg3
/130lViDVMXmq4H4mqP3DzI4S+HQUEV+C/84Vk+Ws5AYgCQ/W/td7YRxHe534FKZ
Wv2XarDY64OMIPzG0Fg6YtXXI/TJt3OlZJrngy9EDpw5YwD+FJYduqMt9haRLNOh
US1ikbLaM5EwmCdGj5yX
=/LeQ
-----END PGP SIGNATURE-----

--=-DxSDjPmiPspZtLg2ym1R--
