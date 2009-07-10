Received: from mail-gx0-f219.google.com ([209.85.217.219])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MPLNc-00036X-Mq
	for linux-mtd@lists.infradead.org; Fri, 10 Jul 2009 19:03:41 +0000
Received: by gxk19 with SMTP id 19so1891835gxk.18
	for <linux-mtd@lists.infradead.org>;
	Fri, 10 Jul 2009 12:03:30 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <alpine.LFD.2.00.0907101448360.3138@xanadu.home>
References: <alpine.LFD.2.00.0907101448360.3138@xanadu.home>
From: Mike Frysinger <vapier.adi@gmail.com>
Date: Fri, 10 Jul 2009 15:03:09 -0400
Message-ID: <8bd0f97a0907101203y70041a4dx3105288afea7f2b6@mail.gmail.com>
Subject: Re: [PATCH / RESENT #3] mtd: let include/linux/mtd/partitions.h stand
	on its own
To: Nicolas Pitre <nico@cam.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Jul 10, 2009 at 14:51, Nicolas Pitre wrote:
> When declaring static MTD partitions in board specific code, only
> including include/linux/mtd/partitions.h should suffice without
> gcc nagging us with:
>
> In file included from arch/arm/mach-kirkwood/sheevaplug-setup.c:14:
> include/linux/mtd/partitions.h:50: warning: 'struct mtd_info' declared inside parameter list
> include/linux/mtd/partitions.h:50: warning: its scope is only this definition or declaration, which is probably not what you want
> include/linux/mtd/partitions.h:51: warning: 'struct mtd_info' declared inside parameter list
> include/linux/mtd/partitions.h:61: warning: 'struct mtd_info' declared inside parameter list
> include/linux/mtd/partitions.h:67: warning: 'struct mtd_info' declared inside parameter list
>
> Signed-off-by: Nicolas Pitre <nico@marvell.com>

Signed-off-by: Mike Frysinger <vapier@gentoo.org>

but this probably wont help your patch get merged ... mtd patches tend
to languish :/
-mike
