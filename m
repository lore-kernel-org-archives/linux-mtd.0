Received: from top.free-electrons.com ([176.31.233.9]
 helo=mail.free-electrons.com)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1W8qbi-0003ls-EQ
 for linux-mtd@lists.infradead.org; Thu, 30 Jan 2014 12:20:34 +0000
Date: Thu, 30 Jan 2014 09:20:25 -0300
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH 2/2] mtd: nand: don't use read_buf for 8-bit ONFI transfers
Message-ID: <20140130122024.GB11285@localhost>
References: <1391033909-6563-1-git-send-email-computersforpeace@gmail.com>
 <1391033909-6563-2-git-send-email-computersforpeace@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1391033909-6563-2-git-send-email-computersforpeace@gmail.com>
Cc: linux-mtd@lists.infradead.org, Pekon Gupta <pekon@ti.com>,
 u.kleine-koenig@pengutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Jan 29, 2014 at 02:18:29PM -0800, Brian Norris wrote:
> Use a repeated read_byte() instead of read_buf(), since for x16 buswidth
> devices, we need to avoid the upper I/O[16:9] bits. See the following
> commit for reference:
> 
> commit 05f7835975dad6b3b517f9e23415985e648fb875
> Author: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> Date:   Thu Dec 5 22:22:04 2013 +0100
> 
>     mtd: nand: don't use {read,write}_buf for 8-bit transfers
> 
> Now, I think that all barriers to probing ONFI on x16 devices are
> removed, so remove the check from nand_flash_detect_onfi().
> 
> Tested on 8-bit ONFI NAND (Micron MT29F32G08CBADAWP).
> 
> Signed-off-by: Brian Norris <computersforpeace@gmail.com>

Tested-by: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>

FWIW:

* 8-bit device, ONFI-probed
nand: device found, Manufacturer ID: 0x2c, Chip ID: 0xf1
nand: Micron MT29F1G08ABADAH4
nand: 128MiB, SLC, page size: 2048, OOB size: 64

* 16-bit device, ID-probed
nand: device found, Manufacturer ID: 0x2c, Chip ID: 0xcc
nand: Micron NAND 512MiB 3,3V 16-bit
nand: 512MiB, SLC, page size: 2048, OOB size: 64

* 16-bit (same) device, ONFI-probed
nand: device found, Manufacturer ID: 0x2c, Chip ID: 0xcc
nand: Micron MT29F4G16ABADAH4
nand: 512MiB, SLC, page size: 2048, OOB size: 64

-- 
Ezequiel García, Free Electrons
Embedded Linux, Kernel and Android Engineering
http://free-electrons.com
