Received: from comal.ext.ti.com ([198.47.26.152])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VT8xL-0001IX-JZ
 for linux-mtd@lists.infradead.org; Mon, 07 Oct 2013 11:26:31 +0000
Message-ID: <52529A4B.6040501@ti.com>
Date: Mon, 7 Oct 2013 16:56:03 +0530
From: Sourav Poddar <sourav.poddar@ti.com>
MIME-Version: 1.0
To: Mark Brown <broonie@kernel.org>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>
Subject: Memory mapped support for SPI flash ?
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I wanted to know whether there is any framework or support available
in mtd which helps in doing a memory mapped read for a serial NOR flash 
driver.

Requirement is something like this..

My controller supports memory mapped read, but needs to switch to
memory mapped port to read from it and once the
read is done switch back again to normal configuration mode.

So, my idea is that spi controller need to be communicated from  the mtd 
layer
that the current read is memory mapped read, so the controller does
whatever settings need to be done and then does the memory mapped read and
switch back to configuration mode.

I see some drivers under drivers/mtd/maps/* , point and unpoint 
functions, but are they
applicable for serial NOR flashes? Or there is any other stuff available 
which I can use
for my usecase?

I was thing of using it in a way that dual/quad support is used. I mean 
to add "memory map"
as a mode and pass it as a transfer parameter(from the mtd layer) to 
indicate that the current transfer
is a memory map read and then do a memcopy in the low level driver function.

Thanks in advance,
Sourav
