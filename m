Received: from ale.deltatee.com ([207.54.116.67])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1ckmjT-0006Fa-Bq
 for linux-mtd@lists.infradead.org; Mon, 06 Mar 2017 07:07:00 +0000
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
Date: Mon,  6 Mar 2017 00:04:26 -0700
Message-Id: <1488783873-2614-11-git-send-email-logang@deltatee.com>
In-Reply-To: <1488783873-2614-1-git-send-email-logang@deltatee.com>
References: <1488783873-2614-1-git-send-email-logang@deltatee.com>
Subject: [PATCH v3 10/16] iio:core: utilize new cdev_device_add helper function
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

In doing so we have to remove a guard statement from cdev_del,
but this doesn't appear to be required in any way.

Signed-off-by: Logan Gunthorpe <logang@deltatee.com>
---
 drivers/iio/industrialio-core.c | 15 ++++-----------
 1 file changed, 4 insertions(+), 11 deletions(-)

diff --git a/drivers/iio/industrialio-core.c b/drivers/iio/industrialio-core.c
index d18ded4..26a03c6 100644
--- a/drivers/iio/industrialio-core.c
+++ b/drivers/iio/industrialio-core.c
@@ -1720,18 +1720,13 @@ int iio_device_register(struct iio_dev *indio_dev)
 
 	cdev_init(&indio_dev->chrdev, &iio_buffer_fileops);
 	indio_dev->chrdev.owner = indio_dev->info->driver_module;
-	indio_dev->chrdev.kobj.parent = &indio_dev->dev.kobj;
-	ret = cdev_add(&indio_dev->chrdev, indio_dev->dev.devt, 1);
-	if (ret < 0)
-		goto error_unreg_eventset;
 
-	ret = device_add(&indio_dev->dev);
+	ret = cdev_device_add(&indio_dev->chrdev, &indio_dev->dev);
 	if (ret < 0)
-		goto error_cdev_del;
+		goto error_unreg_eventset;
 
 	return 0;
-error_cdev_del:
-	cdev_del(&indio_dev->chrdev);
+
 error_unreg_eventset:
 	iio_device_unregister_eventset(indio_dev);
 error_free_sysfs:
@@ -1752,10 +1747,8 @@ void iio_device_unregister(struct iio_dev *indio_dev)
 {
 	mutex_lock(&indio_dev->info_exist_lock);
 
-	device_del(&indio_dev->dev);
+	cdev_device_del(&indio_dev->chrdev, &indio_dev->dev);
 
-	if (indio_dev->chrdev.dev)
-		cdev_del(&indio_dev->chrdev);
 	iio_device_unregister_debugfs(indio_dev);
 
 	iio_disable_all_buffers(indio_dev);
-- 
2.1.4
