Received: from [217.111.56.18] (helo=spring.sncag.com)
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1Bi8NG-0002Ge-8G
	for linux-mtd@lists.infradead.org; Wed, 07 Jul 2004 05:05:59 -0400
Received: from farside.sncag.com (localhost [127.0.0.1])
	by spring.sncag.com (8.12.11/8.12.11/Debian-5) with ESMTP id
	i6795hTV029247
	for <linux-mtd@lists.infradead.org>; Wed, 7 Jul 2004 11:05:47 +0200
Received: from farside.sncag.com (farside [127.0.0.1])
	by farside.sncag.com (8.12.11/8.12.11/Debian-5) with ESMTP id
	i6792qtr024171
	for <linux-mtd@lists.infradead.org>; Wed, 7 Jul 2004 17:02:52 +0800
To: linux-mtd@lists.infradead.org
In-Reply-To: <87fz85eidc.fsf@farside.sncag.com> (Rainer Weikusat's message
	of "Tue, 06 Jul 2004 14:53:51 +0800")
References: <87fz85eidc.fsf@farside.sncag.com>
From: Rainer Weikusat <rainer.weikusat@sncag.com>
Date: Wed, 07 Jul 2004 17:02:52 +0800
Message-ID: <8765909olf.fsf@farside.sncag.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: cmdlineparts.c [PATCH]
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is a (lengthy) patch that transforms cmdlinepart.c
as I have described. I've also added a header to stop gcc from
complaining about use of undeclared functions from physmap.c, but I do
not quite know what to do with it. And I don't really have an idea
about what to do with the 'author' and 'copyright' parts, either,
because I normally avoid putting my (or anybody elses' fwiw) name
anywhere.

I hope to a found (and squashed) all the really stupid bugs ...

--- cmdlinepart.c.orig	2004-07-07 16:57:46.000000000 +0800
+++ cmdlinepart.c	2004-07-07 16:04:59.000000000 +0800
@@ -3,7 +3,9 @@
  *
  * Read flash partition table from command line
  *
- * Copyright 2002 SYSGO Real-Time Solutions GmbH
+ * (c) 2004 SNC AG
+ *
+ * Portions copyright 2002 SYSGO Real-Time Solutions GmbH
  *
  * The format for the command line is as follows:
  * 
@@ -41,300 +43,334 @@
 #define dbg(x)
 #endif
 
-
-/* special size referring to all the remaining space in a partition */
+/*
+  special size referring to all the remaining space in a partition
+*/
 #define SIZE_REMAINING 0xffffffff
 
 struct cmdline_mtd_partition {
-	struct cmdline_mtd_partition *next;
+	struct cmdline_mtd_partition *next, *prev;
 	char *mtd_id;
-	int num_parts;
+	int n_parts;
 	struct mtd_partition *parts;
 };
 
+struct part_info {
+	struct part_info *p;
+	
+	char const *name;
+	u32 ofs, size;
+	unsigned name_len, mask;
+};
+
 /* mtdpart_setup() parses into here */
 static struct cmdline_mtd_partition *partitions;
 
 /* the command line passed to mtdpart_setupd() */
-static char *cmdline;
+static char const *cmdline;
 static int cmdline_parsed = 0;
 
+static int parse_part_spec(char const **s, struct part_info *info)
 /*
- * Parse one partition definition for an MTD. Since there can be many
- * comma separated partition definitions, this function calls itself 
- * recursively until no more partition definitions are found. Nice side
- * effect: the memory to keep the mtd_partition structs and the names
- * is allocated upon the last definition being found. At that point the
- * syntax has been verified ok.
- */
-static struct mtd_partition * newpart(char *s, 
-                                      char **retptr,
-                                      int *num_parts,
-                                      int this_part, 
-                                      unsigned char **extra_mem_ptr, 
-                                      int extra_mem_size)
+  Parse a single partition spec into *info and advance the
+  position in the definition string as appropriate. Return
+  0 if successful, otherwise -1.
+
+  NB: This parser is horribly broken in case of most
+  syntactical errors. OTOH, it's much smaller because
+  of that.
+*/
 {
-	struct mtd_partition *parts;
-	unsigned long size;
-	unsigned long offset = 0;
-	char *name;
-	int name_len;
-	unsigned char *extra_mem;
-	char delim;
-	unsigned int mask_flags;
-
-	/* fetch the partition size */
-	if (*s == '-')
-	{	/* assign all remaining space to this partition */
-		size = SIZE_REMAINING;
-		s++;
-	}
-	else
-	{
-		size = memparse(s, &s);
-		if (size < PAGE_SIZE)
-		{
-			printk(KERN_ERR ERRP "partition size too small (%lx)\n", size);
-			return 0;
-		}
-	}
+	char const *p;
 
-	/* fetch partition name and flags */
-	mask_flags = 0; /* this is going to be a regular partition */
-	delim = 0;
-        /* check for offset */
-        if (*s == '@') 
-	{
-                s++;
-                offset = memparse(s, &s);
-        }
-        /* now look for name */
-	if (*s == '(')
-	{
-		delim = ')';
-	}
-		
-	if (delim)
-	{
-		char *p;
-
-	    	name = ++s;
-		if ((p = strchr(name, delim)) == 0)
-		{
-			printk(KERN_ERR ERRP "no closing %c found in partition name\n", delim);
-			return 0;
-		}
-		name_len = p - name;
-		s = p + 1;
-	}
-	else
-	{
-	    	name = NULL;
-		name_len = 13; /* Partition_000 */
-	}
-   
-	/* record name length for memory allocation later */
-	extra_mem_size += name_len + 1;
-
-        /* test for options */
-        if (strncmp(s, "ro", 2) == 0) 
-	{
-		mask_flags |= MTD_WRITEABLE;
-		s += 2;
-        }
-
-	/* test if more partitions are following */
-	if (*s == ',')
-	{
-		if (size == SIZE_REMAINING)
-		{
-			printk(KERN_ERR ERRP "no partitions allowed after a fill-up partition\n");
-			return 0;
-		}
-		/* more partitions follow, parse them */
-		if ((parts = newpart(s + 1, &s, num_parts, 
-		                     this_part + 1, &extra_mem, extra_mem_size)) == 0)
-		  return 0;
-	}
-	else
-	{	/* this is the last partition: allocate space for all */
-		int alloc_size;
-
-		*num_parts = this_part + 1;
-		alloc_size = *num_parts * sizeof(struct mtd_partition) +
-			     extra_mem_size;
-		parts = kmalloc(alloc_size, GFP_KERNEL);
-		if (!parts)
-		{
-			printk(KERN_ERR ERRP "out of memory\n");
-			return 0;
+	/*
+	  size
+	*/
+	p = *s;
+	if (*p == '-') {
+	    info->size = SIZE_REMAINING;
+	    ++p;
+	} else {
+	    info->size = memparse((char *)p, (char **)&p);
+	    
+	    if (info->size < PAGE_SIZE) {
+		printk(KERN_ERR ERRP "size %x too small\n",
+		       (unsigned)info->size);
+		return -1;
+	    }
+	}
+
+	/*
+	  offset
+	*/
+	info->ofs = 0;
+	if (*p == '@') ++p, info->ofs = memparse((char *)p, (char **)&p);
+
+	/*
+	  name
+	*/
+	if (*p == '(') {
+		info->name = ++p ;
+		p = strchr(p, ')');
+		if (!p) {
+			printk(KERN_ERR ERRP
+			       "closing delimiter missing in partition name\n");
+			return -1;
 		}
-		memset(parts, 0, alloc_size);
-		extra_mem = (unsigned char *)(parts + *num_parts);
-	}
-	/* enter this partition (offset will be calculated later if it is zero at this point) */
-	parts[this_part].size = size;
-	parts[this_part].offset = offset;
-	parts[this_part].mask_flags = mask_flags;
-	if (name)
-	{
-		strncpy(extra_mem, name, name_len);
-		extra_mem[name_len] = 0;
-	}
-	else
-	{
-		sprintf(extra_mem, "Partition_%03d", this_part);
+
+		info->name_len = p++ - info->name;
+	} else {
+		info->name = "";
+		info->name_len = 0;
+	}
+
+	/*
+	  masked flags
+	*/
+	info->mask = 0;
+	if (*p == 'r' && p[1] == 'o') {
+		info->mask = MTD_WRITEABLE;
+		p += 2;
 	}
-	parts[this_part].name = extra_mem;
-	extra_mem += name_len + 1;
 
-	dbg(("partition %d: name <%s>, offset %x, size %x, mask flags %x\n",
-	     this_part, 
-	     parts[this_part].name,
-	     parts[this_part].offset,
-	     parts[this_part].size,
-	     parts[this_part].mask_flags));
-
-	/* return (updated) pointer to extra_mem memory */
-	if (extra_mem_ptr)
-	  *extra_mem_ptr = extra_mem;
+	*s = p;
+	return 0;
+}
+
+static struct mtd_partition *cleanup(struct part_info *p)
+{
+    struct part_info *pp;
 
-	/* return (updated) pointer command line string */
-	*retptr = s;
+    while ((pp = p)) {
+	p = p->p;
+	kfree(pp);
+    }
 
-	/* return partition table */
-	return parts;
+    return NULL;
 }
 
-/* 
- * Parse the command line. 
- */
-static int mtdpart_setup_real(char *s)
+static struct mtd_partition *parse_mtd_parts(char const **s, unsigned *n_parts)
+/*
+  Parse partition definitions associated with a single mtd id
+  and advance the position in the definition string as
+  appropriate. Return a pointer to an array of partition
+  definitions in case of success and NULL otherwise. If
+  successfull, set *n_parts to the number of partitions.
+*/
 {
-	cmdline_parsed = 1;
+	struct mtd_partition *parts, *p;
+	char *names;
+	struct part_info *first, *last, *cur;
+	unsigned l_names, n;
+	int rc;
+
+	/*
+	  Create a temporary list of partition information
+	  structures.
+	*/
+	parts = NULL;
+	first = last = NULL;
+	n = l_names = 0;
+	while (1) {
+		cur = kmalloc(sizeof(*cur), GFP_KERNEL);
+		if (!cur) {
+			printk(KERN_ERR ERRP
+			       "out of memory during mtdpart parsing\n");
 
-	for( ; s != NULL; )
-	{
-		struct cmdline_mtd_partition *this_mtd;
-		struct mtd_partition *parts;
-	    	int mtd_id_len;
-		int num_parts;
-		char *p, *mtd_id;
-
-	    	mtd_id = s;
-		/* fetch <mtd-id> */
-		if (!(p = strchr(s, ':')))
-		{
-			printk(KERN_ERR ERRP "no mtd-id\n");
-			return 0;
+			/*
+			  In theory, allocation failures are of
+			  temporary nature and retrying the operation
+			  later may prove successful. In practice, the
+			  calling code does not support this, but having
+			  the option doesn't hurt.
+			*/
+			cmdline_parsed = 0;
+			return cleanup(first);
 		}
-		mtd_id_len = p - mtd_id;
 
-		dbg(("parsing <%s>\n", p+1));
+		rc = parse_part_spec(s, cur);
+		if (rc == -1) return cleanup(first);
 
-		/* 
-		 * parse one mtd. have it reserve memory for the
-		 * struct cmdline_mtd_partition and the mtd-id string.
-		 */
-		parts = newpart(p + 1,		/* cmdline */
-				&s,		/* out: updated cmdline ptr */
-				&num_parts,	/* out: number of parts */
-				0,		/* first partition */
-				(unsigned char**)&this_mtd, /* out: extra mem */
-				mtd_id_len + 1 + sizeof(*this_mtd));
-		if(!parts)
-		{
-			/*
-			 * An error occurred. We're either:
-			 * a) out of memory, or
-			 * b) in the middle of the partition spec
-			 * Either way, this mtd is hosed and we're
-			 * unlikely to succeed in parsing any more
-			 */
-			 return 0;
-		 }
-
-		/* enter results */	    
-		this_mtd->parts = parts;
-		this_mtd->num_parts = num_parts;
-		this_mtd->mtd_id = (char*)(this_mtd + 1);
-		strncpy(this_mtd->mtd_id, mtd_id, mtd_id_len);
-		this_mtd->mtd_id[mtd_id_len] = 0;
-
-		/* link into chain */
-		this_mtd->next = partitions;	    	
-		partitions = this_mtd;
+		++n;
+		l_names += cur->name_len + 1;
+		if (last) last->p = cur;
+		else first = cur;
+		last = cur;
+		cur->p = NULL;
+
+		if (**s != ',') break;
+		++*s;
+	}
+
+	parts = p = kmalloc(n * sizeof(*p) + l_names, GFP_KERNEL);
+	if (!parts) {
+		printk(KERN_ERR ERRP
+		       "could not allocate partition definitions\n");
+		
+		cmdline_parsed = 0;
+		return cleanup(first);
+	}
+
+	/*
+	  Build the partition array to be returned.
+	*/
+	cur = first;
+	names = (char *)(p + n);
+	do {
+		memcpy(names, cur->name, cur->name_len);
+		names[cur->name_len] = 0;
+		p->name = names;
+		names += cur->name_len + 1;
+
+		p->size = cur->size;
+		p->offset = cur->ofs;
+		p->mask_flags = cur->mask;
+		p->mtdp = NULL;
+
+		first = cur->p;
+		kfree(cur);
+		++p;
+	} while ((cur = first));
+
+	*n_parts = n;
+	return parts;
+}
 
-		dbg(("mtdid=<%s> num_parts=<%d>\n", 
-		     this_mtd->mtd_id, this_mtd->num_parts));
+static void mtdpart_setup_real(void)
+/*
+  Parse commandline partition definitions. Build a list of
+  cmdline_mtd_partition structures, each completly describing
+  the partioning for a single flash device and store that
+  in 'partitions'. In case of errors, free unused allocated
+  space and return.
+*/
+{
+	struct cmdline_mtd_partition *cpart;
+	struct mtd_partition *parts;
+	char const *p, *mtd_id;
+	unsigned mtd_id_len, n;
+
+	cmdline_parsed = 1;
+	p = cmdline;
+	n = 0;
+	while (1) {
+		/*
+		  Parse partition defns.
+		*/
+		mtd_id = p;
+		p = strchr(p, ':');
+		if (!p || p == mtd_id) {
+			printk(KERN_ERR ERRP "no mtd id\n");
+			return;
+		}
+		mtd_id_len = p - mtd_id;
 		
+		++p;
+		parts = parse_mtd_parts(&p, &n);
+		if (!parts) return;
+
+		/*
+		  Set up description.
+		*/
+		cpart = kmalloc(sizeof(*cpart) + mtd_id_len + 1, GFP_KERNEL);
+		if (!cpart) {
+			printk(KERN_ERR ERRP
+			       "could not allocate commandline partition description\n");
+
+			cmdline_parsed = 0;
+			kfree(parts);
+			return;
+		}
+		cpart->mtd_id = (char *)(cpart + 1);
+		memcpy(cpart->mtd_id, mtd_id, mtd_id_len);
+		cpart->mtd_id[mtd_id_len] = 0;
+		cpart->parts = parts;
+		cpart->n_parts = n;
+
+		cpart->next = partitions;
+		if (partitions) partitions->prev = cpart;
+		cpart->prev = NULL;
+		partitions = cpart;
+
+		/*
+		  More work?
+		*/
+		switch (*p) {
+		default:
+			printk(KERN_ERR ERRP
+			       "garbage at end of partition defn (%c)\n", *p);
+			
+		case 0:
+			return;
 
-		/* EOS - we're done */
-		if (*s == 0)
+		case ';':
+			++p;
 			break;
-
-		/* does another spec follow? */
-		if (*s != ';')
-		{
-			printk(KERN_ERR ERRP "bad character after partition (%c)\n", *s);
-			return 0;
 		}
-		s++;
 	}
-	return 1;
 }
 
-/*
- * Main function to be called from the MTD mapping driver/device to
- * obtain the partitioning information. At this point the command line
- * arguments will actually be parsed and turned to struct mtd_partition
- * information. It returns partitions for the requested mtd device, or
- * the first one in the chain if a NULL mtd_id is passed in.
- */
 int parse_cmdline_partitions(struct mtd_info *master, 
                              struct mtd_partition **pparts,
                              const char *mtd_id)
+/*
+  Find partition list for mtd_id, if any. Return the number
+  of partitions found in case of success, and a pointer to
+  the partition array in *pparts. Return -EINVAL in case
+  there was none.
+*/
 {
-	unsigned long offset;
-	int i;
-	struct cmdline_mtd_partition *part;
-
-	if(!cmdline)
-		return -EINVAL;
-
-	/* parse command line */
-	if (!cmdline_parsed)
-		mtdpart_setup_real(cmdline);
-
-	for(part = partitions; part; part = part->next)
-	{
-		if ((!mtd_id) || (!strcmp(part->mtd_id, mtd_id)))
-		{
-			for(i = 0, offset = 0; i < part->num_parts; i++)
-			{
-				if (!part->parts[i].offset)
-				  part->parts[i].offset = offset;
-				else
-				  offset = part->parts[i].offset;
-				if (part->parts[i].size == SIZE_REMAINING)
-				  part->parts[i].size = master->size - offset;
-				if (offset + part->parts[i].size > master->size)
-				{
-					printk(KERN_WARNING ERRP 
-					       "%s: partitioning exceeds flash size, truncating\n",
-					       part->mtd_id);
-					part->parts[i].size = master->size - offset;
-					part->num_parts = i;
-				}
-				offset += part->parts[i].size;
-			}
-			*pparts = part->parts;
-			return part->num_parts;
-		}
-	}
-	return -EINVAL;
-}
+	struct cmdline_mtd_partition *p;
+	struct mtd_partition *parts;
+	u32 ofs;
+	unsigned n;
+
+	/*
+	  Parse command line if not already done and find
+	  the list of partitions asked for.
+	*/
+	if (!cmdline) return -EINVAL;
+	if (!cmdline_parsed) mtdpart_setup_real();
+
+	p = partitions;
+	while (p && strcmp(p->mtd_id, mtd_id) != 0) p = p->next;
+	if (!p) return -EINVAL;
+	*pparts = parts = p->parts;
+
+	/*
+	  Fixup offsets and sizes.
+	*/
+	n = p->n_parts;
+	ofs = 0;
+	do {
+	    if (!parts->offset) parts->offset = ofs;
+	    else ofs = parts->offset;
+
+	    if (parts->size == SIZE_REMAINING) break;
+	    if (ofs + parts->size > master->size) {
+		printk(KERN_WARNING ERRP
+		       "%s: partitioning exceeds flash size, truncating\n",
+		       mtd_id);
+
+		break;
+	    }
+
+	    ofs += parts->size;
+	    ++parts;
+	} while (--n);
+	if (n) parts->size = master->size - ofs;
+
+	/*
+	  Free now unused list head.
+	*/
+	n = p->n_parts;
+	if (p->prev) p->prev->next = p->next;
+	else partitions = p->next;
+	if (p->next) p->next->prev = p->prev;
+	kfree(p);
 
+	return n;
+}
 
 /* 
  * This is the handler for our kernel parameter, called from 
