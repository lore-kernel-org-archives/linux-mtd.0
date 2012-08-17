Received: from mga02.intel.com ([134.134.136.20])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1T2HqV-0000Ex-9S
 for linux-mtd@lists.infradead.org; Fri, 17 Aug 2012 08:23:56 +0000
Message-ID: <1345192119.27859.28.camel@sauron.fi.intel.com>
Subject: Re: [PATCH 2/2] UBI: add ioctl for max_beb_per1024
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Richard Genoud <richard.genoud@gmail.com>
Date: Fri, 17 Aug 2012 11:28:39 +0300
In-Reply-To: <1345128723-13582-3-git-send-email-richard.genoud@gmail.com>
References: <1345042639.3393.150.camel@sauron.fi.intel.com>
 <1345128723-13582-3-git-send-email-richard.genoud@gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-M46YEja31aWRzSyx2JaH"
Mime-Version: 1.0
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
 Shmulik Ladkani <shmulik.ladkani@gmail.com>, linux-kernel@vger.kernel.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-M46YEja31aWRzSyx2JaH
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2012-08-16 at 16:52 +0200, Richard Genoud wrote:
>  		mutex_lock(&ubi_devices_mutex);
>  		err =3D ubi_attach_mtd_dev(mtd, req.ubi_num, req.vid_hdr_offset,
> -					 MTD_UBI_DEFAULT_BEB_LIMIT);
> +					 req.max_beb_per1024);

Do not forget to explicitely validate 'req.max_beb_per1024' valuse in
'ubi_attach_mtd_dev()', as we do for other parameters.

--=20
Best Regards,
Artem Bityutskiy

--=-M46YEja31aWRzSyx2JaH
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQLgC3AAoJECmIfjd9wqK0BswP/R/bARX2W2RlABSMUx1ytXHI
jyuFZSFOiSj7UjrCCFvXzaxgIdbgUHPCxJ9IpEoVY/ELW7hgLJNt5Jx2W2BAQ/yF
dBMk2ZRIctbKRQo9YLlWRvi+elTLL0Qjt4A+iTsxqENbHtXbzWs5rHOYInjvGrUU
vwBFI861JrmOrOVJrcI1mH5Z6mld1q7IQi0fPY48MOpHUEP99131yosH2srs3lGn
c6nRCzcvJfsWRe+BdJ0Yc0O0pmsYr3YWDjwW7aXgOlwbmd+9PDW5sji0m3W7FXWZ
BTX/4bsuRKLFuLWMEZRqjoXs0csk5ThRKdozNM8VF3iZhqxHYaJPclQuuusft1NU
NsflO6QsBnbjhJZkg9lZQIc4pLYC9H99DhWs4dC4WYllrFa0gDqpOHjeb0ck1K07
cxliW8bg+KHceYuZMCVgjfE1ISSFSSbF1z089jRedti22LnHizwibJMHsFcdYJzH
bfw3SLu8dOTUwlBCCATocLMYH0822ewFjBYqjulWjcug4k62cD6/R13aYqJqEc9T
cavfjXS3UrVezYIoYdGlJxPxfolJhq/RA+Hbf1gcI+R0a+Jcw058XysKS5P2oKYH
QREFJ62ax1WOJh0L++wPHBofGxIYDDLztLFQdWMvejxVOtAp4cHEomjKInLco/GY
TbV0lAtL8rPZCpWDXdav
=LU7B
-----END PGP SIGNATURE-----

--=-M46YEja31aWRzSyx2JaH--
