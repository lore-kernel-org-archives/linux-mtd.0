Received: from tac.ki.iif.hu ([2001:738:0:401:20c:6eff:fe71:b2db])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1NoNpl-0005KZ-5C
	for linux-mtd@lists.infradead.org; Sun, 07 Mar 2010 21:16:21 +0000
Received: from wferi by tac.ki.iif.hu with local (Exim 4.69)
	(envelope-from <wferi@tac.ki.iif.hu>) id 1NoNpO-0007Dl-4c
	for linux-mtd@lists.infradead.org; Sun, 07 Mar 2010 22:15:58 +0100
From: Ferenc Wagner <wferi@niif.hu>
To: linux-mtd@lists.infradead.org
Subject: [PATCH, mtd-utils] creat(2) expects a creation mode parameter,
	not an open flag
Date: Sun, 07 Mar 2010 22:15:58 +0100
Message-ID: <87sk8bzvch.fsf@tac.ki.iif.hu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Signed-off-by: Ferenc Wagner <wferi@niif.hu>
---
 mtd_debug.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/mtd_debug.c b/mtd_debug.c
index 85d48e9..49a4567 100644
--- a/mtd_debug.c
+++ b/mtd_debug.c
@@ -110,7 +110,7 @@ int flash_to_file (int fd,u_int32_t offset,size_t len,const char *filename)
 		perror ("lseek()");
 		goto err0;
 	}
-	outfd = creat (filename,O_WRONLY);
+	outfd = creat (filename,0666);
 	if (outfd < 0)
 	{
 		perror ("creat()");
-- 
1.5.6.5
