Received: from [194.51.134.17] (helo=www.anfora.fr)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17LJgD-0000oh-00
	for <linux-mtd@lists.infradead.org>; Fri, 21 Jun 2002 09:22:05 +0100
Received: from christian (firewall.anfora [194.51.134.18])
	by www.anfora.fr (8.9.3/8.8.7) with ESMTP id KAA24256
	for <linux-mtd@lists.infradead.org>; Fri, 21 Jun 2002 10:18:47 +0200
Subject: Re: JFFS2 cannot even initialize
From: gagneraud christian <cgagneraud@anfora.fr>
To: linux-mtd@lists.infradead.org
In-Reply-To: <20020620195253.B13478@wohnheim.fh-wedel.de>
References: <20020620184631.A14004@wohnheim.fh-wedel.de>
	<1024593433.25822.4.camel@christian>
	<20020620195253.B13478@wohnheim.fh-wedel.de>
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: quoted-printable
Date: 21 Jun 2002 10:20:01 +0200
Message-Id: <1024647631.25826.7.camel@christian>
Mime-Version: 1.0
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

Le jeu 20/06/2002 =E0 19:52, J=F6rn Engel a =E9crit :
> On Thu, 20 June 2002 19:16:43 +0200, gagneraud christian wrote:
> > Le jeu 20/06/2002 =E0 18:46, J=F6rn Engel a =E9crit :
> > > After merging current JFFS2 with our kernel again, I tripped over the
> > > first sanity check in super-v24.c. Here is the dmesg:
> > > JFFS2 error: struct jffs2_sb_info (376 bytes) doesn't fit in the supe=
r_block union (272 bytes)
> > >=20
> > > Is this a known issue? What do I do?
> > >=20
> > > J=F6rn
> > i use JFFS2 CVS code on a 2.4.4linux and i've had to modify
> > include/linux/fs.h:
> > ----8<-------8<-------8<-------8<-------8<-------8<-------8<-------8<--=
-
> diff -Naur linux-2.4.4-2002-03-21/include/linux/fs.h
> linux-denx-2.4.4-20020321-edu/include/linux/fs.h
> --- linux-2.4.4-2002-03-21/include/linux/fs.h   Mon Apr 30 01:15:31 2001
> +++ linux-denx-2.4.4-20020321-edu/include/linux/fs.h    Thu Apr 25
> 19:12:28 2002
> @@ -296,6 +296,7 @@
>  #include <linux/ncp_fs_i.h>
>  #include <linux/proc_fs_i.h>
>  #include <linux/usbdev_fs_i.h>
> +#include <linux/jffs2_fs_i.h>
>=20
>  /*
>   * Attribute flags.  These should be or-ed together to figure out what
> @@ -461,6 +462,7 @@
>                 struct proc_inode_info          proc_i;
>                 struct socket                   socket_i;
>                 struct usbdev_inode_info        usbdev_i;
> +               struct jffs2_inode_info         jffs2_i;
>                 void                            *generic_ip;
> =20
>  extern struct list_head super_blocks;
> =20
> @@ -689,6 +692,7 @@
>                 struct udf_sb_info      udf_sb;
>                 struct ncp_sb_info      ncpfs_sb;
>                 struct usbdev_sb_info   usbdevfs_sb;
> +               struct jffs2_sb_info    jffs2_sb;
>                 void                    *generic_sbp;
>         } u;
>         /*
> > ----8<-------8<-------8<-------8<-------8<-------8<-------8<-------8<--=
-
> >=20
> > hope this help.
>=20
> It sure did. Thanks a lot!
>=20
> J=F6rn
>=20
> --=20
> Perfection (in design) is achieved not when there is nothing more to
> add, but rather when there is nothing more to take away.
> -- Eric Raymond in "The cathedral and the bazaar"
>=20
--=20
/**********************************************
* Christian Gagneraud
***********************************************
* cgagneraud@anfora.fr
***********************************************
* ANFORA
* bat Actys, Voie3
* 31313 Lab=E8ge Innopole
* FRANCE
***********************************************/
