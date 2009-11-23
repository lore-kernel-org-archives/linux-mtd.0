Received: from lazybastard.de ([212.112.238.170] helo=longford.logfs.org)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1NCZ1k-0004FL-C0
	for linux-mtd@lists.infradead.org; Mon, 23 Nov 2009 13:32:29 +0000
Date: Mon, 23 Nov 2009 14:32:15 +0100
From: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>
To: Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH 5/17] [LogFS] dir.c
Message-ID: <20091123133214.GB18889@logfs.org>
References: <20091120181113.GA2159@logfs.org>
	<E1NBZIP-0003g2-0r@longford.logfs.org>
	<20091123111744.GA17527@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20091123111744.GA17527@bicker>
Cc: linux-fsdevel@vger.kernel.org, linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 23 November 2009 13:17:44 +0200, Dan Carpenter wrote:
> On Fri, Nov 20, 2009 at 08:37:29PM +0100, Joern Engel wrote:
> > +static int logfs_unlink(struct inode *dir, struct dentry *dentry)
> > +{
> > +	struct logfs_super *super = logfs_super(dir->i_sb);
> > +	struct inode *inode = dentry->d_inode;
> > +	struct logfs_transaction *ta;
> > +	struct page *page;
> > +	pgoff_t index;
> > +	int ret;
> > +
> > +	ta = kzalloc(sizeof(*ta), GFP_KERNEL);
> > +	if (!ta)
> > +		return -ENOMEM;
> > +
> > +	ta->state = UNLINK_1;
> > +	ta->ino = inode->i_ino;
> > +
> > +	inode->i_ctime = dir->i_ctime = dir->i_mtime = CURRENT_TIME;
> > +
> > +	page = logfs_get_dd_page(dir, dentry);
> > +	if (!page)
> 
> kfree(ta);
> 
> > +		return -ENOENT;
> > +	if (IS_ERR(page))
> 
> kfree(ta);
> 
> > +		return PTR_ERR(page);

Ick!  The drunkard who wrote that code ought to get fired.  Thank you
for noticing, Dan.

Fixed in the git tree.  And maybe I should go look for similar cases.

Jörn

-- 
You can't tell where a program is going to spend its time. Bottlenecks
occur in surprising places, so don't try to second guess and put in a
speed hack until you've proven that's where the bottleneck is.
-- Rob Pike
