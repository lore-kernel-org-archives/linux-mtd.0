Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1NeqEL-0003Bk-4M
	for linux-mtd@lists.infradead.org; Tue, 09 Feb 2010 13:34:21 +0000
Subject: Re: [patch 1/5] jffs2: fix memory corruption in
	jffs2_read_inode_range()
From: Artem Bityutskiy <dedekind1@gmail.com>
To: avorontsov@ru.mvista.com
In-Reply-To: <20100209133055.GA11218@oksana.dev.rtsoft.ru>
References: <201002022243.o12Mh9er019176@imap1.linux-foundation.org>
	<1265721992.2006.153.camel@localhost>
	<20100209133055.GA11218@oksana.dev.rtsoft.ru>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 09 Feb 2010 15:33:01 +0200
Message-ID: <1265722381.2006.154.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: neilb@suse.de, linux-mtd@lists.infradead.org, akpm@linux-foundation.org,
	dwmw2@infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2010-02-09 at 16:30 +0300, Anton Vorontsov wrote:
> On Tue, Feb 09, 2010 at 03:26:32PM +0200, Artem Bityutskiy wrote:
> > On Tue, 2010-02-02 at 14:43 -0800, akpm@linux-foundation.org wrote:
> > > From: Anton Vorontsov <avorontsov@ru.mvista.com>
> > > 
> > > In 2.6.23 kernel, commit a32ea1e1f925399e0d81ca3f7394a44a6dafa12c ("Fix
> > > read/truncate race") fixed a race in the generic code, and as a side
> > > effect, now do_generic_file_read() can ask us to readpage() past the
> > > i_size, which seems to be correctly handled by the block routines (e.g. 
> > > block_read_full_page() fills the page with zeroes in case if somebody is
> > > trying to read past the last inode's block).
> [...]
> > > Signed-off-by: Anton Vorontsov <avorontsov@ru.mvista.com>
> > > Cc: David Woodhouse <dwmw2@infradead.org>
> > > Cc: Neil Brown <neilb@suse.de>
> > > Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
> > 
> > All 5 patches you sent in this series are also sitting in my l2-mtd-2.6
> > tree.
> 
> Please drop this particular patch, David's version of this patch
> is already in Linus' tree:
> 
> commit 199bc9ff5ca5e4b3bcaff8927b2983c65f34c263
> Author: David Woodhouse <dwmw2@infradead.org>
> Date:   Mon Nov 30 09:06:40 2009 +0000
> 
>     jffs2: Fix memory corruption in jffs2_read_inode_range()

Right, I actually do not have this one. I have 4 other ones. Sorry for
confusion.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
