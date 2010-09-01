Received: from mail-vw0-f49.google.com ([209.85.212.49])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OqsA7-0001Id-TN
	for linux-mtd@lists.infradead.org; Wed, 01 Sep 2010 18:35:56 +0000
Received: by vws11 with SMTP id 11so7477256vws.36
	for <linux-mtd@lists.infradead.org>;
	Wed, 01 Sep 2010 11:35:55 -0700 (PDT)
Subject: Re: [RFC] jffs2: use cond_resched() instead of yield()
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Wolfram Sang <w.sang@pengutronix.de>
In-Reply-To: <1283357021-16187-1-git-send-email-w.sang@pengutronix.de>
References: <1283357021-16187-1-git-send-email-w.sang@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 01 Sep 2010 21:35:51 +0300
Message-ID: <1283366151.2209.21.camel@brekeke>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>, Ingo Molnar <mingo@elte.hu>,
	dwmw2@infradead.org, linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This 'yield()' was introduced by dwmw2, so he may have strong feelings
about it. CCed.

On Wed, 2010-09-01 at 18:03 +0200, Wolfram Sang wrote:
> yield() has different semantics meanwhile and even causes RT-kernels to
> BUG. Replace the only appearance left in jffs2.
> 
> Signed-off-by: Wolfram Sang <w.sang@pengutronix.de>
> Cc: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
> Cc: Ingo Molnar <mingo@elte.hu>
> ---
> 
> The aforementioned BUG() showed up in one of our customer's RT-projects. While
> this could be handled by rearranging his thread-priorities, I wondered if such
> a patch would be worthwhile, still. Reading through the material covering
> yield() and related replacements, I believe this patch should be appropriate.
> Please say if I missed some side-effects.
> 
>  fs/jffs2/erase.c |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/fs/jffs2/erase.c b/fs/jffs2/erase.c
> index abac961..e513f19 100644
> --- a/fs/jffs2/erase.c
> +++ b/fs/jffs2/erase.c
> @@ -151,7 +151,7 @@ int jffs2_erase_pending_blocks(struct jffs2_sb_info *c, int count)
>  		}
>  
>  		/* Be nice */
> -		yield();
> +		cond_resched();
>  		mutex_lock(&c->erase_free_sem);
>  		spin_lock(&c->erase_completion_lock);
>  	}

-- 
Best Regards,
Artem Bityutskiy (Битюцкий Артём)
