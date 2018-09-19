Received: from mo6-p05-ob.smtp.rzone.de ([2a01:238:20a:202:5305::9])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g2WJ4-0008JJ-IE
 for linux-mtd@lists.infradead.org; Wed, 19 Sep 2018 06:49:53 +0000
Subject: Re: Questions about the Freescale/NXP QuadSPI controller
To: Lukasz Majewski <lukma@denx.de>
Cc: Han Xu <han.xu@nxp.com>, Yogesh Narayan Gaur
 <yogeshnarayan.gaur@nxp.com>, "marek.vasut@gmail.com"
 <marek.vasut@gmail.com>, "dwmw2@infradead.org" <dwmw2@infradead.org>,
 "broonie@kernel.org" <broonie@kernel.org>,
 "miquel.raynal@bootlin.com" <miquel.raynal@bootlin.com>,
 "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
 Boris Brezillon <boris.brezillon@bootlin.com>,
 Prabhakar Kushwaha <prabhakar.kushwaha@nxp.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "richard@nod.at" <richard@nod.at>, Fabio Estevam <fabio.estevam@nxp.com>,
 David Wolfe <david.wolfe@nxp.com>,
 "computersforpeace@gmail.com" <computersforpeace@gmail.com>,
 "shawnguo@kernel.org" <shawnguo@kernel.org>
References: <1530789310-16254-1-git-send-email-frieder.schrempf@exceet.de>
 <1530789310-16254-4-git-send-email-frieder.schrempf@exceet.de>
 <7e95c72c-2cd1-f138-a687-6cca362c95b7@exceet.de>
 <63462dd2-b61b-6522-0619-0cdc89148193@exceet.de>
 <VI1PR0401MB2221D006E89A06B7D343A5E5972C0@VI1PR0401MB2221.eurprd04.prod.outlook.com>
 <20180804153728.0a99d28f@bbrezillon>
 <121b89ad-712f-166b-83d2-6b0f1bdc750e@exceet.de>
 <AM6PR04MB4967E918792A1C0D7D3D5C18971B0@AM6PR04MB4967.eurprd04.prod.outlook.com>
 <b2a29f52-f658-d92c-7b42-3096af6449f1@exceet.de>
 <AM6PR04MB4967C4B3F97004C41220E310971B0@AM6PR04MB4967.eurprd04.prod.outlook.com>
 <09d39759-390a-bca3-caeb-2ee8ddb29443@exceet.de>
 <20180919004247.60c6099a@jawa>
From: Frieder Schrempf <frieder.schrempf@exceet.de>
Message-ID: <e76062cb-f703-2830-8074-d1a812dc14ce@exceet.de>
Date: Wed, 19 Sep 2018 08:49:14 +0200
MIME-Version: 1.0
In-Reply-To: <20180919004247.60c6099a@jawa>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Lukasz,

On 19.09.2018 00:42, Lukasz Majewski wrote:
> Dear All,
> 
> Maybe I do jump a bit off topic here, but...
> 
> I've read through the following thread:
> https://patchwork.ozlabs.org/patch/939885/
> 
> And it mentions some issues with reading AHB content (buffers) in
> fsl-quadspi.c driver discovered when new QuadSPI driver was developed.

The only setup with two chips that is known to be problematic with the 
new driver, is when both chips are connected to the same bus (e.g. 
QSPIA) using separate chip selects.

Does your board use this kind of setup, or are the two chips connected 
two different buses (QSPIA and QSPIB)?

Have you tested the new driver? It would be great to receive some more 
feedback.

> I do have a setup with qspi0 having two SPI memories connected (2x16
> MiB), and I'm wondering if anybody has some more info regarding:
> 
> (What's more is that there is a bug in
>   * the "IP Command Read" in the Vybrid.) found here:
> https://elixir.bootlin.com/linux/v4.19-rc4/source/drivers/mtd/spi-nor/fsl-quadspi.c#L671
> 
> I've googled for some errata or known issues for vybryd's QSPI IP block
> (vf610) but without luck so far ...

Unfortunately I don't know the background for this comment. Is your 
board using VF610? Do you experience problems?

Regards,
Frieder
