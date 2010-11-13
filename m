Received: from hera.kernel.org ([140.211.167.34])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1PHDqs-0001zv-Io
	for linux-mtd@lists.infradead.org; Sat, 13 Nov 2010 11:00:58 +0000
Message-ID: <4CDE6FAA.9030605@kernel.org>
Date: Sat, 13 Nov 2010 11:59:54 +0100
From: Tejun Heo <tj@kernel.org>
MIME-Version: 1.0
To: axboe@kernel.dk, dedekind1@gmail.com
Subject: [PATCH UPDATED 1/5] mtd: fix bdev exclusive open bugs in
	block2mtd::add_device()
References: <1288628129-12811-1-git-send-email-tj@kernel.org>
	<1288628129-12811-2-git-send-email-tj@kernel.org>
In-Reply-To: <1288628129-12811-2-git-send-email-tj@kernel.org>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: jack@suse.cz, leochen@broadcom.com, neilb@suse.de,
	heiko.carstens@de.ibm.com, dm-devel@redhat.com,
	adilger.kernel@dilger.ca, konishi.ryusuke@lab.ntt.co.jp,
	shaggy@linux.vnet.ibm.com, drbd-dev@lists.linbit.com,
	joel.becker@oracle.com, hch@infradead.org, aelder@sgi.com,
	mfasheh@suse.com, joern@logfs.org,
	reiserfs-devel@vger.kernel.org, viro@zeniv.linux.org.uk,
	swhiteho@redhat.com, chris.mason@oracle.com, tytso@mit.edu,
	petero2@telia.com, linux-kernel@vger.kernel.org,
	schwidefsky@de.ibm.com, linux-mtd@lists.infradead.org,
	akpm@linux-foundation.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

There are two bdev exclusive open bugs.

* open_bdev_exclusive() must not be called with NULL holder.  Use dev
  as the holder.

* open_by_devnum() doesn't open the bdev exclusively but
  block2mtd_free_device() always assumes it.  Explicitly claim the
  bdev.

The latter is rather clumsy but will be simplified with future
blkdev_get/put() cleanups.

- Updated to use local variable @mode to cache FMODE_* masks as
  suggested by Artem Bityutskiy.

Signed-off-by: Tejun Heo <tj@kernel.org>
Cc: linux-mtd@lists.infradead.org
Cc: Artem Bityutskiy <dedekind1@gmail.com>
---

This change will cause two conflicts in the series.  I'm not reposting
them now as they're mostly trivial.  Git tree is fully updated.

 git://git.kernel.org/pub/scm/linux/kernel/git/tj/misc.git cleanup-bd_claim

Jens, please let me know when/if you want the full series reposted.

Thanks.

 drivers/mtd/devices/block2mtd.c |   13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

Index: work/drivers/mtd/devices/block2mtd.c
===================================================================
--- work.orig/drivers/mtd/devices/block2mtd.c
+++ work/drivers/mtd/devices/block2mtd.c
@@ -234,6 +234,7 @@ static void block2mtd_free_device(struct
 /* FIXME: ensure that mtd->size % erase_size == 0 */
 static struct block2mtd_dev *add_device(char *devname, int erase_size)
 {
+	const fmode_t mode = FMODE_READ | FMODE_WRITE;
 	struct block_device *bdev;
 	struct block2mtd_dev *dev;
 	char *name;
@@ -246,7 +247,7 @@ static struct block2mtd_dev *add_device(
 		return NULL;

 	/* Get a handle on the device */
-	bdev = open_bdev_exclusive(devname, FMODE_READ|FMODE_WRITE, NULL);
+	bdev = open_bdev_exclusive(devname, mode, dev);
 #ifndef MODULE
 	if (IS_ERR(bdev)) {

@@ -255,7 +256,15 @@ static struct block2mtd_dev *add_device(

 		dev_t devt = name_to_dev_t(devname);
 		if (devt) {
-			bdev = open_by_devnum(devt, FMODE_WRITE | FMODE_READ);
+			bdev = open_by_devnum(devt, mode);
+			if (!IS_ERR(bdev)) {
+				int ret;
+				ret = bd_claim(bdev, dev);
+				if (ret) {
+					blkdev_put(bdev, mode);
+					bdev = ERR_PTR(ret);
+				}
+			}
 		}
 	}
 #endif
