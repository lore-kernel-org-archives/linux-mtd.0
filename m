Received: from mail-db9lp0253.outbound.messaging.microsoft.com
 ([213.199.154.253] helo=db9outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VGg06-0003bo-4K
 for linux-mtd@lists.infradead.org; Tue, 03 Sep 2013 02:05:50 +0000
Message-ID: <52254432.7080502@freescale.com>
Date: Tue, 3 Sep 2013 10:06:42 +0800
From: Huang Shijie <b32955@freescale.com>
MIME-Version: 1.0
To: Marek Vasut <marex@denx.de>
Subject: Re: gpmi-nand driver and jffs2 support
References: <522062B4.4080709@digi.com> <52246421.1020900@digi.com>
 <5224670F.6000703@freescale.com> <201309021332.34063.marex@denx.de>
In-Reply-To: <201309021332.34063.marex@denx.de>
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

=E4=BA=8E 2013=E5=B9=B409=E6=9C=8802=E6=97=A5 19:32, Marek Vasut =E5=86=99=
=E9=81=93:
> This makes not much sense to me. If what you claim is true, than JFFS2 =
in U-Boot
> and Linux would be incompatible for all MTD drivers. This would also me=
an that
The jffs2 in uboot and linux is compatible now. But the mtd base code,=20
such as nand_base.c /nand_bbt.c
has changed. And the gpmi for kernel has be changed too.
All these changes are not sync with the uboot yet.

thanks
Huang Shijie
