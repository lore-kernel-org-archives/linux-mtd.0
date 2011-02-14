Received: from mail-ww0-f49.google.com ([74.125.82.49])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1PouXu-0007g1-7h
	for linux-mtd@lists.infradead.org; Mon, 14 Feb 2011 09:16:39 +0000
Received: by wwb17 with SMTP id 17so4710609wwb.18
	for <linux-mtd@lists.infradead.org>;
	Mon, 14 Feb 2011 01:16:36 -0800 (PST)
Subject: Re: [PATCH] mtd: export mtd->writebufsize attribute over sysfs
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Anatolij Gustschin <agust@denx.de>
In-Reply-To: <20110211163511.061d0f96@wker>
References: <1297424789-4144-1-git-send-email-agust@denx.de>
	<1297436994.2760.51.camel@localhost>  <20110211163511.061d0f96@wker>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 14 Feb 2011 11:15:22 +0200
Message-ID: <1297674922.2854.11.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2011-02-11 at 16:35 +0100, Anatolij Gustschin wrote:
> On Fri, 11 Feb 2011 17:09:54 +0200
> Artem Bityutskiy <dedekind1@gmail.com> wrote:
> 
> > On Fri, 2011-02-11 at 12:46 +0100, Anatolij Gustschin wrote:
> > > +static ssize_t mtd_writebufsize_store(struct device *dev,
> > > +				struct device_attribute *attr,
> > > +				const char *buf, size_t size)
> > > +{
> > > +	struct mtd_info *mtd = dev_to_mtd(dev);
> > > +	unsigned long value;
> > > +	int ret;
> > > +
> > > +	ret = strict_strtoul(buf, 0, &value);
> > > +	if (ret < 0)
> > > +		return ret;
> > > +
> > > +	mtd->writebufsize = value;
> > > +	return size;
> > > +}
> > > +static DEVICE_ATTR(writebufsize, S_IRUGO, mtd_writebufsize_show,
> > > +		   mtd_writebufsize_store);
> > 
> > 
> > I think writebufsize should be read-only. This is characteristic of the
> > flash and should not be changed. OK, if the chip allows to change it, it
> > could be done, but this is not what the patch seems to be about.
> 
> Yes, it is read-only by default.
> 
> > I mean, writebufsize is like writesize. Why writesize sysfs attribut is
> > R/O but writebufsize should be RW?
> 
> This attribute is R/O when the appropriate file is created. For
> mtd-ram test device it will be set RW by the fixup routine. I used
> this to set the writebufsize to different values when working with
> different UBIFS images. If I can set it dynamically, I do not need
> to recompile the mtdram module or the kernel.

But this is bad architecture, you are putting policy into the kernel and
hard-coding device-type specific checks with things like:

+                       sysfs_chmod_file(&mtd->dev.kobj, attr,
+                                        S_IRUGO | S_IWUSR | S_IWGRP);

and

+       if (mtd->type != MTD_RAM)
+               return;

If you are doing something mtdram-specific, make it mtdram-specific. How
about this: add the "writebufsize" mtdram module parameter, then you
will have a /sys/modules/mtdram/parameters/writebufsize file, which you
then can change run-time.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
