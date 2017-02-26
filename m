Received: from ale.deltatee.com ([207.54.116.67])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1chsVp-0000lM-Or
 for linux-mtd@lists.infradead.org; Sun, 26 Feb 2017 06:40:56 +0000
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
 Hartmut Knaack <knaack.h@gmx.de>, Lars-Peter Clausen <lars@metafoo.de>,
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
 Boaz Harrosh <ooo@electrozaur.com>,
 "James E.J. Bottomley" <jejb@linux.vnet.ibm.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Stephen Bates <stephen.bates@microsemi.com>,
 Bjorn Helgaas <bhelgaas@google.com>
Cc: linux-pci@vger.kernel.org, linux-scsi@vger.kernel.org,
 rtc-linux@googlegroups.com, linux-mtd@lists.infradead.org,
 linux-media@vger.kernel.org, linux-iio@vger.kernel.org,
 linux-rdma@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-input@vger.kernel.org, linux-nvdimm@lists.01.org,
 linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
 Logan Gunthorpe <logang@deltatee.com>
Date: Sat, 25 Feb 2017 23:38:04 -0700
Message-Id: <1488091097-12328-4-git-send-email-logang@deltatee.com>
In-Reply-To: <1488091097-12328-1-git-send-email-logang@deltatee.com>
References: <1488091097-12328-1-git-send-email-logang@deltatee.com>
Subject: [PATCH v2 03/16] device-dax: utilize new cdev_device_add helper
 function
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Replace the open coded registration of the cdev and dev with the
new device_add_cdev() helper. The helper replaces a common pattern by
taking the proper reference against the parent device and adding both
the cdev and the device.

Signed-off-by: Logan Gunthorpe <logang@deltatee.com>
---
 drivers/dax/dax.c | 18 +++++-------------
 1 file changed, 5 insertions(+), 13 deletions(-)

diff --git a/drivers/dax/dax.c b/drivers/dax/dax.c
index b62a52f..e60b519 100644
--- a/drivers/dax/dax.c
+++ b/drivers/dax/dax.c
@@ -632,8 +632,6 @@ static void dax_dev_release(struct device *dev)
 
 static void kill_dax_dev(struct dax_dev *dax_dev)
 {
-	struct cdev *cdev = &dax_dev->cdev;
-
 	/*
 	 * Note, rcu is not protecting the liveness of dax_dev, rcu is
 	 * ensuring that any fault handlers that might have seen
@@ -644,7 +642,6 @@ static void kill_dax_dev(struct dax_dev *dax_dev)
 	dax_dev->alive = false;
 	synchronize_rcu();
 	unmap_mapping_range(dax_dev->inode->i_mapping, 0, 0, 1);
-	cdev_del(cdev);
 }
 
 static void unregister_dax_dev(void *dev)
@@ -654,7 +651,8 @@ static void unregister_dax_dev(void *dev)
 	dev_dbg(dev, "%s\n", __func__);
 
 	kill_dax_dev(dax_dev);
-	device_unregister(dev);
+	cdev_device_del(&dax_dev->cdev, dev);
+	put_device(dev);
 }
 
 struct dax_dev *devm_create_dax_dev(struct dax_region *dax_region,
@@ -705,18 +703,13 @@ struct dax_dev *devm_create_dax_dev(struct dax_region *dax_region,
 		goto err_inode;
 	}
 
-	/* device_initialize() so cdev can reference kobj parent */
+	/* from here on we're committed to teardown via dax_dev_release() */
 	device_initialize(dev);
 
 	cdev = &dax_dev->cdev;
 	cdev_init(cdev, &dax_fops);
 	cdev->owner = parent->driver->owner;
-	cdev->kobj.parent = &dev->kobj;
-	rc = cdev_add(&dax_dev->cdev, dev_t, 1);
-	if (rc)
-		goto err_cdev;
 
-	/* from here on we're committed to teardown via dax_dev_release() */
 	dax_dev->num_resources = count;
 	dax_dev->alive = true;
 	dax_dev->region = dax_region;
@@ -728,7 +721,8 @@ struct dax_dev *devm_create_dax_dev(struct dax_region *dax_region,
 	dev->groups = dax_attribute_groups;
 	dev->release = dax_dev_release;
 	dev_set_name(dev, "dax%d.%d", dax_region->id, dax_dev->id);
-	rc = device_add(dev);
+
+	rc = cdev_device_add(cdev, dev);
 	if (rc) {
 		kill_dax_dev(dax_dev);
 		put_device(dev);
@@ -741,8 +735,6 @@ struct dax_dev *devm_create_dax_dev(struct dax_region *dax_region,
 
 	return dax_dev;
 
- err_cdev:
-	iput(dax_dev->inode);
  err_inode:
 	ida_simple_remove(&dax_minor_ida, minor);
  err_minor:
-- 
2.1.4
