Received: from co1ehsobe006.messaging.microsoft.com ([216.32.180.189]
 helo=co1outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TL5Ir-0001pX-3Z
 for linux-mtd@lists.infradead.org; Mon, 08 Oct 2012 04:50:54 +0000
Message-ID: <50725C40.6060102@freescale.com>
Date: Mon, 8 Oct 2012 12:53:20 +0800
From: Huang Shijie <b32955@freescale.com>
MIME-Version: 1.0
To: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH] nand: gpmi-nand: Fix clock registration
References: <1348425062-17427-1-git-send-email-festevam@gmail.com>	<50723E5C.3020403@freescale.com>	<CAOMZO5AE22Kscv8JAxiazzR5NSvEH+qs4QxBC6aEQqi3ZCpCpg@mail.gmail.com>	<5072496A.3040205@freescale.com>
 <CAOMZO5B4c+qaKrz2skB_vGCRBW-9mUhhOaCUtiEqtv36V8i5eQ@mail.gmail.com>
In-Reply-To: <CAOMZO5B4c+qaKrz2skB_vGCRBW-9mUhhOaCUtiEqtv36V8i5eQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Cc: marex@denx.de, artem.bityutskiy@linux.intel.com, shawn.guo@linaro.org,
 linux-mtd@lists.infradead.org, Fabio Estevam <fabio.estevam@freescale.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

=E4=BA=8E 2012=E5=B9=B410=E6=9C=8808=E6=97=A5 11:31, Fabio Estevam =E5=86=
=99=E9=81=93:
> On Mon, Oct 8, 2012 at 12:32 AM, Huang Shijie<b32955@freescale.com>  wr=
ote:
>> This patch is really not needed.
>>
>> The clk_get() can get the right clock in the mx23/mx28. I tested them.
> Please test it on linux-next.
>
> gpmi nand can not event be probed.
ok.

I will test the linux-next as soon as possible.


BR
Huang Shijie
> Regards,
>
> Fabio Estevam
>
