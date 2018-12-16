Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gYg5B-0003Mq-KB
 for linux-mtd@lists.infradead.org; Sun, 16 Dec 2018 23:44:27 +0000
Received: by mail-wm1-x341.google.com with SMTP id y185so3446726wmd.1
 for <linux-mtd@lists.infradead.org>; Sun, 16 Dec 2018 15:44:15 -0800 (PST)
MIME-Version: 1.0
References: <cover.1524823321.git.h.grohne@intenta.de>
 <a8e9cd4537484541828fbd63f3fa853b4fb95726.1524823321.git.h.grohne@intenta.de>
In-Reply-To: <a8e9cd4537484541828fbd63f3fa853b4fb95726.1524823321.git.h.grohne@intenta.de>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Mon, 17 Dec 2018 00:44:02 +0100
Message-ID: <CAFLxGvzfapYR9yE8FS6hOOP7CbXk3qN_dsxsKF-sjRzOst08Cw@mail.gmail.com>
Subject: Re: [PATCH 1/3] jffs2: avoid unnecessarily taking f->sem
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

On Fri, Apr 27, 2018 at 12:38 PM Helmut Grohne <h.grohne@intenta.de> wrote:
>
> jffs2_xattr_do_crccheck_inode creates a temporary struct
> jffs2_inode_info for handling it to jffs2_do_read_inode_internal.
> Formerly, jffs2_do_read_inode_internal released f->sem in the error path
> and that was why it had to be initialized, taken and released. As part
> of 7aaea7605c0 ("jffs2: fix unbalanced locking") locking was moved out
> of it.
>
> In the relevant jffs2_xattr_do_crccheck_inode we own the only reference
> to f as we allocate it with kmalloc. Since nothing else has knowledge of
> it, there is no need to lock it. In particular, that saves us from
> thinking about the correct locking class.
>
> We still need to initialize the mutex as jffs2_do_clear_inode insists on
> acquiring it.
>
> Signed-off-by: Helmut Grohne <h.grohne@intenta.de>
> Cc: Peter Zijlstra <peterz@infradead.org>

Reviewed-by: Richard Weinberger <richard@nod.at>

-- 
Thanks,
//richard
