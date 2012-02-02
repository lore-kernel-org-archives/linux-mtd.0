Received: from mail-pw0-f49.google.com ([209.85.160.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Rsusx-0005Ht-RO
 for linux-mtd@lists.infradead.org; Thu, 02 Feb 2012 11:31:28 +0000
Received: by pbdx9 with SMTP id x9so2294463pbd.36
 for <linux-mtd@lists.infradead.org>; Thu, 02 Feb 2012 03:31:26 -0800 (PST)
Message-ID: <1328182404.28171.161.camel@sauron.fi.intel.com>
Subject: Re: [PATCH 1/2] libmtd: add `mtd_dev_present()' library function
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Date: Thu, 02 Feb 2012 13:33:24 +0200
In-Reply-To: <1327689046-1450-1-git-send-email-computersforpeace@gmail.com>
References: <1327689046-1450-1-git-send-email-computersforpeace@gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-9IyCwiSDLlHtAPjCJ6pE"
Mime-Version: 1.0
Cc: Brian Foster <brian.foster@maxim-ic.com>, linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-9IyCwiSDLlHtAPjCJ6pE
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2012-01-27 at 10:30 -0800, Brian Norris wrote:

> +int mtd_dev_present(libmtd_t desc, int mtd_num) {
> +	struct stat st;
> +	struct libmtd *lib =3D (struct libmtd *)desc;
> +	char file[strlen(lib->mtd) + 10];
> +
> +	sprintf(file, lib->mtd, mtd_num);
> +	return !stat(file, &st);
> +}

Thanks! However...

This will only work for relatively newer kernels where MTD has sysfs
support (2.6.30+). Older kernels have no MTD sysfs support and the sysfs
file you are stat()'ing won't exist, so this function will always return
an error.

I've added the following stub to 'mtd_dev_present()':

+       if (!lib->sysfs_supported)
+               /* TODO: add legacy_dev_present() function */
+               return 1;

And pushed your patches to mtd-utils.

This means old kernels won't be fixed, but at least they won't be broken
either. Do you have enough juice to add a 'legacy_def_present()'
function? Ideally, it should parse '/proc/mtd', but I think there are
functions already which just check for '/dev/mtdX' node, so you could
just stat it instead of the sysfs file, I guess. See
'legacy_get_dev_info1()' for example.

--=20
Best Regards,
Artem Bityutskiy

--=-9IyCwiSDLlHtAPjCJ6pE
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAABAgAGBQJPKnSEAAoJECmIfjd9wqK0q9EP/iy5MplpRR2fDp4Z+KUNgi7N
iJ40WhMl5W9x3sawbR5BkkjWHiroKGO4ZQ1IR6DU3Jfb6LPjPosf2dq24Nb+eu4Q
TrmB5aPe/xdKhNRld2FXFVlgJCrMnsURNYBPg2stxXGXLJpRq0oB+l55xNe4Ia+E
PM3L5MPr6FU42CH+qeyL3GWA2p5fHm8fbjTHCU+SwzOEdZt1KCVLl1EHsAjmIhlj
6hsjhN9hYJhO1Y6rb5xfKr7EQ1k8VVJbPbndj0TTgst8VxEf/WqNF+7OkJe9C6Q4
DaGQIDVxuWhzYbAWMoTt3slYXCf0UrhmTL9Pj7BpQkdqkN8pI2+8WtrB+B2UU/zc
p2xieffHs/WYLQPVf9CjCB+fNeC1ZFYpSspvSVoQV26Qay+gT/4tWrFJZdKUuOGg
lCFFcEIUtf0g35UjZUkmlAHVILtDfwUVbZK5QZB4U11zvV/RRyYN90XsZxYDIYkP
j8BwZ3Xjjz7FHoJClXlyj82lksXme4Jppd3a6P95uS7TxOSjqxIo3utwAXNO27lz
cNEQaGtKoGnNlyygFGV26SfYmCqEsv4g5pFfZu4sSqXJMn+xqJ95D1w9UgmqpRVl
JQ4Zk1QBWKT/KJopBoS718buUkBSf2wxBhwv8pIOEXJwdEluKO1hIHfjUrEF41Ba
h7jHNAp/u7wmpD2HSiXu
=mp0K
-----END PGP SIGNATURE-----

--=-9IyCwiSDLlHtAPjCJ6pE--
