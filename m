Received: from johnea.net ([70.167.123.7] helo=mail.johnea.net)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TvaqZ-0004yT-0g
 for linux-mtd@lists.infradead.org; Wed, 16 Jan 2013 21:48:36 +0000
Message-ID: <50F72030.6000809@johnea.net>
Date: Wed, 16 Jan 2013 13:48:32 -0800
From: mtd@johnea.net
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: jffs2 minimum erase block count
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


Hello,

While recently debugging an issue mounting an mtdblock device via jffs2, we discovered a minimum erase block count requirement in fs/jffs2/fs.c:

#if 0
	if (c->flash_size < 5*c->sector_size) {
		printk(KERN_ERR "jffs2: Too few erase blocks (%d)\n", c->flash_size / c->sector_size);
		return -EINVAL;
	}
#endif

Which we disabled by wrapping it with #if 0 as shown.

For our particular application, the mounted mtdblock partition is for very rarely written user data, and is implemented over high endurance NOR flash.

After disabling this check the mounted partition seems to be working.

However it would be reassuring to know if violating this minimum erase block count will have other repercussions.

Thank You...

John Andrews
