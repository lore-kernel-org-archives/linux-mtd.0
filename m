Received: from vw-hfger.navico.com ([81.89.228.210])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1Q9STX-00040x-7S
	for linux-mtd@lists.infradead.org; Tue, 12 Apr 2011 01:33:04 +0000
Message-ID: <70F6AAAFDC054F41B9994A9BCD3DF64E1284E165@exch01-aklnz.MARINE.NET.INT>
Date: Tue, 12 Apr 2011 13:32:50 +1200
From: "Reuben Dowle" <Reuben.Dowle@navico.com>
Subject: Oops when calling fsync on read-only file-system
To: <linux-mtd@lists.infradead.org>
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On my system, calling the fsync system call on any file in a UBI file-sys=
tem that is mounted read-only leads to a kernel oops. Our system is runni=
ng a customise version of 2.6.31, but as far as I can see (without testin=
g which is not possible due to extensive vendor customisation of .31 kern=
el version), the current git branch also contains this bug.

I have created a patch against 2.6.31 that fixes the problem in my system=
=2E Perhaps someone could test on latest kernel version.

Signed-off-by: Reuben Dowle <reuben.dowle at navico.com>
---
--- linux-2.6.31.orig/fs/ubifs/io.c	2009-09-10 10:13:59.000000000 +1200
+++ linux-2.6.31/fs/ubifs/io.c	2011-04-11 15:43:50.026527002 +1200
@@ -916,6 +916,14 @@
 {
 	int i, err =3D 0;
=20
+	/* If this is a read-only mount, write buffers will be null
+	 * Skip the sync, returning success (even though this is an invalid ope=
ration
+	 * on a read-only file-system, return success because all data on flash
+	 * is up to date)
+	 */
+	if(!c->jheads)
+		return 0;
+
 	for (i =3D 0; i < c->jhead_cnt; i++) {
 		struct ubifs_wbuf *wbuf =3D &c->jheads[i].wbuf;
=20
---
