Received: from mail-db8lp0184.outbound.messaging.microsoft.com
 ([213.199.154.184] helo=db8outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VGRGu-00045s-K3
 for linux-mtd@lists.infradead.org; Mon, 02 Sep 2013 10:22:13 +0000
Message-ID: <5224670F.6000703@freescale.com>
Date: Mon, 2 Sep 2013 18:23:11 +0800
From: Huang Shijie <b32955@freescale.com>
MIME-Version: 1.0
To: Hector Palacios <hector.palacios@digi.com>
Subject: Re: gpmi-nand driver and jffs2 support
References: <522062B4.4080709@digi.com> <52206C05.8020701@freescale.com>
 <5220AB35.9080409@digi.com> <20130831025344.GA9971@gmail.com>
 <5220B8F6.3080405@digi.com> <20130831033438.GA13704@gmail.com>
 <5220C8C4.5010305@digi.com>
 <CAOMZO5CTQZBmvQc4y761kGHWYWRXr7GwVrTuTPE+JU=bmjq62w@mail.gmail.com>
 <5220CB56.7040505@digi.com> <20130831133728.GA22069@gmail.com>
 <52244886.8060205@digi.com> <52244B22.3020605@freescale.com>
 <52244F85.4030904@digi.com> <52245171.3050900@freescale.com>
 <52246421.1020900@digi.com>
In-Reply-To: <52246421.1020900@digi.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Cc: "fabio.estevam@freescale.com" <fabio.estevam@freescale.com>,
 Marek Vasut <marex@denx.de>, Huang Shijie <shijie8@gmail.com>,
 "u-boot@lists.denx.de" <u-boot@lists.denx.de>,
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

=E4=BA=8E 2013=E5=B9=B409=E6=9C=8802=E6=97=A5 18:10, Hector Palacios =E5=86=
=99=E9=81=93:
> So does this mean that U-Boot is now unable to properly write a JFFS2=20
> partition for it to be understood by the linux-next=20
For the gpmi nand controller, the uboot is not proper to write a jffs2 no=
w.
> kernel? What is exactly the difference? Does it only affect Freescale=20
> NAND controllers?
I think there are many difference. Just diff the nand_base.c, you can=20
see there are many patches merged in
the kernel's mtd code, but not exit in the uboot's mtd code.


AFAIK, only the gpmi is affected now.

thanks
Huang Shijie
