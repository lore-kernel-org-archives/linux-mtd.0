Received: from ale.deltatee.com ([207.54.116.67])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cg2cD-0002va-8s
 for linux-mtd@lists.infradead.org; Tue, 21 Feb 2017 05:03:55 +0000
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
Date: Mon, 20 Feb 2017 22:00:51 -0700
Message-Id: <1487653253-11497-13-git-send-email-logang@deltatee.com>
In-Reply-To: <1487653253-11497-1-git-send-email-logang@deltatee.com>
References: <1487653253-11497-1-git-send-email-logang@deltatee.com>
Subject: [PATCH 12/14] rtc: utilize new device_add_cdev helper function
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
 drivers/rtc/rtc-dev.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/rtc/rtc-dev.c b/drivers/rtc/rtc-dev.c
index a6d9434..e4012bb 100644
--- a/drivers/rtc/rtc-dev.c
+++ b/drivers/rtc/rtc-dev.c
@@ -477,12 +477,11 @@ void rtc_dev_prepare(struct rtc_device *rtc)
 
 	cdev_init(&rtc->char_dev, &rtc_dev_fops);
 	rtc->char_dev.owner = rtc->owner;
-	rtc->char_dev.kobj.parent = &rtc->dev.kobj;
 }
 
 void rtc_dev_add_device(struct rtc_device *rtc)
 {
-	if (cdev_add(&rtc->char_dev, rtc->dev.devt, 1))
+	if (device_add_cdev(&rtc->dev, &rtc->char_dev))
 		dev_warn(&rtc->dev, "%s: failed to add char device %d:%d\n",
 			rtc->name, MAJOR(rtc_devt), rtc->id);
 	else
-- 
2.1.4
