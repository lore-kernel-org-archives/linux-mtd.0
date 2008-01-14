Received: from fg-out-1718.google.com ([72.14.220.154])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JEMXe-0001S1-2M
	for linux-mtd@lists.infradead.org; Mon, 14 Jan 2008 10:27:42 +0000
Received: by fg-out-1718.google.com with SMTP id 22so2389868fge.26
	for <linux-mtd@lists.infradead.org>;
	Mon, 14 Jan 2008 02:23:45 -0800 (PST)
Message-ID: <fe810cf0801140223yb3a4deehde5b282710619915@mail.gmail.com>
Date: Mon, 14 Jan 2008 13:23:45 +0300
From: "Alexander Belyakov" <abelyako@googlemail.com>
To: "David Woodhouse" <dwmw2@infradead.org>
Subject: Re: [PATCH][JFFS2] Fix garbage collector block search
In-Reply-To: <E1J2Trs-000IFE-00.abelyako-mail-ru@f65.mail.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <E1J2Trs-000IFE-00.abelyako-mail-ru@f65.mail.ru>
Cc: Alexander Belyakov <abelyako@mail.ru>,
	"linux-mtd@lists. infradead. org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Dec 12, 2007 6:51 PM, Alexander Belyakov <abelyako@mail.ru> wrote:
> Hello,
>
> The patch checks if erasable_list is empty in jffs2_refile_wbuf_blocks() moving at least one block to that list. So jffs2_find_gc_block() will not fail sometimes with "jffs2: No clean, dirty _or_ erasable blocks to GC from! Where are they all?" message.
>
> Signed-off-by: Alexander Belyakov <alexander.belyakov@intel.com>
>
> diff -uNr a/fs/jffs2/wbuf.c b/fs/jffs2/wbuf.c
> --- a/fs/jffs2/wbuf.c   2007-12-03 17:00:16.000000000 +0300
> +++ b/fs/jffs2/wbuf.c   2007-12-11 19:03:03.000000000 +0300
> @@ -115,7 +115,7 @@
>
>                 D1(printk(KERN_DEBUG "Removing eraseblock at 0x%08x from erasable_pending_wbuf_list...\n", jeb->offset));
>                 list_del(this);
> -               if ((jiffies + (n++)) & 127) {
> +               if (((jiffies + (n++)) & 127) && !list_empty(&c->erasable_list)) {
>                         /* Most of the time, we just erase it immediately. Otherwise we
>                            spend ages scanning it on mount, etc. */
>                         D1(printk(KERN_DEBUG "...and adding to erase_pending_list\n"));
>
>

Hello, David.

I've sent this jffs2 fix about month ago. Have you received applicable
patch? It should be applicable -- I've sent it to myself and checked
it before sending out.

Have you any comments on this patch?

Thanks,
Alexander
