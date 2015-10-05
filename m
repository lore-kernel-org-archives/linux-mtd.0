Received: from mx2.suse.de ([195.135.220.15])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zj0iW-0005id-SJ
 for linux-mtd@lists.infradead.org; Mon, 05 Oct 2015 08:01:54 +0000
Date: Mon, 5 Oct 2015 10:01:27 +0200
From: Jan Kara <jack@suse.cz>
To: Christoph Hellwig <hch@infradead.org>
Cc: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>, viro@ZenIV.linux.org.uk,
 jack@suse.cz, dedekind1@gmail.com, richard.weinberger@gmail.com,
 linux-mtd@lists.infradead.org, linux-fsdevel@vger.kernel.org
Subject: Re: [PATCH v3 13/39] fs: introduce a get_qsize() to inode_operations
Message-ID: <20151005080127.GC15529@quack.suse.cz>
References: <1442307754-13233-1-git-send-email-yangds.fnst@cn.fujitsu.com>
 <1442307754-13233-14-git-send-email-yangds.fnst@cn.fujitsu.com>
 <20151004063357.GH28519@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20151004063357.GH28519@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat 03-10-15 23:33:57, Christoph Hellwig wrote:
> On Tue, Sep 15, 2015 at 05:02:08PM +0800, Dongsheng Yang wrote:
> > get_qsize() is used to allow inode to decide how much of the quota size
> > in itself. If file system implements the own get_qsize(), ioctl of
> > FIOQSIZe will call it to get quota size. If not implemented, get the
> > quota size in a generic way.
> 
> This should be in struct dquot_operations.

This function won't be needed at all in the end as we talked with Yang...

								Honza
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR
