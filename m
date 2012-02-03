Received: from mail-pz0-f49.google.com ([209.85.210.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RtFEq-0003D5-7b
 for linux-mtd@lists.infradead.org; Fri, 03 Feb 2012 09:15:24 +0000
Received: by dakp5 with SMTP id p5so3093106dak.36
 for <linux-mtd@lists.infradead.org>; Fri, 03 Feb 2012 01:15:23 -0800 (PST)
Message-ID: <1328260644.13362.1.camel@sauron.fi.intel.com>
Subject: Re: [PATCH 1/2] libmtd: add `mtd_dev_present()' library function
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Brian Foster <brian.foster@maxim-ic.com>
Date: Fri, 03 Feb 2012 11:17:24 +0200
In-Reply-To: <201202021420.18252.brian.foster@maxim-ic.com>
References: <1327689046-1450-1-git-send-email-computersforpeace@gmail.com>
 <1328182404.28171.161.camel@sauron.fi.intel.com>
 <201202021420.18252.brian.foster@maxim-ic.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-Pqo2XZ6T6czH/+Bdyfar"
Mime-Version: 1.0
Cc: Brian Norris <computersforpeace@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-Pqo2XZ6T6czH/+Bdyfar
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2012-02-02 at 14:20 +0100, Brian Foster wrote:
> On Thursday 02 February 2012 12:33:24 Artem Bityutskiy wrote:
> > On Fri, 2012-01-27 at 10:30 -0800, Brian Norris wrote:
> > > +int mtd_dev_present(libmtd_t desc, int mtd_num) {  [ ... ]
> >=20
> > This will only work for relatively newer kernels where MTD has sysfs
> > support (2.6.30+). Older kernels have no MTD sysfs support and the sysf=
s
> > file you are stat()'ing won't exist, so this function will always retur=
n
> > an error.
>=20
>  This is a very plausible concern:  Our older system
>  is mostly deployed with 2.6.26(or even older) kernel,
>  albeit a 2.6.30 option exists.  It has multiple MTD
>  devices, albeit due to the usage/configuration (and
>  maybe the use of older mtd-utils?) I suspect the bug
>  has never been observed.
>=20
>  Our latest system uses 2.6.36, and is where the original
>  UBI-related bug was observed.

Ok, I've just prepared the below patch. Compile-tested only. Anyone
volunteers to verify?

=46rom d3e5e0a2aeb61dbd99c41c11e1c268510a4334c2 Mon Sep 17 00:00:00 2001
From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
Date: Fri, 3 Feb 2012 09:15:31 +0200
Subject: [PATCH] limbtd: implement mtd_dev_present for old kernels

Implement the 'legacy_dev_present()' function which will check whether an M=
TD
device is present by scanning the /proc/mtd file when the MTD subsystem doe=
s
not support sysfs (the case for pre-2.6.30 kernels).

This patch also moves the 'mtd_dev_present()' function to a slightly more
logical position.

Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
---
 lib/libmtd.c        |   25 ++++++++++++-------------
 lib/libmtd_int.h    |    1 +
 lib/libmtd_legacy.c |   25 +++++++++++++++++++++++++
 3 files changed, 38 insertions(+), 13 deletions(-)

diff --git a/lib/libmtd.c b/lib/libmtd.c
index 888d118..ecf182f 100644
--- a/lib/libmtd.c
+++ b/lib/libmtd.c
@@ -641,6 +641,18 @@ void libmtd_close(libmtd_t desc)
 	free(lib);
 }
=20
+int mtd_dev_present(libmtd_t desc, int mtd_num) {
+	struct stat st;
+	struct libmtd *lib =3D (struct libmtd *)desc;
+	char file[strlen(lib->mtd) + 10];
+
+	if (!lib->sysfs_supported)
+		return legacy_dev_present(mtd_num);
+
+	sprintf(file, lib->mtd, mtd_num);
+	return !stat(file, &st);
+}
+
 int mtd_get_info(libmtd_t desc, struct mtd_info *info)
 {
 	DIR *sysfs_mtd;
@@ -713,19 +725,6 @@ out_close:
 	return -1;
 }
=20
-int mtd_dev_present(libmtd_t desc, int mtd_num) {
-	struct stat st;
-	struct libmtd *lib =3D (struct libmtd *)desc;
-	char file[strlen(lib->mtd) + 10];
-
-	if (!lib->sysfs_supported)
-		/* TODO: add legacy_dev_present() function */
-		return 1;
-
-	sprintf(file, lib->mtd, mtd_num);
-	return !stat(file, &st);
-}
-
 int mtd_get_dev_info1(libmtd_t desc, int mtd_num, struct mtd_dev_info *mtd=
)
 {
 	int ret;
diff --git a/lib/libmtd_int.h b/lib/libmtd_int.h
index bb48d35..7913e67 100644
--- a/lib/libmtd_int.h
+++ b/lib/libmtd_int.h
@@ -95,6 +95,7 @@ struct libmtd
 };
=20
 int legacy_libmtd_open(void);
+int legacy_dev_present(int mtd_num);
 int legacy_mtd_get_info(struct mtd_info *info);
 int legacy_get_dev_info(const char *node, struct mtd_dev_info *mtd);
 int legacy_get_dev_info1(int dev_num, struct mtd_dev_info *mtd);
diff --git a/lib/libmtd_legacy.c b/lib/libmtd_legacy.c
index d6c3938..d3f1672 100644
--- a/lib/libmtd_legacy.c
+++ b/lib/libmtd_legacy.c
@@ -170,6 +170,31 @@ int legacy_libmtd_open(void)
 }
=20
 /**
+ * legacy_dev_presentl - legacy version of 'mtd_dev_present()'.
+ * @info: the MTD device information is returned here
+ *
+ * When the kernel does not provide sysfs files for the MTD subsystem,
+ * fall-back to parsing the /proc/mtd file to determine whether an mtd dev=
ice
+ * number @mtd_num is present.
+ */
+int legacy_dev_present(int mtd_num)
+{
+	int ret;
+	struct proc_parse_info pi;
+
+	ret =3D proc_parse_start(&pi);
+	if (ret)
+		return -1;
+
+	while (proc_parse_next(&pi)) {
+		if (pi.mtd_num =3D=3D mtd_num)
+			return 1;
+	}
+
+	return 0;
+}
+
+/**
  * legacy_mtd_get_info - legacy version of 'mtd_get_info()'.
  * @info: the MTD device information is returned here
  *
--=20
1.7.9



--=20
Best Regards,
Artem Bityutskiy


--=-Pqo2XZ6T6czH/+Bdyfar
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAABAgAGBQJPK6YkAAoJECmIfjd9wqK0qNQQAKuByDhdbdFuoZ8EbR5Kbi8X
YpXI3r9e7vWL5zW7TyKygHOk/zoincMTVlgZzcotlYnJCDCWXYGf1Xv5h7E2VDTL
kv/jAQjJTO3uhcrDQAZnNM3XONbUYZfRoKpPOAKoq7Y7+hECdY59Y8YM6Y5MJBqH
oEvz0S0ujWKP9H+EzO2m4pbh+fxUx7Pn2Az1/8aWjZrJck7HHpT2iMpC+3P+1AFV
k2YTwDpbsF3NCumiooWqara9OoiYbvjRK+US4Oho9uafhTmQ9ss5ZVxY91VUjxlk
e4TVwuehKjYiv6YdQ1tL4sj9PhWoq/GpF4fVchW+WJmKeRVxiJw2TeUixeutd5X3
qXBE93Madr7NOAbOynTqs0M2tyIH1jCMn2cS/OU2fpyeybAZbMDyzf479Q3Rs79/
PHvs2A+zv0cF9zUXiamPlm+i2t3mgK7a5DLMlt8MFnBXdzXaEYQlVK5nqEk2DqSN
2WLD7v6rNdjlAhD9doyoSqHYrgc7lvKQPF5AjiVw7CViYQ8Ln7aLwWPfFLka2TA+
/PbzfS3Wf9Q3TJftRkDmo8braC35cKM/cY+hTDkp7D6eLpH7/SfDCj2WPm/UZ/XF
R2AKK+o9R7O+Y+WDSgUT6h5tkvcCDLnrMNzu2corzb05pk0CUSDwVn7yL/JckaTl
0WhHn63YX3F3V63/ZgGf
=L+NK
-----END PGP SIGNATURE-----

--=-Pqo2XZ6T6czH/+Bdyfar--
