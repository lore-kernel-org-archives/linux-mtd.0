Received: from mail.atmel.fr ([81.80.104.162] helo=atmel-es2.atmel.fr)
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1J4eXC-0005i3-BI
	for linux-mtd@lists.infradead.org; Tue, 18 Dec 2007 15:39:12 +0000
Message-ID: <4767E995.2050100@atmel.com>
Date: Tue, 18 Dec 2007 16:39:01 +0100
From: Nicolas Ferre <nicolas.ferre@atmel.com>
MIME-Version: 1.0
To: Duke <ezbonites@gmail.com>
Subject: Re: SPI Flash
References: <79ac09b60712180702v724b20cetb4070b53466efcba@mail.gmail.com>
In-Reply-To: <79ac09b60712180702v724b20cetb4070b53466efcba@mail.gmail.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Duke :
> Hi all,
> Has anyone use ST's SPI flash and Atmels SPI DataFlash suscessfully?

Atmel DataFlash are working on Linux with this configuration in your 
.config :
CONFIG_MTD_DATAFLASH=y

> How does the interface look from userspace? Is it still an mtdblockX
> device or is it a spi device node?

It is seen as a mtd device :
# cat /proc/mtd
dev:    size   erasesize  name
[..]
mtd2: 00840000 00000420 "spi0.0-AT45DB642x"

So you can mount is using mtdblockx interface.

Regards,
-- 
Nicolas Ferre
