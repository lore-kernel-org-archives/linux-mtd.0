Received: from mail.fh-wedel.de ([213.39.232.194])
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1Bshla-0002VN-6X
	for linux-mtd@lists.infradead.org; Thu, 05 Aug 2004 08:54:43 -0400
Date: Thu, 5 Aug 2004 14:52:50 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: Ari Rahikkala <ari.rahikkala@gmail.com>
Message-ID: <20040805125250.GA29762@wohnheim.fh-wedel.de>
References: <e2041ca104080412415a9ce4e8@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e2041ca104080412415a9ce4e8@mail.gmail.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: [PATCH] Trivial fix to phram.c
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 4 August 2004 22:41:32 +0300, Ari Rahikkala wrote:
> 
> I'm not sure if gmail likes to mangle stuff a lot, so I'll include
> this patch both inline and as an attachment.

Patch is fine.  David, does cvs via ipv4 work again?

> --- linux-2.6.7/drivers/mtd/devices/phram.c     2004-08-04
> 22:29:04.850552576 +0300
> +++ linux-2.6.7/drivers/mtd/devices/phram.c.argument_fix       
> 2004-08-04 22:25:04.557082736 +0300
> @@ -231,14 +231,15 @@
>  
>  static int phram_setup(const char *val, struct kernel_param *kp)
>  {
> -       char buf[64+12+12], *str = buf;
> +       const int buflen = 88;
> +       char buf[buflen], *str = buf;
>         char *token[3];
>         char *name;
>         uint32_t start;
>         uint32_t len;
>         int i, ret;
>  
> -       if (strnlen(val, sizeof(str)) >= sizeof(str))
> +       if (strnlen(val, buflen) >= buflen)
>                 parse_err("parameter too long\n");
>  
>         strcpy(str, val);


Jörn

-- 
My second remark is that our intellectual powers are rather geared to
master static relations and that our powers to visualize processes
evolving in time are relatively poorly developed.
-- Edsger W. Dijkstra
