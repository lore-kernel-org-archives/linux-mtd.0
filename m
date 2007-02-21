Received: from mx1.redhat.com ([66.187.233.31])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1HJsCA-00049u-Bu
	for linux-mtd@lists.infradead.org; Wed, 21 Feb 2007 09:11:58 -0500
Received: from int-mx1.corp.redhat.com (int-mx1.corp.redhat.com
	[172.16.52.254])
	by mx1.redhat.com (8.13.1/8.13.1) with ESMTP id l1LEBjKU031676
	for <linux-mtd@lists.infradead.org>; Wed, 21 Feb 2007 09:11:45 -0500
Received: from warthog.cambridge.redhat.com (warthog.cambridge.redhat.com
	[172.16.18.73])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l1LEBdrg016256
	for <linux-mtd@lists.infradead.org>; Wed, 21 Feb 2007 09:11:40 -0500
Received: from redhat.com (localhost.localdomain [127.0.0.1])
	by warthog.cambridge.redhat.com (8.13.8/8.13.8) with ESMTP id
	l1LEBdHG011790
	for <linux-mtd@lists.infradead.org>; Wed, 21 Feb 2007 14:11:39 GMT
From: David Howells <dhowells@redhat.com>
Subject: [PATCH 2/4] NOMMU: Add support for direct mapping through mtdconcat
	if possible
To: torvalds@osdl.org, akpm@osdl.org, dwmw2@infradead.org
Date: Wed, 21 Feb 2007 12:56:27 +0000
Message-ID: <20070221125627.10141.14354.stgit@warthog.cambridge.redhat.com>
In-Reply-To: <20070221125620.10141.71409.stgit@warthog.cambridge.redhat.com>
References: <20070221125620.10141.71409.stgit@warthog.cambridge.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Sender: linux-kernel-owner@vger.kernel.org
Resent-Message-ID: <11789.1172067099@redhat.com>
Cc: dhowells@redhat.com, linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org, uclinux-dev@uclinux.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: David Howells <dhowells@redhat.com>

Add support for direct mapping through mtdconcat, if possible, by attaching the
samebacking_dev_info structure to the master.

It has some restrictions:

 (1) It won't permit direct mapping of concatenated devices that have differing
     BDIs.

 (2) It doesn't support maps that span the 'gap' between devices, although it
     possibly could if the devices spanned across return compatible
     (ie. contiguous) addresses from their get_unmapped_area() ops.

Signed-off-by: Gavin Lambert <gavinl@compacsort.com>
Signed-Off-By: David Howells <dhowells@redhat.com>
---

 drivers/mtd/mtdconcat.c |   47 +++++++++++++++++++++++++++++++++++++++++++++++
 1 files changed, 47 insertions(+), 0 deletions(-)

diff --git a/drivers/mtd/mtdconcat.c b/drivers/mtd/mtdconcat.c
index 880580c..730689b 100644
--- a/drivers/mtd/mtdconcat.c
+++ b/drivers/mtd/mtdconcat.c
@@ -15,6 +15,7 @@
 #include <linux/slab.h>
 #include <linux/sched.h>
 #include <linux/types.h>
+#include <linux/backing-dev.h>
 
 #include <linux/mtd/mtd.h>
 #include <linux/mtd/concat.h>
@@ -686,6 +687,40 @@ static int concat_block_markbad(struct mtd_info *mtd, loff_t ofs)
 }
 
 /*
+ * try to support NOMMU mmaps on concatenated devices
+ * - we don't support subdev spanning as we can't guarantee it'll work
+ */
+static unsigned long concat_get_unmapped_area(struct mtd_info *mtd,
+					      unsigned long len,
+					      unsigned long offset,
+					      unsigned long flags)
+{
+	struct mtd_concat *concat = CONCAT(mtd);
+	int i;
+
+	for (i = 0; i < concat->num_subdev; i++) {
+		struct mtd_info *subdev = concat->subdev[i];
+
+		if (offset >= subdev->size) {
+			offset -= subdev->size;
+			continue;
+		}
+
+		/* we've found the subdev over which the mapping will reside */
+		if (offset + len > subdev->size)
+			return (unsigned long) -EINVAL;
+
+		if (subdev->get_unmapped_area)
+			return subdev->get_unmapped_area(subdev, len, offset,
+							 flags);
+
+		break;
+	}
+
+	return (unsigned long) -ENOSYS;
+}
+
+/*
  * This function constructs a virtual MTD device by concatenating
  * num_devs MTD devices. A pointer to the new device object is
  * stored to *new_dev upon success. This function does _not_
@@ -740,6 +775,8 @@ struct mtd_info *mtd_concat_create(struct mtd_info *subdev[],	/* subdevices to c
 
 	concat->mtd.ecc_stats.badblocks = subdev[0]->ecc_stats.badblocks;
 
+	concat->mtd.backing_dev_info = subdev[0]->backing_dev_info;
+
 	concat->subdev[0] = subdev[0];
 
 	for (i = 1; i < num_devs; i++) {
@@ -766,6 +803,15 @@ struct mtd_info *mtd_concat_create(struct mtd_info *subdev[],	/* subdevices to c
 				concat->mtd.flags |=
 				    subdev[i]->flags & MTD_WRITEABLE;
 		}
+
+		/* only permit direct mapping if the BDIs are all the same
+		 * - copy-mapping is still permitted
+		 */
+		if (concat->mtd.backing_dev_info !=
+		    subdev[i]->backing_dev_info)
+			concat->mtd.backing_dev_info =
+				&default_backing_dev_info;
+
 		concat->mtd.size += subdev[i]->size;
 		concat->mtd.ecc_stats.badblocks +=
 			subdev[i]->ecc_stats.badblocks;
@@ -796,6 +842,7 @@ struct mtd_info *mtd_concat_create(struct mtd_info *subdev[],	/* subdevices to c
 	concat->mtd.unlock = concat_unlock;
 	concat->mtd.suspend = concat_suspend;
 	concat->mtd.resume = concat_resume;
+	concat->mtd.get_unmapped_area = concat_get_unmapped_area;
 
 	/*
 	 * Combine the erase block size info of the subdevices:
