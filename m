Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16bkZs-0005mG-00
	for <linux-mtd@lists.infradead.org>; Fri, 15 Feb 2002 15:47:12 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <Pine.LNX.4.21.0202121938210.25544-102000@dagobert.svc.sysgo.de> 
References: <Pine.LNX.4.21.0202121938210.25544-102000@dagobert.svc.sysgo.de> 
To: Robert Kaiser <rob@sysgo.de>
Cc: linux-mtd@lists.infradead.org,
    Jörn Engel <joern@wohnheim.fh-wedel.de>
Subject: Re: MTD concat layer 
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Date: Fri, 15 Feb 2002 15:58:20 +0000
Message-ID: <3402.1013788700@redhat.com>
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

rob@sysgo.de said:
>  attached is my first version of the MTD "concatenation layer". This
> basically allows to build virtual MTD devices by concatenating
> existing ones, so it is -in a way- the opposite of partitioning. I
> would like to add this to the MTD CVS and so I'm asking people to have
> a look at it. 

> +#if defined(CONFIG_MTD_CONCAT) || defined(CONFIG_MTD_CONCAT_MODULE) 

Don't ever do that. Modules should be, well, modular - don't make other 
stuff depend on whether you happened to build a particular module today or 
not.

It doesn't look like you have the concat_erase code right. An erase which 
covers more than one subdev will only get partially done.

I think the best way to do this would be to merge it with the existing
partition code. The question of how to actually _register_ these remains
open, but I think the core code ought to be something like this...

--- mtdpart.c	2001/11/27 14:55:11	1.25
+++ mtdpart.c	2002/02/15 15:02:51
@@ -21,13 +21,19 @@
 /* Our partition linked list */
 static LIST_HEAD(mtd_partitions);
 
+struct mtd_part_section {
+	struct mtd_info *master;
+	uint32_t logical_offset; /* In the 'partition' */
+	uint32_t phys_offset; /* In the master */
+	uint32_t len;
+};
+
 /* Our partition node structure */
 struct mtd_part {
 	struct mtd_info mtd;
-	struct mtd_info *master;
-	u_int32_t offset;
-	int index;
 	struct list_head list;
+	int nr_sects;
+	struct mtd_part_section sections[0];
 };
 
 /*
@@ -46,12 +52,41 @@ static int part_read (struct mtd_info *m
 			size_t *retlen, u_char *buf)
 {
 	struct mtd_part *part = PART(mtd);
+	size_t thisretlen;
+	size_t totretlen = 0;
+	int sect;
+	int ret = 0;
+
 	if (from >= mtd->size)
-		len = 0;
-	else if (from + len > mtd->size)
-		len = mtd->size - from;
-	return part->master->read (part->master, from + part->offset, 
-					len, retlen, buf);
+		return -EINVAL;
+
+	for (sect = 0; sect < part->nr_sects; sect_ofs += part->sections[sect].len, sect++) {
+		struct mtd_part_section *thissect = &part->sections[sect];
+		uint32_t thisofs, thislen;
+
+		if (from >= thissect->logical_offset + thissect->len)
+			continue;
+		
+		/* Offset within this section */
+		thisofs = from - thissect->logical_offset;
+		/* Trim length */
+		thislen = min(len, thissect->len - thisofs);
+		thisofs += thissect->phys_offset;
+
+		ret = part->master->read (part->master, from + part->offset, 
+					len, &thisretlen, buf);
+
+		if (ret)
+			goto out;
+
+		totretlen += thisretlen;
+		buf += thisretlen;
+		from += thisretlen;
+	}
+ out:
+	*retlen = totretlen;
+	return ret;
+
 }
 
 static int part_write (struct mtd_info *mtd, loff_t to, size_t len,
@@ -224,7 +259,6 @@ int add_mtd_partitions(struct mtd_info *
 		slave->mtd.erase = part_erase;
 		slave->master = master;
 		slave->offset = parts[i].offset;
-		slave->index = i;
 
 		if (slave->offset == MTDPART_OFS_APPEND)
 			slave->offset = cur_offset;


--
dwmw2
