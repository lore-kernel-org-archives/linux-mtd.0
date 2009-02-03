Received: from mx11.lb01.inode.at ([62.99.145.13] helo=mx.inode.at)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1LUSGF-00051S-Sd
	for linux-mtd@lists.infradead.org; Tue, 03 Feb 2009 20:52:50 +0000
Date: Tue, 3 Feb 2009 21:52:45 +0100
From: Andreas Fenkart <andreas.fenkart@streamunlimited.com>
To: linux-mtd@lists.infradead.org
Subject: mtd_concat + m25p80 fails
Message-ID: <20090203205245.GB29085@CCCP.sue.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi all

I successfully merged two m25p80 flash devices into a single 'virtual' device. Thanks for your efforts. 

There is one problem though, when running flash_erase. Actually at the end of it, the kernel crashes in concat_sync. Since m25p80 does not define the 'sync' method concat_sync crashes while dereferencing the NULL pointer. 

static void concat_sync(struct mtd_info *mtd)
{ 
	struct mtd_concat *concat = CONCAT(mtd);
	int i;

	for (i = 0; i < concat->num_subdev; i++) {
		struct mtd_info *subdev = concat->subdev[i];
		subdev->sync(subdev);
	}
}
               

My question is, if the following the 'hack' is valid or whether I run into troubles, by not defining sync/lock/unlock when the subdevices do not define them.

diff --git a/drivers/mtd/mtdconcat.c b/drivers/mtd/mtdconcat.c
index d563dcd..8c2384f 100644
--- a/drivers/mtd/mtdconcat.c
+++ b/drivers/mtd/mtdconcat.c
@@ -793,11 +793,16 @@ struct mtd_info *mtd_concat_create(struct mtd_info *subdev[],     /* subdevices to c
        concat->mtd.erase = concat_erase;
        concat->mtd.read = concat_read;
        concat->mtd.write = concat_write;
-       concat->mtd.sync = concat_sync;
+       if (subdev[0]->sync)
+               concat->mtd.sync = concat_sync;
+       if (subdev[0]->lock)
        concat->mtd.lock = concat_lock;
+       if (subdev[0]->unlock)
        concat->mtd.unlock = concat_unlock;
-       concat->mtd.suspend = concat_suspend;
-       concat->mtd.resume = concat_resume;
+       if (subdev[0]->suspend)
+               concat->mtd.suspend = concat_suspend;
+       if (subdev[0]->resume)
+               concat->mtd.resume = concat_resume;
 

thank you

Andi
