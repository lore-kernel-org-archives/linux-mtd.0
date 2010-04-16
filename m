Received: from qw-out-1920.google.com ([74.125.92.146])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1O2cMP-0004lK-IY
	for linux-mtd@lists.infradead.org; Fri, 16 Apr 2010 03:36:54 +0000
Received: by qw-out-1920.google.com with SMTP id 14so204541qwa.24
	for <linux-mtd@lists.infradead.org>;
	Thu, 15 Apr 2010 20:36:51 -0700 (PDT)
MIME-Version: 1.0
Date: Fri, 16 Apr 2010 11:36:50 +0800
Message-ID: <i2ncf7b913c1004152036t3b23af53h339b16092ecdd812@mail.gmail.com>
Subject: [PATCH] ubifs: add update vfs super block infomation when remount to
	ro mode
From: ZhangJieJing <kzjeef@gmail.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: linux-fsdevel@vger.kernel.org, Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

If some read/write error happens(eg.CRC error), ubifs make self a read
only mode,
but the vfs infomation still not update.
This patch add this also make /proc/mounts update.

Signed-off-by: Zhang Jiejing <kzjeef@gmail.com>
---
=A0fs/ubifs/io.c | =A0 =A01 +
=A01 files changed, 1 insertions(+), 0 deletions(-)
diff --git a/fs/ubifs/io.c b/fs/ubifs/io.c
index 0168271..d33c233 100644
--- a/fs/ubifs/io.c
+++ b/fs/ubifs/io.c
@@ -63,6 +63,7 @@ void ubifs_ro_mode(struct ubifs_info *c, int err)
=A0=A0 =A0 =A0 if (!c->ro_media) {
=A0=A0 =A0 =A0 =A0 =A0 =A0 =A0 c->ro_media =3D 1;
=A0=A0 =A0 =A0 =A0 =A0 =A0 =A0 c->no_chk_data_crc =3D 0;
+ =A0 =A0 =A0 =A0 =A0 =A0  c->vfs_sb->s_flags |=3D MS_RDONLY;
=A0=A0 =A0 =A0 =A0 =A0 =A0 =A0 ubifs_warn("switched to read-only mode, erro=
r %d", err);
=A0=A0 =A0 =A0 =A0 =A0 =A0 =A0 dbg_dump_stack();
=A0=A0 =A0 =A0 }
--
1.6.3.3
