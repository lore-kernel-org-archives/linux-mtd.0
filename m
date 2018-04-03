Message-ID: <1522723618.3504.7.camel@mhfsdcap03>
Subject: Re: [PATCH] mtd: Add sysfs attribute for mtd OOB available size
From: xiaolei li <xiaolei.li@mediatek.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>
CC: <richard@nod.at>, <linux-mediatek@lists.infradead.org>,
 <linux-mtd@lists.infradead.org>, <srv_heupstream@mediatek.com>
Date: Tue, 3 Apr 2018 10:46:58 +0800
In-Reply-To: <20180402141505.33051c14@bbrezillon>
References: <1522657210-56833-1-git-send-email-xiaolei.li@mediatek.com>
 <1522657210-56833-2-git-send-email-xiaolei.li@mediatek.com>
 <20180402141505.33051c14@bbrezillon>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello Boris,

On Mon, 2018-04-02 at 14:15 +0200, Boris Brezillon wrote:
> Hi Xiaolei,
> 
> On Mon, 2 Apr 2018 16:20:10 +0800
> Xiaolei Li <xiaolei.li@mediatek.com> wrote:
> 
> > Expose mtd OOB available size by sysfs file. Then users can get available
> > OOB size by accessing /sys/class/mtd/mtdX/oobavail.
> 
> May I ask why you need to expose that? I'm not against exposing new
> things through sysfs, but since this is part of the ABI, I'd like to be
> sure we actually need it.
> 
That is user-space can write OOB data through ioctl MEMWRITE now.
If OOB operation mode is MTD_OPS_AUTO_OOB, user should know how many
OOB available bytes it can use. But I didn't find a way to get it. (If
there is already a method, please kindly let me know, thanks.)

One problem I know is to do Jffs2 type flash erase using MTD user-space
tool flash_erase. flash_erase tool will program "cleanmarker" into OOB
free area, but it can not get OOB available size.
Please refer this commit:
http://git.infradead.org/mtd-utils.git/commit/d7e86124d55bbcee1b82c68b82389ebcda588076

Thanks!
Xiaolei

> Regards,
> 
> Boris
> 
> > 
> > Signed-off-by: Xiaolei Li <xiaolei.li@mediatek.com>
> > ---
> >  Documentation/ABI/testing/sysfs-class-mtd |  8 ++++++++
> >  drivers/mtd/mtdcore.c                     | 10 ++++++++++
> >  2 files changed, 18 insertions(+)
> > 
> > diff --git a/Documentation/ABI/testing/sysfs-class-mtd b/Documentation/ABI/testing/sysfs-class-mtd
> > index f34e5923..3bc7c0a 100644
> > --- a/Documentation/ABI/testing/sysfs-class-mtd
> > +++ b/Documentation/ABI/testing/sysfs-class-mtd
> > @@ -232,3 +232,11 @@ Description:
> >  		of the parent (another partition or a flash device) in bytes.
> >  		This attribute is absent on flash devices, so it can be used
> >  		to distinguish them from partitions.
> > +
> > +What:		/sys/class/mtd/mtdX/oobavail
> > +Date:		April 2018
> > +KernelVersion:	4.16
> > +Contact:	linux-mtd@lists.infradead.org
> > +Description:
> > +		Number of bytes available for a client to place data into
> > +		the out of band area.
> > diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
> > index 807d17d..99d9352 100644
> > --- a/drivers/mtd/mtdcore.c
> > +++ b/drivers/mtd/mtdcore.c
> > @@ -210,6 +210,15 @@ static ssize_t mtd_oobsize_show(struct device *dev,
> >  }
> >  static DEVICE_ATTR(oobsize, S_IRUGO, mtd_oobsize_show, NULL);
> >  
> > +static ssize_t mtd_oobavail_show(struct device *dev,
> > +				 struct device_attribute *attr, char *buf)
> > +{
> > +	struct mtd_info *mtd = dev_get_drvdata(dev);
> > +
> > +	return snprintf(buf, PAGE_SIZE, "%lu\n", (unsigned long)mtd->oobavail);
> > +}
> > +static DEVICE_ATTR(oobavail, S_IRUGO, mtd_oobavail_show, NULL);
> > +
> >  static ssize_t mtd_numeraseregions_show(struct device *dev,
> >  		struct device_attribute *attr, char *buf)
> >  {
> > @@ -327,6 +336,7 @@ static ssize_t mtd_bbtblocks_show(struct device *dev,
> >  	&dev_attr_writesize.attr,
> >  	&dev_attr_subpagesize.attr,
> >  	&dev_attr_oobsize.attr,
> > +	&dev_attr_oobavail.attr,
> >  	&dev_attr_numeraseregions.attr,
> >  	&dev_attr_name.attr,
> >  	&dev_attr_ecc_strength.attr,
> 
> 
> 
