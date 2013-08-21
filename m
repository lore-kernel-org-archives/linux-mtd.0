Received: from tritech.se ([46.59.120.190])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VC8PW-0002T5-T0
 for linux-mtd@lists.infradead.org; Wed, 21 Aug 2013 13:25:23 +0000
From: =?iso-8859-1?Q?Mats_K=E4rrman?= <Mats.Karrman@tritech.se>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: [PATCH] ubifs: Correct data corruption range
Date: Wed, 21 Aug 2013 13:24:49 +0000
Message-ID: <ED3E0BCACD909541BA94A34C4A164D4C4FCDE5DF@post.tritech.se>
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

With power-cut emulation, it is possible that sometimes no data at all is=
=0A=
corrupted and that confusing messages are printed due to errors in the=0A=
computation of data corruption range.=0A=
=0A=
[1] The start of the range should be [0..len-1], not [0..len].=0A=
[2] The end of the range should always be at least 1 greater than the start=
.=0A=
=0A=
Signed-off-by: Mats Karrman <mats.karrman@tritech.se>=0A=
=0A=
diff --git a/fs/ubifs/debug.c b/fs/ubifs/debug.c=0A=
index 6e025e0..cc1febd 100644=0A=
--- a/fs/ubifs/debug.c=0A=
+++ b/fs/ubifs/debug.c=0A=
@@ -2563,9 +2563,9 @@ static int corrupt_data(const struct ubifs_info *c, c=
onst void *buf,=0A=
 	unsigned int from, to, ffs =3D chance(1, 2);=0A=
 	unsigned char *p =3D (void *)buf;=0A=
 =0A=
-	from =3D prandom_u32() % (len + 1);=0A=
-	/* Corruption may only span one max. write unit */=0A=
-	to =3D min(len, ALIGN(from, c->max_write_size));=0A=
+	from =3D prandom_u32() % len;=0A=
+	/* Corruption span max to end of write unit */=0A=
+	to =3D min(len, ALIGN(from + 1, c->max_write_size));=0A=
 =0A=
 	ubifs_warn("filled bytes %u-%u with %s", from, to - 1,=0A=
 		   ffs ? "0xFFs" : "random data");=
