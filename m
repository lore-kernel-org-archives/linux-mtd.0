Received: from mx2.suse.de ([195.135.220.15])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zj1GK-0007wj-2U
 for linux-mtd@lists.infradead.org; Mon, 05 Oct 2015 08:36:48 +0000
Date: Mon, 5 Oct 2015 10:36:24 +0200
From: Jan Kara <jack@suse.cz>
To: Christoph Hellwig <hch@infradead.org>
Cc: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>, viro@ZenIV.linux.org.uk,
 jack@suse.cz, dedekind1@gmail.com, richard.weinberger@gmail.com,
 linux-mtd@lists.infradead.org, linux-fsdevel@vger.kernel.org
Subject: Re: [PATCH v3 01/39] fs: introduce a ->s_cdev field into struct
 super_block
Message-ID: <20151005083624.GD15529@quack.suse.cz>
References: <1442307754-13233-1-git-send-email-yangds.fnst@cn.fujitsu.com>
 <1442307754-13233-2-git-send-email-yangds.fnst@cn.fujitsu.com>
 <20151004063119.GF28519@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20151004063119.GF28519@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat 03-10-15 23:31:19, Christoph Hellwig wrote:
> On Tue, Sep 15, 2015 at 05:01:56PM +0800, Dongsheng Yang wrote:
> > There are some filesystems are running on char devs, such
> > as ubifs. So we need a field in super_block to hold a
> > reference to the char device.
> 
> We only care about the block device to get a device number to return
> in st.st_dev.  And while filesystem literally run on top of a block
> device that is not the case of a character device - you might use a
> chardev to identify a device to mount but it'll never use the actual
> char device.
> 
> So please don't bloat the superblock with this.

Hum, interesting idea. You're right that using anon bdev ubifs got assigned
in set_anon_super() would work as well. It may be slightly confusing for
quota-tools usage where specifying char device on command line would not
work (specifying block device to identify filesystem works there). But
using mount point would work fine so the situation would be the same as
with network filesystems.

We could even add a translation in quota-tools to convert char device to
corresponding anon block device if there's a reasonably simple way to do
that in userspace or we could translate in quotactl code in kernel if
that's any easier. But currently I don't see a way how we could easily do
either of those.

								Honza
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR
