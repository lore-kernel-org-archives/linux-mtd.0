Received: from co1ehsobe004.messaging.microsoft.com ([216.32.180.187]
 helo=co1outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VYoAD-0001mT-R1
 for linux-mtd@lists.infradead.org; Wed, 23 Oct 2013 02:27:15 +0000
Message-ID: <52673487.40908@freescale.com>
Date: Wed, 23 Oct 2013 10:29:27 +0800
From: Huang Shijie <b32955@freescale.com>
MIME-Version: 1.0
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH for mtd-utils 0/4] about the SLC/MLC
References: <1376978317-28010-1-git-send-email-b32955@freescale.com>
 <20131022233349.GR23337@ld-irv-0074.broadcom.com>
In-Reply-To: <20131022233349.GR23337@ld-irv-0074.broadcom.com>
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

=E4=BA=8E 2013=E5=B9=B410=E6=9C=8823=E6=97=A5 07:33, Brian Norris =E5=86=99=
=E9=81=93:
> You're missing flash_erase.c, which still has:
>
> 	isNAND =3D mtd.type =3D=3D MTD_NANDFLASH ? 1 : 0;
I missed it on purpose.

The "isNAND" is used for the jffs2 to write the cleanmarker.

Since the jffs2 does not support the MLC now, the above line is used to=20
check the SLC nand now.
Only the SLC nand can be written with the cleanmarker.

Am i right?

thanks
Huang Shijie
