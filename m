Received: from mail.transmode.se ([83.241.175.147] helo=tmnt04.transmode.se)
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1I3yvr-0000di-MA
	for linux-mtd@lists.infradead.org; Thu, 28 Jun 2007 14:41:33 -0400
From: "Joakim Tjernlund" <joakim.tjernlund@transmode.se>
To: "'David Woodhouse'" <dwmw2@infradead.org>
Subject: RE: jffs2_mark_node_obsolete race w.r.t erase_free_sem?
Date: Thu, 28 Jun 2007 20:41:22 +0200
Message-ID: <000f01c7b9b3$ed0e7260$0e67a8c0@Jocke>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
In-Reply-To: <1183055402.1170.186.camel@pmac.infradead.org>
Cc: 'Linux MTD mailing list' <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

 

> -----Original Message-----
> From: David Woodhouse [mailto:dwmw2@infradead.org] 
> Sent: den 28 juni 2007 20:30
> To: Joakim Tjernlund
> Cc: 'Linux MTD mailing list'
> Subject: Re: jffs2_mark_node_obsolete race w.r.t erase_free_sem?
> 
> On Fri, 2007-06-22 at 13:27 +0200, Joakim Tjernlund wrote:
> > I belive this jffs2_mark_node_obsolete can race against
> > jffs2_erase_pending_blocks(run in pdflush context).
> > 
> > During jffs2_build_filesystem, the flag 
> JFFS2_SB_FLAG_BUILDING is set and
> > the erase_free_sem is NOT taken. There is nothing I can see that
> > holds pdflush back from erasing blocks during this time.
> > Confirmation would be great.
> > 
> > Dunno what the fix should be. Gut feeling is to prevent pdflush
> > from running until after build phase as erasing blocks is
> > a background task that shouldn't interfere with other tasks if
> > it can be helpt.
> > 
> > I think this is the root cause to the OOPS:es I seen lately
> 
> Perhaps. Try this...
> 
> diff --git a/fs/jffs2/fs.c b/fs/jffs2/fs.c
> index 1d3b7a9..0fa82d0 100644
> --- a/fs/jffs2/fs.c
> +++ b/fs/jffs2/fs.c
> @@ -390,6 +390,12 @@ void jffs2_write_super (struct super_block *sb)
>  	if (sb->s_flags & MS_RDONLY)
>  		return;
>  
> +	if (c->flags & JFFS2_SB_FLAG_BUILDING) {
> +		printk(KERN_NOTICE "jffs2_write_super() called 
> while fs still building\n");
> +		WARN_ON(1);
> +		return;
> +	}
> +
>  	D1(printk(KERN_DEBUG "jffs2_write_super()\n"));
>  	jffs2_garbage_collect_trigger(c);
>  	jffs2_erase_pending_blocks(c, 0);
> 
> -- 
> dwmw2

Yeah, was thinking something like this but got busy.
Hopefully I will get to it tmw
