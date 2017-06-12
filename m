Received: from lizzard.sbs.de ([194.138.37.39])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dKMwY-0003K0-QV
 for linux-mtd@lists.infradead.org; Mon, 12 Jun 2017 10:51:40 +0000
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
 by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id v5CAp7v0019942
 (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <linux-mtd@lists.infradead.org>; Mon, 12 Jun 2017 12:51:07 +0200
From: Daniel Wagner <daniel.wagner@siemens.com>
To: linux-mtd@lists.infradead.org
Cc: Daniel Wagner <daniel.wagner@siemens.com>
Subject: [PATCH v0 02/20] jffs2dump: Use defines for exit code values
Date: Mon, 12 Jun 2017 12:50:43 +0200
Message-Id: <20170612105101.18223-3-daniel.wagner@siemens.com>
In-Reply-To: <20170612105101.18223-1-daniel.wagner@siemens.com>
References: <20170612105101.18223-1-daniel.wagner@siemens.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Make the usage of exit consist. That is use the pre defined exit
values.

Signed-off-by: Daniel Wagner <daniel.wagner@siemens.com>
---
 jffsX-utils/jffs2dump.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/jffsX-utils/jffs2dump.c b/jffsX-utils/jffs2dump.c
index df5b1e120b69..2200f06919a5 100644
--- a/jffsX-utils/jffs2dump.c
+++ b/jffsX-utils/jffs2dump.c
@@ -751,7 +751,7 @@ int main(int argc, char **argv)
 	/* Open the input file */
 	if ((fd = open(img, O_RDONLY)) == -1) {
 		perror("open input file");
-		exit(1);
+		exit(EXIT_FAILURE);
 	}
 
 	// get image length
@@ -762,7 +762,7 @@ int main(int argc, char **argv)
 	if (!data) {
 		perror("out of memory");
 		close (fd);
-		exit(1);
+		exit(EXIT_FAILURE);
 	}
 
 	if (datsize && oobsize) {
@@ -796,5 +796,5 @@ int main(int argc, char **argv)
 	free (data);
 
 	// Return happy
-	exit (0);
+	exit (EXIT_SUCCESS);
 }
-- 
2.9.4
