Received: from an-out-0708.google.com ([209.85.132.251])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1I5jcr-0006cT-3I
	for linux-mtd@lists.infradead.org; Tue, 03 Jul 2007 10:45:10 -0400
Received: by an-out-0708.google.com with SMTP id c3so375616ana
	for <linux-mtd@lists.infradead.org>;
	Tue, 03 Jul 2007 07:45:08 -0700 (PDT)
Message-ID: <fe810cf0707030745q320feacega2328f6e1a19375e@mail.gmail.com>
Date: Tue, 3 Jul 2007 18:45:07 +0400
From: "Alexander Belyakov" <abelyako@googlemail.com>
To: linux-mtd@lists.infradead.org, "David Woodhouse" <dwmw2@infradead.org>
Subject: Re: [PATCH] [JFFS2] Fix unreasonable jffs2_do_reserve_space() failure
In-Reply-To: <fe810cf0706282325k536bf24ct6ad216f0c980e97c@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <fe810cf0706282325k536bf24ct6ad216f0c980e97c@mail.gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 6/29/07, Alexander Belyakov <abelyako@googlemail.com> wrote:
>
> The patch below checks if erasable_list is empty. If so
> jffs2_refile_wbuf_blocks() moves at least one block to that list.
> jffs2_find_gc_block() will not fail in that case and write will
> succeed.
>
> Signed-off-by: Alexander Belyakov <alexander.belyakov@intel.com>
> ---
> diff -uNr a/fs/jffs2/wbuf.c b/fs/jffs2/wbuf.c
> --- a/fs/jffs2/wbuf.c   2007-05-25 01:22:47.000000000 +0400
> +++ b/fs/jffs2/wbuf.c   2007-06-20 18:45:09.000000000 +0400
> @@ -117,7 +117,7 @@
>
>                 D1(printk(KERN_DEBUG "Removing eraseblock at 0x%08x from
> erasable_pending_wbuf_list...\n", jeb->offset));
>                 list_del(this);
> -               if ((jiffies + (n++)) & 127) {
> +               if (((jiffies + (n++)) & 127) && !list_empty(&c->erasable_list)) {
>                         /* Most of the time, we just erase it immediately. Otherwise we
>                            spend ages scanning it on mount, etc. */
>                         D1(printk(KERN_DEBUG "...and adding to erase_pending_list\n"));
>

David,

what do think about fixing this bug in mainline?

Thanks,
Alexander
