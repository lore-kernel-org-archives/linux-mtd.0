Received: from mail.imc-berlin.de ([217.110.46.186])
	by canuck.infradead.org with esmtp (Exim 4.61 #1 (Red Hat Linux))
	id 1Fc2Kd-0002Dt-K6
	for linux-mtd@lists.infradead.org; Fri, 05 May 2006 11:35:06 -0400
Message-ID: <445B709E.6090008@imc-berlin.de>
Date: Fri, 05 May 2006 17:34:54 +0200
From: Steven Scholz <steven.scholz@imc-berlin.de>
MIME-Version: 1.0
To: Ushit Kumar <ukumar@neomagic.com>
References: <FE01084Ikv3ySjWrywN00012b68@mX1.Myoutlookonline.com>
In-Reply-To: <FE01084Ikv3ySjWrywN00012b68@mX1.Myoutlookonline.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: Probe function not being called
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Ushit,

> I am trying to implement a nor driver for a Intel strata flash chip on Linux
> 2.6.14. My problem is that the driver code is not calling the probe
> function. My declarations are as follows:
> 
> static struct device_driver mm6p_flash_driver = {
>         .name           = "mm6p_flash",
>         .bus            = &platform_bus_type,
>         .probe          = mm6p_flash_probe,
>         .remove         = mm6p_flash_remove,
> };
> 
> static int __init mm6p_flash_init(void)
> {
>         printk("$$$$$in mm6p_flash_init$$$$$$$$$$\n");
>         return driver_register(&mm6p_flash_driver);
> }

Did you register a suitable platform_device with the same name!?

Something like

struct platform_device foo_device = {
        .name           = "mm6p_flash",
        .id             = -1,
        .dev            = {
                                .platform_data          = &foo_data,
        },
        .resource       = foo_resources,
        .num_resources  = ARRAY_SIZE(foo_resources),
};

platform_device_register(&foo_device);

Usually in your board specific startup files.

driver and device are matched by name! So if there's no device "mm6p_flash"
registered, then there's no need to call probe in driver "mm6p_flash".

Ok?

--
Steven
