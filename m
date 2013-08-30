Received: from mail-db8lp0184.outbound.messaging.microsoft.com
 ([213.199.154.184] helo=db8outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VFLPP-00011y-4c
 for linux-mtd@lists.infradead.org; Fri, 30 Aug 2013 09:54:27 +0000
Message-ID: <52206C05.8020701@freescale.com>
Date: Fri, 30 Aug 2013 17:55:17 +0800
From: Huang Shijie <b32955@freescale.com>
MIME-Version: 1.0
To: Hector Palacios <hector.palacios@digi.com>
Subject: Re: gpmi-nand driver and jffs2 support
References: <522062B4.4080709@digi.com>
In-Reply-To: <522062B4.4080709@digi.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Cc: "fabio.estevam@freescale.com" <fabio.estevam@freescale.com>,
 Marek Vasut <marex@denx.de>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

=E4=BA=8E 2013=E5=B9=B408=E6=9C=8830=E6=97=A5 17:15, Hector Palacios =E5=86=
=99=E9=81=93:
> Hello,
>
> Working on my custom platform based on i.MX28 (and also with the=20
> MX28EVK) I checked that I cannot mount JFFS2 nand partitions because=20
> I'm getting this error:
>
> jffs2: inconsistent device description
>
> which seems to have to do with the OOB area of the NAND.
> I saw patchset [1] from Huang Shijie which seems to be related to the=20
> issue. I just wanted to confirm if other people has the same problem=20
> and if the patchset really aims to solve this, or mine is a different=20
> issue.
>
yes, this patch set aims to solve this.

You can try the SLC on the imx28.

I only tested the SLC On the imx6q.

thanks
Huang Shijie
