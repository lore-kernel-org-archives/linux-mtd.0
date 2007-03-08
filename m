Received: from smtp.nokia.com ([131.228.20.172] helo=mgw-ext13.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HPEHK-00087B-9Z
	for linux-mtd@lists.infradead.org; Thu, 08 Mar 2007 03:47:15 -0500
Subject: [PATCH] JFFS2: print a message when marking bad block
From: Artem Bityutskiy <dedekind@infradead.org>
To: David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset=UTF-8
Date: Thu, 08 Mar 2007 10:46:45 +0200
Message-Id: <1173343605.5493.3.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
Date: Thu, 8 Mar 2007 10:35:10 +0200
Subject: [PATCH] JFFS2: print a message when marking bad block

New bad eraseblock is an event which is important enough to be printed
about.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 fs/jffs2/wbuf.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/fs/jffs2/wbuf.c b/fs/jffs2/wbuf.c
index cc5fee4..6d53ada 100644
--- a/fs/jffs2/wbuf.c
+++ b/fs/jffs2/wbuf.c
@@ -1130,7 +1130,7 @@ int jffs2_write_nand_badblock(struct jffs2_sb_info *c=
, struct jffs2_eraseblock *
 	if (!c->mtd->block_markbad)
 		return 1; // What else can we do?
=20
-	D1(printk(KERN_WARNING "jffs2_write_nand_badblock(): Marking bad block at=
 %08x\n", bad_offset));
+	printk(KERN_WARNING "JFFS2: marking eraseblock at %08x\n as bad", bad_off=
set);
 	ret =3D c->mtd->block_markbad(c->mtd, bad_offset);
=20
 	if (ret) {
--=20
1.4.4.2


--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
