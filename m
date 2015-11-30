Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a3TOM-00009R-OX
 for linux-mtd@lists.infradead.org; Mon, 30 Nov 2015 18:41:39 +0000
Date: Mon, 30 Nov 2015 19:36:24 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Brian Norris <computersforpeace@gmail.com>
Cc: <linux-mtd@lists.infradead.org>, Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 3/3] mtd: support a cleanup callback for partition parsers
Message-ID: <20151130193624.152c032a@bbrezillon>
In-Reply-To: <1447989997-108476-4-git-send-email-computersforpeace@gmail.com>
References: <1447989997-108476-1-git-send-email-computersforpeace@gmail.com>
 <1447989997-108476-4-git-send-email-computersforpeace@gmail.com>
MIME-Version: 1.0
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

Hi Brian,

On Thu, 19 Nov 2015 19:26:37 -0800
Brian Norris <computersforpeace@gmail.com> wrote:

> If partition parsers need to clean up their resources, we shouldn't
> assume that all memory will fit in a single kmalloc() that the caller
> can kfree(). We should allow the parser to provide a proper cleanup
> routine.
> 
> Note that this means we need to keep a hold on the parser's module for a
> bit longer, and release it later with mtd_part_parser_put().

I like the general idea behind this patch but I would have done it
sightly differently. Here you are keeping the parser around and the
parse_mtd_partitions() caller is responsible for calling the
appropriate cleanup method and releasing the parser reference if any.

How about simplifying callers life by doing all this behind the scene
and keeping the parser reference directly inside the mtd_partition
object (see the following diff).
Of course this implies adding an extra ->parser field to all partitions
while all we need is one parser reference per partition array, but
IMHO, it also keeps the code more readable (I guess it's a matter of
taste).
Another solution would be to declare an mtd_partitions struct
containing the number of partitions, the partition array and a
reference to the partition parser, which would even further simplify
the caller logic (nr_parts would be directly available in the
mtd_partitions struct).

What do you think?

Best Regards,

Boris

diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index c8d5494..e0bd54d 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -630,7 +630,7 @@ int mtd_device_parse_register(struct mtd_info *mtd, const char * const *types,
 	}
 
 out:
-	kfree(real_parts);
+	mtd_part_cleanup(real_parts, nr_parts);
 	return ret;
 }
 EXPORT_SYMBOL_GPL(mtd_device_parse_register);
diff --git a/drivers/mtd/mtdcore.h b/drivers/mtd/mtdcore.h
index 102cdef..b8a6e07 100644
--- a/drivers/mtd/mtdcore.h
+++ b/drivers/mtd/mtdcore.h
@@ -21,6 +21,25 @@ static inline void mtd_part_parser_put(struct mtd_part_parser *p)
 	module_put(p->owner);
 }
 
+static inline void mtd_part_cleanup(struct mtd_partition *pparts, int nrparts)
+{
+	struct mtd_part_parser *parser = pparts->parser;
+
+	/* Some parsers provide their own cleanup function */
+	if (parser && parser->cleanup)
+		parser->cleanup(pparts, nrparts);
+	/*
+	 * Others have historically relied on the core to kfree() their data.
+	 * Retain this behavior for legacy.
+	 */
+	else
+		kfree(pparts);
+
+	/* Release the reference to the partition parser if any */
+	if (parser)
+		mtd_part_parser_put(parser);
+}
+
 int __init init_mtdchar(void);
 void __exit cleanup_mtdchar(void);
 
diff --git a/drivers/mtd/mtdpart.c b/drivers/mtd/mtdpart.c
index 47afef3..2452a57 100644
--- a/drivers/mtd/mtdpart.c
+++ b/drivers/mtd/mtdpart.c
@@ -773,12 +773,13 @@ int parse_mtd_partitions(struct mtd_info *master, const char *const *types,
 		ret = (*parser->parse_fn)(master, pparts, data);
 		pr_debug("%s: parser %s: %i\n",
 			 master->name, parser->name, ret);
-		mtd_part_parser_put(parser);
 		if (ret > 0) {
 			printk(KERN_NOTICE "%d %s partitions found on MTD device %s\n",
 			       ret, parser->name, master->name);
+			(*pparts)->parser = parser;
 			return ret;
 		}
+		mtd_part_parser_put(parser);
 		/*
 		 * Stash the first error we see; only report it if no parser
 		 * succeeds
diff --git a/include/linux/mtd/partitions.h b/include/linux/mtd/partitions.h
index d002d9b..5ba07f2 100644
--- a/include/linux/mtd/partitions.h
+++ b/include/linux/mtd/partitions.h
@@ -11,6 +11,7 @@
 
 #include <linux/types.h>
 
+struct mtd_part_parser;
 
 /*
  * Partition definition structure:
@@ -31,6 +32,8 @@
  * 	master MTD flag set for the corresponding MTD partition.
  * 	For example, to force a read-only partition, simply adding
  * 	MTD_WRITEABLE to the mask_flags will do the trick.
+ * parser: partition parser that created this partition. Only set in the
+ *	   the first entry of the partiton array.
  *
  * Note: writeable partitions require their size and offset be
  * erasesize aligned (e.g. use MTDPART_OFS_NEXTBLK).
@@ -41,6 +44,7 @@ struct mtd_partition {
 	uint64_t size;			/* partition size */
 	uint64_t offset;		/* offset within the master MTD space */
 	uint32_t mask_flags;		/* master MTD flags to mask out for this partition */
+	struct mtd_part_parser *parser;
 };
 
 #define MTDPART_OFS_RETAIN	(-3)
@@ -71,6 +75,7 @@ struct mtd_part_parser {
 	const char *name;
 	int (*parse_fn)(struct mtd_info *, struct mtd_partition **,
 			struct mtd_part_parser_data *);
+	void (*cleanup)(struct mtd_partition *pparts, int nr_parts);
 };
 
 extern int __register_mtd_parser(struct mtd_part_parser *parser,


-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
