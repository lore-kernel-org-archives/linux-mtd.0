Received: from mailout-de.gmx.net ([213.165.64.23] helo=mail.gmx.net)
	by canuck.infradead.org with smtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PALhd-0007XL-A6
	for linux-mtd@lists.infradead.org; Mon, 25 Oct 2010 11:59:02 +0000
Content-Type: text/plain; charset="utf-8"
Date: Mon, 25 Oct 2010 13:58:54 +0200
From: "Vivenzio Pagliari" <vivenzio.pagliari@gmx.de>
Message-ID: <20101025115854.226600@gmx.net>
MIME-Version: 1.0
Subject: [PATCH] mtd-utils: mkfs.ubifs: Fix typo in short options of mkfs.ubifs
To: linux-mtd@lists.infradead.org
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The short option for specifying the count of erase blocks for orphans '-p'
was not detected due to a typo.
    
Signed-off-by: Vivenzio Pagliari <vivenzio.pagliari@gmx.de>

diff --git a/mkfs.ubifs/mkfs.ubifs.c b/mkfs.ubifs/mkfs.ubifs.c
index d83f6bd..bc0817f 100644
--- a/mkfs.ubifs/mkfs.ubifs.c
+++ b/mkfs.ubifs/mkfs.ubifs.c
@@ -132,7 +132,7 @@ static struct inum_mapping **hash_table;
 /* Inode creation sequence number */
 static unsigned long long creat_sqnum;
 
-static const char *optstring = "d:r:m:o:D:h?vVe:c:g:f:P:k:x:X:j:R:l:j:UQq";
+static const char *optstring = "d:r:m:o:D:h?vVe:c:g:f:p:k:x:X:j:R:l:j:UQq";
 
 static const struct option longopts[] = {
        {"root",               1, NULL, 'r'},

-- 
Neu: GMX De-Mail - Einfach wie E-Mail, sicher wie ein Brief!  
Jetzt De-Mail-Adresse reservieren: http://portal.gmx.net/de/go/demail
