Received: from tritech.se ([46.59.120.190])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V9bj1-00025o-I9
 for linux-mtd@lists.infradead.org; Wed, 14 Aug 2013 14:07:00 +0000
From: =?iso-8859-1?Q?Mats_K=E4rrman?= <Mats.Karrman@tritech.se>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: [PATCH] ubifs: remove invalid warn msg with tst_recovery enabled
Date: Wed, 14 Aug 2013 14:06:24 +0000
Message-ID: <ED3E0BCACD909541BA94A34C4A164D4C4FCDB069@post.tritech.se>
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

Signed-off-by: Mats Karrman <mats.karrman@tritech.se>=0A=
=0A=
diff --git a/fs/ubifs/debug.c b/fs/ubifs/debug.c=0A=
index 7f60e90..6e025e0 100644=0A=
--- a/fs/ubifs/debug.c=0A=
+++ b/fs/ubifs/debug.c=0A=
@@ -2587,10 +2587,11 @@ int dbg_leb_write(struct ubifs_info *c, int lnum, c=
onst void *buf,=0A=
 		return -EROFS;=0A=
 =0A=
 	failing =3D power_cut_emulated(c, lnum, 1);=0A=
-	if (failing)=0A=
+	if (failing) {=0A=
 		len =3D corrupt_data(c, buf, len);=0A=
-	ubifs_warn("actually write %d bytes to LEB %d:%d (the buffer was corrupte=
d)",=0A=
-		   len, lnum, offs);=0A=
+		ubifs_warn("actually write %d bytes to LEB %d:%d (the buffer was corrupt=
ed)",=0A=
+			   len, lnum, offs);=0A=
+	}=0A=
 	err =3D ubi_leb_write(c->ubi, lnum, buf, offs, len);=0A=
 	if (err)=0A=
 		return err;=
