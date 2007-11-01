Received: from [85.21.88.6] (helo=buildserver.ru.mvista.com)
	by bombadil.infradead.org with esmtp (Exim 4.66 #1 (Red Hat Linux))
	id 1Ina9W-00048f-CQ
	for linux-mtd@lists.infradead.org; Thu, 01 Nov 2007 09:32:13 -0400
Received: from [192.168.12.21] (unknown [10.149.0.1])
	by buildserver.ru.mvista.com (Postfix) with ESMTP id 01B678817
	for <linux-mtd@lists.infradead.org>;
	Thu,  1 Nov 2007 17:32:05 +0400 (SAMT)
Message-ID: <4729D50C.6030500@ru.mvista.com>
Date: Thu, 01 Nov 2007 16:30:52 +0300
From: Valentine Barshak <vbarshak@ru.mvista.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: MTD NDFC questions.
Content-Type: text/plain; charset=KOI8-R; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I couldn't find any ndfc platform deivce users in arch/ppc and attempted 
to understand how ndfc works and how to properly initialize platform 
device structures looking at the ndfc driver code, but that didn't help 
much, just arose new questions, so I decided to ask them here. I'd 
really appreciate if anyone could help me.

1.
[snip]
struct ndfc_nand_mtd {
	struct mtd_info			mtd;
	struct nand_chip		chip;
	struct platform_nand_chip	*pl_chip;
};

static struct ndfc_nand_mtd ndfc_mtd[NDFC_MAX_BANKS];
[snip]

Why do we use a static array of chip device descriptors here instead of
dynamically allocating them? A lot of boards have only 1 chip attached.


2.
[snip]
struct ndfc_controller {
	void __iomem		*ndfcbase;
	struct nand_hw_control	ndfc_control;
	atomic_t		childs_active;
};

static struct ndfc_controller ndfc_ctrl;
[snip]
Static structure again. Why?


3.
[snip]
static int ndfc_chip_probe(struct platform_device *pdev)
{
...
	if (nc->chip_offset >= NDFC_MAX_BANKS || nc->nr_chips > NDFC_MAX_BANKS)
		return -EINVAL;

	/* Set the bank settings */
	__raw_writel(settings->bank_settings,
		     ndfc->ndfcbase + NDFC_BCFG0 + (nc->chip_offset << 2));
...
	/* Scan for chips */
	if (nand_scan(&nandmtd->mtd, nc->nr_chips)) {
		nandmtd->pl_chip = NULL;
		return -ENODEV;
	}
[snip]

We write bank settings for a single chip here, but scan for nc->nr_chips.
Do we need other identical chip platform devices to be properly 
initialized prior to probing the last device in this case?
Looks like each chip is handled as a separate independent device.
How do we ensure the proper initialization order here and know that 
other chips are successfully initialized?


4.
[snip]
static int ndfc_chip_remove(struct platform_device *pdev)
{
	return 0;
}
[snip]

Why don't we delete previously created mtd devices here?
Is there any reason to do nothing at device removal?


5.
[snip]
static int ndfc_nand_remove(struct platform_device *pdev)
{
	struct ndfc_controller *ndfc = platform_get_drvdata(pdev);

	if (atomic_read(&ndfc->childs_active))
		return -EBUSY;

[snip]

The childs_active is never decremented. So, basically the ndfc device 
can never be removed. Is there a good reason to keep it no matter what, 
even if the user tries to remove the driver module?


6.
[snip]
static int __init ndfc_nand_init(void)
{
	int ret;

	spin_lock_init(&ndfc_ctrl.ndfc_control.lock);
	init_waitqueue_head(&ndfc_ctrl.ndfc_control.wq);

[snip]

Why do we need to initialize the spinlock and waitqueue twice?
This is also done in the ndfc_nand_probe() function.

[snip]

	ret = platform_driver_register(&ndfc_nand_driver);
	if (!ret)
		ret = platform_driver_register(&ndfc_chip_driver);
	return ret;
}
[snip]

Don't we need to also unregister ndfc_nand_driver in case
ndfc_chip_driver fails to register?
How do we guarantee that ndfc_chip devices are probed only
after successful ndfc_nand controller initialization?
Setting dev.parent for ndfc chip platform device structures doesn't help.
Why do we need 2 separate platform drivers for ndfc and nand chips 
attached to it?

If I need to concatenate several different chips, how do I do that, 
since all chips are handled as separate platform devices?
Wouldn't it be easier to handle ndfc and chips as a whole, especially 
since one is useless without another?


Thanks,
Valentine.
