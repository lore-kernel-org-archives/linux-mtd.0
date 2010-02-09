Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1Neoqt-0007w7-4h
	for linux-mtd@lists.infradead.org; Tue, 09 Feb 2010 12:06:03 +0000
Subject: Re: [PATCH] JFFS2: Erase max 3 EB's in jffs2_write_super()
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Joakim Tjernlund <Joakim.Tjernlund@transmode.se>
In-Reply-To: <1265103600-32522-1-git-send-email-Joakim.Tjernlund@transmode.se>
References: <1265103600-32522-1-git-send-email-Joakim.Tjernlund@transmode.se>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 09 Feb 2010 14:05:02 +0200
Message-ID: <1265717102.2006.142.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2010-02-02 at 10:40 +0100, Joakim Tjernlund wrote:
> Deleting big files in a JFFS2 root FS and the rebooting makes
> the system hang until all freed EB's has been erased which
> can take several minutes.
> Fix the hanging by making jffs2_write_super() erase max 3 EB's
> at a time. If there are more EB's to erase afterwards, reset the
> s_dirty flag.
> 
> Signed-off-by: Joakim Tjernlund <Joakim.Tjernlund@transmode.se>
> ---
> 
>  I hope the list_empty calls doesn't need locking. If
>  so, it can easily be added.
> 
>  fs/jffs2/super.c |    5 ++++-
>  1 files changed, 4 insertions(+), 1 deletions(-)
> 
> diff --git a/fs/jffs2/super.c b/fs/jffs2/super.c
> index 9a80e8e..10393e0 100644
> --- a/fs/jffs2/super.c
> +++ b/fs/jffs2/super.c
> @@ -64,7 +64,10 @@ static void jffs2_write_super(struct super_block *sb)
>  	if (!(sb->s_flags & MS_RDONLY)) {
>  		D1(printk(KERN_DEBUG "jffs2_write_super()\n"));
>  		jffs2_garbage_collect_trigger(c);
> -		jffs2_erase_pending_blocks(c, 0);
> +		jffs2_erase_pending_blocks(c, 3);
> +		if (!list_empty(&c->erase_complete_list) ||
> +		    !list_empty(&c->erase_pending_list))
> +			sb->s_dirt = 1;
>  		jffs2_flush_wbuf_gc(c, 0);
>  	}

I think this is not very "friendly" WRT to VFS. From VFS's POW, JFFS2
has to have it's super-block clean upon return from '->write_super()'.
By leaving the super-block dirty, you violate VFS conventions, I thing.

What I suggest you to do instead is to delegate the erasing part to the
background thread. Roughly, something like:

1. wake the JFFS2 BGT from 'jffs2_write_super()' (you'll do this by
   doing the next item).
2. Change 'jffs2_thread_should_wake()' so that it would return "true" if
   there are pending EBs to erase.
3. Erase only a couple of EBs at one loop iteration, then try to do
   other activities (GC ing)

This way you will (1) make '->write_super()'  fast.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
