Received: from mail-db8lp0187.outbound.messaging.microsoft.com
 ([213.199.154.187] helo=db8outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VH2nS-0000o1-SE
 for linux-mtd@lists.infradead.org; Wed, 04 Sep 2013 02:26:19 +0000
Message-ID: <52269A56.4030808@freescale.com>
Date: Wed, 4 Sep 2013 10:26:30 +0800
From: Huang Shijie <b32955@freescale.com>
MIME-Version: 1.0
To: Marek Vasut <marex@denx.de>
Subject: Re: gpmi-nand driver and jffs2 support
References: <522062B4.4080709@digi.com> <201309021332.34063.marex@denx.de>
 <52254432.7080502@freescale.com> <201309031353.18964.marex@denx.de>
In-Reply-To: <201309031353.18964.marex@denx.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Cc: "fabio.estevam@freescale.com" <fabio.estevam@freescale.com>,
 Huang Shijie <shijie8@gmail.com>,
 "u-boot@lists.denx.de" <u-boot@lists.denx.de>,
 Hector Palacios <hector.palacios@digi.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 scottwood@freescale.com, Fabio Estevam <festevam@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

=E4=BA=8E 2013=E5=B9=B409=E6=9C=8803=E6=97=A5 19:53, Marek Vasut =E5=86=99=
=E9=81=93:
> questions comes to mind. Is JFFS2 support in Linux 3.7 not compatible w=
ith JFFS2
> in Linux -next? Is this true? Can I not mount JFFS2 partition under Lin=
ux-next
The jffs2 does not changed since the linux 3.7.
All the changes happened in the drivers and mtd code.

The gpmi does not support the jffs2 all the time. Only apply the slc/mlc=20
patch set,
the gpmi can support the jffs2.

So the jffs2 support is compatiable all the time.


> that I could mount with Linux 3.7 and earlier?
I think the mount can be succeeded.

thanks
Huang Shijie
