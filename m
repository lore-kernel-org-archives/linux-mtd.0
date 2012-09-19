Received: from mo6-p05-ob.rzone.de ([2a01:238:20a:202:5305::1])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TEFgF-0000zy-Jz
 for linux-mtd@lists.infradead.org; Wed, 19 Sep 2012 08:30:49 +0000
From: Stefan Roese <sr@denx.de>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] mtd: cmdlineparts.c: Codingstyle cleanup
Date: Wed, 19 Sep 2012 10:30:27 +0200
Message-Id: <1348043427-5165-1-git-send-email-sr@denx.de>
Cc: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The codingstyle of cmdlineparts.c was really ugly. I've run this
file through Lindent and made some manual tweaks.

Signed-off-by: Stefan Roese <sr@denx.de>
---
 drivers/mtd/cmdlinepart.c | 178 +++++++++++++++++++++-------------------------
 1 file changed, 81 insertions(+), 97 deletions(-)

diff --git a/drivers/mtd/cmdlinepart.c b/drivers/mtd/cmdlinepart.c
index 4558e0f..0239c18 100644
--- a/drivers/mtd/cmdlinepart.c
+++ b/drivers/mtd/cmdlinepart.c
@@ -55,7 +55,6 @@
 #define dbg(x)
 #endif
 
-
 /* special size referring to all the remaining space in a partition */
 #define SIZE_REMAINING UINT_MAX
 #define OFFSET_CONTINUOUS UINT_MAX
@@ -82,12 +81,12 @@ static int cmdline_parsed = 0;
  * is allocated upon the last definition being found. At that point the
  * syntax has been verified ok.
  */
-static struct mtd_partition * newpart(char *s,
-                                      char **retptr,
-                                      int *num_parts,
-                                      int this_part,
-                                      unsigned char **extra_mem_ptr,
-                                      int extra_mem_size)
+static struct mtd_partition *newpart(char *s,
+				     char **retptr,
+				     int *num_parts,
+				     int this_part,
+				     unsigned char **extra_mem_ptr,
+				     int extra_mem_size)
 {
 	struct mtd_partition *parts;
 	unsigned long size;
@@ -99,79 +98,70 @@ static struct mtd_partition * newpart(char *s,
 	unsigned int mask_flags;
 
 	/* fetch the partition size */
-	if (*s == '-')
-	{	/* assign all remaining space to this partition */
+	if (*s == '-') {	/* assign all remaining space to this partition */
 		size = SIZE_REMAINING;
 		s++;
-	}
-	else
-	{
+	} else {
 		size = memparse(s, &s);
-		if (size < PAGE_SIZE)
-		{
-			printk(KERN_ERR ERRP "partition size too small (%lx)\n", size);
+		if (size < PAGE_SIZE) {
+			printk(KERN_ERR ERRP "partition size too small (%lx)\n",
+			       size);
 			return NULL;
 		}
 	}
 
 	/* fetch partition name and flags */
-	mask_flags = 0; /* this is going to be a regular partition */
+	mask_flags = 0;		/* this is going to be a regular partition */
 	delim = 0;
-        /* check for offset */
-        if (*s == '@')
-	{
-                s++;
-                offset = memparse(s, &s);
-        }
-        /* now look for name */
+
+	/* check for offset */
+	if (*s == '@') {
+		s++;
+		offset = memparse(s, &s);
+	}
+
+	/* now look for name */
 	if (*s == '(')
-	{
 		delim = ')';
-	}
 
-	if (delim)
-	{
+	if (delim) {
 		char *p;
 
-	    	name = ++s;
+		name = ++s;
 		p = strchr(name, delim);
-		if (!p)
-		{
-			printk(KERN_ERR ERRP "no closing %c found in partition name\n", delim);
+		if (!p) {
+			printk(KERN_ERR ERRP
+			       "no closing %c found in partition name\n",
+			       delim);
 			return NULL;
 		}
 		name_len = p - name;
 		s = p + 1;
-	}
-	else
-	{
-	    	name = NULL;
-		name_len = 13; /* Partition_000 */
+	} else {
+		name = NULL;
+		name_len = 13;	/* Partition_000 */
 	}
 
 	/* record name length for memory allocation later */
 	extra_mem_size += name_len + 1;
 
-        /* test for options */
-        if (strncmp(s, "ro", 2) == 0)
-	{
+	/* test for options */
+	if (strncmp(s, "ro", 2) == 0) {
 		mask_flags |= MTD_WRITEABLE;
 		s += 2;
-        }
+	}
 
-        /* if lk is found do NOT unlock the MTD partition*/
-        if (strncmp(s, "lk", 2) == 0)
-	{
+	/* if lk is found do NOT unlock the MTD partition */
+	if (strncmp(s, "lk", 2) == 0) {
 		mask_flags |= MTD_POWERUP_LOCK;
 		s += 2;
-        }
+	}
 
 	/* test if more partitions are following */
-	if (*s == ',')
-	{
-		if (size == SIZE_REMAINING)
-		{
-			printk(KERN_ERR ERRP "no partitions allowed after a fill-up partition\n");
+	if (*s == ',') {
+		if (size == SIZE_REMAINING) {
+			printk(KERN_ERR ERRP
+			       "no partitions allowed after a fill-up partition\n");
 			return NULL;
 		}
 		/* more partitions follow, parse them */
@@ -179,14 +169,12 @@ static struct mtd_partition * newpart(char *s,
 				&extra_mem, extra_mem_size);
 		if (!parts)
 			return NULL;
-	}
-	else
-	{	/* this is the last partition: allocate space for all */
+	} else {		/* this is the last partition: allocate space for all */
 		int alloc_size;
 
 		*num_parts = this_part + 1;
 		alloc_size = *num_parts * sizeof(struct mtd_partition) +
-			     extra_mem_size;
+		    extra_mem_size;
 		parts = kzalloc(alloc_size, GFP_KERNEL);
 		if (!parts)
 			return NULL;
@@ -196,27 +184,22 @@ static struct mtd_partition * newpart(char *s,
 	parts[this_part].size = size;
 	parts[this_part].offset = offset;
 	parts[this_part].mask_flags = mask_flags;
+
 	if (name)
-	{
 		strlcpy(extra_mem, name, name_len + 1);
-	}
 	else
-	{
 		sprintf(extra_mem, "Partition_%03d", this_part);
-	}
+
 	parts[this_part].name = extra_mem;
 	extra_mem += name_len + 1;
 
 	dbg(("partition %d: name <%s>, offset %llx, size %llx, mask flags %x\n",
-	     this_part,
-	     parts[this_part].name,
-	     parts[this_part].offset,
-	     parts[this_part].size,
-	     parts[this_part].mask_flags));
+	     this_part, parts[this_part].name, parts[this_part].offset,
+	     parts[this_part].size, parts[this_part].mask_flags));
 
 	/* return (updated) pointer to extra_mem memory */
 	if (extra_mem_ptr)
-	  *extra_mem_ptr = extra_mem;
+		*extra_mem_ptr = extra_mem;
 
 	/* return (updated) pointer command line string */
 	*retptr = s;
@@ -232,24 +215,22 @@ static int mtdpart_setup_real(char *s)
 {
 	cmdline_parsed = 1;
 
-	for( ; s != NULL; )
-	{
+	for (; s != NULL;) {
 		struct cmdline_mtd_partition *this_mtd;
 		struct mtd_partition *parts;
-	    	int mtd_id_len;
+		int mtd_id_len;
 		int num_parts;
 		char *p, *mtd_id;
 
-	    	mtd_id = s;
+		mtd_id = s;
 		/* fetch <mtd-id> */
-		if (!(p = strchr(s, ':')))
-		{
+		if (!(p = strchr(s, ':'))) {
 			printk(KERN_ERR ERRP "no mtd-id\n");
 			return 0;
 		}
 		mtd_id_len = p - mtd_id;
 
-		dbg(("parsing <%s>\n", p+1));
+		dbg(("parsing <%s>\n", p + 1));
 
 		/*
 		 * parse one mtd. have it reserve memory for the
@@ -259,11 +240,10 @@ static int mtdpart_setup_real(char *s)
 				&s,		/* out: updated cmdline ptr */
 				&num_parts,	/* out: number of parts */
 				0,		/* first partition */
-				(unsigned char**)&this_mtd, /* out: extra mem */
+				(unsigned char **)&this_mtd,	/* out: extra mem */
 				mtd_id_len + 1 + sizeof(*this_mtd) +
-				sizeof(void*)-1 /*alignment*/);
-		if(!parts)
-		{
+				sizeof(void *) - 1 /*alignment */ );
+		if (!parts) {
 			/*
 			 * An error occurred. We're either:
 			 * a) out of memory, or
@@ -271,16 +251,17 @@ static int mtdpart_setup_real(char *s)
 			 * Either way, this mtd is hosed and we're
 			 * unlikely to succeed in parsing any more
 			 */
-			 return 0;
-		 }
+			return 0;
+		}
 
 		/* align this_mtd */
 		this_mtd = (struct cmdline_mtd_partition *)
-			ALIGN((unsigned long)this_mtd, sizeof(void*));
+			ALIGN((unsigned long)this_mtd, sizeof(void *));
+
 		/* enter results */
 		this_mtd->parts = parts;
 		this_mtd->num_parts = num_parts;
-		this_mtd->mtd_id = (char*)(this_mtd + 1);
+		this_mtd->mtd_id = (char *)(this_mtd + 1);
 		strlcpy(this_mtd->mtd_id, mtd_id, mtd_id_len + 1);
 
 		/* link into chain */
@@ -290,19 +271,19 @@ static int mtdpart_setup_real(char *s)
 		dbg(("mtdid=<%s> num_parts=<%d>\n",
 		     this_mtd->mtd_id, this_mtd->num_parts));
 
-
 		/* EOS - we're done */
 		if (*s == 0)
 			break;
 
 		/* does another spec follow? */
-		if (*s != ';')
-		{
-			printk(KERN_ERR ERRP "bad character after partition (%c)\n", *s);
+		if (*s != ';') {
+			printk(KERN_ERR ERRP
+			       "bad character after partition (%c)\n", *s);
 			return 0;
 		}
 		s++;
 	}
+
 	return 1;
 }
 
@@ -326,40 +307,42 @@ static int parse_cmdline_partitions(struct mtd_info *master,
 	if (!cmdline_parsed)
 		mtdpart_setup_real(cmdline);
 
-	for(part = partitions; part; part = part->next)
-	{
-		if ((!mtd_id) || (!strcmp(part->mtd_id, mtd_id)))
-		{
-			for(i = 0, offset = 0; i < part->num_parts; i++)
-			{
+	for (part = partitions; part; part = part->next) {
+		if ((!mtd_id) || (!strcmp(part->mtd_id, mtd_id))) {
+			for (i = 0, offset = 0; i < part->num_parts; i++) {
 				if (part->parts[i].offset == OFFSET_CONTINUOUS)
-				  part->parts[i].offset = offset;
+					part->parts[i].offset = offset;
 				else
-				  offset = part->parts[i].offset;
+					offset = part->parts[i].offset;
+
 				if (part->parts[i].size == SIZE_REMAINING)
-				  part->parts[i].size = master->size - offset;
-				if (offset + part->parts[i].size > master->size)
-				{
+					part->parts[i].size =
+						master->size - offset;
+
+				if (offset + part->parts[i].size > master->size) {
 					printk(KERN_WARNING ERRP
 					       "%s: partitioning exceeds flash size, truncating\n",
 					       part->mtd_id);
-					part->parts[i].size = master->size - offset;
+					part->parts[i].size =
+					    master->size - offset;
 					part->num_parts = i;
 				}
 				offset += part->parts[i].size;
 			}
+
 			*pparts = kmemdup(part->parts,
-					sizeof(*part->parts) * part->num_parts,
-					GFP_KERNEL);
+					  sizeof(*part->parts) *
+					  part->num_parts, GFP_KERNEL);
 			if (!*pparts)
 				return -ENOMEM;
+
 			return part->num_parts;
 		}
 	}
+
 	return 0;
 }
 
-
 /*
  * This is the handler for our kernel parameter, called from
  * main.c::checksetup(). Note that we can not yet kmalloc() anything,
@@ -370,6 +353,7 @@ static int parse_cmdline_partitions(struct mtd_info *master,
 static int mtdpart_setup(char *s)
 {
 	cmdline = s;
+
 	return 1;
 }
 
-- 
1.7.12.1
