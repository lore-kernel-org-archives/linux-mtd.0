Received: from www.mw-itcon.de ([213.146.115.73])
	by canuck.infradead.org with smtp (Exim 4.52 #1 (Red Hat Linux))
	id 1EITi2-00025H-6Q
	for linux-mtd@lists.infradead.org; Thu, 22 Sep 2005 12:14:51 -0400
Message-ID: <4332D852.3060105@mw-itcon.de>
Date: Thu, 22 Sep 2005 18:14:10 +0200
From: Peter Menzebach <pm@mw-itcon.de>
MIME-Version: 1.0
To: Andrew Victor <andrew@sanpeople.com>
References: <432812E8.2030807@mw-itcon.de> <4332A3E8.8020002@mw-itcon.de>	
	<1127393059.20014.105.camel@sauron.oktetlabs.ru>	
	<4332B24F.2050305@mw-itcon.de> <4332BA7E.3060409@yandex.ru>
	<1127399523.6125.79.camel@fuzzie.sanpeople.com>
In-Reply-To: <1127399523.6125.79.camel@fuzzie.sanpeople.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: "Artem B. Bityutskiy" <dedekind@yandex.ru>, linux-mtd@lists.infradead.org
Subject: Re: data  loss on jffs2 filesystem on dataflash
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Andrew Victor wrote:

> This magic minimum block size could always be calculated in JFFS2 (in
> jffs2_dataflash_setup).  It is a JFFS2-specific value.
> Just calculate an 'N' where:
>    (N * mtd->erasesize) >= jffs2_minimum_block_size
> and
>    (mtd->size % (N * mtd->erasesize)) == 0

How about this in jffs2_dataflash_setup:

--- /arm/src/mtd/fs/jffs2/wbuf.c	2005-09-22 13:33:42.000000000 +0200
+++ wbuf.c	2005-09-22 17:52:17.000000000 +0200
@@ -1204,14 +1197,28 @@
  	
  	/* Initialize write buffer */
  	init_rwsem(&c->wbuf_sem);
-	c->wbuf_pagesize = c->sector_size;
+	c->wbuf_pagesize = c->mtd->erasesize;
+
+	c->sector_size = ((JFFS2_MIN_SECTOR_SIZE + c->mtd->erasesize - 1) /
+			  c->mtd->erasesize) * c->mtd->erasesize;
+
+	while ((5*c->sector_size < c->mtd->size) &&
+		((c->mtd->size % c->sector_size) != 0))
+	{
+		c->sector_size+=c->mtd->erasesize;
+	}
+	if ((c->mtd->size % c->sector_size) != 0) {
+		printk(KERN_WARNING "JFFS2 no suitable sector size found\n");
+		return (1);
+	};
+	
  	c->wbuf_ofs = 0xFFFFFFFF;

  	c->wbuf = kmalloc(c->wbuf_pagesize, GFP_KERNEL);
  	if (!c->wbuf)
  		return -ENOMEM;

-	printk(KERN_INFO "JFFS2 write-buffering enabled (%i)\n", 
c->wbuf_pagesize);
+	printk(KERN_INFO "JFFS2 write-buffering enabled (%i) erasesize 
(%i)\n", c->wbuf_pagesize, c->sector_size);

  	return 0;
  }


-- 
Peter Menzebach
Menzebach und Wolff IT-Consulting GbR
Phone +49 751 355 387 1
