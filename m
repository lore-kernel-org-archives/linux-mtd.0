Received: from mail-pz0-f182.google.com ([209.85.222.182])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1Nzlit-0002MD-Il
	for linux-mtd@lists.infradead.org; Thu, 08 Apr 2010 07:00:20 +0000
Received: by pzk12 with SMTP id 12so1680243pzk.28
	for <linux-mtd@lists.infradead.org>;
	Thu, 08 Apr 2010 00:00:17 -0700 (PDT)
MIME-Version: 1.0
Date: Thu, 8 Apr 2010 15:00:16 +0800
Message-ID: <r2icf7b913c1004080000t3f7c8c15yb6cea17f0d0496b1@mail.gmail.com>
Subject: [PATCH] [ubifs] add update vfs super block infomation when remount to
	ro mode.
From: ZhangJieJing <kzjeef@gmail.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
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

Signed-off-by: zhangjiejing <kzjeef@gmail.com>

Change-Id: I709ada21d1f6168d2e785eac389510e2b5edb2a4
---
=A0fs/ubifs/io.c |=A0=A0=A0 1 +
=A01 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/fs/ubifs/io.c b/fs/ubifs/io.c
index 0168271..d33c233 100644
--- a/fs/ubifs/io.c
+++ b/fs/ubifs/io.c
@@ -63,6 +63,7 @@ void ubifs_ro_mode(struct ubifs_info *c, int err)
=A0=A0=A0=A0=A0=A0=A0=A0if (!c->ro_media) {
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0c->ro_media =3D 1;
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0c->no_chk_data_crc =3D 0;
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 c->vfs_sb->s_flags |=3D MS_R=
DONLY;
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0ubifs_warn("switched to rea=
d-only mode, error %d", err);
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0dbg_dump_stack();
=A0=A0=A0=A0=A0=A0=A0=A0}
--
1.6.3.3
