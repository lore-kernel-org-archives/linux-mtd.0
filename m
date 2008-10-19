Date: Sun, 19 Oct 2008 15:21:22 +0200
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Artem Bityutskiy <dedekind@infradead.org>
Subject: [RFC] ubi: tmp hack for lstat
Message-ID: <20081019132122.GA20282@www.tglx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

lstat() on /dev/ubi%d_%d returns 0 in the st_size field. This hack
allows to get the correct file size (as long as nobody updates the volume
in the meantime).

Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---
I have userpsace programs which stat() the file and process the
returned number bytes. The other work around is to copy the file
somewhere and use this file instead of /dev/ubi.
Artem, do you thing it is possible to implement this functionality
properly or would it be reasonable not to use stat() at all on ubi
volumes?

 drivers/mtd/ubi/cdev.c |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/drivers/mtd/ubi/cdev.c b/drivers/mtd/ubi/cdev.c
index 03c759b..921dd81 100644
--- a/drivers/mtd/ubi/cdev.c
+++ b/drivers/mtd/ubi/cdev.c
@@ -123,6 +123,7 @@ static int vol_cdev_open(struct inode *inode, struct file *file)
 	if (IS_ERR(desc))
 		return PTR_ERR(desc);
 
+	i_size_write(inode, desc->vol->used_bytes);
 	file->private_data = desc;
 	return 0;
 }
-- 
1.5.6.5
