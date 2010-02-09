Received: from mail.dev.rtsoft.ru ([213.79.90.226])
	by bombadil.infradead.org with smtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NeqBD-0002nt-AN
	for linux-mtd@lists.infradead.org; Tue, 09 Feb 2010 13:31:07 +0000
Date: Tue, 9 Feb 2010 16:30:55 +0300
From: Anton Vorontsov <avorontsov@ru.mvista.com>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: [patch 1/5] jffs2: fix memory corruption in
	jffs2_read_inode_range()
Message-ID: <20100209133055.GA11218@oksana.dev.rtsoft.ru>
References: <201002022243.o12Mh9er019176@imap1.linux-foundation.org>
	<1265721992.2006.153.camel@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1265721992.2006.153.camel@localhost>
Cc: neilb@suse.de, linux-mtd@lists.infradead.org, akpm@linux-foundation.org,
	dwmw2@infradead.org
Reply-To: avorontsov@ru.mvista.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Feb 09, 2010 at 03:26:32PM +0200, Artem Bityutskiy wrote:
> On Tue, 2010-02-02 at 14:43 -0800, akpm@linux-foundation.org wrote:
> > From: Anton Vorontsov <avorontsov@ru.mvista.com>
> > 
> > In 2.6.23 kernel, commit a32ea1e1f925399e0d81ca3f7394a44a6dafa12c ("Fix
> > read/truncate race") fixed a race in the generic code, and as a side
> > effect, now do_generic_file_read() can ask us to readpage() past the
> > i_size, which seems to be correctly handled by the block routines (e.g. 
> > block_read_full_page() fills the page with zeroes in case if somebody is
> > trying to read past the last inode's block).
[...]
> > Signed-off-by: Anton Vorontsov <avorontsov@ru.mvista.com>
> > Cc: David Woodhouse <dwmw2@infradead.org>
> > Cc: Neil Brown <neilb@suse.de>
> > Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
> 
> All 5 patches you sent in this series are also sitting in my l2-mtd-2.6
> tree.

Please drop this particular patch, David's version of this patch
is already in Linus' tree:

commit 199bc9ff5ca5e4b3bcaff8927b2983c65f34c263
Author: David Woodhouse <dwmw2@infradead.org>
Date:   Mon Nov 30 09:06:40 2009 +0000

    jffs2: Fix memory corruption in jffs2_read_inode_range()


Thanks!

-- 
Anton Vorontsov
email: cbouatmailru@gmail.com
irc://irc.freenode.net/bd2
