Received: from dns1.vpop.net ([207.178.248.2] helo=boromir.vpop.net)
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1AzgI5-0004DQ-3W
	for linux-mtd@lists.infradead.org; Sat, 06 Mar 2004 18:12:49 +0000
Received: from vpop.net (bilbo.vpop.net [65.103.33.41])
	by boromir.vpop.net (Postfix) with ESMTP id 6CA7B3A5FF7
	for <linux-mtd@lists.infradead.org>;
	Sat,  6 Mar 2004 10:12:41 -0800 (PST)
Message-ID: <404A149C.5060702@vpop.net>
Date: Sat, 06 Mar 2004 12:12:44 -0600
From: Matthew Reimer <mreimer@vpop.net>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Subject: PATCH: make blkmtd work
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

blkmtd wasn't working for me at all, oopsing because it tried to 
dereference a NULL pointer. This patch fixes it:

--- blkmtd.c.orig       2004-03-06 11:58:30.000000000 -0600
+++ blkmtd.c    2004-03-06 11:58:45.000000000 -0600
@@ -664,12 +664,12 @@ static struct blkmtd_dev *add_device(cha
        }
 
        memset(dev, 0, sizeof(struct blkmtd_dev));
-       atomic_set(&(dev->blkdev->bd_inode->i_mapping->truncate_count), 0);
        if(!readonly) {
                init_MUTEX(&dev->wrbuf_mutex);
        }
 
        dev->blkdev = bdev;
+       atomic_set(&(dev->blkdev->bd_inode->i_mapping->truncate_count), 0);
        dev->mtd_info.size = dev->blkdev->bd_inode->i_size & PAGE_MASK;
 
        /* Setup the MTD structure */


This patch makes it work for me. Does this look right? If so, how do I 
go about getting it committed?

Matt
