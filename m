Received: from mga02.intel.com ([134.134.136.20])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1STv3J-0003Ev-Al
 for linux-mtd@lists.infradead.org; Mon, 14 May 2012 13:11:12 +0000
Message-ID: <1337001270.2528.53.camel@sauron.fi.intel.com>
Subject: Re: how do I backup a jffs2 partition to an image file
From: Artem Bityutskiy <dedekind1@gmail.com>
To: geraldwalden@comcast.net
Date: Mon, 14 May 2012 16:14:30 +0300
In-Reply-To: <1074804305.215687.1336714462469.JavaMail.root@sz0162a.emeryville.ca.mail.comcast.net>
References: <1074804305.215687.1336714462469.JavaMail.root@sz0162a.emeryville.ca.mail.comcast.net>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-cOuCwGfZ0nrRnWlzJzN3"
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


--=-cOuCwGfZ0nrRnWlzJzN3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2012-05-11 at 05:34 +0000, geraldwalden@comcast.net wrote:
> how do I backup a jffs2 partition to a ".bin" file. I want to run jffs2du=
mp on a jffs2 filesystem, and the utility only takes an image file as a par=
ameter.

Please, use nanddump/nandwrite tools from the linux-mtd project:

git://git.infradead.org/mtd-utils.git

--=20
Best Regards,
Artem Bityutskiy

--=-cOuCwGfZ0nrRnWlzJzN3
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJPsQU2AAoJECmIfjd9wqK0UwoP/0oL2/YWMijPdljNqaBgk288
oX7xgGtplQrADej2QWyr3LzqaGyX/9etbw+e/0fCMC9q/fG3HaD5+s4l2C+ELeRB
bnqvOufapdkaNFP3G00KO/zhvzhBgRJfHmEp2GIMipstlp/00vDChJsrE7piPYVx
HIE+es6LI7aezNPoqvEFXGkj80VT+AzJNGh7DBiBG1ISQpTggfNSvlu18zoqM9rh
OQDfcoL4bRUjePOjMWpUlhtsx2kzMcAPDT6kqKEmMcyBMXW0Fvr1fiAGTH5Xof0y
DcX22UlFWAPu/iwFQWqWVwYLSrhRgYBKTpc8LFB5fEXEd8ZFfPKYUXSY3dmzvSgt
LmVWB6g/WFlJrV2bj+HvgnLDbhocg82k16GYRgEn2vpy1V8qfoNqL+RODMGhKLY6
yybp0Gzp97V3+EEP5X5b+4IXRBqkbDKY0JV00bgV4SPClVsPrQaoCE+u21ocBtJu
vwrOp8FS+cSDPAggtcGJqGrM0DS8YFYZ4vTQvT3FibsGBhxf+bOvcQwKKSTiKDgg
omlZ+UBl6oonJmOk4/kESz0Fp8ffZiXc6OxEqoGvRzHydCP2sfGo7/bjTdzhwyml
sK04vEJ9nxKzRNOnnhTaIAUgxHTrJ17n1yBOL2eDFLu6N9g1BFJ91LtuivSRO+Yp
FYmpTHbJiS9J5eZLB+xn
=sY8/
-----END PGP SIGNATURE-----

--=-cOuCwGfZ0nrRnWlzJzN3--
