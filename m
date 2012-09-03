Received: from mga11.intel.com ([192.55.52.93])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1T8RB5-0005MO-7l
 for linux-mtd@lists.infradead.org; Mon, 03 Sep 2012 07:34:36 +0000
From: Artem Bityutskiy <dedekind1@gmail.com>
To: MTD Maling List <linux-mtd@lists.infradead.org>
Subject: [PATCH 2/2] mtd: cmdlinepart: minor cleanups
Date: Mon,  3 Sep 2012 10:34:52 +0300
Message-Id: <1346657692-21754-2-git-send-email-dedekind1@gmail.com>
In-Reply-To: <1346657692-21754-1-git-send-email-dedekind1@gmail.com>
References: <1346657692-21754-1-git-send-email-dedekind1@gmail.com>
Cc: Huang Shijie <shijie8@gmail.com>,
 Shmulik Ladkani <shmulik.ladkani@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>

Clean-up the driver a bit to make it easier to read and amend the coding style.
Mostly these are changes like:

if (a)
{
}

=>

if (a) {
}

Some extra blank lines were added.
Indentation was changed to use tabs instead of spaces.

Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
---
 drivers/mtd/cmdlinepart.c |  137 +++++++++++++++++++--------------------------
 1 file changed, 59 insertions(+), 78 deletions(-)

diff --git a/drivers/mtd/cmdlinepart.c b/drivers/mtd/cmdlinepart.c
index 58dd0d0..17b0bd4 100644
--- a/drivers/mtd/cmdlinepart.c
+++ b/drivers/mtd/cmdlinepart.c
@@ -82,15 +82,14 @@ static int cmdline_parsed;
  * syntax has been verified ok.
  */
 static struct mtd_partition * newpart(char *s,
-                                      char **retptr,
-                                      int *num_parts,
-                                      int this_part,
-                                      unsigned char **extra_mem_ptr,
-                                      int extra_mem_size)
+				      char **retptr,
+				      int *num_parts,
+				      int this_part,
+				      unsigned char **extra_mem_ptr,
+				      int extra_mem_size)
 {
 	struct mtd_partition *parts;
-	unsigned long size;
-	unsigned long offset = OFFSET_CONTINUOUS;
+	unsigned long size, offset = OFFSET_CONTINUOUS;
 	char *name;
 	int name_len;
 	unsigned char *extra_mem;
@@ -98,16 +97,13 @@ static struct mtd_partition * newpart(char *s,
 	unsigned int mask_flags;
 
 	/* fetch the partition size */
-	if (*s == '-')
-	{	/* assign all remaining space to this partition */
+	if (*s == '-') {
+		/* assign all remaining space to this partition */
 		size = SIZE_REMAINING;
 		s++;
-	}
-	else
-	{
+	} else {
 		size = memparse(s, &s);
-		if (size < PAGE_SIZE)
-		{
+		if (size < PAGE_SIZE) {
 			printk(KERN_ERR ERRP "partition size too small (%lx)\n", size);
 			return ERR_PTR(-EINVAL);
 		}
@@ -116,60 +112,51 @@ static struct mtd_partition * newpart(char *s,
 	/* fetch partition name and flags */
 	mask_flags = 0; /* this is going to be a regular partition */
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
+		if (!p) {
 			printk(KERN_ERR ERRP "no closing %c found in partition name\n", delim);
 			return ERR_PTR(-EINVAL);
 		}
 		name_len = p - name;
 		s = p + 1;
-	}
-	else
-	{
-	    	name = NULL;
+	} else {
+		name = NULL;
 		name_len = 13; /* Partition_000 */
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
+	/* if lk is found do NOT unlock the MTD partition*/
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
+	if (*s == ',') {
+		if (size == SIZE_REMAINING) {
 			printk(KERN_ERR ERRP "no partitions allowed after a fill-up partition\n");
 			return ERR_PTR(-EINVAL);
 		}
@@ -178,44 +165,38 @@ static struct mtd_partition * newpart(char *s,
 				&extra_mem, extra_mem_size);
 		if (IS_ERR(parts))
 			return parts;
-	}
-	else
-	{	/* this is the last partition: allocate space for all */
+	} else {
+		/* this is the last partition: allocate space for all */
 		int alloc_size;
 
 		*num_parts = this_part + 1;
 		alloc_size = *num_parts * sizeof(struct mtd_partition) +
 			     extra_mem_size;
+
 		parts = kzalloc(alloc_size, GFP_KERNEL);
 		if (!parts)
 			return ERR_PTR(-ENOMEM);
 		extra_mem = (unsigned char *)(parts + *num_parts);
 	}
+
 	/* enter this partition (offset will be calculated later if it is zero at this point) */
 	parts[this_part].size = size;
 	parts[this_part].offset = offset;
 	parts[this_part].mask_flags = mask_flags;
 	if (name)
-	{
 		strlcpy(extra_mem, name, name_len + 1);
-	}
 	else
-	{
 		sprintf(extra_mem, "Partition_%03d", this_part);
-	}
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
@@ -235,14 +216,14 @@ static int mtdpart_setup_real(char *s)
 	{
 		struct cmdline_mtd_partition *this_mtd;
 		struct mtd_partition *parts;
-	    	int mtd_id_len;
-		int num_parts;
+		int mtd_id_len, num_parts;
 		char *p, *mtd_id;
 
-	    	mtd_id = s;
+		mtd_id = s;
+
 		/* fetch <mtd-id> */
-		if (!(p = strchr(s, ':')))
-		{
+		p = strchr(s, ':');
+		if (!p) {
 			printk(KERN_ERR ERRP "no mtd-id\n");
 			return -EINVAL;
 		}
@@ -261,8 +242,7 @@ static int mtdpart_setup_real(char *s)
 				(unsigned char**)&this_mtd, /* out: extra mem */
 				mtd_id_len + 1 + sizeof(*this_mtd) +
 				sizeof(void*)-1 /*alignment*/);
-		if (IS_ERR(parts))
-		{
+		if (IS_ERR(parts)) {
 			/*
 			 * An error occurred. We're either:
 			 * a) out of memory, or
@@ -275,7 +255,7 @@ static int mtdpart_setup_real(char *s)
 
 		/* align this_mtd */
 		this_mtd = (struct cmdline_mtd_partition *)
-			ALIGN((unsigned long)this_mtd, sizeof(void*));
+				ALIGN((unsigned long)this_mtd, sizeof(void *));
 		/* enter results */
 		this_mtd->parts = parts;
 		this_mtd->num_parts = num_parts;
@@ -295,13 +275,13 @@ static int mtdpart_setup_real(char *s)
 			break;
 
 		/* does another spec follow? */
-		if (*s != ';')
-		{
+		if (*s != ';') {
 			printk(KERN_ERR ERRP "bad character after partition (%c)\n", *s);
 			return -EINVAL;
 		}
 		s++;
 	}
+
 	return 0;
 }
 
@@ -328,20 +308,18 @@ static int parse_cmdline_partitions(struct mtd_info *master,
 			return err;
 	}
 
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
+					part->parts[i].size = master->size - offset;
+
+				if (offset + part->parts[i].size > master->size) {
 					printk(KERN_WARNING ERRP
 					       "%s: partitioning exceeds flash size, truncating\n",
 					       part->mtd_id);
@@ -350,14 +328,17 @@ static int parse_cmdline_partitions(struct mtd_info *master,
 				}
 				offset += part->parts[i].size;
 			}
+
 			*pparts = kmemdup(part->parts,
 					sizeof(*part->parts) * part->num_parts,
 					GFP_KERNEL);
 			if (!*pparts)
 				return -ENOMEM;
+
 			return part->num_parts;
 		}
 	}
+
 	return 0;
 }
 
-- 
1.7.10.4
