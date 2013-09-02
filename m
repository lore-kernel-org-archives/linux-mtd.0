Received: from co1ehsobe004.messaging.microsoft.com ([216.32.180.187]
 helo=co1outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VGPpj-0001lD-UG
 for linux-mtd@lists.infradead.org; Mon, 02 Sep 2013 08:50:04 +0000
Message-ID: <52245171.3050900@freescale.com>
Date: Mon, 2 Sep 2013 16:50:57 +0800
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
 <52244F85.4030904@digi.com>
In-Reply-To: <52244F85.4030904@digi.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Cc: "fabio.estevam@freescale.com" <fabio.estevam@freescale.com>,
 Fabio Estevam <festevam@gmail.com>, Marek Vasut <marex@denx.de>,
 Huang Shijie <shijie8@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

=E4=BA=8E 2013=E5=B9=B409=E6=9C=8802=E6=97=A5 16:42, Hector Palacios =E5=86=
=99=E9=81=93:
> I am writing the JFFS2 partition from my custom U-Boot. Do you mean=20
> that they way it writes it could not be compatible=20

The mtd code(as well as the gpmi driver) has merge many patch to the kern=
el,
BUT, the relative patches are not submitted to uboot maillist. So the=20
code is not aligned between the
uboot and the kernel.

thanks
Huang Shijie
