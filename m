Received: from tx2ehsobe004.messaging.microsoft.com ([65.55.88.14]
	helo=TX2EHSOBE009.bigfish.com)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1PN5NL-00053h-Eh
	for linux-mtd@lists.infradead.org; Mon, 29 Nov 2010 15:10:44 +0000
Message-ID: <4CF3C24E.2060801@freescale.com>
Date: Mon, 29 Nov 2010 13:10:06 -0200
From: Fabio Estevam <fabio.estevam@freescale.com>
MIME-Version: 1.0
To: <dedekind1@gmail.com>
Subject: Re: [PATCH] mtd: mxc_nand: Fix warning on nr_parts unused variable
References: <1290538933-12607-1-git-send-email-fabio.estevam@freescale.com>
	<1291042287.2141.12.camel@koala>
In-Reply-To: <1291042287.2141.12.camel@koala>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Cc: Estevam Fabio-R49496 <r49496@freescale.com>, linux-mtd@lists.infradead.org,
	dwmw2@infradead.org, u.kleine-koenig@pengutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 11/29/2010 12:51 PM, Artem Bityutskiy wrote:
> On Tue, 2010-11-23 at 17:02 -0200, Fabio Estevam wrote:
>  > If CONFIG_MTD_PARTITIONS is not selected, then the following warning
> is generated:
>  >
>  > CC drivers/mtd/nand/mxc_nand.o
>  > drivers/mtd/nand/mxc_nand.c: In function 'mxcnd_probe':
>  > drivers/mtd/nand/mxc_nand.c:1014: warning: unused variable 'nr_parts'
>  >
>  > Fix it by marking nr_parts as __maybe_unused.
>  >
>  > Signed-off-by: Fabio Estevam <fabio.estevam@freescale.com>
>
> I'm curious, do you really use MTD without CONFIG_MTD_PARTITIONS ? Or
> you found just random warning? I'm asking because I believed this config
> option has to be killed, because it causes more harm in form of mess,
> than good.

I was using it without CONFIG_MTD_PARTITIONS because first I was trying 
to get the NAND to be detected only.

> Anyway, putting this to my l2-mtd-2.6.git, thanks.

Thanks,

Fabio Estevam
