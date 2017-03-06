Received: from ale.deltatee.com ([207.54.116.67])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1ckmjO-0006DY-Bx
 for linux-mtd@lists.infradead.org; Mon, 06 Mar 2017 07:06:55 +0000
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
Date: Mon,  6 Mar 2017 00:04:32 -0700
Message-Id: <1488783873-2614-17-git-send-email-logang@deltatee.com>
In-Reply-To: <1488783873-2614-1-git-send-email-logang@deltatee.com>
References: <1488783873-2614-1-git-send-email-logang@deltatee.com>
Subject: [PATCH v3 16/16] switchtec: utilize new device_add_cdev helper
 function
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Very straightforward conversion to device_add_cdev. Drop cdev_add and
device_add and use cdev_device_add.

Signed-off-by: Logan Gunthorpe <logang@deltatee.com>
---
 drivers/pci/switch/switchtec.c | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/drivers/pci/switch/switchtec.c b/drivers/pci/switch/switchtec.c
index 1f045c9..e27fd29 100644
--- a/drivers/pci/switch/switchtec.c
+++ b/drivers/pci/switch/switchtec.c
@@ -1291,7 +1291,6 @@ static struct switchtec_dev *stdev_create(struct pci_dev *pdev)
 	cdev = &stdev->cdev;
 	cdev_init(cdev, &switchtec_fops);
 	cdev->owner = THIS_MODULE;
-	cdev->kobj.parent = &dev->kobj;
 
 	return stdev;
 
@@ -1479,11 +1478,7 @@ static int switchtec_pci_probe(struct pci_dev *pdev,
 		  SWITCHTEC_EVENT_EN_IRQ,
 		  &stdev->mmio_part_cfg->mrpc_comp_hdr);
 
-	rc = cdev_add(&stdev->cdev, stdev->dev.devt, 1);
-	if (rc)
-		goto err_put;
-
-	rc = device_add(&stdev->dev);
+	rc = cdev_device_add(&stdev->cdev, &stdev->dev);
 	if (rc)
 		goto err_devadd;
 
@@ -1492,7 +1487,6 @@ static int switchtec_pci_probe(struct pci_dev *pdev,
 	return 0;
 
 err_devadd:
-	cdev_del(&stdev->cdev);
 	stdev_kill(stdev);
 err_put:
 	ida_simple_remove(&switchtec_minor_ida, MINOR(stdev->dev.devt));
@@ -1506,8 +1500,7 @@ static void switchtec_pci_remove(struct pci_dev *pdev)
 
 	pci_set_drvdata(pdev, NULL);
 
-	device_del(&stdev->dev);
-	cdev_del(&stdev->cdev);
+	cdev_device_del(&stdev->cdev, &stdev->dev);
 	ida_simple_remove(&switchtec_minor_ida, MINOR(stdev->dev.devt));
 	dev_info(&stdev->dev, "unregistered.\n");
 
-- 
2.1.4
