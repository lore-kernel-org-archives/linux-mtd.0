Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MxyuF-0004x3-4v
	for linux-mtd@lists.infradead.org; Wed, 14 Oct 2009 08:08:28 +0000
Subject: RE: [PATCH] Fix memory leak in mtd_dataflash
From: Artem Bityutskiy <dedekind1@gmail.com>
To: H Hartley Sweeten <hartleys@visionengravers.com>
In-Reply-To: <BD79186B4FD85F4B8E60E381CAEE190901DB7E55@mi8nycmail19.Mi8.com>
References: <BD79186B4FD85F4B8E60E381CAEE190901DB7B18@mi8nycmail19.Mi8.com>
	<1255266577.16942.57.camel@localhost>
	<BD79186B4FD85F4B8E60E381CAEE190901DB7E55@mi8nycmail19.Mi8.com>
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 14 Oct 2009 11:07:48 +0300
Message-Id: <1255507668.32489.115.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: David Brownell <david-b@pacbell.net>, linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, 2009-10-11 at 16:49 -0400, H Hartley Sweeten wrote:
> On Sunday, October 11, 2009 6:10 AM, Artem Bityutskiy wrote:
> > On Wed, 2009-10-07 at 17:08 -0400, H Hartley Sweeten wrote:
> >> Fix a potential memory leak in mtd_dataflash driver.
> >> 
> >> The private data that is allocated when registering a DataFlash
> >> device with the MTD subsystem is not released if an error occurs
> >> when add_mtd_partitions() or add_mtd_device() is called.  Fix this
> >> by adding an error path.  The memory is already released during a
> >> remove.
> >> 
> >> Also, add a dev_set_drvdata(&spi->dev, NULL) before the kfree() so
> >> that the spi device does not reference invalid data.
> >> 
> >> Signed-off-by: H Hartley Sweeten <hsweeten@visionengravers.com>
> >> Cc: David Brownell <david-b@pacbell.net>
> >> Cc: linux-mtd@lists.infradead.org
> >> 
> >> ---
> >> 
> >> diff --git a/drivers/mtd/devices/mtd_dataflash.c b/drivers/mtd/devices/mtd_dataflash.c
> >> index 93e3627..1981740 100644
> >> --- a/drivers/mtd/devices/mtd_dataflash.c
> >> +++ b/drivers/mtd/devices/mtd_dataflash.c
> >> @@ -636,6 +636,7 @@ add_dataflash_otp(struct spi_device *spi, char *name,
> >>  	struct mtd_info			*device;
> >>  	struct flash_platform_data	*pdata = spi->dev.platform_data;
> >>  	char				*otp_tag = "";
> >> +	int				err = 0;
> >>  
> >>  	priv = kzalloc(sizeof *priv, GFP_KERNEL);
> >>  	if (!priv)
> >> @@ -693,13 +694,23 @@ add_dataflash_otp(struct spi_device *spi, char *name,
> >>  
> >>  		if (nr_parts > 0) {
> >>  			priv->partitioned = 1;
> >> -			return add_mtd_partitions(device, parts, nr_parts);
> >> +			err = add_mtd_partitions(device, parts, nr_parts);
> >> +			goto out;
> >>  		}
> >>  	} else if (pdata && pdata->nr_parts)
> >>  		dev_warn(&spi->dev, "ignoring %d default partitions on %s\n",
> >>  				pdata->nr_parts, device->name);
> >>  
> >> -	return add_mtd_device(device) == 1 ? -ENODEV : 0;
> >> +	if (add_mtd_device(device) == 1)
> >> +		err = -ENODEV;
> >
> > But if you fail here, you should also call del_mtd_partitions(), right?
> 
> Not as I understand it.
> 
> If the device has partitions (mtd_has_partitions), and the subsystem can
> determine what they are, add_mtd_partitions is called to add those partitions.
> The only way the code gets to add_mtd_device is if mtd_has_partitions returns
> false or the number of partitions cannot be determined.  In that case the entire
> device is added.  So calling del_mtd_partitions in that case is not valid.
> 
> Did I overlook something?

Right. I've applied it to my l2-mtd-2.6 tree.


-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
