Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fIbqB-0008RW-Ej
 for linux-mtd@lists.infradead.org; Tue, 15 May 2018 15:26:17 +0000
Date: Tue, 15 May 2018 17:25:51 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Xiangsheng Hou <xiangsheng.hou@mediatek.com>
Cc: <linux-mtd@lists.infradead.org>, <srv_heupstream@mediatek.com>,
 <guochun.mao@mediatek.com>, <benliang.zhao@mediatek.com>,
 <bayi.cheng@mediatek.com>, <dandan.he@mediatek.com>
Subject: Re: Some questions about the spi mem framework
Message-ID: <20180515172551.1adcf276@bbrezillon>
In-Reply-To: <1526355800.31853.45.camel@mhfsdcap03>
References: <1526355800.31853.45.camel@mhfsdcap03>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

On Tue, 15 May 2018 11:43:20 +0800
Xiangsheng Hou <xiangsheng.hou@mediatek.com> wrote:

> Hello Boris,
> 
> I have seen you are working on extend the framework to generically
> support spi memory devices.
> And, I am working on upstream SPI Nand driver of Mediatek SPI NAND
> controller based on your branch[1].

Great!

> I have some questions need your comment.
> 
> 1) There is a difference between different SPI NAND Flash when using the
> Quad SPI command,for example Macronix,Etron and GigaDevice, 
> Quad SPI commands require the Quad Enable bit in Status Register(B0H) to
> be set.
> However, current spi-mem framework does not have this operation,
> do you have a plan to support it?

I added support for the QE bit in the v7 I sent just a few minutes ago
[1].

> 
> 2) I see that current spi-mem framework doesn't support ECC,
> But we need ECC, and we use Mediatek controller's HW ECC
> instead of spi nand on-chip ECC,
> maybe other companies also have this behavior,
> So the ECC part must be implemented in controller's driver.
> Will you abstract ECC interface in future? 

Well, I added support for on-die ECC in my v7 since all chips seem to
provide this feature. I was initially planning on abstracting ECC
engines, but I decided to go for a simpler approach and only support
on-die ECC. That does not mean we shouldn't work on this "ECC engine
abstraction", just that I wanted to get something out and didn't have
time to spend on this topic.

I'd be happy if someone else could work on that aspect though. BTW, do
you plan to use this engine [2], or is this yet another ECC engine?

> 
> 3) You know, some nand controller need configure their registers when
> getting some information(page size, spare size) of nand flash,
> But the spi-mem framework doesn't has an interface for scanning NAND
> flash, when controller driver initialization.

You seem to mix 2 different things:
- spi-mem: this is generic interface provided by the SPI framework to
  send spi_mem_op. There's nothing NOR or NAND specific in there, and
  I'd like it to stay like that as much as possible
- spinand: this the spi-mem driver that is dealing with SPI NAND
  devices, and this is where all the code related to SPI NAND support
  should end up.

Can you tell me exactly why your SPI controller needs such a detailed
description? Is it able to program/read pages or erase blocks on its
own? Do you have a spec of this controller publicly available?

> Now we have to do the setting in spi_controller_mem_ops->exec_op for
> every operation.

Yes, you do, at least for now.

> Maybe it not an efficient practice.
> Could we supply an interface for controller to scanning NAND Flash when
> in module probe process?

I'm thinking about a direct mapping API that could be used by spi-mem
drivers to directly map portions of the SPI-mem in the CPU address
space, but I don't have code yet. Having a datasheet of your controller
would probably help understanding what your needs are exactly and how
we can expose that through the spi-mem API.


Regards,

Boris

[1]http://patchwork.ozlabs.org/project/linux-mtd/list/?series=44491
[2]https://elixir.bootlin.com/linux/v4.17-rc5/source/drivers/mtd/nand/raw/mtk_ecc.c
