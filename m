Received: from mail1.bemta12.messagelabs.com ([216.82.251.9])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VMgsR-0001fP-2a
 for linux-mtd@lists.infradead.org; Thu, 19 Sep 2013 16:14:47 +0000
Message-ID: <523B22D6.8050303@digi.com>
Date: Thu, 19 Sep 2013 18:14:14 +0200
From: Hector Palacios <hector.palacios@digi.com>
MIME-Version: 1.0
To: Marek Vasut <marex@denx.de>
Subject: Re: gpmi-nand driver and jffs2 support
References: <522062B4.4080709@digi.com> <201309151618.52045.marex@denx.de>
 <52366E5B.1010508@freescale.com> <201309191807.21140.marex@denx.de>
In-Reply-To: <201309191807.21140.marex@denx.de>
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Cc: "fabio.estevam@freescale.com" <fabio.estevam@freescale.com>,
 "u-boot@lists.denx.de" <u-boot@lists.denx.de>,
 Fabio Estevam <festevam@gmail.com>, Huang Shijie <b32955@freescale.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "scottwood@freescale.com" <scottwood@freescale.com>,
 Huang Shijie <shijie8@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 09/19/2013 06:07 PM, Marek Vasut wrote:
> Dear Huang Shijie,
>
> Sorry, I think I got lost in the discussion. I will pull out.
>
> btw Hector, I managed to verify JFFS2 mounting doesn't work on 3.10 , now I'm
> trying to backport patches from -next and apply the GPMI NAND patchset, without
> much luck yet.

Oops, sorry, did you mean you were trying to backport them into U-Boot? Then please 
disregards my previous message.


Best regards,
--
Hector Palacios
