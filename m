Received: from smtp3-g21.free.fr ([212.27.42.3])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1eMK1n-0003Kw-Pb
 for linux-mtd@lists.infradead.org; Tue, 05 Dec 2017 20:41:21 +0000
Subject: Re: [PATCHv2 0/2] mtd: m25p80: restore the addressing mode when stop
 using the flash
To: Zhiqiang Hou <Zhiqiang.Hou@nxp.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, computersforpeace@gmail.com,
 dwmw2@infradead.org, boris.brezillon@free-electrons.com,
 marek.vasut@gmail.com, richard@nod.at
References: <20171205053322.35823-1-Zhiqiang.Hou@nxp.com>
From: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
Message-ID: <0b8fae88-cff4-41ac-2613-09bb671ec070@wedev4u.fr>
Date: Tue, 5 Dec 2017 21:40:53 +0100
MIME-Version: 1.0
In-Reply-To: <20171205053322.35823-1-Zhiqiang.Hou@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Hou,

Le 05/12/2017 à 06:33, Zhiqiang Hou a écrit :
> From: Hou Zhiqiang <Zhiqiang.Hou@nxp.com>
> 
> To be compatible with legacy device, reset the addressing mode
> to the default mode. Such as Freescale eSPI boot, it copies the
> images from SPI flash without firing a reset signal previously,
> so the reboot command will fail without reseting the addressing
> mode of SPI flash.
>

You should put this in one of the commit messages so it explains which
issue is fixed by your patches.

Otherwise, your series looks good to me :)

Best regards,

Cyrille

> Hou Zhiqiang (2):
>   mtd: spi-nor: add an API to restore the status of SPI flash chip
>   mtd: m25p80: restore the status of SPI flash when stop using it
> 
>  Documentation/mtd/spi-nor.txt |  3 +++
>  drivers/mtd/devices/m25p80.c  |  9 +++++++++
>  drivers/mtd/spi-nor/spi-nor.c | 10 ++++++++++
>  include/linux/mtd/spi-nor.h   |  6 ++++++
>  4 files changed, 28 insertions(+)
> 
