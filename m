Received: from mail-wr0-f196.google.com ([209.85.128.196])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cg9vi-0002Cl-6A
 for linux-mtd@lists.infradead.org; Tue, 21 Feb 2017 12:52:32 +0000
Received: by mail-wr0-f196.google.com with SMTP id z61so14341572wrc.3
 for <linux-mtd@lists.infradead.org>; Tue, 21 Feb 2017 04:52:09 -0800 (PST)
Subject: Re: [PATCH 13/14] scsi: utilize new device_add_cdev helper function
To: Logan Gunthorpe <logang@deltatee.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
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
 Sean Hefty <sean.hefty@intel.com>, Hal Rosenstock
 <hal.rosenstock@gmail.com>, Dmitry Vyukov <dvyukov@google.com>,
 Haggai Eran <haggaie@mellanox.com>, Parav Pandit <pandit.parav@gmail.com>,
 Leon Romanovsky <leon@kernel.org>, Jonathan Cameron <jic23@kernel.org>,
 Hartmut Knaack <knaack.h@gmx.de>, Lars-Peter Clausen <lars@metafoo.de>,
 Peter Meerwald-Stadler <pmeerw@pmeerw.net>,
 Hans Verkuil <hans.verkuil@cisco.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Artem Bityutskiy <dedekind1@gmail.com>, Richard Weinberger <richard@nod.at>,
 David Woodhouse <dwmw2@infradead.org>,
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
References: <1487653253-11497-1-git-send-email-logang@deltatee.com>
 <1487653253-11497-14-git-send-email-logang@deltatee.com>
Cc: linux-scsi@vger.kernel.org, rtc-linux@googlegroups.com,
 linux-gpio@vger.kernel.org, linux-iio@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-nvdimm@lists.01.org,
 linux-kernel@vger.kernel.org, linux-rdma@vger.kernel.org,
 tpmdd-devel@lists.sourceforge.net, linux-mtd@lists.infradead.org,
 osd-dev@open-osd.org, linux-input@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-media@vger.kernel.org
From: Boaz Harrosh <ooo@electrozaur.com>
Message-ID: <eeedf346-32a8-d503-e6ba-649c7a0a17f1@electrozaur.com>
Date: Tue, 21 Feb 2017 14:52:00 +0200
MIME-Version: 1.0
In-Reply-To: <1487653253-11497-14-git-send-email-logang@deltatee.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 02/21/2017 07:00 AM, Logan Gunthorpe wrote:
> Note: the chardev instance in osd_uld.c originally did not
> set the kobject parent. Thus, I'm reasonably confident that because
> of this, this code  would have suffered from a minor use after free
> bug if the cdev was open when the backing device was released.
> 
> Signed-off-by: Logan Gunthorpe <logang@deltatee.com>

Cool thanks. And even a bug fix
ACK-by: Boaz Harrosh <ooo@electrozaur.com>

> ---
>  drivers/scsi/osd/osd_uld.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/scsi/osd/osd_uld.c b/drivers/scsi/osd/osd_uld.c
> index 243eab3..519be56 100644
> --- a/drivers/scsi/osd/osd_uld.c
> +++ b/drivers/scsi/osd/osd_uld.c
> @@ -473,18 +473,19 @@ static int osd_probe(struct device *dev)
>  		goto err_put_disk;
>  	}
>  
> +	device_initialize(&oud->class_dev);
> +	oud->class_dev.devt = MKDEV(SCSI_OSD_MAJOR, oud->minor);
> +
>  	/* init the char-device for communication with user-mode */
>  	cdev_init(&oud->cdev, &osd_fops);
>  	oud->cdev.owner = THIS_MODULE;
> -	error = cdev_add(&oud->cdev,
> -			 MKDEV(SCSI_OSD_MAJOR, oud->minor), 1);
> +	error = device_add_cdev(&oud->class_dev, &oud->cdev);
>  	if (error) {
>  		OSD_ERR("cdev_add failed\n");
>  		goto err_put_disk;
>  	}
>  
>  	/* class device member */
> -	oud->class_dev.devt = oud->cdev.dev;
>  	oud->class_dev.class = &osd_uld_class;
>  	oud->class_dev.parent = dev;
>  	oud->class_dev.release = __remove;
> @@ -494,7 +495,7 @@ static int osd_probe(struct device *dev)
>  		goto err_put_cdev;
>  	}
>  
> -	error = device_register(&oud->class_dev);
> +	error = device_add(&oud->class_dev);
>  	if (error) {
>  		OSD_ERR("device_register failed => %d\n", error);
>  		goto err_put_cdev;
> 
