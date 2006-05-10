Received: from mx1.myoutlookonline.com ([69.25.74.59])
	by canuck.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1FdhV5-0007bO-Su
	for linux-mtd@lists.infradead.org; Wed, 10 May 2006 01:44:49 -0400
From: "Ushit Kumar" <ukumar@neomagic.com>
To: <linux-mtd@lists.infradead.org>
Date: Wed, 10 May 2006 11:12:35 +0530
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-ID: <FE011ltcNdbUu2o8q3p000014ec@mx1.MyoutlookonlinE.com>
Subject: Getting Erro Message: CFI:Hello Found no mm6p_flash.0 device at
	location zero
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I am trying to write a NOR flash driver for a Arm 926 based SOC.  The code
sequence I am trying to execute is as follows:
        info->map.size          = size;
      info->map.bankwidth     = 4;//plat->width;
      info->map.phys          = res->start;
      info->map.virt          = base;
      info->map.name          = dev->dev.bus_id;
      info->map.set_vpp       = mm6p_flash_set_vpp;
        info->mtd = do_map_probe("cfi_probe", &info->map);
      if (!info->mtd) {
                err = -ENXIO;
                printk("Error do_map_probe\n:");
                goto no_device;
        }

The error message I get is:
"CFI:Hello  Found no mm6p_flash.0 device at location zero". On digging
through the MTD layer, I see that the genprobe_new_chip() call fails.
Unfortunately at this point I am somewhat lost.

Is this a configuration issue, or do I have do to some other setup?

Thanks,

Ushit
