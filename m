Received: from mail-db8lp0184.outbound.messaging.microsoft.com
 ([213.199.154.184] helo=db8outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VPS5x-0000Z5-66
 for linux-mtd@lists.infradead.org; Fri, 27 Sep 2013 07:04:10 +0000
Message-ID: <52452E4F.6030306@freescale.com>
Date: Fri, 27 Sep 2013 15:05:51 +0800
From: Huang Shijie <b32955@freescale.com>
MIME-Version: 1.0
To: Sourav Poddar <sourav.poddar@ti.com>
Subject: Re: [PATCHv2] drivers: mtd: devices: Add quad read support.
References: <1380191565-28640-1-git-send-email-sourav.poddar@ti.com>
 <1380193243.28494.51.camel@i7.infradead.org> <524418AF.3030306@ti.com>
 <5244F003.6040502@freescale.com> <52451D85.90404@ti.com>
 <524522A7.2090202@freescale.com> <5245256F.1060407@ti.com>
In-Reply-To: <5245256F.1060407@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Cc: artem.bityutskiy@linux.intel.com, balbi@ti.com, broonie@kernel.org,
 linux-mtd@lists.infradead.org, computersforpeace@gmail.com,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

=E4=BA=8E 2013=E5=B9=B409=E6=9C=8827=E6=97=A5 14:27, Sourav Poddar =E5=86=
=99=E9=81=93:
> hmm..I think thats should be handle in your controller by checking=20
> t->tx_buf and see what command is used.=20
Just as Mark ever said:
    Parsing out the command makes the QuadSPI driver looks like a SPI=20
NOR driver, not a SPI driver.
    And that's why i need to rewrite the m25p80 code.


Btw: i do not object your patch, i hope it can be merged as soon as=20
possible.

thanks
Huang Shijie
