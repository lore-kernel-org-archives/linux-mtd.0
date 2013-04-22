Received: from mail-out.m-online.net ([2001:a60:0:28:0:1:25:1])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UUOJP-0002U1-7s
 for linux-mtd@lists.infradead.org; Mon, 22 Apr 2013 21:30:11 +0000
From: Marek Vasut <marex@denx.de>
To: linux-mtd@lists.infradead.org
Subject: Re: [PATCH 17/18] fs: Fix copyright symbol in printk()
Date: Mon, 22 Apr 2013 23:30:08 +0200
References: <1366665870-8998-1-git-send-email-marex@denx.de>
In-Reply-To: <1366665870-8998-1-git-send-email-marex@denx.de>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Message-Id: <201304222330.08876.marex@denx.de>
Cc: David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Dear Marek Vasut,

you're such a moron, leaving that 17/18 stuff in the subject ... at least b=
e=20
sorry for confusing others! :-/

> Use regular ASCII "(C)" string instead of UTF8 "=A9" string in
> printk() as the later produces the following output on dmesg
> instead of the expected one:
>=20
>   jffs2: version 2.2. (NAND) \xffffffc2\xffffffa9 2001-2006 Red Hat, Inc.
>=20
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: David Woodhouse <dwmw2@infradead.org>

=2E.. yes, I'm sorry :-(

> ---
>  fs/jffs2/super.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/fs/jffs2/super.c b/fs/jffs2/super.c
> index 0defb1c..8916eb8 100644
> --- a/fs/jffs2/super.c
> +++ b/fs/jffs2/super.c
> @@ -381,7 +381,7 @@ static int __init init_jffs2_fs(void)
>  #ifdef CONFIG_JFFS2_SUMMARY
>  	       " (SUMMARY) "
>  #endif
> -	       " =A9 2001-2006 Red Hat, Inc.\n");
> +	       " (C) 2001-2006 Red Hat, Inc.\n");
>=20
>  	jffs2_inode_cachep =3D kmem_cache_create("jffs2_i",
>  					     sizeof(struct jffs2_inode_info),

Best regards,
Marek Vasut
