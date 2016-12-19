Received: from lelnx194.ext.ti.com ([198.47.27.80])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cIvre-0001GR-6P
 for linux-mtd@lists.infradead.org; Mon, 19 Dec 2016 11:12:19 +0000
Subject: Re: mtd, nand, omap2: how to pass the NAND device name to mtdparts ?
To: "Leto, Enrico" <enrico.leto@siemens.com>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>, Boris Brezillon
 <boris.brezillon@free-electrons.com>, Brian Norris
 <computersforpeace@gmail.com>
References: <87CEE11E4E15344BAFE0FAC01C1671FB244857@DEFTHW99EI1MSX.ww902.siemens.net>
From: Roger Quadros <rogerq@ti.com>
Message-ID: <093f00e2-cd63-eee0-59a7-1548bc9ec723@ti.com>
Date: Mon, 19 Dec 2016 13:11:48 +0200
MIME-Version: 1.0
In-Reply-To: <87CEE11E4E15344BAFE0FAC01C1671FB244857@DEFTHW99EI1MSX.ww902.siemens.net>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

On 19/12/16 11:30, Leto, Enrico wrote:
> Hello All,
> 
> I'm trying to port some projects to kernel 4.4. It crashes because the driver name given by mtdparts (omap2-nand.0) is no more accepted. It's running fine if I replace it with the device name (e.g. S34ML04G1).

What crashes? Is it a user space application? If it is then it shouldn't be
depending on the platform device name for anything.

The mtd_dev_info has the mtd device name but I don't think it contains
the chip name. Rather it will contain MTD type and partition name.

The chip names are cryptic and mean nothing to user space. Why do you
want user space to depend on chip names?

> 
> We use different NANDs from different manufacturers. I'm searching for a convenient solution to pass the device name to mtdparts.
> 
> Should I read the device name from u-boot and to pass it to mtdparts?

Kernel can also read the chip model so we don't need to depend on u-boot.

> Or some other suggestion or recommendation how to do that ?

As the kernel mtd driver (nand/spi/etc) already knows this information, it is
a matter of just providing it to userspace. Maybe adding another sysfs parameter
like modelname or something will do.

But as this was not yet done there might be a good reason why the model name was
not provided to user space. Maybe Brian/Boris can comment.

cheers,
-roger
