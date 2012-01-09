Received: from mail-vw0-f49.google.com ([209.85.212.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RkHxv-0001Dk-6b
 for linux-mtd@lists.infradead.org; Mon, 09 Jan 2012 16:20:59 +0000
Received: by vbbfs19 with SMTP id fs19so3708105vbb.36
 for <linux-mtd@lists.infradead.org>; Mon, 09 Jan 2012 08:20:53 -0800 (PST)
MIME-Version: 1.0
Date: Mon, 9 Jan 2012 16:20:53 +0000
Message-ID: <CAGaKrsmCb6jHZ+oYjQiV8kU63-DQMpzwTG4pR-Jf_aTE1K2=NQ@mail.gmail.com>
Subject: [PATCH] libmtd: Variable name same as function name causing compile
 to fail (Android)
From: Thomas Cannon <mail@thomascannon.net>
To: Thomas Cannon <mail@thomascannon.net>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

When compiling mtd-utils against Android's bionic libc using the
supplied cross compiler environment it errors:

lib/libmtd.c: In function 'dev_node2num':
lib/libmtd.c:444: error: called object 'major' is not a function
lib/libmtd.c:445: error: called object 'minor' is not a function
lib/libmtd.c: In function 'mtd_probe_node':
lib/libmtd.c:1384: error: called object 'major' is not a function
lib/libmtd.c:1385: error: called object 'minor' is not a function

This patch updates the variable names for "major" and "minor" in two
places. It then compiles cleanly.

Tested against mtd-utils 1.4.9
Applied with=A0patch -p1 -i libmtd.patch

Signed-off-by: Thomas Cannon <mail at thomascannon.net>
Cc: linux-mtd at lists.infradead.org
---

diff -crB a/lib/libmtd.c b/lib/libmtd.c
*** a/lib/libmtd.c	2012-01-09 14:38:56.000000000 +0000
--- b/lib/libmtd.c	2012-01-09 20:57:34.363506783 +0000
***************
*** 429,435 ****
  static int dev_node2num(struct libmtd *lib, const char *node, int *mtd_nu=
m)
  {
  	struct stat st;
! 	int i, major, minor;
  	struct mtd_info info;

  	if (stat(node, &st))
--- 429,435 ----
  static int dev_node2num(struct libmtd *lib, const char *node, int *mtd_nu=
m)
  {
  	struct stat st;
! 	int i, majorx, minorx;
  	struct mtd_info info;

  	if (stat(node, &st))
***************
*** 441,448 ****
  		return -1;
  	}

! 	major =3D major(st.st_rdev);
! 	minor =3D minor(st.st_rdev);

  	if (mtd_get_info((libmtd_t *)lib, &info))
  		return -1;
--- 441,448 ----
  		return -1;
  	}

! 	majorx =3D major(st.st_rdev);
! 	minorx =3D minor(st.st_rdev);

  	if (mtd_get_info((libmtd_t *)lib, &info))
  		return -1;
***************
*** 459,465 ****
  			return -1;
  		}

! 		if (major1 =3D=3D major && minor1 =3D=3D minor) {
  			errno =3D 0;
  			*mtd_num =3D i;
  			return 0;
--- 459,465 ----
  			return -1;
  		}

! 		if (major1 =3D=3D majorx && minor1 =3D=3D minorx) {
  			errno =3D 0;
  			*mtd_num =3D i;
  			return 0;
***************
*** 1369,1375 ****
  {
  	struct stat st;
  	struct mtd_info info;
! 	int i, major, minor;
  	struct libmtd *lib =3D (struct libmtd *)desc;

  	if (stat(node, &st))
--- 1369,1375 ----
  {
  	struct stat st;
  	struct mtd_info info;
! 	int i, majorx, minorx;
  	struct libmtd *lib =3D (struct libmtd *)desc;

  	if (stat(node, &st))
***************
*** 1381,1388 ****
  		return -1;
  	}

! 	major =3D major(st.st_rdev);
! 	minor =3D minor(st.st_rdev);

  	if (mtd_get_info((libmtd_t *)lib, &info))
  		return -1;
--- 1381,1388 ----
  		return -1;
  	}

! 	majorx =3D major(st.st_rdev);
! 	minorx =3D minor(st.st_rdev);

  	if (mtd_get_info((libmtd_t *)lib, &info))
  		return -1;
***************
*** 1402,1408 ****
  			return -1;
  		}

! 		if (major1 =3D=3D major && minor1 =3D=3D minor)
  			return 1;
  	}

--- 1402,1408 ----
  			return -1;
  		}

! 		if (major1 =3D=3D majorx && minor1 =3D=3D minorx)
  			return 1;
  	}
