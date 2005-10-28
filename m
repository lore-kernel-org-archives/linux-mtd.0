Received: from mail.fh-wedel.de ([213.39.232.198] helo=moskovskaya.fh-wedel.de)
	by canuck.infradead.org with esmtps (Exim 4.54 #1 (Red Hat Linux))
	id 1EVVDN-00071x-La
	for linux-mtd@lists.infradead.org; Fri, 28 Oct 2005 10:28:22 -0400
Date: Fri, 28 Oct 2005 16:27:39 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: "Pierre.Ricadat@UTBM.fr" <Pierre.Ricadat@utbm.fr>
Message-ID: <20051028142739.GB1269@wohnheim.fh-wedel.de>
References: <1130311964.435f311cf30e9@webmail2.utbm.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1130311964.435f311cf30e9@webmail2.utbm.fr>
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

On Wed, 26 October 2005 09:32:44 +0200, Pierre.Ricadat@UTBM.fr wrote:
> 
> here i attach a small patch for that 'todo' in nodelist.c:
> 
>   /* TODO: this is very frequent pattern, make it a separate
> 		   * routine */
>   err = jffs2_flash_read(c, ofs, len, &retlen, buffer);
>   ...
> 
> about the checking of jffs2_flash_read().
> 
> I made a new function : jffs2_check_flash_read to
> - check that jffs2_flash_read returns success
> - check that it read all
> and in a case of failure, print error, free the buffer and return error code.

Nice.  Two things you could improve:

> @@ -131,12 +131,8 @@
>                 return;
> 
>         ret = jffs2_flash_read(c, ofs, len, &retlen, buf);
> -       if (ret || (retlen != len)) {
> -               JFFS2_WARNING("read %d bytes failed or short. ret %d, retlen %zd.\n",
> -                               len, ret, retlen);
> -               kfree(buf);
> +       if (!jffs2_check_flash_read(ret, ofs, len, retlen, &buf))
>                 return;
> -       }

All cases but one call jffs2_flash_read() before doing the various
error checks.  A function jffs2_flash_read_safe() that combines your
existing function and the actual read would be even nicer.


>  /*
> + *     Check if jffs2_flash_read was successful
> + */
> +int jffs2_check_flash_read(int err, uint32_t ofs, int len, size_t retlen, u_char *buf)
> +{
> +       int ret = 1;
> +
> +       /* did the read succeed? */
> +       if (err) {
> +               JFFS2_ERROR("can not read %d bytes from 0x%08x, error code: %d.\n", len, ofs, err);
> +               kfree(buf);
> +               ret = 0;
> +       }
> +       /* did we read all? */
> +       if (retlen != len) {
> +               JFFS2_ERROR("short read at 0x%08x: %d instead of %d.\n", ofs, retlen, len);
> +               kfree(buf);
> +               ret = 0;
> +       }
> +       return ret;
> +}

The return code doesn't match common convention at all - people will
get confused and create bugs in the future.  Return 0 on success and
-EIO for errors.


Jörn

-- 
Schrödinger's cat is <BLINK>not</BLINK> dead.
-- Illiad
