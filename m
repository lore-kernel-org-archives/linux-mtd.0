Received: from mail.pripojeni.net ([178.22.112.14] helo=smtp.pripojeni.net)
 by bombadil.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SzWlw-0002Zz-Mb
 for linux-mtd@lists.infradead.org; Thu, 09 Aug 2012 17:43:50 +0000
From: Jiri Slaby <jslaby@suse.cz>
To: dedekind1@gmail.com
Subject: [PATCH] ubifs: remove __DATE__ and __TIME__
Date: Thu,  9 Aug 2012 19:43:14 +0200
Message-Id: <1344534194-16321-1-git-send-email-jslaby@suse.cz>
Cc: Michal Marek <mmarek@suse.cz>, jirislaby@gmail.com,
 linux-kernel@vger.kernel.org, Adrian Hunter <adrian.hunter@intel.com>,
 linux-mtd@lists.infradead.org, Alexander Viro <viro@zeniv.linux.org.uk>,
 linux-fsdevel@vger.kernel.org, Jiri Slaby <jslaby@suse.cz>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This tag is useless and it breaks automatic builds. It causes rebuilds
for packages that depend on kernel for no real reason.

Further, quoting Michal, who removed most of the users already:
The kernel already prints its build timestamp during boot, no need to
repeat it in random drivers and produce different object files each
time.

Signed-off-by: Jiri Slaby <jslaby@suse.cz>
Cc: Artem Bityutskiy <dedekind1@gmail.com>
Cc: Adrian Hunter <adrian.hunter@intel.com>
Cc: linux-mtd@lists.infradead.org
Cc: Michal Marek <mmarek@suse.cz>
---
 fs/ubifs/super.c |    1 -
 1 file changed, 1 deletion(-)

diff --git a/fs/ubifs/super.c b/fs/ubifs/super.c
index e354832..67af316 100644
--- a/fs/ubifs/super.c
+++ b/fs/ubifs/super.c
@@ -1431,7 +1431,6 @@ static int mount_ubifs(struct ubifs_info *c)
 	ubifs_msg("reserved for root:  %llu bytes (%llu KiB)",
 		c->report_rp_size, c->report_rp_size >> 10);
 
-	dbg_msg("compiled on:         " __DATE__ " at " __TIME__);
 	dbg_msg("min. I/O unit size:  %d bytes", c->min_io_size);
 	dbg_msg("max. write size:     %d bytes", c->max_write_size);
 	dbg_msg("LEB size:            %d bytes (%d KiB)",
-- 
1.7.10.4
