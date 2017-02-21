Received: from ale.deltatee.com ([207.54.116.67])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cg2bi-0002q6-MV
 for linux-mtd@lists.infradead.org; Tue, 21 Feb 2017 05:03:27 +0000
From: Logan Gunthorpe <logang@deltatee.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dan Williams <dan.j.williams@intel.com>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Johannes Thumshirn <jthumshirn@suse.de>, Jan Kara <jack@suse.cz>,
 Arnd Bergmann <arnd@arndb.de>, Sajjan Vikas C <vikas.cha.sajjan@hpe.com>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Alexandre Courbot <gnurou@gmail.com>, Peter Huewe <peterhuewe@gmx.de>,
 Marcel Selhorst <tpmdd@selhorst.net>,
 Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>,
 Jason Gunthorpe <jgunthorpe@obsidianresearch.com>,
 Olof Johansson <olof@lixom.net>, Doug Ledford <dledford@redhat.com>,
 Sean Hefty <sean.hefty@intel.com>,
 Hal Rosenstock <hal.rosenstock@gmail.com>,
 Dmitry Vyukov <dvyukov@google.com>, Haggai Eran <haggaie@mellanox.com>,
 Parav Pandit <pandit.parav@gmail.com>, Leon Romanovsky <leon@kernel.org>,
 Jonathan Cameron <jic23@kernel.org>, Hartmut Knaack <knaack.h@gmx.de>,
 Lars-Peter Clausen <lars@metafoo.de>,
 Peter Meerwald-Stadler <pmeerw@pmeerw.net>,
 Hans Verkuil <hans.verkuil@cisco.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Artem Bityutskiy <dedekind1@gmail.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 Matt Porter <mporter@kernel.crashing.org>,
 Alexandre Bounine <alexandre.bounine@idt.com>,
 Andrew Morton <akpm@linux-foundation.org>, Joe Perches <joe@perches.com>,
 Lorenzo Stoakes <lstoakes@gmail.com>, Vladimir Zapolskiy <vz@mleia.com>,
 Alessandro Zummo <a.zummo@towertech.it>,
 Alexandre Belloni <alexandre.belloni@free-electrons.com>,
 Boaz Harrosh <ooo@electrozaur.com>, Benny Halevy <bhalevy@primarydata.com>,
 "James E.J. Bottomley" <jejb@linux.vnet.ibm.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Stephen Bates <stephen.bates@microsemi.com>,
 Bjorn Helgaas <bhelgaas@google.com>
Cc: linux-pci@vger.kernel.org, osd-dev@open-osd.org,
 linux-scsi@vger.kernel.org, rtc-linux@googlegroups.com,
 linux-mtd@lists.infradead.org, linux-media@vger.kernel.org,
 linux-iio@vger.kernel.org, linux-rdma@vger.kernel.org,
 tpmdd-devel@lists.sourceforge.net, linux-gpio@vger.kernel.org,
 linux-input@vger.kernel.org, linux-nvdimm@lists.01.org,
 linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
 Logan Gunthorpe <logang@deltatee.com>
Date: Mon, 20 Feb 2017 22:00:45 -0700
Message-Id: <1487653253-11497-7-git-send-email-logang@deltatee.com>
In-Reply-To: <1487653253-11497-1-git-send-email-logang@deltatee.com>
References: <1487653253-11497-1-git-send-email-logang@deltatee.com>
Subject: [PATCH 06/14] platform/chrome: utilize new device_add_cdev helper
 function
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Signed-off-by: Logan Gunthorpe <logang@deltatee.com>
---
 drivers/platform/chrome/cros_ec_dev.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/platform/chrome/cros_ec_dev.c b/drivers/platform/chrome/cros_ec_dev.c
index 47268ec..658fb99 100644
--- a/drivers/platform/chrome/cros_ec_dev.c
+++ b/drivers/platform/chrome/cros_ec_dev.c
@@ -388,7 +388,6 @@ static int ec_device_probe(struct platform_device *pdev)
 	int retval = -ENOMEM;
 	struct device *dev = &pdev->dev;
 	struct cros_ec_platform *ec_platform = dev_get_platdata(dev);
-	dev_t devno = MKDEV(ec_major, pdev->id);
 	struct cros_ec_dev *ec = kzalloc(sizeof(*ec), GFP_KERNEL);
 
 	if (!ec)
@@ -401,6 +400,7 @@ static int ec_device_probe(struct platform_device *pdev)
 	ec->features[0] = -1U; /* Not cached yet */
 	ec->features[1] = -1U; /* Not cached yet */
 	device_initialize(&ec->class_dev);
+	ec->class_dev.devt = MKDEV(ec_major, pdev->id);
 	cdev_init(&ec->cdev, &fops);
 
 	/*
@@ -408,8 +408,7 @@ static int ec_device_probe(struct platform_device *pdev)
 	 * Link cdev to the class device to be sure device is not used
 	 * before unbinding it.
 	 */
-	ec->cdev.kobj.parent = &ec->class_dev.kobj;
-	retval = cdev_add(&ec->cdev, devno, 1);
+	retval = device_add_cdev(&ec->class_dev, &ec->cdev);
 	if (retval) {
 		dev_err(dev, ": failed to add character device\n");
 		goto cdev_add_failed;
@@ -420,7 +419,6 @@ static int ec_device_probe(struct platform_device *pdev)
 	 * Link to the character device for creating the /dev entry
 	 * in devtmpfs.
 	 */
-	ec->class_dev.devt = ec->cdev.dev;
 	ec->class_dev.class = &cros_class;
 	ec->class_dev.parent = dev;
 	ec->class_dev.release = __remove;
-- 
2.1.4
