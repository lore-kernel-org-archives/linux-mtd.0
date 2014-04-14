Received: from tritech.se ([46.59.120.190])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WZfMN-0002fX-FC
 for linux-mtd@lists.infradead.org; Mon, 14 Apr 2014 11:47:36 +0000
From: =?iso-8859-1?Q?Mats_K=E4rrman?= <Mats.Karrman@tritech.se>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, "Artem
 Bityutskiy" <dedekind1@gmail.com>
Subject: [PATCH 1/2] mtd-utils: integck: Use $(CC) and $(AR) instead of
 'gcc' and 'ar'  consistently
Date: Mon, 14 Apr 2014 11:47:01 +0000
Message-ID: <ED3E0BCACD909541BA94A34C4A164D4C5B3D11ED@post.tritech.se>
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

>From b7ca80dbccda63a1ecabc15912d9bb1b73d66318 Mon Sep 17 00:00:00 2001=0A=
From: =3D?UTF-8?q?Mats=3D20K=3DC3=3DA4rrman?=3D <mats.karrman@tritech.se>=
=0A=
Date: Fri, 11 Apr 2014 09:38:21 +0200=0A=
Subject: [PATCH 1/2] mtd-utils: integck: Use $(CC) and $(AR) instead of 'gc=
c' and 'ar'=0A=
 consistently=0A=
=0A=
Not using the macros may be a problem when cross-compiling.=0A=
=0A=
Signed-off-by: Mats Karrman <mats.karrman@tritech.se>=0A=
---=0A=
 tests/fs-tests/integrity/Makefile |    4 ++--=0A=
 1 file changed, 2 insertions(+), 2 deletions(-)=0A=
=0A=
diff --git a/tests/fs-tests/integrity/Makefile b/tests/fs-tests/integrity/M=
akefile=0A=
index 4d6fc7d..b64bad9 100644=0A=
--- a/tests/fs-tests/integrity/Makefile=0A=
+++ b/tests/fs-tests/integrity/Makefile=0A=
@@ -18,14 +18,14 @@ all: $(TARGETS)=0A=
 # Compile ubilib=0A=
 libubi.a:=0A=
 	$(CC) $(CFLAGS) -c $(LIBUBI_PATH)/libubi.c -o libubi.o=0A=
-	ar cr libubi.a libubi.o=0A=
+	$(AR) cr libubi.a libubi.o=0A=
 =0A=
 $(TARGETS): libubi.a=0A=
 =0A=
 # Disable optimizations to make it possible to use gdb comfortably=0A=
 # Use -rdynamic to have stack backtraces=0A=
 debug: libubi.a=0A=
-	gcc $(CFLAGS) -O0 -D INTEGCK_DEBUG -rdynamic integck.c libubi.a -o integc=
k=0A=
+	$(CC) $(CFLAGS) -O0 -D INTEGCK_DEBUG -rdynamic integck.c libubi.a -o inte=
gck=0A=
 =0A=
 clean:=0A=
 	rm -f *.o $(TARGETS) libubi.a=0A=
-- =0A=
1.7.10.4=0A=
