Received: from lazybastard.de ([212.112.238.170] helo=longford.lazybastard.org)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JEPVV-0006l9-Iu
	for linux-mtd@lists.infradead.org; Mon, 14 Jan 2008 13:37:50 +0000
Date: Mon, 14 Jan 2008 14:28:43 +0100
From: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>
To: Alexander Belyakov <abelyako@mail.ru>
Subject: Re: [PATCH][JFFS2] Fix garbage collector block search
Message-ID: <20080114132843.GA15710@lazybastard.org>
References: <E1J2Trs-000IFE-00.abelyako-mail-ru@f65.mail.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <E1J2Trs-000IFE-00.abelyako-mail-ru@f65.mail.ru>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	David Woodhouse <dwmw2@infradead.org>,
	Alexander Belyakov <abelyako@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 12 December 2007 18:51:28 +0300, Alexander Belyakov wrote:
> 
> The patch checks if erasable_list is empty in jffs2_refile_wbuf_blocks() moving at least one block to that list. So jffs2_find_gc_block() will not fail sometimes with "jffs2: No clean, dirty _or_ erasable blocks to GC from! Where are they all?" message.

If the erasable_list is empty, we push it to the list for someone else
to erase it later instead of doing it now?  Nonsense.

If it makes a difference whether the block is erasable or erase_pending,
we have a bug.  And that bug wants a fix, not a paper bandaid.

> Signed-off-by: Alexander Belyakov <alexander.belyakov@intel.com>
> 
> diff -uNr a/fs/jffs2/wbuf.c b/fs/jffs2/wbuf.c
> --- a/fs/jffs2/wbuf.c	2007-12-03 17:00:16.000000000 +0300
> +++ b/fs/jffs2/wbuf.c	2007-12-11 19:03:03.000000000 +0300
> @@ -115,7 +115,7 @@
>  
>  		D1(printk(KERN_DEBUG "Removing eraseblock at 0x%08x from erasable_pending_wbuf_list...\n", jeb->offset));
>  		list_del(this);
> -		if ((jiffies + (n++)) & 127) {
> +		if (((jiffies + (n++)) & 127) && !list_empty(&c->erasable_list)) {
>  			/* Most of the time, we just erase it immediately. Otherwise we
>  			   spend ages scanning it on mount, etc. */
>  			D1(printk(KERN_DEBUG "...and adding to erase_pending_list\n"));
> 
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
> 

Jörn

-- 
Joern's library part 14:
http://www.sandpile.org/
