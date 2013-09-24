Received: from co9ehsobe004.messaging.microsoft.com ([207.46.163.27]
 helo=co9outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VOQ6x-0002sK-Uu
 for linux-mtd@lists.infradead.org; Tue, 24 Sep 2013 10:44:56 +0000
Message-ID: <52416D88.6030906@freescale.com>
Date: Tue, 24 Sep 2013 18:46:32 +0800
From: Huang Shijie <b32955@freescale.com>
MIME-Version: 1.0
To: Marek Vasut <marex@denx.de>
Subject: Re: gpmi-nand driver and jffs2 support
References: <522062B4.4080709@digi.com> <201309241150.09313.marex@denx.de>
In-Reply-To: <201309241150.09313.marex@denx.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Cc: "fabio.estevam@freescale.com" <fabio.estevam@freescale.com>,
 Hector Palacios <hector.palacios@digi.com>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

=E4=BA=8E 2013=E5=B9=B409=E6=9C=8824=E6=97=A5 17:50, Marek Vasut =E5=86=99=
=E9=81=93:
> Hello Huang,
>
> Can you please explain what is the exact difference between the NAND la=
yout when
> using JFFS2 in FSL 2.6.35 and in mainline with your patches ?
In FSL 2.6.35, there are some free space in the OOB;
while in mainline we use all the free space in the OOB.
> Is there any way to mount JFFS2 written with FSL 2.6.35 on current main=
line?
> Thus far, neither me nor Hector were able to mount such partition with =
the same
> result.
The gpmi driver in FSL 2.6.35 is different from the mainline.
The two drivers are not compatible to each other.

thanks
Huang Shijie

> Best regards,
> Marek Vasut
>
