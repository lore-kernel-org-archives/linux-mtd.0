Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1NhJGv-0002Y9-9K
	for linux-mtd@lists.infradead.org; Tue, 16 Feb 2010 08:59:14 +0000
Subject: Re: [PATCH 1/2] jffs:2 Move erasing from write_super to GC.
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Joakim Tjernlund <Joakim.Tjernlund@transmode.se>
In-Reply-To: <1266249781-27970-1-git-send-email-Joakim.Tjernlund@transmode.se>
References: <1266249781-27970-1-git-send-email-Joakim.Tjernlund@transmode.se>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 16 Feb 2010 10:57:52 +0200
Message-ID: <1266310672.11659.197.camel@localhost>
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

On Mon, 2010-02-15 at 17:03 +0100, Joakim Tjernlund wrote:
> Erasing blocks is a form of GC and therefor it should live in the
> GC task. By moving it there two problems will be solved:
> 1) umounting will not hang until all pending blocks has
>    been erased.
> 2) Erasing can be paused by sending a SIGSTOP to the GC thread which
>    allowes for time critical tasks work in peace.
> 
> Signed-off-by: Joakim Tjernlund <Joakim.Tjernlund@transmode.se>
> ---
>  fs/jffs2/background.c |    1 +
>  fs/jffs2/erase.c      |    5 +++++
>  fs/jffs2/nodemgmt.c   |    4 ++++
>  fs/jffs2/super.c      |    1 -
>  4 files changed, 10 insertions(+), 1 deletions(-)
> 
> diff --git a/fs/jffs2/background.c b/fs/jffs2/background.c
> index 3ff50da..a8e0140 100644
> --- a/fs/jffs2/background.c
> +++ b/fs/jffs2/background.c
> @@ -146,6 +146,7 @@ static int jffs2_garbage_collect_thread(void *_c)
>  		disallow_signal(SIGHUP);
>  
>  		D1(printk(KERN_DEBUG "jffs2_garbage_collect_thread(): pass\n"));
> +		jffs2_erase_pending_blocks(c, 0);
>  		if (jffs2_garbage_collect_pass(c) == -ENOSPC) {
>  			printk(KERN_NOTICE "No space for garbage collection. Aborting GC thread\n");
>  			goto die;
> diff --git a/fs/jffs2/erase.c b/fs/jffs2/erase.c
> index b47679b..1ca2559 100644
> --- a/fs/jffs2/erase.c
> +++ b/fs/jffs2/erase.c
> @@ -114,6 +114,11 @@ void jffs2_erase_pending_blocks(struct jffs2_sb_info *c, int count)
>  	while (!list_empty(&c->erase_complete_list) ||
>  	       !list_empty(&c->erase_pending_list)) {
>  
> +		if (signal_pending(current)) {
> +			spin_unlock(&c->erase_completion_lock);
> +			mutex_unlock(&c->erase_free_sem);
> +			goto done;
> +		}

I think this is not very good split of functionality.
'jffs2_erase_pending_blocks()' should be stupid, it should just erase as
many EBs as it was asked to. It should have zero knowledge about
signals.

I think you should remove the signals checking from here and move that
to the GC thread.

Also, I think you should call it with count = 1, so that you would erase
only one EB at one iteration. This way you will let the GC thread do
other things with less latency as well.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
