Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gYg3B-0002op-Cp
 for linux-mtd@lists.infradead.org; Sun, 16 Dec 2018 23:42:22 +0000
Received: by mail-wm1-x344.google.com with SMTP id y139so10579564wmc.5
 for <linux-mtd@lists.infradead.org>; Sun, 16 Dec 2018 15:42:10 -0800 (PST)
MIME-Version: 1.0
References: <cover.1524823321.git.h.grohne@intenta.de>
 <95327ddd01e86d0160c2d678f4306a737cb6a085.1524823321.git.h.grohne@intenta.de>
In-Reply-To: <95327ddd01e86d0160c2d678f4306a737cb6a085.1524823321.git.h.grohne@intenta.de>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Mon, 17 Dec 2018 00:41:57 +0100
Message-ID: <CAFLxGvwTi+bRE3iApMrxR-Ua_99=uoxLUZunsOmFzFBHWPmGsg@mail.gmail.com>
Subject: Re: [PATCH 2/3] jffs2: jffs2_iget defer f->sem acquisition
To: h.grohne@intenta.de
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
 Peter Zijlstra <peterz@infradead.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Apr 27, 2018 at 12:37 PM Helmut Grohne <h.grohne@intenta.de> wrote:
>
> At the point where f->sem is taken, we know that we have a locked I_NEW
> inode. Since jffs2_iget is the only function processing I_NEW inodes and
> iget_locked blocks on I_NEW inodes, we know that we are the only user of
> the inode until we unlock_new_inode it. Since 7aaea7605c0 ("jffs2: fix
> unbalanced locking"), jffs2_do_read_inode no longer touches f->sem and
> does not make the inode visible to others either. Thus we can call it
> without f->sem acquired. Nextup, inode->i_mode is protected until
> unlock_new_inode.
>
> After deferring the locking, we can decide upon the proper lock class
> depending on inode->i_mode.
>
> Signed-off-by: Helmut Grohne <h.grohne@intenta.de>
> Cc: Peter Zijlstra <peterz@infradead.org>

Reviewed-by: Richard Weinberger <richard@nod.at>

-- 
Thanks,
//richard
