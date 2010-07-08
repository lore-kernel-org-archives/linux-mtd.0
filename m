Received: from mms1.broadcom.com ([216.31.210.17])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OWy4Z-0001om-FT
	for linux-mtd@lists.infradead.org; Thu, 08 Jul 2010 20:51:56 +0000
From: "Brian Norris" <norris@broadcom.com>
To: "Artem Bityutskiy" <Artem.Bityutskiy@nokia.com>
Subject: [PATCH 4/6] mtd-utils/mkfs.jffs2: fixed warnings
Date: Thu, 8 Jul 2010 13:50:07 -0700
Message-ID: <1278622209-20149-5-git-send-email-norris@broadcom.com>
In-Reply-To: <1278622209-20149-1-git-send-email-norris@broadcom.com>
References: <1278622209-20149-1-git-send-email-norris@broadcom.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, Brian Norris <norris@broadcom.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Changed "char*" to "const char*" in certain function argument lists
to prevent compiler warnings for passing a hard-coded string.

Signed-off-by: Brian Norris <norris@broadcom.com>
---
 mkfs.jffs2.c |    7 ++++---
 1 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/mkfs.jffs2.c b/mkfs.jffs2.c
index 64cafb6..bfa1c6e 100644
--- a/mkfs.jffs2.c
+++ b/mkfs.jffs2.c
@@ -309,8 +309,8 @@ static struct filesystem_entry *find_filesystem_entry(
 	return (NULL);
 }
 
-static struct filesystem_entry *add_host_filesystem_entry(
-		char *name, char *path, unsigned long uid, unsigned long gid,
+static struct filesystem_entry *add_host_filesystem_entry(const char *name,
+		const char *path, unsigned long uid, unsigned long gid,
 		unsigned long mode, dev_t rdev, struct filesystem_entry *parent)
 {
 	int status;
@@ -401,7 +401,8 @@ static struct filesystem_entry *add_host_filesystem_entry(
 }
 
 static struct filesystem_entry *recursive_add_host_directory(
-		struct filesystem_entry *parent, char *targetpath, char *hostpath)
+		struct filesystem_entry *parent, const char *targetpath,
+		const char *hostpath)
 {
 	int i, n;
 	struct stat sb;
-- 
1.7.0.4
