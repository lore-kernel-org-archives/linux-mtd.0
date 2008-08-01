Subject: Re: mtdsuper.c BLOCK=n compile error
From: David Woodhouse <dwmw2@infradead.org>
To: Adrian Bunk <bunk@kernel.org>
In-Reply-To: <20080801223056.GK19682@cs181140183.pp.htv.fi>
References: <20080801223056.GK19682@cs181140183.pp.htv.fi>
Content-Type: text/plain
Date: Fri, 01 Aug 2008 23:48:31 +0100
Message-Id: <1217630912.3719.41.camel@shinybook.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, Al Viro <viro@zeniv.linux.org.uk>,
	linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, 2008-08-02 at 01:30 +0300, Adrian Bunk wrote:
> Commit d5686b444ff3f72808d2b3fbd58672a86cdf38e7
> (switch mtd and dm-table to lookup_bdev()) causes
> the following compile error with CONFIG_BLOCK=n:
> 
> <--  snip  -->
> 
> ...
>   CC      drivers/mtd/mtdsuper.o
> /home/bunk/linux/kernel-2.6/git/linux-2.6/drivers/mtd/mtdsuper.c: In function `get_sb_mtd':
> /home/bunk/linux/kernel-2.6/git/linux-2.6/drivers/mtd/mtdsuper.c:184: error: implicit declaration of function 'lookup_bdev'
> /home/bunk/linux/kernel-2.6/git/linux-2.6/drivers/mtd/mtdsuper.c:184: warning: assignment makes pointer from integer without a cast
> /home/bunk/linux/kernel-2.6/git/linux-2.6/drivers/mtd/mtdsuper.c:197: error: implicit declaration of function 'bdput'
> make[3]: *** [drivers/mtd/mtdsuper.o] Error 1
> 
> <--  snip  -->

Signed-off-by: David Woodhouse <David.Woodhouse@intel.com>

diff --git a/drivers/mtd/mtdsuper.c b/drivers/mtd/mtdsuper.c
index 9b6af7e..e03250b 100644
--- a/drivers/mtd/mtdsuper.c
+++ b/drivers/mtd/mtdsuper.c
@@ -178,6 +178,7 @@ int get_sb_mtd(struct file_system_type *fs_type, int
flags,
 		}
 	}
 
+#ifdef CONFIG_BLOCK
 	/* try the old way - the hack where we allowed users to mount
 	 * /dev/mtdblock$(n) but didn't actually _use_ the blockdev
 	 */
@@ -200,6 +201,7 @@ int get_sb_mtd(struct file_system_type *fs_type, int
flags,
 			     mnt);
 
 not_an_MTD_device:
+#endif /* CONFIG_BLOCK */
 	if (!(flags & MS_SILENT))
 		printk(KERN_NOTICE
 		       "MTD: Attempt to mount non-MTD device \"%s\"\n",

-- 
David Woodhouse                            Open Source Technology Centre
David.Woodhouse@intel.com                              Intel Corporation
