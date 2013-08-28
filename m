Received: from am1ehsobe001.messaging.microsoft.com ([213.199.154.204]
 helo=am1outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VEaVB-0002UI-Df
 for linux-mtd@lists.infradead.org; Wed, 28 Aug 2013 07:49:18 +0000
Message-ID: <521DABB1.1080900@freescale.com>
Date: Wed, 28 Aug 2013 15:50:09 +0800
From: Huang Shijie <b32955@freescale.com>
MIME-Version: 1.0
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH v3 06/10] mtd: fix the wrong mtd->type for nand chip
References: <1377509808-29363-1-git-send-email-b32955@freescale.com>
 <1377509808-29363-7-git-send-email-b32955@freescale.com>
 <521D69B6.7070504@gmail.com> <521D9FCC.5010104@freescale.com>
 <521DA6B3.9080003@gmail.com>
In-Reply-To: <521DA6B3.9080003@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

=E4=BA=8E 2013=E5=B9=B408=E6=9C=8828=E6=97=A5 15:28, Brian Norris =E5=86=99=
=E9=81=93:
> All you've shown is the breakage, not the reason for exposing=20
> MTD_MLCNANFLASH. There's a difference between MTD_MLCNANDFLASH being=20
> in the mtd-abi.h header and actually using it in a driver (and=20
> documenting it, and giving it a new sysfs string).
>


Just as you said belowing, the app may calls the MEMGETINFO get the nand=20
type(SLC OR MLC).
So after this patch, the app will get the MTD_MLCNANDFLASH type for MLC=20
which will is the breakage.

Are'nt the reason for exposing the MTD_MLCNANDFLASH? :(

> There is an alternative: that we don't pass MTD_MLCNANDFLASH through=20
> to user-space (we intercept it and change it to MTD_NANDFLASH in=20
> ioctl(MEMGETINFO)), and it just appears as "nand" in the sysfs 'type'=20
> entry. I'm not saying we should do that--I think it's useful to know=20
> SLC vs. MLC in user-space--but I am saying that we need a proper=20
> justification. So far I'm the only one who has explained why=20
> user-space needs this...
You concern is that exposing the MTD_MLCNANDFLASH may breaks mtd-utils=20
or other app tools.

So you suggest to hack the IOCTL(MEMGETINFO) to avoid any changes of the=20
apps?

yes, we can use this way to avoid changing the apps, but the side-effect=20
is the mtd-utils can not get the
right SLC/MLC info.  If we does do the hack code to the ioctrl, I think=20
some one will try to fix the hack code in the future.

thanks
Huang Shijie
