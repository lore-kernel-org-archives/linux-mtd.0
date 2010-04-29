Received: from mail-yw0-f190.google.com ([209.85.211.190])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1O7NO9-0007oD-LP
	for linux-mtd@lists.infradead.org; Thu, 29 Apr 2010 06:38:22 +0000
Received: by ywh28 with SMTP id 28so7570694ywh.28
	for <linux-mtd@lists.infradead.org>;
	Wed, 28 Apr 2010 23:38:20 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1272512811.2593.2.camel@localhost.localdomain>
References: <i2ncf7b913c1004152036t3b23af53h339b16092ecdd812@mail.gmail.com>
	<1272439453.7750.20.camel@localhost>
	<i2rcf7b913c1004281914kbe0c0c18xeee2e1bbcc375012@mail.gmail.com>
	<1272512811.2593.2.camel@localhost.localdomain>
Date: Thu, 29 Apr 2010 14:38:20 +0800
Message-ID: <j2ycf7b913c1004282338n64902b64g453442bdcb69d8f5@mail.gmail.com>
Subject: Re: [PATCH] ubifs: add update vfs super block infomation when remount
	to ro mode
From: Zhang JieJing <kzjeef@gmail.com>
To: dedekind1@gmail.com
Content-Type: text/plain; charset=ISO-8859-1
Cc: linux-fsdevel@vger.kernel.org, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

If some read/write error happens, ubifs make self a read only mode,
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
