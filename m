Received: from ch1ehsobe004.messaging.microsoft.com ([216.32.181.184]
 helo=ch1outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Styy7-0007wc-Bx
 for linux-mtd@lists.infradead.org; Wed, 25 Jul 2012 10:37:31 +0000
Message-ID: <500FCCA7.40604@freescale.com>
Date: Wed, 25 Jul 2012 18:38:31 +0800
From: Huang Shijie <b32955@freescale.com>
MIME-Version: 1.0
To: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH 2/2] mtd: nand: Select MXS_DMA for MTD_NAND_GPMI_NAND
References: <1343146515-18578-1-git-send-email-festevam@gmail.com>	<500F8B1A.6070605@freescale.com>
 <CAOMZO5BLFp-FOa4n5HpuA2ug6tbxX9kKq8fUeg5a=ytCFFq3UA@mail.gmail.com>
In-Reply-To: <CAOMZO5BLFp-FOa4n5HpuA2ug6tbxX9kKq8fUeg5a=ytCFFq3UA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Cc: Fabio Estevam <fabio.estevam@freescale.com>,
 Artem.Bityutskiy@linux.intel.com, linux-mtd@lists.infradead.org,
 kernel@pengutronix.de, shawn.guo@linaro.org, dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

=E4=BA=8E 2012=E5=B9=B407=E6=9C=8825=E6=97=A5 18:32, Fabio Estevam =E5=86=
=99=E9=81=93:
> On Wed, Jul 25, 2012 at 2:58 AM, Huang Shijie<b32955@freescale.com>  wr=
ote:
>
>> thanks, but please see this thread.
>>
>> http://comments.gmane.org/gmane.linux.ports.arm.kernel/146232
> Ok, but what is the conclusion on this then? It has been 8 months
> since that thread started and the problem is still present.
>
If we want to fix it, we can add the "depend on MXS-DMA" for gpmi nand.

Huang Shijie
