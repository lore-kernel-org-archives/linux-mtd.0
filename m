Received: from [62.112.80.35] (helo=ipc1.karo)
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1AewE7-0003I8-Kj
	for linux-mtd@lists.infradead.org; Fri, 09 Jan 2004 12:58:59 +0000
Message-ID: <16382.42248.387225.929229@ipc1.karo>
Date: Fri, 9 Jan 2004 13:56:40 +0100
From: "Lothar Wassmann" <LW@KARO-electronics.de>
To: "Dan Post" <djp.mtd@onemyth.net>
In-Reply-To: <20040108211206.M17119@onemyth.net>
References: <16381.14656.474765.390645@ipc1.karo>
	<20040108211206.M17119@onemyth.net>
Sender: Lothar Wassmann <lothar@karo-electronics.de>
cc: linux-mtd@lists.infradead.org
Subject: Re: put_chip() called with oldstate 1!! (linux 2.6.0-rmk2)
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

> Looking at the CVS version of cfi_cmdset_0001.c,
>                 chip->state = FL_ERASING;
>                 break;
> 
>         case FL_READY:
> +        case FL_STATUS:
>                 /* We should really make set_vpp() count, rather than doing
> this */
>                 DISABLE_VPP(map);
>                 break;
>
But obviously this change didn't make it into the mainline 2.6.0
kernel. :(


Lothar Wassmann
