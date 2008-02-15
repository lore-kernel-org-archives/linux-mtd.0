Received: from mail.transmode.se ([83.241.175.147] helo=tmnt04.transmode.se)
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JPwPY-0000O5-8P
	for linux-mtd@lists.infradead.org; Fri, 15 Feb 2008 08:59:18 +0000
Subject: RE: Abnormal behavior with JFFS2 on latest kernel
From: Joakim Tjernlund <joakim.tjernlund@transmode.se>
To: kmpark@infradead.org
In-Reply-To: <005001c86fb0$b9bc6d00$1fa9580a@swcenter.sec.samsung.co.kr>
References: <004601c86fa2$201a78d0$1fa9580a@swcenter.sec.samsung.co.kr>
	<1203065237.5419.74.camel@gentoo-jocke.transmode.se>
	<005001c86fb0$b9bc6d00$1fa9580a@swcenter.sec.samsung.co.kr>
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Date: Fri, 15 Feb 2008 09:59:11 +0100
Message-Id: <1203065951.5419.84.camel@gentoo-jocke.transmode.se>
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Reply-To: joakim.tjernlund@transmode.se
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Fri, 2008-02-15 at 17:56 +0900, Kyungmin Park wrote:
> > > I got following messages.
> > > INFO: task pdflush:56 blocked for more than 120 seconds.
> > > "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
> > >
> > > What are the meanings?
> > > Too mush running GC in JFFS2 or others?
> > >
> > > BR,
> > > Kyungmin Park
> > 
> > It is probably erasing lots of blocks and that takes a while, minutes
> > some times. I once sent a patch to address this but the patch is racy
> > w.r.t module unload. Look in the archive after patches from me.
> > 
> 
> You mean this one?
> diff --git a/fs/jffs2/wbuf.c b/fs/jffs2/wbuf.c
> index d1d4f27..b2e71c7 100644
> --- a/fs/jffs2/wbuf.c
> +++ b/fs/jffs2/wbuf.c
> @@ -115,7 +115,7 @@ static inline void jffs2_refile_wbuf_blocks(struct jffs2_sb_
> 
>                 D1(printk(KERN_DEBUG "Removing eraseblock at 0x%08x from erasabl
>                 list_del(this);
> -               if ((jiffies + (n++)) & 127) {
> +               if ((jiffies + (n++)) & 127 && !list_empty(&c->erasable_list)) {
>                         /* Most of the time, we just erase it immediately. Other
>                            spend ages scanning it on mount, etc. */
>                         D1(printk(KERN_DEBUG "...and adding to erase_pending_lis
> 
> It's already applied, but it's same.

Nope, the patch is probably named 
"[JFFS2] Stop erasing blocks when rebooting."

  Jocke
