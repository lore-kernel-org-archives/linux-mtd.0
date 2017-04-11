Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cxsSQ-0006Vj-QT
 for linux-mtd@lists.infradead.org; Tue, 11 Apr 2017 09:51:33 +0000
From: Oleksij Rempel <o.rempel@pengutronix.de>
To: richard@nod.at, dedekind1@gmail.com, adrian.hunter@intel.com,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-fsdevel@vger.kernel.org
Cc: Steffen Trumtrar <s.trumtrar@pengutronix.de>,
 Oleksij Rempel <o.rempel@pengutronix.de>
Subject: [PATCH v2 3/3] fs: ubifs: set s_uuid in super block
Date: Tue, 11 Apr 2017 11:50:55 +0200
Message-Id: <20170411095055.26328-4-o.rempel@pengutronix.de>
In-Reply-To: <20170411095055.26328-1-o.rempel@pengutronix.de>
References: <20170411095055.26328-1-o.rempel@pengutronix.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Steffen Trumtrar <s.trumtrar@pengutronix.de>

This is need to provide uuid based integrity functionlity for:
imy_policy (fsuuid option) and  evmctl (--uuid option).

Signed-off-by: Steffen Trumtrar <s.trumtrar@pengutronix.de>
Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
---
 fs/ubifs/super.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/fs/ubifs/super.c b/fs/ubifs/super.c
index bff1e8d6f7bd..a584b2f2b11d 100644
--- a/fs/ubifs/super.c
+++ b/fs/ubifs/super.c
@@ -2077,6 +2077,7 @@ static int ubifs_fill_super(struct super_block *sb, void *data, int silent)
 		err = -ENOMEM;
 		goto out_umount;
 	}
+	memcpy(&sb->s_uuid, &c->uuid, sizeof(c->uuid));
 
 	mutex_unlock(&c->umount_mutex);
 	return 0;
-- 
2.11.0
