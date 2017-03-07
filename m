Received: from mga03.intel.com ([134.134.136.65])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1clAXd-0006HB-Pc
 for linux-mtd@lists.infradead.org; Tue, 07 Mar 2017 08:32:24 +0000
Date: Tue, 7 Mar 2017 10:31:39 +0200
From: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Logan Gunthorpe <logang@deltatee.com>,
 Dan Williams <dan.j.williams@intel.com>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Johannes Thumshirn <jthumshirn@suse.de>, Jan Kara <jack@suse.cz>,
 Arnd Bergmann <arnd@arndb.de>, Sajjan Vikas C <vikas.cha.sajjan@hpe.com>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Alexandre Courbot <gnurou@gmail.com>, Peter Huewe <peterhuewe@gmx.de>,
 Marcel Selhorst <tpmdd@selhorst.net>,
 Jason Gunthorpe <jgunthorpe@obsidianresearch.com>,
 Olof Johansson <olof@lixom.net>, Doug Ledford <dledford@redhat.com>,
 Sean Hefty <sean.hefty@intel.com>,
 Hal Rosenstock <hal.rosenstock@gmail.com>,
 Dmitry Vyukov <dvyukov@google.com>, Haggai Eran <haggaie@mellanox.com>,
 Parav Pandit <pandit.parav@gmail.com>,
 Leon Romanovsky <leon@kernel.org>, Hartmut Knaack <knaack.h@gmx.de>,
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
 Andrew Morton <akpm@linux-foundation.org>,
 Joe Perches <joe@perches.com>, Lorenzo Stoakes <lstoakes@gmail.com>,
 Vladimir Zapolskiy <vz@mleia.com>, Alessandro Zummo <a.zummo@towertech.it>,
 Alexandre Belloni <alexandre.belloni@free-electrons.com>,
 Boaz Harrosh <ooo@electrozaur.com>,
 "James E.J. Bottomley" <jejb@linux.vnet.ibm.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Stephen Bates <stephen.bates@microsemi.com>,
 Bjorn Helgaas <bhelgaas@google.com>, linux-pci@vger.kernel.org,
 linux-scsi@vger.kernel.org, rtc-linux@googlegroups.com,
 linux-mtd@lists.infradead.org, linux-media@vger.kernel.org,
 linux-iio@vger.kernel.org, linux-rdma@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-input@vger.kernel.org,
 linux-nvdimm@lists.01.org, linux-fsdevel@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 06/16] tpm-chip: utilize new cdev_device_add helper
 function
Message-ID: <20170307083139.ccaoascf7yjoixg5@intel.com>
References: <1488783873-2614-1-git-send-email-logang@deltatee.com>
 <1488783873-2614-7-git-send-email-logang@deltatee.com>
 <20170306210426.qeftgujergryutie@intel.com>
 <20170307053138.GA7665@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170307053138.GA7665@kroah.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Mar 07, 2017 at 06:31:38AM +0100, Greg Kroah-Hartman wrote:
> On Mon, Mar 06, 2017 at 11:04:26PM +0200, Jarkko Sakkinen wrote:
> > On Mon, Mar 06, 2017 at 12:04:22AM -0700, Logan Gunthorpe wrote:
> > > Replace the open coded registration of the cdev and dev with the
> > > new device_add_cdev() helper. The helper replaces a common pattern by
> > > taking the proper reference against the parent device and adding both
> > > the cdev and the device.
> > > 
> > > Signed-off-by: Logan Gunthorpe <logang@deltatee.com>
> > > Reviewed-by: Jason Gunthorpe <jgunthorpe@obsidianresearch.com>
> > > ---
> > >  drivers/char/tpm/tpm-chip.c | 19 +++----------------
> > >  1 file changed, 3 insertions(+), 16 deletions(-)
> > > 
> > > diff --git a/drivers/char/tpm/tpm-chip.c b/drivers/char/tpm/tpm-chip.c
> > > index c406343..935f0e9 100644
> > > --- a/drivers/char/tpm/tpm-chip.c
> > > +++ b/drivers/char/tpm/tpm-chip.c
> > > @@ -187,7 +187,6 @@ struct tpm_chip *tpm_chip_alloc(struct device *pdev,
> > >  
> > >  	cdev_init(&chip->cdev, &tpm_fops);
> > >  	chip->cdev.owner = THIS_MODULE;
> > > -	chip->cdev.kobj.parent = &chip->dev.kobj;
> > >  
> > >  	return chip;
> > >  
> > > @@ -230,27 +229,16 @@ static int tpm_add_char_device(struct tpm_chip *chip)
> > >  {
> > >  	int rc;
> > >  
> > > -	rc = cdev_add(&chip->cdev, chip->dev.devt, 1);
> > > +	rc = cdev_device_add(&chip->cdev, &chip->dev);
> > >  	if (rc) {
> > >  		dev_err(&chip->dev,
> > > -			"unable to cdev_add() %s, major %d, minor %d, err=%d\n",
> > > +			"unable to cdev_device_add() %s, major %d, minor %d, err=%d\n",
> > >  			dev_name(&chip->dev), MAJOR(chip->dev.devt),
> > >  			MINOR(chip->dev.devt), rc);
> > >  
> > >  		return rc;
> > >  	}
> > >  
> > > -	rc = device_add(&chip->dev);
> > > -	if (rc) {
> > > -		dev_err(&chip->dev,
> > > -			"unable to device_register() %s, major %d, minor %d, err=%d\n",
> > > -			dev_name(&chip->dev), MAJOR(chip->dev.devt),
> > > -			MINOR(chip->dev.devt), rc);
> > > -
> > > -		cdev_del(&chip->cdev);
> > > -		return rc;
> > > -	}
> > > -
> > >  	/* Make the chip available. */
> > >  	mutex_lock(&idr_lock);
> > >  	idr_replace(&dev_nums_idr, chip, chip->dev_num);
> > > @@ -261,8 +249,7 @@ static int tpm_add_char_device(struct tpm_chip *chip)
> > >  
> > >  static void tpm_del_char_device(struct tpm_chip *chip)
> > >  {
> > > -	cdev_del(&chip->cdev);
> > > -	device_del(&chip->dev);
> > > +	cdev_device_del(&chip->cdev, &chip->dev);
> > >  
> > >  	/* Make the chip unavailable. */
> > >  	mutex_lock(&idr_lock);
> > > -- 
> > > 2.1.4
> > > 
> > 
> > Reviewed-by: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
> > 
> > I cannot test this at this point as security tree does not include
> > the commit that is dependent on this. I'm also wondering if this
> > commit is even going through my tree to upstream?
> 
> I can take it all at once through my tree.
> 
> thanks,
> 
> greg k-h

Alright, thank you!

/Jarkko
