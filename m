Received: from www.tglx.de ([62.245.132.106])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1LCtRg-0003FO-Ka
	for linux-mtd@lists.infradead.org; Wed, 17 Dec 2008 10:16:00 +0000
Received: from www.tglx.de (www.tglx.de [127.0.0.1])
	by www.tglx.de (8.13.8/8.13.8/TGLX-2007100201) with ESMTP id
	mBHAFsdH005347
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-mtd@lists.infradead.org>; Wed, 17 Dec 2008 11:15:54 +0100
Received: (from bigeasy@localhost)
	by www.tglx.de (8.13.8/8.13.8/Submit) id mBHAFsfo005346
	for linux-mtd@lists.infradead.org; Wed, 17 Dec 2008 11:15:54 +0100
Date: Wed, 17 Dec 2008 11:15:54 +0100
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] ubiupdatevol: make the -t parameter work again
Message-ID: <20081217101554.GA4999@www.tglx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The execution of
|./ubiupdatevol /dev/ubi0 -t
will fail because 'argv[optind + 1]' is undefined and the later executed
'strcmp(args.img, "-")' will segfault.
So I can hack around and supply a dummy image or fix it that way.

Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---
 ubi-utils/new-utils/src/ubiupdatevol.c |   13 +++++++++----
 1 files changed, 9 insertions(+), 4 deletions(-)

diff --git a/ubi-utils/new-utils/src/ubiupdatevol.c b/ubi-utils/new-utils/src/ubiupdatevol.c
index 5eeaa3c..c83731c 100644
--- a/ubi-utils/new-utils/src/ubiupdatevol.c
+++ b/ubi-utils/new-utils/src/ubiupdatevol.c
@@ -157,10 +157,15 @@ static int parse_opt(int argc, char * const argv[])
 	args.node = argv[optind];
 	args.img  = argv[optind + 1];
 
-	if (strcmp(args.img, "-") == 0)
-		args.use_stdin = 1;
-	if (args.use_stdin && !args.size)
-		return errmsg("file size must be specified if input is stdin");
+	if (args.img && args.truncate)
+		return errmsg("You can't truncate and specify an image (use -h for help)");
+
+	if (args.img && !args.truncate) {
+		if (strcmp(args.img, "-") == 0)
+			args.use_stdin = 1;
+		if (args.use_stdin && !args.size)
+			return errmsg("file size must be specified if input is stdin");
+	}
 
 	return 0;
 }
-- 
1.5.6.5
