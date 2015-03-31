Received: from mail-pa0-x22e.google.com ([2607:f8b0:400e:c03::22e])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YcmuD-00084w-JB
 for linux-mtd@lists.infradead.org; Tue, 31 Mar 2015 03:31:58 +0000
Received: by padcy3 with SMTP id cy3so6028300pad.3
 for <linux-mtd@lists.infradead.org>; Mon, 30 Mar 2015 20:31:35 -0700 (PDT)
Date: Mon, 30 Mar 2015 20:31:30 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Daniel Ehrenberg <dehrenberg@google.com>
Subject: Re: [PATCH v3 2/3] mtd: part: Add sysfs variable for offset of
 partition
Message-ID: <20150331033130.GW32500@ld-irv-0074>
References: <1427484257-13708-1-git-send-email-dehrenberg@chromium.org>
 <1427484257-13708-3-git-send-email-dehrenberg@chromium.org>
 <20150328005313.GB32500@ld-irv-0074>
 <CAAK6Zt1L54X4_JWCXzMSAz7nP-5bEkVTz4JLQLtROj6frzwgKQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAAK6Zt1L54X4_JWCXzMSAz7nP-5bEkVTz4JLQLtROj6frzwgKQ@mail.gmail.com>
Cc: Richard Weinberger <richard@nod.at>, Gwendal Grignou <gwendal@chromium.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Mar 30, 2015 at 01:32:21PM -0700, Daniel Ehrenberg wrote:
> On Fri, Mar 27, 2015 at 5:53 PM, Brian Norris
> <computersforpeace@gmail.com> wrote:
> > On Fri, Mar 27, 2015 at 12:24:16PM -0700, Dan Ehrenberg wrote:
> >> This patch makes a sysfs variable called 'offset' on each partition
> >> which contains the offset in bytes from the beginning of the master
> >> device that the partition starts.
> >>
> >> Signed-off-by: Dan Ehrenberg <dehrenberg@chromium.org>
> >> ---
> >>  drivers/mtd/mtdpart.c | 29 +++++++++++++++++++++++++++++
> >>  1 file changed, 29 insertions(+)
> >>
> >> diff --git a/drivers/mtd/mtdpart.c b/drivers/mtd/mtdpart.c
> >> index a19ec5a..b8ed202 100644
> >> --- a/drivers/mtd/mtdpart.c
> >> +++ b/drivers/mtd/mtdpart.c
> >> @@ -554,6 +554,30 @@ out_register:
> >>       return slave;
> >>  }
> >>
> >> +static ssize_t mtd_partition_offset_show(struct device *dev,
> >> +             struct device_attribute *attr, char *buf)
> >> +{
> >> +     struct mtd_info *mtd = dev_get_drvdata(dev);
> >> +     struct mtd_part *part = PART(mtd);
> >> +     return snprintf(buf, PAGE_SIZE, "%lld\n", part->offset);
> >> +}
> >> +
> >> +static DEVICE_ATTR(offset, S_IRUGO, mtd_partition_offset_show, NULL);
> >
> > You'll want #include <linux/device.h>, just to be explicit.
> >
> > And if you're adding to the sysfs ABI, please update
> > Documentation/ABI/testing/sysfs-class-mtd
> >
> >> +
> >> +const static struct attribute *mtd_partition_attrs[] = {
> >
> > gcc complains:
> >
> >   drivers/mtd/mtdpart.c:568:1: warning: 'static' is not at beginning of declaration [-Wold-style-declaration]
> >
> >> +     &dev_attr_offset.attr,
> >> +     NULL
> >> +};
> >> +
> >> +int mtd_add_partition_attrs(struct mtd_part *new)
> >
> > gcc and sprase complain:
> >
> >   drivers/mtd/mtdpart.c:573:5: warning: no previous prototype for 'mtd_add_partition_attrs' [-Wmissing-prototypes]
> >   drivers/mtd/mtdpart.c:573:5: warning: symbol 'mtd_add_partition_attrs' was not declared. Should it be static? [sparse]
> 
> Thanks, not sure why these warnings haven't been showing up for me
> (while other warnings do, e.g., if I make an unused variable). I'll
> fix this and the docs in a new patch.

sparse is not run by default, and some of the gcc warnings might only be
available on newer gcc's and/or when building with extra warnings
enabled.

To build with extra warnings, you can use 'make W=1' or 'make W=2'. To
build with sparse checking you can use 'make C=1' or 'make C=2'. See
Makefile for details.

> >> +{
> >> +     int ret = sysfs_create_files(&new->mtd.dev.kobj, mtd_partition_attrs);
> >> +     if (ret)
> >> +             printk(KERN_WARNING
> >> +                    "mtd: failed to create partition attrs, err=%d\n", ret);
> >> +     return ret;
> >> +}
> >> +
> >>  int mtd_add_partition(struct mtd_info *master, const char *name,
> >>                     long long offset, long long length)
> >>  {
> >> @@ -603,6 +627,8 @@ int mtd_add_partition(struct mtd_info *master, const char *name,
> >>
> >>       add_mtd_device(&new->mtd);
> >>
> >> +     mtd_add_partition_attrs(new);
> >
> > Hmm, so you're adding the partition attribute only to dynamically
> > created partitions? I think we'll want it for all partitions. I know
> > the naming isn't completely straightforward, but some partitions are
> > added through add_mtd_device(), without calling mtd_add_partition().
> 
> It's also called in add_mtd_partitions, as you can see just below. I
> tested this with static partitions and the attribute was visible.

Sorry, must have overlooked this.

> >
> >> +
> >>       return ret;
> >>  err_inv:
> >>       mutex_unlock(&mtd_partitions_mutex);
> >> @@ -620,6 +646,8 @@ int mtd_del_partition(struct mtd_info *master, int partno)
> >>       list_for_each_entry_safe(slave, next, &mtd_partitions, list)
> >>               if ((slave->master == master) &&
> >>                   (slave->mtd.index == partno)) {
> >> +                     sysfs_remove_files(&slave->mtd.dev.kobj,
> >> +                                        mtd_partition_attrs);
> >>                       ret = del_mtd_device(&slave->mtd);
> >>                       if (ret < 0)
> >>                               break;
> >> @@ -663,6 +691,7 @@ int add_mtd_partitions(struct mtd_info *master,
> >>               mutex_unlock(&mtd_partitions_mutex);
> >>
> >>               add_mtd_device(&slave->mtd);
> >> +             mtd_add_partition_attrs(slave);
> >>
> >>               cur_offset = slave->offset + slave->mtd.size;

Brian
