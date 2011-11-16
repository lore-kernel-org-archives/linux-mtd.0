Received: from mail-gx0-f177.google.com ([209.85.161.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RQliS-0005Dz-95
 for linux-mtd@lists.infradead.org; Wed, 16 Nov 2011 20:04:16 +0000
Received: by ggnb1 with SMTP id b1so116532ggn.36
 for <linux-mtd@lists.infradead.org>; Wed, 16 Nov 2011 12:04:15 -0800 (PST)
From: Brian Norris <computersforpeace@gmail.com>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: [PATCH 1/2] mtd-utils: add jffs2reader to .gitignore
Date: Wed, 16 Nov 2011 12:03:56 -0800
Message-Id: <1321473837-27891-2-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1321473837-27891-1-git-send-email-computersforpeace@gmail.com>
References: <1321473837-27891-1-git-send-email-computersforpeace@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org,
 Mike Frysinger <vapier.adi@gmail.com>, Kevin Cernekee <cernekee@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 .gitignore |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/.gitignore b/.gitignore
index 3a56d0d..d4771fb 100644
--- a/.gitignore
+++ b/.gitignore
@@ -30,6 +30,7 @@
 /ftl_check
 /ftl_format
 /jffs2dump
+/jffs2reader
 /mkfs.jffs2
 /mtd_debug
 /nanddump
-- 
1.7.5.4
