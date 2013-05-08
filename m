Received: from woodpecker.gentoo.org ([2001:470:ea4a:1:214:c2ff:fe64:b2d3]
 helo=smtp.gentoo.org)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UaDNM-00042d-8m
 for linux-mtd@lists.infradead.org; Wed, 08 May 2013 23:02:20 +0000
Received: from localhost.localdomain (localhost [127.0.0.1])
 by smtp.gentoo.org (Postfix) with ESMTP id 1CFC433BDD3
 for <linux-mtd@lists.infradead.org>; Wed,  8 May 2013 23:01:55 +0000 (UTC)
From: Mike Frysinger <vapier@gentoo.org>
To: linux-mtd@lists.infradead.org
Subject: [PATCH [mtd-utils]] use xstrdup in a few more places
Date: Wed,  8 May 2013 19:01:55 -0400
Message-Id: <1368054115-32172-1-git-send-email-vapier@gentoo.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

These call sites either assume there is no failure (they deref the
pointer right away), or the exit themselves.  Use xstrdup() instead.

Signed-off-by: Mike Frysinger <vapier@gentoo.org>
---
 jffs2reader.c           | 2 +-
 mkfs.jffs2.c            | 2 +-
 mkfs.ubifs/mkfs.ubifs.c | 4 ++--
 nanddump.c              | 5 +----
 4 files changed, 5 insertions(+), 8 deletions(-)

diff --git a/jffs2reader.c b/jffs2reader.c
index 5231ff0..a62da9a 100644
--- a/jffs2reader.c
+++ b/jffs2reader.c
@@ -694,7 +694,7 @@ struct jffs2_raw_dirent *resolvepath0(char *o, size_t size, uint32_t ino,
 		return NULL;
 	}
 
-	pp = path = strdup(p);
+	pp = path = xstrdup(p);
 
 	if (*path == '/') {
 		path++;
diff --git a/mkfs.jffs2.c b/mkfs.jffs2.c
index c1b0f0d..f09c0b2 100644
--- a/mkfs.jffs2.c
+++ b/mkfs.jffs2.c
@@ -469,7 +469,7 @@ static int interpret_table_entry(struct filesystem_entry *root, char *line)
 	} else {
 		/* If parent is NULL (happens with device table entries),
 		 * try and find our parent now) */
-		tmp = strdup(name);
+		tmp = xstrdup(name);
 		dir = dirname(tmp);
 		parent = find_filesystem_entry(root, dir, S_IFDIR);
 		free(tmp);
diff --git a/mkfs.ubifs/mkfs.ubifs.c b/mkfs.ubifs/mkfs.ubifs.c
index 427e37d..f9977bc 100644
--- a/mkfs.ubifs/mkfs.ubifs.c
+++ b/mkfs.ubifs/mkfs.ubifs.c
@@ -534,7 +534,7 @@ static int get_options(int argc, char**argv)
 				return err_msg("bad maximum LEB count");
 			break;
 		case 'o':
-			output = strdup(optarg);
+			output = xstrdup(optarg);
 			break;
 		case 'D':
 			tbl_file = optarg;
@@ -627,7 +627,7 @@ static int get_options(int argc, char**argv)
 	}
 
 	if (optind != argc && !output)
-		output = strdup(argv[optind]);
+		output = xstrdup(argv[optind]);
 
 	if (!output)
 		return err_msg("not output device or file specified");
diff --git a/nanddump.c b/nanddump.c
index 85ccd5d..4b3e14d 100644
--- a/nanddump.c
+++ b/nanddump.c
@@ -159,10 +159,7 @@ static void process_options(int argc, char * const argv[])
 				start_addr = simple_strtoll(optarg, &error);
 				break;
 			case 'f':
-				if (!(dumpfile = strdup(optarg))) {
-					perror("stddup");
-					exit(EXIT_FAILURE);
-				}
+				dumpfile = xstrdup(optarg);
 				break;
 			case 'l':
 				length = simple_strtoll(optarg, &error);
-- 
1.8.2.1
