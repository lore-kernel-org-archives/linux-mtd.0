Received: from filtteri5.pp.htv.fi ([213.243.153.188])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NkHKj-0001gX-CU
	for linux-mtd@lists.infradead.org; Wed, 24 Feb 2010 13:31:25 +0000
Received: from localhost (localhost [127.0.0.1])
	by filtteri5.pp.htv.fi (Postfix) with ESMTP id 111BD5A60E7
	for <linux-mtd@lists.infradead.org>;
	Wed, 24 Feb 2010 15:31:20 +0200 (EET)
Received: from smtp4.welho.com ([213.243.153.38])
	by localhost (filtteri5.pp.htv.fi [213.243.153.188]) (amavisd-new,
	port 10024)
	with ESMTP id NFeiCo6QBpAv for <linux-mtd@lists.infradead.org>;
	Wed, 24 Feb 2010 15:31:19 +0200 (EET)
Received: from localhost.pp.htv.fi (cs181201061.pp.htv.fi [82.181.201.61])
	by smtp4.welho.com (Postfix) with ESMTP id 977C75BC005
	for <linux-mtd@lists.infradead.org>;
	Wed, 24 Feb 2010 15:31:19 +0200 (EET)
Date: Wed, 24 Feb 2010 15:32:29 +0200
From: Adrian Bunk <bunk@kernel.org>
To: linux-mtd@lists.infradead.org
Subject: [mtd-utils patch] mkfs.jffs2: fix --enable-compressor
Message-ID: <20100224133229.GA23442@localhost.pp.htv.fi>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The short option -X was working, but the documented long option
--enable-compressor was missing.

Signed-off-by: Adrian Bunk <bunk@kernel.org>

---
 mkfs.jffs2.c |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/mkfs.jffs2.c b/mkfs.jffs2.c
index 23a8cf8..64cafb6 100644
--- a/mkfs.jffs2.c
+++ b/mkfs.jffs2.c
@@ -1468,6 +1468,7 @@ static struct option long_options[] = {
 	{"devtable", 1, NULL, 'D'},
 	{"compression-mode", 1, NULL, 'm'},
 	{"disable-compressor", 1, NULL, 'x'},
+	{"enable-compressor", 1, NULL, 'X'},
 	{"test-compression", 0, NULL, 't'},
 	{"compressor-priority", 1, NULL, 'y'},
 	{"incremental", 1, NULL, 'i'},
-- 
1.7.0
