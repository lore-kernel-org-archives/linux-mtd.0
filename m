Received: from comal.ext.ti.com ([198.47.26.152])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UcE77-0004Oa-AB
 for linux-mtd@lists.infradead.org; Tue, 14 May 2013 12:13:54 +0000
Message-ID: <51922A5A.9040501@ti.com>
Date: Tue, 14 May 2013 17:43:14 +0530
From: Sourav Poddar <sourav.poddar@ti.com>
MIME-Version: 1.0
To: <spi-devel-general@lists.sourceforge.net>
Subject: Re: Qspi flash device  driver - framework to use?
References: <518CD57E.2020705@ti.com>
In-Reply-To: <518CD57E.2020705@ti.com>
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Cc: Matt Porter <mporter@ti.com>, Felipe Balbi <balbi@ti.com>,
 grant.likely@secretlab.ca, broonie@kernel.org,
 Santosh Shilimkar <santosh.shilimkar@ti.com>, Pekon Gupta <pekon@ti.com>,
 linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

+ linux-mtd list
On Friday 10 May 2013 04:39 PM, Sourav Poddar wrote:
> Hi,
>
> I am trying to work out a way to write a QSPI serial flash interface 
> driver
> for my IP. The idea is to have an execute in place usecase.
>
> We have a configuration port from which the spi core can be configured 
> and a
> memory mapped port from which the data can be read/write from/to serial
> flash device.
>
> As far as I can understand, I dont think it will be correct/possible 
> to write this
> driver making use of the generice spi framework(drivers/spi/spi.c) as 
> that
> framework is more suited for generic spi use case, where in you can load
> your Image from external SPI devices into DDR and then execute. ?
>
> But for cases, where qspi is connected to serial flash device (XIP is 
> needed) what
> we might need is some framework which just passes the buffers and its 
> length to
> our driver which in turn will configure the qspi to initiate the 
> transfer.
>
> What can be the best framework to use for the above use case?
>
> I saw a device(m25p80) using mtd framework for some similar usecase.
> Is it the mtd which should be used? OR will it be a
> good idea to go for a generic qspi framework(drivers/qspi) which can be
> used by qspi flash devices having a memory mapped interface. ?
>
> Thanks,
> Sourav
