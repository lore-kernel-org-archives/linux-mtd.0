Received: from relay00.pair.com ([209.68.5.9])
	by bombadil.infradead.org with smtp (Exim 4.68 #1 (Red Hat Linux))
	id 1K7BU6-0005nH-TZ
	for linux-mtd@lists.infradead.org; Fri, 13 Jun 2008 15:46:39 +0000
From: Grant Erickson <gerickson@nuovations.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] [MTD-UTILS] mkfs.jffs2: Add Support for Symlinks to Device
	Table
Date: Fri, 13 Jun 2008 08:46:37 -0700
Message-Id: <1213371997-23465-1-git-send-email-gerickson@nuovations.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Added support for symbolic links to the grammar of the device table file 
such that links that already exist in the root working directory may 
have their permissions and ownership changed. Creating symbolic links 
anew is still unsupported.

Added a note to this effect in the manual reference page.

Print out the type character when encountering an unsupported file type 
(e.g. symbolic links when created anew).

Signed-off-by: Grant Erickson <gerickson@nuovations.com>
---
 mkfs.jffs2.1 |    8 ++++++++
 mkfs.jffs2.c |    7 +++++--
 2 files changed, 13 insertions(+), 2 deletions(-)

diff --git a/mkfs.jffs2.1 b/mkfs.jffs2.1
index 4080032..1eefeda 100644
--- a/mkfs.jffs2.1
+++ b/mkfs.jffs2.1
@@ -241,6 +241,14 @@ Display version information.
 Generate an appendage image for FILE. If FILE is written to flash and flash
 is appended with the output, then it seems as if it was one thing.
 
+.SH LIMITATIONS
+The format and grammar of the device table file does not allow it to
+create symbolic links when the symbolic links are not already present
+in the root working directory.
+
+However, symbolic links may be specified in the device table file
+using the \fIl\fR type for the purposes of setting their permissions
+and ownership.
 .SH BUGS
 JFFS2 limits device major and minor numbers to 8 bits each.  Some
 consider this a bug.
diff --git a/mkfs.jffs2.c b/mkfs.jffs2.c
index f042ae7..7255536 100644
--- a/mkfs.jffs2.c
+++ b/mkfs.jffs2.c
@@ -544,8 +544,11 @@ static int interpret_table_entry(struct filesystem_entry *root, char *line)
 		case 'b':
 			mode |= S_IFBLK;
 			break;
+		case 'l':
+			mode |= S_IFLNK;
+			break;
 		default:
-			error_msg_and_die("Unsupported file type");
+			error_msg_and_die("Unsupported file type '%c'", type);
 	}
 	entry = find_filesystem_entry(root, name, mode);
 	if (entry) {
@@ -604,7 +607,7 @@ static int interpret_table_entry(struct filesystem_entry *root, char *line)
 				}
 				break;
 			default:
-				error_msg_and_die("Unsupported file type");
+				error_msg_and_die("Unsupported file type '%c'", type);
 		}
 	}
 	free(name);
-- 
1.5.4.3
