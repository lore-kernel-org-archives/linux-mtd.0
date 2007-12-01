Subject: Re: dynamic mtd_blktrans_dev not fully init'd under UBI?
From: David Woodhouse <dwmw2@infradead.org>
To: catboat@texas.net
In-Reply-To: <1196456294.47507966462cb@webmail.texas.net>
References: <1196456294.47507966462cb@webmail.texas.net>
Content-Type: text/plain
Date: Sat, 01 Dec 2007 09:28:11 +0000
Message-Id: <1196501291.13978.77.camel@pmac.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2007-11-30 at 14:58 -0600, catboat@texas.net wrote:
> In the newest git, I see a mutex named "lock" instead, but 
> I don't think it's initialized either. See the function 
> mtdblock_add_mtd() in drivers/mtd/mtdblock.c. The struct
> mtd_blktrans_dev is just kzalloc'd leaving the mutex lock
> all zeroes. 

diff --git a/drivers/mtd/mtd_blkdevs.c b/drivers/mtd/mtd_blkdevs.c
index 74d9d30..839eed8 100644
--- a/drivers/mtd/mtd_blkdevs.c
+++ b/drivers/mtd/mtd_blkdevs.c
@@ -248,9 +248,9 @@ int add_mtd_blktrans_dev(struct mtd_blktrans_dev *new)
 		return -EBUSY;
 	}
 
-	mutex_init(&new->lock);
 	list_add_tail(&new->list, &tr->devs);
  added:
+	mutex_init(&new->lock);
 	if (!tr->writesect)
 		new->readonly = 1;
 

-- 
dwmw2
