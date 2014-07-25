Received: from top.free-electrons.com ([176.31.233.9]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XAoeV-0005W5-Bb
 for linux-mtd@lists.infradead.org; Fri, 25 Jul 2014 23:11:58 +0000
Date: Fri, 25 Jul 2014 20:10:01 -0300
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: [PATCH v2 for v3.15 0/3] UBI: block: Support very large volumes
Message-ID: <20140725231001.GA29798@arch.cereza>
References: <1399284714-6283-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <1401188546.1304.128.camel@sauron.fi.intel.com>
 <20140527123017.GA1655@arch.cereza>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20140527123017.GA1655@arch.cereza>
Cc: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Artem,

On 27 May 09:30 AM, Ezequiel Garcia wrote:
> On 27 May 02:02 PM, Artem Bityutskiy wrote:
> > On Mon, 2014-05-05 at 07:11 -0300, Ezequiel Garcia wrote:
> > > This bug was reported on #mtd IRC. I don't have to reporter name to give proper
> > > credit. It should be applied as a fix for v3.15.
> > 
> > I've taken them, thanks.
> > 
> > However, I do not think they are important enough to send to 3.15. The
> > first patch, may be, but I doubt there is really a user suffering from
> > that. The second is just an optimization. The third is a fix, but I am
> > not sure if anyone uses this driver with such a huge MTD device. So I
> > think 3.16 should be all-right, how does this sound to you?
> > 
> 
> Sure, I'm fine with that.
> 

I think this series got lost :-(

It's not in today's -next, and I'm looking at your pull for v3.16 and it's
not there either. It seems I overlooked it, and realised just now, just before
sending a new fix.

Any idea what happened?

Anyway, I have found a new issue with ubiblock and I think this may be suitable
for -stable. Can you take a quick look at the patch below?

If the fix below is suitable for -stable, then we should apply this one now
and then rebase the large volume support on top of it, to be applied for v3.17.

>From 72b390aa14c6d2c81dfd6f3940ceed1067b9ae15 Mon Sep 17 00:00:00 2001
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
Date: Fri, 25 Jul 2014 19:37:03 -0300
Subject: [PATCH] UBI: block: Fix block device size set

We are currently taking the block device size from the ubi_volume_info.size
field. However, this is not the amount of data in the volume, but the
number of reserved physical eraseblocks, and hence leads to an incorrect
representation of the volume.

For static volumes, this leads to I/O errors as the block interface may
attempt to read unmapped PEBs:

$ cat /dev/ubiblock0_0 > /dev/null
UBI error: ubiblock_read_to_buf: ubiblock0_0 ubi_read error -22
end_request: I/O error, dev ubiblock0_0, sector 9536
Buffer I/O error on device ubiblock0_0, logical block 2384
[snip]

Fix this by using the ubi_volume_info.used_bytes field which is set to the
actual number of data bytes for both static and dynamic volumes.
While here, improve the error message to be less stupid and more useful:

UBI error: ubiblock_read_to_buf: ubiblock0_1 ubi_read error -9 on LEB=0, off=15872, len=512

Signed-off-by: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
---
 drivers/mtd/ubi/block.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/ubi/block.c b/drivers/mtd/ubi/block.c
index 8457df7..295a234 100644
--- a/drivers/mtd/ubi/block.c
+++ b/drivers/mtd/ubi/block.c
@@ -188,8 +188,8 @@ static int ubiblock_read_to_buf(struct ubiblock *dev, char *buffer,
 
 	ret = ubi_read(dev->desc, leb, buffer, offset, len);
 	if (ret) {
-		ubi_err("%s ubi_read error %d",
-			dev->gd->disk_name, ret);
+		ubi_err("%s ubi_read error %d on LEB=%d, off=%d, len=%d",
+			dev->gd->disk_name, ret, leb, offset, len);
 		return ret;
 	}
 	return 0;
@@ -412,7 +412,7 @@ int ubiblock_create(struct ubi_volume_info *vi)
 	gd->first_minor = dev->ubi_num * UBI_MAX_VOLUMES + dev->vol_id;
 	gd->private_data = dev;
 	sprintf(gd->disk_name, "ubiblock%d_%d", dev->ubi_num, dev->vol_id);
-	disk_capacity = (vi->size * vi->usable_leb_size) >> 9;
+	disk_capacity = vi->used_bytes >> 9;
 	set_capacity(gd, disk_capacity);
 	dev->gd = gd;
 
@@ -516,9 +516,9 @@ static void ubiblock_resize(struct ubi_volume_info *vi)
 	}
 
 	mutex_lock(&dev->dev_mutex);
-	disk_capacity = (vi->size * vi->usable_leb_size) >> 9;
+	disk_capacity = vi->used_bytes >> 9;
 	set_capacity(dev->gd, disk_capacity);
-	ubi_msg("%s resized to %d LEBs", dev->gd->disk_name, vi->size);
+	ubi_msg("%s resized to %d bytes", dev->gd->disk_name, vi->used_bytes);
 	mutex_unlock(&dev->dev_mutex);
 	mutex_unlock(&devices_mutex);
 }
-- 
2.0.1

-- 
Ezequiel García, Free Electrons
Embedded Linux, Kernel and Android Engineering
http://free-electrons.com
