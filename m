Received: from mail-pv0-f177.google.com ([74.125.83.177])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1Nzm2l-0004uS-W3
	for linux-mtd@lists.infradead.org; Thu, 08 Apr 2010 07:20:52 +0000
Received: by pvc30 with SMTP id 30so886324pvc.36
	for <linux-mtd@lists.infradead.org>;
	Thu, 08 Apr 2010 00:20:50 -0700 (PDT)
MIME-Version: 1.0
Date: Thu, 8 Apr 2010 15:20:50 +0800
Message-ID: <j2hcf7b913c1004080020j3161fc72ya4af9f4be666b2e9@mail.gmail.com>
Subject: [ubifs] add update vfs super block infomation when remount to ro
	mode.
From: ZhangJieJing <kzjeef@gmail.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1
Cc: linux-fsdevel@vger.kernel.org, dedekind1@gmail.com
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
 fs/ubifs/io.c |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/fs/ubifs/io.c b/fs/ubifs/io.c
index 0168271..d33c233 100644
--- a/fs/ubifs/io.c
+++ b/fs/ubifs/io.c
@@ -63,6 +63,7 @@ void ubifs_ro_mode(struct ubifs_info *c, int err)
        if (!c->ro_media) {
                c->ro_media = 1;
                c->no_chk_data_crc = 0;
+                c->vfs_sb->s_flags |= MS_RDONLY;
                ubifs_warn("switched to read-only mode, error %d", err);
                dbg_dump_stack();
        }
--
1.6.3.3
---
Best regards,
Zhang Jiejing
