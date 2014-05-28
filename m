Received: from mga01.intel.com ([192.55.52.88])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WpYoe-0007tG-A9
 for linux-mtd@lists.infradead.org; Wed, 28 May 2014 08:02:28 +0000
Message-ID: <1401264104.983.12.camel@sauron.fi.intel.com>
Subject: Re: [PATCH v2] ubifs: respect MS_SILENT mount flag
From: Artem Bityutskiy <dedekind1@gmail.com>
To: hujianyang <hujianyang@huawei.com>
Date: Wed, 28 May 2014 11:01:44 +0300
In-Reply-To: <538545B4.7070103@huawei.com>
References: <1401193128.1304.132.camel@sauron.fi.intel.com>
 <20140527141030.GA3130@earthship.local>
 <1401202595.1304.165.camel@sauron.fi.intel.com>
 <5384B772.4030506@makrotopia.org> <538545B4.7070103@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd <linux-mtd@lists.infradead.org>, Daniel <daniel@makrotopia.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2014-05-28 at 10:11 +0800, hujianyang wrote:
> Hi Daniel and Artem,
> 
> > 
> > You can test this by trying to mount a non-empty volume which does not contain a
> > UBIFS superblock (but e.g. squashfs or a U-Boot environment) with
> > mount -t ubifs -o silent /dev/ubiX_Y /mnt
> > This should fail without creating any klog lines.
> > 
> 
> I think disabling log message in this case is needed. But I'm sorry to say
> I don't like just adding a new parameter to ubifs_read_node in this way
> because this silent flag seems only used during mount. This adding makes the
> parameters different in ubifs_read_node and ubifs_write_node, also not good
> for reading code.

So you bring up 2 points.

1. This patch only makes the read part of the mount code-path silent,
everything else stays normal.
2. Another parameter makes code less readable.

WRT the former, do we really need more than that? IIUC, this is exactly
the meaning of the 'silent' flag, and exactly its purpose. IIUC, it
serves a single use-case: file-system probing. And the patch does
exactly that.

> How about to add a separate func ubifs_read_node_silent to instead this
> ubifs_read_node in ubifs_read_sb_node? I think we could do more proper work
> in this new function.

This would introduce code duplication, and I am not sure if this is much
better than what Daniel suggests.

How about introducing a per-file-system flag, like c->probing or
something, and make do something like this:

diff --git a/fs/ubifs/super.c b/fs/ubifs/super.c
index a81c7b5..a627476 100644
--- a/fs/ubifs/super.c
+++ b/fs/ubifs/super.c
@@ -1210,7 +1210,12 @@ static int mount_ubifs(struct ubifs_info *c)
 
        c->mounting = 1;
 
+       /*
+        * Good commend describing what we are doing.
+        */
+       c->probing = 1
        err = ubifs_read_superblock(c);
+       c->probing = 0
        if (err)
                goto out_free;
 

After all, we already have a number of "state" flags like 'c->mounting',
so adding another one is not that big deal.

-- 
Best Regards,
Artem Bityutskiy
