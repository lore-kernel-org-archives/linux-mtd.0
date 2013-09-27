Received: from co9ehsobe005.messaging.microsoft.com ([207.46.163.28]
 helo=co9outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VPNwp-0003JQ-93
 for linux-mtd@lists.infradead.org; Fri, 27 Sep 2013 02:38:27 +0000
Message-ID: <5244F003.6040502@freescale.com>
Date: Fri, 27 Sep 2013 10:40:03 +0800
From: Huang Shijie <b32955@freescale.com>
MIME-Version: 1.0
To: Sourav Poddar <sourav.poddar@ti.com>
Subject: Re: [PATCHv2] drivers: mtd: devices: Add quad read support.
References: <1380191565-28640-1-git-send-email-sourav.poddar@ti.com>
 <1380193243.28494.51.camel@i7.infradead.org> <524418AF.3030306@ti.com>
In-Reply-To: <524418AF.3030306@ti.com>
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

=E4=BA=8E 2013=E5=B9=B409=E6=9C=8826=E6=97=A5 19:21, Sourav Poddar =E5=86=
=99=E9=81=93:
> If the pupose of LUT is to just set the dummy cycles, and vf610-twr
> hardware state machine does not have have any other dependency
> on LUT, this patch should work.
Hi Sourav & David:

    The key issue about the vf610-twr is that:
    [0] Use the LUT makes the Quadspi driver more efficiency.
    [1] the vf610-twr needs to know the SPI NOR commands for Page Program=
.
        Why? because the driver can not change the size of write-buffer=20
from 256bytes to the 64byte(TXFIFO SIZE).
    [2] the dummy and other things.

Mark said the Quadspi is not a SPI controller, instead it is a SPI NOR=20
controller, and Mark suggested me
  to rewrite the m25p80.c for the Quadspi.

thanks
Huang Shijie
