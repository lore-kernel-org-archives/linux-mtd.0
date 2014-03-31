Received: from smtprelay02.ispgateway.de ([80.67.29.24])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WUiUI-0006GR-98
 for linux-mtd@lists.infradead.org; Mon, 31 Mar 2014 20:07:20 +0000
Received: from [78.43.41.9] (helo=abel)
 by smtprelay02.ispgateway.de with esmtpsa (SSLv3:AES128-SHA:128)
 (Exim 4.68) (envelope-from <daniel@vangerpen.de>) id 1WUiTu-000211-J1
 for linux-mtd@lists.infradead.org; Mon, 31 Mar 2014 22:06:54 +0200
Date: Mon, 31 Mar 2014 22:06:53 +0200
From: Daniel van Gerpen <daniel@vangerpen.de>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] Fix memory leaks found by clang's static analyzer
Message-ID: <20140331220653.5b26c11e@abel>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


Signed-off-by: Daniel van Gerpen <daniel@vangerpen.de>
---
 ftl_format.c          |  4 ++++
 lib/libmtd.c          |  1 +
 mkfs.ubifs/devtable.c | 12 ++++++++----
 3 files changed, 13 insertions(+), 4 deletions(-)

diff --git a/ftl_format.c b/ftl_format.c
index b58677f..80144d4 100644
--- a/ftl_format.c
+++ b/ftl_format.c
@@ -190,6 +190,7 @@ static int format_partition(int fd, int quiet, int interrogate,
 				fflush(stdout);
 			}
 			perror("block erase failed");
+			free(bam);
 			return -1;
 		}
 		erase.start += erase.length;
@@ -245,6 +246,9 @@ static int format_partition(int fd, int quiet, int interrogate,
 			break;
 		}
 	}
+
+	free(bam);
+
 	if (i < le16_to_cpu(hdr.NumEraseUnits))
 		return -1;
 	else
diff --git a/lib/libmtd.c b/lib/libmtd.c
index 2089373..6b83832 100644
--- a/lib/libmtd.c
+++ b/lib/libmtd.c
@@ -1113,6 +1113,7 @@ static int legacy_auto_oob_layout(const struct mtd_dev_info *mtd, int fd,
 		memcpy(oob + start, tmp_buf + start, len);
 	}
 
+	free(tmp_buf);
 	return 0;
 }
 
diff --git a/mkfs.ubifs/devtable.c b/mkfs.ubifs/devtable.c
index dee035d..1ab242e 100644
--- a/mkfs.ubifs/devtable.c
+++ b/mkfs.ubifs/devtable.c
@@ -213,8 +213,10 @@ static int interpret_table_entry(const char *line)
 		}
 	}
 
-	if (increment != 0 && count == 0)
-		return err_msg("count cannot be zero if increment is non-zero");
+	if (increment != 0 && count == 0) {
+		err_msg("count cannot be zero if increment is non-zero");
+		goto out_free;
+	}
 
 	/*
 	 * Add the file/directory/device node (last component of the path) to
@@ -239,8 +241,10 @@ static int interpret_table_entry(const char *line)
 		dbg_msg(3, "inserting '%s' into name hash table (major %d, minor %d)",
 			name, major(nh_elt->dev), minor(nh_elt->dev));
 
-		if (hashtable_search(ph_elt->name_htbl, name))
-			return err_msg("'%s' is referred twice", buf);
+		if (hashtable_search(ph_elt->name_htbl, name)) {
+			err_msg("'%s' is referred twice", buf);
+			goto out_free;
+		}
 
 		nh_elt->name = name;
 		if (!hashtable_insert(ph_elt->name_htbl, name, nh_elt)) {
-- 
1.8.3.2
