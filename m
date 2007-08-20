Received: from smtpd4.aruba.it ([62.149.128.209] helo=smtp5.aruba.it)
	by canuck.infradead.org with smtp (Exim 4.63 #1 (Red Hat Linux))
	id 1IN3Do-0001qV-4L
	for linux-mtd@lists.infradead.org; Mon, 20 Aug 2007 05:06:57 -0400
Message-ID: <46C95A0E.6040801@andorsystems.com>
Date: Mon, 20 Aug 2007 11:08:30 +0200
From: giulio fedel <giulio.fedel@andorsystems.com>
MIME-Version: 1.0
To: David Woodhouse <dwmw2@infradead.org>
Subject: Re: jffs2 kernel dump with 2.6.22-rc7
References: <8c7950360708011141w3a716a8aua185e9f1931f17e3@mail.gmail.com>	
	<46C5D764.5000303@andorsystems.com>	
	<625fc13d0708181442k5efc6eb3g783ad32b2efdcadc@mail.gmail.com>
	<1187513787.28494.9.camel@shinybook.infradead.org>
In-Reply-To: <1187513787.28494.9.camel@shinybook.infradead.org>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: Josh Boyer <jwboyer@gmail.com>, linux-mtd@lists.infradead.org,
	Joakim.Tjernlund@transmode.se
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

It's ok for me.

     Giulio


David Woodhouse wrote:
> On Sat, 2007-08-18 at 16:42 -0500, Josh Boyer wrote:
...
> 
> Hm, maybe. On the other hand, it does make it clear that we're violating
> the "No writes to flash without alloc_sem" held assumption. That
> assumption, when you're holding alloc_sem, means you're allowed to hold
> on to a _valid_ node while not holding the erase_completion_lock
> spinlock, although you're not allowed to hold onto an invalid one
> (because it might disappear if the eraseblock in which it resides is
> deleted). If valid nodes can become invalid, that's going to be...
> fun :)
> 
> I think I'd prefer to make the can_mark_obsolete path also hold
> alloc_sem while it's doing its thing.
> 
> Giulio, please could you verify that this patch also fixes the problem?
> 
> diff --git a/fs/jffs2/write.c b/fs/jffs2/write.c
> index bc61859..664c164 100644
> --- a/fs/jffs2/write.c
> +++ b/fs/jffs2/write.c
> @@ -566,6 +566,9 @@ int jffs2_do_unlink(struct jffs2_sb_info *c, struct jffs2_inode_info *dir_f,
>  		struct jffs2_full_dirent **prev = &dir_f->dents;
>  		uint32_t nhash = full_name_hash(name, namelen);
>  
> +		/* We don't actually want to reserve any space, but we do
> +		   want to be holding the alloc_sem when we write to flash */
> +		down(&c->alloc_sem);
>  		down(&dir_f->sem);
>  
>  		while ((*prev) && (*prev)->nhash <= nhash) {
> 
> 
