Received: from www.mw-itcon.de ([213.146.115.73])
	by canuck.infradead.org with smtp (Exim 4.52 #1 (Red Hat Linux))
	id 1EIUZi-0002y6-3L
	for linux-mtd@lists.infradead.org; Thu, 22 Sep 2005 13:09:41 -0400
Message-ID: <4332E554.4020202@mw-itcon.de>
Date: Thu, 22 Sep 2005 19:09:40 +0200
From: Peter Menzebach <pm-mtd@mw-itcon.de>
MIME-Version: 1.0
To: Peter Menzebach <pm@mw-itcon.de>
References: <432812E8.2030807@mw-itcon.de>
	<4332A3E8.8020002@mw-itcon.de>		<1127393059.20014.105.camel@sauron.oktetlabs.ru>		<4332B24F.2050305@mw-itcon.de>
	<4332BA7E.3060409@yandex.ru>	<1127399523.6125.79.camel@fuzzie.sanpeople.com>
	<4332D852.3060105@mw-itcon.de>
In-Reply-To: <4332D852.3060105@mw-itcon.de>
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

Peter Menzebach wrote:
forget the last patch, I made up my mind. If I do not find a good sector 
size, I should resize the size of flash for jffs2. See below.

The question is, if the call for jffs2_flash_setup should be moved 
before the size checks in jffs2_do_fill_super?

Best regards
Peter


--- /arm/src/mtd/fs/jffs2/wbuf.c	2005-09-22 13:33:42.000000000 +0200
+++ wbuf.c	2005-09-22 18:52:17.000000000 +0200
@@ -1200,18 +1193,37 @@
  }

  int jffs2_dataflash_setup(struct jffs2_sb_info *c) {
+	int min_sector_size;
  	c->cleanmarker_size = 0;		/* No cleanmarkers needed */
  	
  	/* Initialize write buffer */
  	init_rwsem(&c->wbuf_sem);
-	c->wbuf_pagesize = c->sector_size;
+	c->wbuf_pagesize = c->mtd->erasesize;
+
+	min_sector_size = ((JFFS2_MIN_SECTOR_SIZE + c->mtd->erasesize - 1) / 
c->mtd->erasesize) * c->mtd->erasesize;
+
+	c->sector_size = min_sector_size;
+
+	c->flash_size = c->mtd->size;
+	
+	while ((c->sector_size < (2 * min_sector_size)) && (c->flash_size % 
c->sector_size != 0)) {
+		c->sector_size+=c->mtd->erasesize;
+	}
+
+	if ((c->flash_size % c->sector_size) != 0) {
+		c->sector_size = min_sector_size;
+		c->flash_size = (c->flash_size / min_sector_size) * min_sector_size;
+		printk(KERN_INFO "JFFS2 flash size and erase size adjusted size %dKiB 
erasesize %dB\n", c->flash_size/1024, c->sector_size);
+	};
+	
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
