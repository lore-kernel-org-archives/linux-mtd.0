Received: from mail-ew0-f221.google.com ([209.85.219.221])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MPLrv-0003LH-UA
	for linux-mtd@lists.infradead.org; Fri, 10 Jul 2009 19:35:07 +0000
Received: by ewy21 with SMTP id 21so1058535ewy.18
	for <linux-mtd@lists.infradead.org>;
	Fri, 10 Jul 2009 12:34:49 -0700 (PDT)
Sender: Florian Fainelli <f.fainelli@gmail.com>
From: Florian Fainelli <florian@openwrt.org>
To: linux-mtd@lists.infradead.org
Subject: Re: [PATCH / RESENT #3] mtd: let include/linux/mtd/partitions.h stand
	on its own
Date: Fri, 10 Jul 2009 21:34:45 +0200
References: <alpine.LFD.2.00.0907101448360.3138@xanadu.home>
In-Reply-To: <alpine.LFD.2.00.0907101448360.3138@xanadu.home>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Message-Id: <200907102134.46212.florian@openwrt.org>
Cc: Nicolas Pitre <nico@cam.org>, Martin Michlmayr <tbm@cyrius.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Nicolas,

Le Friday 10 July 2009 20:51:33 Nicolas Pitre, vous avez =E9crit=A0:
> When declaring static MTD partitions in board specific code, only
> including include/linux/mtd/partitions.h should suffice without
> gcc nagging us with:
>
> In file included from arch/arm/mach-kirkwood/sheevaplug-setup.c:14:
> include/linux/mtd/partitions.h:50: warning: 'struct mtd_info' declared
> inside parameter list include/linux/mtd/partitions.h:50: warning: its sco=
pe
> is only this definition or declaration, which is probably not what you wa=
nt
> include/linux/mtd/partitions.h:51: warning: 'struct mtd_info' declared
> inside parameter list include/linux/mtd/partitions.h:61: warning: 'struct
> mtd_info' declared inside parameter list include/linux/mtd/partitions.h:6=
7:
> warning: 'struct mtd_info' declared inside parameter list
>
> Signed-off-by: Nicolas Pitre <nico@marvell.com>

Thanks for doing this, Martin and I had the same problem on Cobalt Microser=
vers (MIPS).

> ---
>
> Hello?  Anybody home?
>
> diff --git a/include/linux/mtd/partitions.h
> b/include/linux/mtd/partitions.h index af6dcb9..b70313d 100644
> --- a/include/linux/mtd/partitions.h
> +++ b/include/linux/mtd/partitions.h
> @@ -47,6 +47,8 @@ struct mtd_partition {
>  #define MTDPART_SIZ_FULL	(0)
>
>
> +struct mtd_info;
> +
>  int add_mtd_partitions(struct mtd_info *, const struct mtd_partition *,
> int); int del_mtd_partitions(struct mtd_info *);
>
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/



=2D-=20
Best regards, Florian Fainelli
Email : florian@openwrt.org
http://openwrt.org
=2D------------------------------
