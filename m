Received: from mail-pz0-f184.google.com ([209.85.222.184])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MjCnT-0007Ld-Gi
	for linux-mtd@lists.infradead.org; Thu, 03 Sep 2009 13:56:24 +0000
Received: by pzk14 with SMTP id 14so736330pzk.3
	for <linux-mtd@lists.infradead.org>;
	Thu, 03 Sep 2009 06:56:17 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1251796036.3514.29.camel@localhost>
References: <58484c0e0908290317m62485b2bu6ca69db7de8111a5@mail.gmail.com>
	<1251796036.3514.29.camel@localhost>
Date: Thu, 3 Sep 2009 22:56:17 +0900
Message-ID: <58484c0e0909030656u7e59d35fs73c043fd772e5725@mail.gmail.com>
Subject: Re: [PATCH] inappropriate pending block in foldchain
From: Mohanlal Jangir <mohanlaljangir@gmail.com>
To: dedekind1@gmail.com
Content-Type: text/plain; charset=ISO-8859-1
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> Hint: we use "git format-patch" to create patches.
>

I hope, my struggle with git has yielded something acceptable :)

>From 736fe41b3a8f42f72f793f6a18fcfa420abc6b7b Mon Sep 17 00:00:00 2001
From: Mohan Lal Jangir <mohanlaljangir@gmail.com>
Date: Thu, 3 Sep 2009 22:38:53 +0900
Subject: [PATCH] inappropriate pending block in foldchain


Signed-off-by: Mohan Lal Jangir <mohanlaljangir@gmail.com>
---
 drivers/mtd/inftlcore.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)
 mode change 100644 => 100755 drivers/mtd/inftlcore.c

diff --git a/drivers/mtd/inftlcore.c b/drivers/mtd/inftlcore.c
old mode 100644
new mode 100755
index d8cf29c..8aca552
--- a/drivers/mtd/inftlcore.c
+++ b/drivers/mtd/inftlcore.c
@@ -550,7 +550,7 @@ hitused:
 			 * waiting to be picked up. We're going to have to fold
 			 * a chain to make room.
 			 */
-			thisEUN = INFTL_makefreeblock(inftl, BLOCK_NIL);
+			thisEUN = INFTL_makefreeblock(inftl, block);

 			/*
 			 * Hopefully we free something, lets try again.
-- 
1.6.1.2
