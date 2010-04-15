Received: from cantor2.suse.de ([195.135.220.15] helo=mx2.suse.de)
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1O2SmN-0005wb-Fj
	for linux-mtd@lists.infradead.org; Thu, 15 Apr 2010 17:23:04 +0000
Date: Thu, 15 Apr 2010 19:23:00 +0200
From: Jan Kara <jack@suse.cz>
To: "Kirill A. Shutemov" <kirill@shutemov.name>
Subject: Re: [BUG] Rewriting backing_dev_info in MTD
Message-ID: <20100415172300.GF3561@quack.suse.cz>
References: <g2ycc557aab1004130433g537f417ch401a97e5031f77ff@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <g2ycc557aab1004130433g537f417ch401a97e5031f77ff@mail.gmail.com>
Cc: Bernd Schmidt <bernd.schmidt@analog.com>,
	David Howells <dhowells@redhat.com>,
	Alexander Shishkin <virtuoso@slind.org>, linux-mtd@lists.infradead.org,
	Alexander Viro <viro@zeniv.linux.org.uk>, linux-fsdevel@vger.kernel.org,
	David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue 13-04-10 14:33:01, Kirill A. Shutemov wrote:
> I've got NULL-pointer dereference in __mark_inode_dirty() on chmod()
> for MTD device node. wb->bdi was NULL in this case.
> 
> During investigation I've found that MTD subsystem rewrites
> file->f_mapping->backing_dev_info on openning to get mmap() work on
> MMU-less systems. But in fact it rewrites
> inode->i_mapping->backing_dev_info too, since inode->i_mapping ==
> file->f_mapping (see __dentry_open() in fs/open.c). It breaks
> writeback of inode changes.
  I think the right trick is to not overwrite
file->f_mapping->backing_dev_info but rather change already
file->f_mapping. For example drivers/char/raw.c does this. Then you'll stop
having problems with writeback code going wild.

> I guess the right way to fix this is changing of __dentry_open() to
> create _copy_ of i_mapping to assign to f_mapping since in common case
> f_mapping != i_mapping. But I'm not sure were the copy should be
> freed.
  No, in most cases we will leave f_mapping == i_mapping so copying
i_mapping would be an overkill.

								Honza
-- 
Jan Kara <jack@suse.cz>
SUSE Labs, CR
