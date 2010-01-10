Received: from mail-fx0-f222.google.com ([209.85.220.222])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NTtj6-0001Y1-6h
	for linux-mtd@lists.infradead.org; Sun, 10 Jan 2010 09:04:53 +0000
Received: by fxm22 with SMTP id 22so23089107fxm.2
	for <linux-mtd@lists.infradead.org>;
	Sun, 10 Jan 2010 01:04:47 -0800 (PST)
Subject: Re: [PATCH] add pismo support
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Russell King - ARM Linux <linux@arm.linux.org.uk>
In-Reply-To: <20091218111630.GA32469@n2100.arm.linux.org.uk>
References: <20091129145623.GD11445@n2100.arm.linux.org.uk>
	<8bd0f97a0911290712y298a530fwc6c1ab1c2bcb020b@mail.gmail.com>
	<20091129152351.GE11445@n2100.arm.linux.org.uk>
	<20091218111630.GA32469@n2100.arm.linux.org.uk>
Content-Type: text/plain; charset="UTF-8"
Date: Sun, 10 Jan 2010 11:04:44 +0200
Message-Id: <1263114284.7315.134.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: 'David Woodhouse' <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
	Mike Frysinger <vapier.adi@gmail.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2009-12-18 at 11:16 +0000, Russell King - ARM Linux wrote:
> Ping.

I do not know how this happened, but your patch was picked up, but
somehow screwed up. Only the Makefile part was taken for some reason,
see commit 7cb777a3d71f9d1f7eb149c7a504d21f24219ae8:

commit 7cb777a3d71f9d1f7eb149c7a504d21f24219ae8
Author: Russell King - ARM Linux <linux@arm.linux.org.uk>
Date:   Sun Nov 29 15:23:51 2009 +0000

    mtd: add ARM pismo support

    The following patch adds support for PISMO modules found on ARM Ltd
    development platforms.  These are MTD modules, and can have a
    selection of SRAM, flash or DOC devices as described by an on-board
    I2C EEPROM.

    We support SRAM and NOR flash devices only by registering appropriate
    conventional MTD platform devices as children of the 'pismo' device.

    Signed-off-by: Russell King <rmk+kernel@arm.linux.org.uk>
    Signed-off-by: David Woodhouse <David.Woodhouse@intel.com>

diff --git a/drivers/mtd/maps/Makefile b/drivers/mtd/maps/Makefile
index 34f3cdd..3078d6d 100644
--- a/drivers/mtd/maps/Makefile
+++ b/drivers/mtd/maps/Makefile
@@ -24,6 +24,7 @@ obj-$(CONFIG_MTD_CEIVA)               += ceiva.o
 obj-$(CONFIG_MTD_OCTAGON)      += octagon-5066.o
 obj-$(CONFIG_MTD_PHYSMAP)      += physmap.o
 obj-$(CONFIG_MTD_PHYSMAP_OF)   += physmap_of.o
+obj-$(CONFIG_MTD_PISMO)                += pismo.o
 obj-$(CONFIG_MTD_PMC_MSP_EVM)   += pmcmsp-flash.o
 obj-$(CONFIG_MTD_PCMCIA)       += pcmciamtd.o
 obj-$(CONFIG_MTD_RPXLITE)      += rpxlite.o

David, I think we should fix this.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
