Received: from mail-out.m-online.net ([212.18.0.10])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1Pnv1a-0000KH-W6
	for linux-mtd@lists.infradead.org; Fri, 11 Feb 2011 15:35:11 +0000
Date: Fri, 11 Feb 2011 16:35:11 +0100
From: Anatolij Gustschin <agust@denx.de>
To: dedekind1@gmail.com
Subject: Re: [PATCH] mtd: export mtd->writebufsize attribute over sysfs
Message-ID: <20110211163511.061d0f96@wker>
In-Reply-To: <1297436994.2760.51.camel@localhost>
References: <1297424789-4144-1-git-send-email-agust@denx.de>
	<1297436994.2760.51.camel@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 11 Feb 2011 17:09:54 +0200
Artem Bityutskiy <dedekind1@gmail.com> wrote:

> On Fri, 2011-02-11 at 12:46 +0100, Anatolij Gustschin wrote:
> > +static ssize_t mtd_writebufsize_store(struct device *dev,
> > +				struct device_attribute *attr,
> > +				const char *buf, size_t size)
> > +{
> > +	struct mtd_info *mtd = dev_to_mtd(dev);
> > +	unsigned long value;
> > +	int ret;
> > +
> > +	ret = strict_strtoul(buf, 0, &value);
> > +	if (ret < 0)
> > +		return ret;
> > +
> > +	mtd->writebufsize = value;
> > +	return size;
> > +}
> > +static DEVICE_ATTR(writebufsize, S_IRUGO, mtd_writebufsize_show,
> > +		   mtd_writebufsize_store);
> 
> 
> I think writebufsize should be read-only. This is characteristic of the
> flash and should not be changed. OK, if the chip allows to change it, it
> could be done, but this is not what the patch seems to be about.

Yes, it is read-only by default.

> I mean, writebufsize is like writesize. Why writesize sysfs attribut is
> R/O but writebufsize should be RW?

This attribute is R/O when the appropriate file is created. For
mtd-ram test device it will be set RW by the fixup routine. I used
this to set the writebufsize to different values when working with
different UBIFS images. If I can set it dynamically, I do not need
to recompile the mtdram module or the kernel.

Anatolij
