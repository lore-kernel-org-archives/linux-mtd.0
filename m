Received: from gv-out-0910.google.com ([216.239.58.188])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1Kx4PN-0000Am-Lu
	for linux-mtd@lists.infradead.org; Mon, 03 Nov 2008 18:44:14 +0000
Received: by gv-out-0910.google.com with SMTP id n40so315127gve.5
	for <linux-mtd@lists.infradead.org>;
	Mon, 03 Nov 2008 10:44:09 -0800 (PST)
Subject: Re: FW: How to write rules for mtd based devices
From: Kay Sievers <kay.sievers@vrfy.org>
To: Juergen Beisert <jbe@pengutronix.de>
In-Reply-To: <200811031549.59177.jbe@pengutronix.de>
References: <200811031549.59177.jbe@pengutronix.de>
Content-Type: text/plain
Date: Mon, 03 Nov 2008 19:44:10 +0100
Message-Id: <1225737850.26166.6.camel@linux>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2008-11-03 at 15:49 +0100, Juergen Beisert wrote:
> I discussed this on the udev list:
> 
> ----->8----->8----->8----->8----->8----->8----->8----->8----->8----->8
> 
> has anybody an idea how to write some rules to match devices from the mtd
> framework?
> 
> All I get is:
> ------------------------------------------------------------------
> $ udevadm info -a -p /sys/block/mtdblock5
> 
> Udevinfo starts with the device specified by the devpath and then
> walks up the chain of parent devices. It prints for every device
> found, all possible attributes in the udev rules key format.
> A rule to match, can be composed by the attributes of the device
> and the attributes from one single parent device.
> 
>   looking at device '/devices/virtual/block/mtdblock5':
>     KERNEL=="mtdblock5"
>     SUBSYSTEM=="block"
>     DRIVER==""
>     ATTR{range}=="1"
>     ATTR{removable}=="0"
>     ATTR{ro}=="0"
>     ATTR{size}=="1024"
>     ATTR{capability}=="10"
>     ATTR{stat}=="       0        0        0        0        0        0        0        0        0        0        0"
> ------------------------------------------------------------------
> 
> And its mostly the same for all the other mtdblock devices.
> 
> The other frameworks like SATA and USB providing much more information about
> their bus controllers and connected devices to find adequate matching rules.
> But mtd seems very uncommunicative, or do I query the wrong path to search for
> usefull rules to match?
> 
> ----->8----->8----->8----->8----->8----->8----->8----->8----->8----->8
> 
> "Kay Sievers" <kay.sievers@vrfy.org> aswers:
> 
> ----->8----->8----->8----->8----->8----->8----->8----->8----->8----->8
> >> Seems, there is not much you can do with the current information it
> >> exposes. What is the hardware behind these mtd devices? Are these
> >> devices show up somewhere in /sys/devices/, maybe as platform devices?
> >> Then we could try to make the kernel use these as parents for the
> >> block devices, so the block devices would not be "virtual".
> >
> > MTDs are simple memory devices. Flash (NOR or NAND type) and SRAM for example.
> > They are connected through a simple address/data bus, some also via SPI
> > interface. About each of these devices the kernel knows at least the
> > manufacturer and the device name (for flash memory this info can be
> > autodetected). For the other types mostly a platform structure provides this
> > information. On my ARM (i.MX27 CPU) tree types of memory is available:
> >
> > SRAM:
> > /sys/bus/platform/devices/mtd-ram.0
> >
> > NAND-flash:
> > /sys/bus/platform/devices/mxc_nand.0
> >
> > NOR-flash:
> > /sys/bus/platform/devices/physmap-flash.0
> >
> > Currently the NOR flash is using three partitions so I get:
> >
> > $ ls -l /dev/mtd*
> > crw-rw----    1 root     root      90,   0 Jan  1 00:00 /dev/mtd0
> > crw-rw----    1 root     root      90,   1 Jan  1 00:00 /dev/mtd0ro
> > crw-rw----    1 root     root      90,   2 Jan  1 00:00 /dev/mtd1
> > crw-rw----    1 root     root      90,   3 Jan  1 00:00 /dev/mtd1ro
> > crw-rw----    1 root     root      90,   4 Jan  1 00:00 /dev/mtd2
> > crw-rw----    1 root     root      90,   5 Jan  1 00:00 /dev/mtd2ro
> > crw-rw----    1 root     root      90,   6 Jan  1 00:00 /dev/mtd3
> > crw-rw----    1 root     root      90,   7 Jan  1 00:00 /dev/mtd3ro
> > crw-rw----    1 root     root      90,   8 Jan  1 00:00 /dev/mtd4
> > crw-rw----    1 root     root      90,   9 Jan  1 00:00 /dev/mtd4ro
> > crw-rw----    1 root     root      90,  10 Jan  1 00:00 /dev/mtd5
> > crw-rw----    1 root     root      90,  11 Jan  1 00:00 /dev/mtd5ro
> > brw-rw----    1 root     root      31,   0 Jan  1 00:00 /dev/mtdblock0
> > brw-rw----    1 root     root      31,   1 Jan  1 00:00 /dev/mtdblock1
> > brw-rw----    1 root     root      31,   2 Jan  1 00:00 /dev/mtdblock2
> > brw-rw----    1 root     root      31,   3 Jan  1 00:00 /dev/mtdblock3
> > brw-rw----    1 root     root      31,   4 Jan  1 00:00 /dev/mtdblock4
> > brw-rw----    1 root     root      31,   5 Jan  1 00:00 /dev/mtdblock5
> >
> > mtd*0 ... mtd*3 are the three partitions on the NOR flash (its also the memory
> > to boot from), mtd*4 is the NAND memory, mtd*5 is the SRAM. All I want is to
> > detect the NAND and the SRAM to create special links or node names for these
> > devices to be independent from the partition count of the NOR memory and the
> > changing device node numbers when this count changes.
> 
> It is something that should be changed in mtd. NAND for example
> registers the device in drivers/mtd/nand/mxc_nand.c. Before that, it
> has handled the platform device *pdev.
> 
> We would need to pass the pdev down to the mtd core and set "struct
> gendisk->driverfs_dev" to  &pdev->dev, and the NAND mtd devices would
> show up with a device path like:
>   /sys/devices/platform/mxc_nand.0/block/mtdblock4
> 
> With these devices as parents, you can match on any property or device
> name with usual udev rules.
> ----->8----->8----->8----->8----->8----->8----->8----->8----->8----->8
> 
> Would that be possible to support it in the MTD framework?

You can start with something like this. It should at least show what I
meant above. Be prepared that it may not work at all, I did not even
compile the drivers. :)

Good luck,
Kay


diff --git a/drivers/mtd/maps/physmap.c b/drivers/mtd/maps/physmap.c
index 42d844f..28d701b 100644
--- a/drivers/mtd/maps/physmap.c
+++ b/drivers/mtd/maps/physmap.c
@@ -149,6 +149,7 @@ static int physmap_flash_probe(struct platform_device *dev)
 			devices_found++;
 		}
 		info->mtd[i]->owner = THIS_MODULE;
+		info->mtd[i]->parent = &dev->dev;
 	}
 
 	if (devices_found == 1) {
diff --git a/drivers/mtd/maps/plat-ram.c b/drivers/mtd/maps/plat-ram.c
index e7dd9c8..07a6a69 100644
--- a/drivers/mtd/maps/plat-ram.c
+++ b/drivers/mtd/maps/plat-ram.c
@@ -224,6 +224,7 @@ static int platram_probe(struct platform_device *pdev)
 	}
 
 	info->mtd->owner = THIS_MODULE;
+	info->mtd->parent = &pdev->dev;
 
 	platram_setrw(info, PLATRAM_RW);
 
diff --git a/drivers/mtd/mtd_blkdevs.c b/drivers/mtd/mtd_blkdevs.c
index 1409f01..4f37bbc 100644
--- a/drivers/mtd/mtd_blkdevs.c
+++ b/drivers/mtd/mtd_blkdevs.c
@@ -286,6 +286,7 @@ int add_mtd_blktrans_dev(struct mtd_blktrans_dev *new)
 	gd->private_data = new;
 	new->blkcore_priv = gd;
 	gd->queue = tr->blkcore_priv->rq;
+	gd->driverfs_dev = new->mtd->parent;
 
 	if (new->readonly)
 		set_disk_ro(gd, 1);
diff --git a/drivers/mtd/mtdchar.c b/drivers/mtd/mtdchar.c
index bcffeda..32ad2fe 100644
--- a/drivers/mtd/mtdchar.c
+++ b/drivers/mtd/mtdchar.c
@@ -26,10 +26,10 @@ static void mtd_notify_add(struct mtd_info* mtd)
 	if (!mtd)
 		return;
 
-	device_create(mtd_class, NULL, MKDEV(MTD_CHAR_MAJOR, mtd->index*2),
+	device_create(mtd_class, mtd->parent, MKDEV(MTD_CHAR_MAJOR, mtd->index*2),
 		      NULL, "mtd%d", mtd->index);
 
-	device_create(mtd_class, NULL, MKDEV(MTD_CHAR_MAJOR, mtd->index*2+1),
+	device_create(mtd_class, mtd->parent, MKDEV(MTD_CHAR_MAJOR, mtd->index*2+1),
 		      NULL, "mtd%dro", mtd->index);
 }
 
diff --git a/drivers/mtd/nand/mxc_nand.c b/drivers/mtd/nand/mxc_nand.c
index 21fd4f1..485bee1 100644
--- a/drivers/mtd/nand/mxc_nand.c
+++ b/drivers/mtd/nand/mxc_nand.c
@@ -866,6 +866,7 @@ static int __init mxcnd_probe(struct platform_device *pdev)
 	mtd = &host->mtd;
 	mtd->priv = this;
 	mtd->owner = THIS_MODULE;
+	mtd->parent = &pdev->dev;
 
 	/* 50 us command delay time */
 	this->chip_delay = 5;
diff --git a/include/linux/mtd/mtd.h b/include/linux/mtd/mtd.h
index eae26bb..537f67e 100644
--- a/include/linux/mtd/mtd.h
+++ b/include/linux/mtd/mtd.h
@@ -211,6 +211,7 @@ struct mtd_info {
 	void *priv;
 
 	struct module *owner;
+	struct device *parent;
 	int usecount;
 
 	/* If the driver is something smart, like UBI, it may need to maintain
