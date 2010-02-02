Received: from mail.dev.rtsoft.ru ([213.79.90.226])
	by bombadil.infradead.org with smtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NcRaB-0006qL-5R
	for linux-mtd@lists.infradead.org; Tue, 02 Feb 2010 22:50:59 +0000
Date: Wed, 3 Feb 2010 01:50:47 +0300
From: Anton Vorontsov <avorontsov@ru.mvista.com>
To: akpm@linux-foundation.org
Subject: Re: [patch 1/5] jffs2: fix memory corruption in
	jffs2_read_inode_range()
Message-ID: <20100202225047.GA20293@oksana.dev.rtsoft.ru>
References: <201002022243.o12Mh9er019176@imap1.linux-foundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <201002022243.o12Mh9er019176@imap1.linux-foundation.org>
Cc: neilb@suse.de, linux-mtd@lists.infradead.org, dwmw2@infradead.org
Reply-To: avorontsov@ru.mvista.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Feb 02, 2010 at 02:43:09PM -0800, akpm@linux-foundation.org wrote:
> From: Anton Vorontsov <avorontsov@ru.mvista.com>
> 
> In 2.6.23 kernel, commit a32ea1e1f925399e0d81ca3f7394a44a6dafa12c ("Fix
> read/truncate race") fixed a race in the generic code, and as a side
> effect, now do_generic_file_read() can ask us to readpage() past the
> i_size, which seems to be correctly handled by the block routines (e.g. 
> block_read_full_page() fills the page with zeroes in case if somebody is
> trying to read past the last inode's block).
[...]
> Signed-off-by: Anton Vorontsov <avorontsov@ru.mvista.com>
> Cc: David Woodhouse <dwmw2@infradead.org>
> Cc: Neil Brown <neilb@suse.de>
> Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
> ---

Andrew,

Please drop this patch. David's version of that fix is
already in the mainline:

commit 199bc9ff5ca5e4b3bcaff8927b2983c65f34c263
Author: David Woodhouse <dwmw2@infradead.org>
Date:   Mon Nov 30 09:06:40 2009 +0000

    jffs2: Fix memory corruption in jffs2_read_inode_range()


Thanks!

>  fs/jffs2/file.c |    8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff -puN fs/jffs2/file.c~jffs2-fix-memory-corruption-in-jffs2_read_inode_range fs/jffs2/file.c
> --- a/fs/jffs2/file.c~jffs2-fix-memory-corruption-in-jffs2_read_inode_range
> +++ a/fs/jffs2/file.c
> @@ -85,7 +85,13 @@ static int jffs2_do_readpage_nolock (str
>  	pg_buf = kmap(pg);
>  	/* FIXME: Can kmap fail? */
>  
> -	ret = jffs2_read_inode_range(c, f, pg_buf, pg->index << PAGE_CACHE_SHIFT, PAGE_CACHE_SIZE);
> +	if (pg->index > ((i_size_read(inode) - 1) >> PAGE_CACHE_SHIFT)) {
> +		ret = 0;
> +		memset(pg_buf, 0, PAGE_CACHE_SIZE);
> +	} else {
> +		ret = jffs2_read_inode_range(c, f, pg_buf,
> +			pg->index << PAGE_CACHE_SHIFT, PAGE_CACHE_SIZE);
> +	}
>  
>  	if (ret) {
>  		ClearPageUptodate(pg);
> _

-- 
Anton Vorontsov
email: cbouatmailru@gmail.com
irc://irc.freenode.net/bd2
