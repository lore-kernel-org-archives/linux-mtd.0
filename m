Received: from smtp.nokia.com ([131.228.20.170] helo=mgw-ext11.nokia.com)
	by pentafluge.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HR63U-00031n-1j
	for linux-mtd@lists.infradead.org; Tue, 13 Mar 2007 12:24:42 +0000
Subject: [PATCH] JFFS2: fix deadlock on error path
From: Artem Bityutskiy <dedekind@infradead.org>
To: David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset=UTF-8
Date: Tue, 13 Mar 2007 14:19:25 +0200
Message-Id: <1173788365.5493.31.camel@sauron>
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
Subject: [PATCH] JFFS2: fix deadlock on error path

When the MTD driver returns write failure, the following deadlock
occures:

We are in __jffs2_flush_wbuf(), we hold &c->wbuf_sem. Write failure.
jffs2_wbuf_recover()->jffs2_reserve_space_gc()->jffs2_do_reserve_space()
->jffs2_erase_pending_blocks()->jffs2_flash_read()

and it tries to lock &c->wbuf_sem again. Deadlock.

Reported-by: Adrian Hunter <ext-adrian.hunter@nokia.com>
Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 fs/jffs2/erase.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/fs/jffs2/erase.c b/fs/jffs2/erase.c
index ad01210..6b1f7be 100644
--- a/fs/jffs2/erase.c
+++ b/fs/jffs2/erase.c
@@ -333,7 +333,7 @@ static int jffs2_block_check_erase(struct jffs2_sb_info=
 *c, struct jffs2_erasebl
=20
 		*bad_offset =3D ofs;
=20
-		ret =3D jffs2_flash_read(c, ofs, readlen, &retlen, ebuf);
+		ret =3D c->mtd->read(c->mtd, ofs, readlen, &retlen, ebuf);
 		if (ret) {
 			printk(KERN_WARNING "Read of newly-erased block at 0x%08x failed: %d. P=
utting on bad_list\n", ofs, ret);
 			goto fail;
--=20
1.4.4.2

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
