Received: from mail-gx0-f10.google.com ([209.85.217.10])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KqQXF-0006nf-GE
	for linux-mtd@lists.infradead.org; Thu, 16 Oct 2008 10:56:54 +0000
Received: by gxk3 with SMTP id 3so8119048gxk.18
	for <linux-mtd@lists.infradead.org>;
	Thu, 16 Oct 2008 03:56:52 -0700 (PDT)
Message-ID: <386072610810160356p3807f538la5087debe0c76866@mail.gmail.com>
Date: Thu, 16 Oct 2008 18:56:52 +0800
From: "Bryan Wu" <cooloney@kernel.org>
Sender: cooloney.lkml@gmail.com
To: dwmw2@infradead.org, linux-mtd@lists.infradead.org,
	LKML <linux-kernel@vger.kernel.org>
Subject: [BUG] re-modprobe a nand controller driver module will cause system
	crash.
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi folks,

These days I found a subtle bug which should be related with mtdcore layers.
The detailed story is located at
https://blackfin.uclinux.org/gf/project/uclinux-dist/tracker/?action=TrackerItemEdit&tracker_id=141&tracker_item_id=4463.

Briefly speaking,
1) modprobe a nand controller driver to add_mtd_paritition().
2) add_mtd_partition->add_devices->blktrans_notify_add->mtdblock_add_mtd->add_mtd_blktrans_dev
3) in add_mtd_blktrans_dev, alloc_disk will be called to create a new
gendisk structure according to the partition setting.
4) "gd->queue = tr->blkcore_priv->rq;"
    No matter how many partitions (in my test, 2 partitions), there
will be the same number gendisk structures but just 1 queue.
    They all use the same request_queue which is created in
register_mtd_blktrans.
5) mtdblockd kthread handles this request_queue for mtdblock layer.
6) There is one backing_dev_info structure member (not pointer) in
request_queue. so for several mtd partitions (serveral gendisks) there
is only one bdi structure instance.
7) So the problem is in add_disk(),
    bdi_register_dev(bdi, MKDEV(disk->major, disk->first_minor));
    For 1st partition mtdblock0, it will create /sys/class/bdi/31:0
and register information in bdi structure instance.
    Then for 2nd partition mtdblock1, because the bdi structure
instance is the same as the 1st partition, it will overwrite bdi
structure and create /sys/class/bdi/31:1.
    So the bdi info of 1st partition are totally lost.
8) When we rmmod the nand controller driver, del_mtd_partition will
only remove /sys/class/bdi/31:1 but left 1st partition
/sys/class/bdi/31:0 there.
9) modprobe again will let the bug show up.

I found this bug does not relate with my nand flash controller driver
and it should be fixed in mtdblock layer.
And if we just add only one partition, there is no such bug at all. I
tried to solve this bug, but it related with
mtdblock/mtd_blktrans/block/bdi. It is diffcult for me to find a way
to satisfy all the parts with minimal changes.

IMHO, can we just simply remove the bdi_register_dev (in add_disk) and
bdi_unregister_dev (in unlink_disk)?

P.S. I also found this bug in latest 2.6.27 kernel mainline.

Thanks
-Bryan
