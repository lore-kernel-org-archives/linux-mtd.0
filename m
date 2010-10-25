Subject: Re: [PATCH] jffs2: Do not assume erase will fail
From: David Woodhouse <dwmw2@infradead.org>
To: Joakim Tjernlund <Joakim.Tjernlund@transmode.se>
In-Reply-To: <1286468986-24627-1-git-send-email-Joakim.Tjernlund@transmode.se>
References: <1286468986-24627-1-git-send-email-Joakim.Tjernlund@transmode.se>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 25 Oct 2010 01:11:25 +0100
Message-ID: <1287965485.5674.25.camel@macbook.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2010-10-07 at 18:29 +0200, Joakim Tjernlund wrote:
> 
> Test if it did and then abort.
> 
> Signed-off-by: Joakim Tjernlund <Joakim.Tjernlund@transmode.se>
> ---
>  fs/jffs2/nodemgmt.c |    6 +++---
>  1 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/fs/jffs2/nodemgmt.c b/fs/jffs2/nodemgmt.c
> index 694aa5b..49ee5de 100644
> --- a/fs/jffs2/nodemgmt.c
> +++ b/fs/jffs2/nodemgmt.c
> @@ -260,9 +260,9 @@ static int jffs2_find_nextblock(struct jffs2_sb_info *c)
>                 spin_lock(&c->erase_completion_lock);
>  
>                 /* An erase may have failed, decreasing the
> -                  amount of free space available. So we must
> -                  restart from the beginning */
> -               return -EAGAIN;
> +                  amount of free space available. */
> +               if (list_empty(&c->free_list))
> +                       return -EAGAIN; /* restart from the beginning */ 

Hm, but there could have been more than one erase pending (or in
progress). And if one fails and another succeeds then you could have a
non-empty free_list but you could *also* now have run short of
free/freeable space so that a userspace write should now receive
-ENOSPC.

Is this really a performance issue? It should just come straight back if
the conditions are still met, surely?

And if we're hitting this code path that often, we should look at
erasing more aggressively so that we *don't* have to erase stuff on
demand.

-- 
David Woodhouse                            Open Source Technology Centre
David.Woodhouse@intel.com                              Intel Corporation
