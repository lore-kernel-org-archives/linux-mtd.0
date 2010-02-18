Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1Ni4Ee-0003vJ-Bc
	for linux-mtd@lists.infradead.org; Thu, 18 Feb 2010 11:08:01 +0000
Subject: Re: [PATCH 1/2] jffs2: Move erasing from write_super to GC.
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Joakim Tjernlund <Joakim.Tjernlund@transmode.se>
In-Reply-To: <1266394581-32450-2-git-send-email-Joakim.Tjernlund@transmode.se>
References: <1266394581-32450-1-git-send-email-Joakim.Tjernlund@transmode.se>
	<1266394581-32450-2-git-send-email-Joakim.Tjernlund@transmode.se>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 18 Feb 2010 13:06:06 +0200
Message-ID: <1266491166.16891.18.camel@localhost>
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

On Wed, 2010-02-17 at 09:16 +0100, Joakim Tjernlund wrote:
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

Err, I thought you would remove signal checking from this function? It
really does not belong here.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
