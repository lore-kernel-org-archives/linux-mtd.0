Received: from szxga01-in.huawei.com ([119.145.14.64])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WpTMo-0005fF-7O
 for linux-mtd@lists.infradead.org; Wed, 28 May 2014 02:13:23 +0000
Message-ID: <538545B4.7070103@huawei.com>
Date: Wed, 28 May 2014 10:11:00 +0800
From: hujianyang <hujianyang@huawei.com>
MIME-Version: 1.0
To: Daniel <daniel@makrotopia.org>, Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: [PATCH v2] ubifs: respect MS_SILENT mount flag
References: <1401193128.1304.132.camel@sauron.fi.intel.com>
 <20140527141030.GA3130@earthship.local>
 <1401202595.1304.165.camel@sauron.fi.intel.com>
 <5384B772.4030506@makrotopia.org>
In-Reply-To: <5384B772.4030506@makrotopia.org>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Cc: linux-mtd <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Daniel and Artem,

> 
> You can test this by trying to mount a non-empty volume which does not contain a
> UBIFS superblock (but e.g. squashfs or a U-Boot environment) with
> mount -t ubifs -o silent /dev/ubiX_Y /mnt
> This should fail without creating any klog lines.
> 

I think disabling log message in this case is needed. But I'm sorry to say
I don't like just adding a new parameter to ubifs_read_node in this way
because this silent flag seems only used during mount. This adding makes the
parameters different in ubifs_read_node and ubifs_write_node, also not good
for reading code.

How about to add a separate func ubifs_read_node_silent to instead this
ubifs_read_node in ubifs_read_sb_node? I think we could do more proper work
in this new function.

> 
> However, this is probably distribution-specific hackery, but independently of
> that, UBIFS should still respect the MS_SILENT flag just like all other
> filesystems do.
> 

Do you get some more error messages not only in ubifs_read_node during mount?
I think this is a good suggestion. Current code do not use @silent in
ubifs_fill_super and we should do some work to enable it like other filesystems.

Thanks!

Hu
