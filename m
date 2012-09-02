Received: from mail-wi0-f171.google.com ([209.85.212.171])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1T87pj-0001JA-0i
 for linux-mtd@lists.infradead.org; Sun, 02 Sep 2012 10:55:15 +0000
Received: by wibhq4 with SMTP id hq4so2224992wib.0
 for <linux-mtd@lists.infradead.org>; Sun, 02 Sep 2012 03:55:08 -0700 (PDT)
From: Artem Bityutskiy <dedekind1@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] mtd: cmdlinepart: revise error handling
Date: Sun,  2 Sep 2012 13:54:14 +0300
Message-Id: <1346583254-9190-1-git-send-email-dedekind1@gmail.com>
Cc: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>

This patch revises and fixes error handling in the command line mtd
partitions parser. Namely:
1. we ignored return code of 'mtdpart_setup_real()'.
2. instead of returning 0 for failure and 1 for success, teach
   'mtdpart_setup_real()' to return real error codes.

Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
---
 drivers/mtd/cmdlinepart.c | 31 +++++++++++++++++--------------
 1 file changed, 17 insertions(+), 14 deletions(-)

diff --git a/drivers/mtd/cmdlinepart.c b/drivers/mtd/cmdlinepart.c
index b4faca2..5bddecf 100644
--- a/drivers/mtd/cmdlinepart.c
+++ b/drivers/mtd/cmdlinepart.c
@@ -110,7 +110,7 @@ static struct mtd_partition * newpart(char *s,
 		if (size < PAGE_SIZE)
 		{
 			printk(KERN_ERR ERRP "partition size too small (%lx)\n", size);
-			return NULL;
+			return ERR_PTR(-EINVAL);
 		}
 	}
 
@@ -138,7 +138,7 @@ static struct mtd_partition * newpart(char *s,
 		if (!p)
 		{
 			printk(KERN_ERR ERRP "no closing %c found in partition name\n", delim);
-			return NULL;
+			return ERR_PTR(-EINVAL);
 		}
 		name_len = p - name;
 		s = p + 1;
@@ -172,13 +172,13 @@ static struct mtd_partition * newpart(char *s,
 		if (size == SIZE_REMAINING)
 		{
 			printk(KERN_ERR ERRP "no partitions allowed after a fill-up partition\n");
-			return NULL;
+			return ERR_PTR(-EINVAL);
 		}
 		/* more partitions follow, parse them */
 		parts = newpart(s + 1, &s, num_parts, this_part + 1,
 				&extra_mem, extra_mem_size);
-		if (!parts)
-			return NULL;
+		if (IS_ERR(parts))
+			return parts;
 	}
 	else
 	{	/* this is the last partition: allocate space for all */
@@ -189,7 +189,7 @@ static struct mtd_partition * newpart(char *s,
 			     extra_mem_size;
 		parts = kzalloc(alloc_size, GFP_KERNEL);
 		if (!parts)
-			return NULL;
+			return PTR_ERR(-ENOMEM);
 		extra_mem = (unsigned char *)(parts + *num_parts);
 	}
 	/* enter this partition (offset will be calculated later if it is zero at this point) */
@@ -245,7 +245,7 @@ static int mtdpart_setup_real(char *s)
 		if (!(p = strchr(s, ':')))
 		{
 			printk(KERN_ERR ERRP "no mtd-id\n");
-			return 0;
+			return -EINVAL;
 		}
 		mtd_id_len = p - mtd_id;
 
@@ -262,7 +262,7 @@ static int mtdpart_setup_real(char *s)
 				(unsigned char**)&this_mtd, /* out: extra mem */
 				mtd_id_len + 1 + sizeof(*this_mtd) +
 				sizeof(void*)-1 /*alignment*/);
-		if(!parts)
+		if(IS_ERR(parts))
 		{
 			/*
 			 * An error occurred. We're either:
@@ -271,7 +271,7 @@ static int mtdpart_setup_real(char *s)
 			 * Either way, this mtd is hosed and we're
 			 * unlikely to succeed in parsing any more
 			 */
-			 return 0;
+			 return ERR_PTR(parts);
 		 }
 
 		/* align this_mtd */
@@ -299,11 +299,11 @@ static int mtdpart_setup_real(char *s)
 		if (*s != ';')
 		{
 			printk(KERN_ERR ERRP "bad character after partition (%c)\n", *s);
-			return 0;
+			return -EINVAL;
 		}
 		s++;
 	}
-	return 1;
+	return 0;
 }
 
 /*
@@ -318,13 +318,16 @@ static int parse_cmdline_partitions(struct mtd_info *master,
 				    struct mtd_part_parser_data *data)
 {
 	unsigned long offset;
-	int i;
+	int i, err;
 	struct cmdline_mtd_partition *part;
 	const char *mtd_id = master->name;
 
 	/* parse command line */
-	if (!cmdline_parsed)
-		mtdpart_setup_real(cmdline);
+	if (!cmdline_parsed) {
+		err = mtdpart_setup_real(cmdline);
+		if (err)
+			return err;
+	}
 
 	for(part = partitions; part; part = part->next)
 	{
-- 
1.7.11.4
