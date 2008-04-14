Received: from smtp5.pp.htv.fi ([213.243.153.39])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JlPYS-0002wJ-Jq
	for linux-mtd@lists.infradead.org; Mon, 14 Apr 2008 14:21:08 +0000
Date: Mon, 14 Apr 2008 17:20:04 +0300
From: Adrian Bunk <bunk@kernel.org>
To: dwmw2@infradead.org
Subject: [2.6 patch] mtd/cmdlinepart.c: don't compare pointers with 0
Message-ID: <20080414142004.GR6695@cs181133002.pp.htv.fi>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Sparse spotted that 0 was compared to pointers.

While I was at it, I also moved the assignments out of the if's.

Signed-off-by: Adrian Bunk <bunk@kernel.org>

---

 drivers/mtd/cmdlinepart.c |   10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

32de76e83f37322dd85eaecf126e7b17327f606f diff --git a/drivers/mtd/cmdlinepart.c b/drivers/mtd/cmdlinepart.c
index b44292a..3e09043 100644
--- a/drivers/mtd/cmdlinepart.c
+++ b/drivers/mtd/cmdlinepart.c
@@ -119,7 +119,8 @@ static struct mtd_partition * newpart(char *s,
 		char *p;
 
 	    	name = ++s;
-		if ((p = strchr(name, delim)) == 0)
+		p = strchr(name, delim);
+		if (!p)
 		{
 			printk(KERN_ERR ERRP "no closing %c found in partition name\n", delim);
 			return NULL;
@@ -159,9 +160,10 @@ static struct mtd_partition * newpart(char *s,
 			return NULL;
 		}
 		/* more partitions follow, parse them */
-		if ((parts = newpart(s + 1, &s, num_parts,
-		                     this_part + 1, &extra_mem, extra_mem_size)) == 0)
-		  return NULL;
+		parts = newpart(s + 1, &s, num_parts, this_part + 1,
+				&extra_mem, extra_mem_size);
+		if (!parts)
+			return NULL;
 	}
 	else
 	{	/* this is the last partition: allocate space for all */
