Received: from mail.fh-wedel.de ([213.39.232.198] helo=moskovskaya.fh-wedel.de)
	by canuck.infradead.org with esmtps (Exim 4.54 #1 (Red Hat Linux))
	id 1EWajM-0005Zu-Ap
	for linux-mtd@lists.infradead.org; Mon, 31 Oct 2005 09:33:55 -0500
Date: Mon, 31 Oct 2005 15:33:45 +0100
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: "pierre.ricadat@utbm.fr" <Pierre.Ricadat@utbm.fr>
Message-ID: <20051031143345.GB27238@wohnheim.fh-wedel.de>
References: <1130311964.435f311cf30e9@webmail2.utbm.fr>
	<20051028142739.GB1269@wohnheim.fh-wedel.de>
	<1130753526.4365edf6b2807@webmail1.utbm.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1130753526.4365edf6b2807@webmail1.utbm.fr>
Cc: linux-mtd@lists.infradead.org
Subject: Re: [PATCH] separate routine to check jffs2_flash_read
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 31 October 2005 11:12:06 +0100, pierre.ricadat@utbm.fr wrote:
> 
> I made the two changes you proposed:
> - new function (jffs2_flash_read_safe) who calls jffs2_flash_read and checks it
> - better return code
> 
> So i attach the new patch.

Better.  There's one bit that actually concerns me, though:

> diff -u ./mtd/fs/jffs2/nodelist.c ./mtd_pierre/fs/jffs2/nodelist.c
> --- ./mtd/fs/jffs2/nodelist.c   2005-09-21 22:28:35.000000000 +0900
> +++ ./mtd_pierre/fs/jffs2/nodelist.c    2005-10-31 18:27:34.000000000 +0900
> @@ -451,19 +451,8 @@
>                 if (unlikely(!buffer))
>                         return -ENOMEM;
> 
> -               /* TODO: this is very frequent pattern, make it a separate
> -                * routine */
> -               err = jffs2_flash_read(c, ofs, len, &retlen, buffer);
> -               if (err) {
> -                       JFFS2_ERROR("can not read %d bytes from 0x%08x, error code: %d.\n", len, ofs, err);
> -                       goto free_out;
> -               }
> -
> -               if (retlen != len) {
> -                       JFFS2_ERROR("short read at %#08x: %d instead of %d.\n", ofs, retlen, len);
> -                       err = -EIO;
> -                       goto free_out;
> -               }
> +               if (jffs2_flash_read_safe(c, ofs, len, buffer))
> +                       return -EIO;
>         }
> 
>         /* Continue calculating CRC */
> @@ -498,14 +487,6 @@
> 
>         return 0;
> 
> -free_out:
> -       if(!pointed)
> -               kfree(buffer);
> -#ifndef __ECOS
> -       else
> -               c->mtd->unpoint(c->mtd, buffer, ofs, len);
> -#endif
> -       return err;
>  }

Nowhere in jffs2_flash_read_safe() do you call c->mtd->unpoint.  So
obviously your code is not equivalent to the existing.  Can you look
into it and see what needs to be don?


Jörn

-- 
When you close your hand, you own nothing. When you open it up, you
own the whole world.
-- Li Mu Bai in Tiger & Dragon
