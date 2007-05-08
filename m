Received: from [67.18.166.194] (helo=warp.phpwebhosting.com)
	by canuck.infradead.org with smtp (Exim 4.63 #1 (Red Hat Linux))
	id 1HlPRk-0003QN-Sm
	for linux-mtd@lists.infradead.org; Tue, 08 May 2007 09:09:42 -0400
Message-ID: <4640768F.7060703@indefia.com>
Date: Tue, 08 May 2007 16:09:35 +0300
From: Semih Hazar <semih.hazar@indefia.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: [PATCH] mkfs.jffs2: Add support for entering the page size in KiB
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

mkfs.jffs2 doesn't understand page size when given in KiB. This patch 
fixes that so short forms are supported both in erase size and page size.

Signed-off-by: Semih Hazar <semih.hazar@indefia.com>
---
mkfs.jffs2.c |   56 +++++++++++++++++++++++++++++++++++---------------------
1 files changed, 35 insertions(+), 21 deletions(-)

diff --git a/mkfs.jffs2.c b/mkfs.jffs2.c
index bc9901e..0011817 100644
--- a/mkfs.jffs2.c
+++ b/mkfs.jffs2.c
@@ -168,6 +168,34 @@ static void perror_msg_and_die(const char *s, ...)
	exit(EXIT_FAILURE);
}

+int tobytes(const char* str)
+{
+	char *unit;
+	int mul;
+	int val = strtol(str, &unit, 0);
+
+	if (!val)
+		return val;
+
+	if (*unit) {
+		if (!strcmp(unit, "KiB")) {
+			mul = 1024;
+		} else if (!strcmp(unit, "MiB")) {
+			mul = 1024 * 1024;
+		} else {
+			return -1;
+		}
+	} else {
+		if (val < 0x1000) {
+			mul = 1024;
+		} else {
+			mul = 1;
+		}
+	}
+	
+	return val * mul;
+}
+
#ifndef DMALLOC
extern void *xmalloc(size_t size)
{
@@ -1641,7 +1669,10 @@ int main(int argc, char **argv)
				break;

			case 's':
-				page_size = strtol(optarg, NULL, 0);
+				page_size = tobytes(optarg);
+				if (page_size<0) {
+					error_msg_and_die("Unrecognisable page size\n");
+				}		  
				break;

			case 'o':
@@ -1684,28 +1715,11 @@ int main(int argc, char **argv)
						(int) strlen(revtext) - 13, revtext + 11);

			case 'e': {
-						  char *next;
-						  unsigned units = 0;
-						  erase_block_size = strtol(optarg, &next, 0);
-						  if (!erase_block_size)
+						  erase_block_size = tobytes(optarg);
+						  
+						  if (erase_block_size<0)
							  error_msg_and_die("Unrecognisable erase size\n");

-						  if (*next) {
-							  if (!strcmp(next, "KiB")) {
-								  units = 1024;
-							  } else if (!strcmp(next, "MiB")) {
-								  units = 1024 * 1024;
-							  } else {
-								  error_msg_and_die("Unknown units in erasesize\n");
-							  }
-						  } else {
-							  if (erase_block_size < 0x1000)
-								  units = 1024;
-							  else
-								  units = 1;
-						  }
-						  erase_block_size *= units;
-
						  /* If it's less than 8KiB, they're not allowed */
						  if (erase_block_size < 0x2000) {
							  fprintf(stderr, "Erase size 0x%x too small. Increasing to 8KiB minimum\n",
-- 
1.4.4.2
