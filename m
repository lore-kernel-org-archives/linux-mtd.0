Return-Path: <SRS0=tMSz=TG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,T_DKIMWL_WL_HIGH,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F9DAC04A6B
	for <linux-mtd@archiver.kernel.org>; Mon,  6 May 2019 11:37:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4D77B206BF
	for <linux-mtd@archiver.kernel.org>; Mon,  6 May 2019 11:37:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="c0lByfpd";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="fYrhc+wo"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4D77B206BF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CgtG5LcmFi57NLWXhByvF/xXxjXLewz45N9EdqFUTFM=; b=c0lByfpdpxgvbS
	KoS6HpVKkbYc/oEtZimI1y5O7DBaQ42KKfOQqOQ+RZqSytIajR4It4ql2Ed4wzccCqdpegIBb1agK
	Ccv+sASyuzupYeqlU1ojUJ/xU3mepvB8ibfe5EopU8+ntxLTe6ulP0lKJZQx/BoycqrHD8MkY2bz8
	c80ohC9Ze+5ypzdOqQqOx2Q7I7+iZeDCYa6yirtx9+AD/lKA+n7H/wViF4nue0UyUjz/AXBCEu9w2
	tSqcyq/iOwIj0fmQth3u5IeVyRGIQppm93I8joIX87/LHA4874uzFitYmONXwIxwlCzwQPdDDauAy
	97H78h+H6QL3t35euMTg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hNbvU-0003F9-PL; Mon, 06 May 2019 11:36:56 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hNbvR-0003Eg-DK
 for linux-mtd@lists.infradead.org; Mon, 06 May 2019 11:36:55 +0000
Received: by mail-wm1-x341.google.com with SMTP id b10so15367176wmj.4
 for <linux-mtd@lists.infradead.org>; Mon, 06 May 2019 04:36:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Hdgsasm85cLpyR+0zO9UBOEFTYWJLaXCuX6Xh5Umnis=;
 b=fYrhc+woeaOQFI3Ihy5OmqudKf1+eRh10Qxbl4Lvuz4hKNtsxZUqtwnNC3fb62hECe
 NPQ2VHuwFUcZCTD8QH1PQGY5vKxe08zPrjqL/pkwICb2GJwRo9J+tmY6qSDD3BDnMBSO
 YACjIRSjt3l6j8GDnb7Q8swbwNJqDWRayA5/s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Hdgsasm85cLpyR+0zO9UBOEFTYWJLaXCuX6Xh5Umnis=;
 b=mCVIqgB1/k9Kt7k0UC8lyPLTIntBGhX7hcdpE042FiBQFZ+VFYfYFA694gUZ/Shx62
 Ctb0oknDDqdOXQIbjAjFuA0u6yK/fV0vobqRqp0zLCRAR6AEA0TZAFv7jXuA4dl2/uvn
 6H7k9gBU0p0tlCtGfLofusQunLBIXBUsMO5pYgvHGPKswdKMJ9Xe4JQ1S9mpqvP75eZE
 7aFfO1otUORTJAYBKl5d60ZT8k1SC/WvmvV6gaLkKWIsN4LcFDqrVJ2yH2Dc9+roGH/w
 gxA/OZ1gWSEJ9gbm2wet/TLv1ScUYrck54dUEui0ekerio625xpk3TrPmcIpbRa6HNoS
 EhlA==
X-Gm-Message-State: APjAAAXdJkw6qyd0IxOs64W6INKCbhUlprPSZhGZ1I/uNIr/9Uv8kQL2
 V5OK40/L1DufDNwqSA/G9ZB/9gSuUAvDCfNrQNDGBg==
X-Google-Smtp-Source: APXvYqxYMwZr850Oc2ms5Uw7wL7Q0E1EzRzwM1i5zWOcTXWfAqDCpRIdvljauq44lHV0qzMKZkH+Q29iPAjW4GLqYWY=
X-Received: by 2002:a1c:1f92:: with SMTP id
 f140mr13611692wmf.132.1557142611608; 
 Mon, 06 May 2019 04:36:51 -0700 (PDT)
MIME-Version: 1.0
References: <20190506084414.89702-1-zhuohao@chromium.org>
 <CANMq1KBpqb5-Ab1z_9zzvNVCkY72pBrAEJ2UVO1CgOjP=xXQ+A@mail.gmail.com>
In-Reply-To: <CANMq1KBpqb5-Ab1z_9zzvNVCkY72pBrAEJ2UVO1CgOjP=xXQ+A@mail.gmail.com>
From: Zhuohao Lee <zhuohao@chromium.org>
Date: Mon, 6 May 2019 19:36:41 +0800
Message-ID: <CABD5ybnTbKLNUU68+bN9EcbkJECU6egPghUm=h=xHToWGmeWUw@mail.gmail.com>
Subject: Re: [PATCH v2] mtd: spi-nor: add debugfs nodes for querying the flash
 name and id
To: Nicolas Boichat <drinkcat@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190506_043653_483978_F772055E 
X-CRM114-Status: GOOD (  30.84  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: bbrezillon@kernel.org, richard@nod.at,
 Brian Norris <briannorris@chromium.org>,
 =?UTF-8?B?TWFyZWsgVmHFoXV0?= <marek.vasut@gmail.com>,
 linux-mtd@lists.infradead.org, Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Mon, May 6, 2019 at 5:07 PM Nicolas Boichat <drinkcat@chromium.org> wrote:
>
> On Mon, May 6, 2019 at 5:44 PM Zhuohao Lee <zhuohao@chromium.org> wrote:
> >
> > Currently, we don't have vfs nodes for querying the underlying
> > flash name and flash id. This information is important especially
> > when we want to know the flash detail of the defective system.
> > In order to support the query, we add a function spi_nor_debugfs_create()
> > to create the debugfs node (ie. flashname and flashid)
> > This patch is modified based on the SPI-NOR flash system as we
> > only have the SPI-NOR system now. But the idea should be applied to
> > the other flash driver like NAND flash.
> >
> > The output of new debugfs nodes on my device are:
> > cat /sys/kernel/debug/mtd/mtd0/flashid
> > ef6017
> > cat /sys/kernel/debug/mtd/mtd0/flashname
> > w25q64dw
> >
> > Signed-off-by: Zhuohao Lee <zhuohao@chromium.org>
> > ---
>
> For next time, please include notes/changelog here (after ---), e.g.
> things like link to previous discussion thread(s), changes since vX,
> etc.
>
> >  drivers/mtd/devices/m25p80.c  |  5 ++-
> >  drivers/mtd/spi-nor/spi-nor.c | 62 +++++++++++++++++++++++++++++++++++
> >  include/linux/mtd/spi-nor.h   |  6 ++++
> >  3 files changed, 72 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
> > index c4a1d04b8c80..be11e7d96646 100644
> > --- a/drivers/mtd/devices/m25p80.c
> > +++ b/drivers/mtd/devices/m25p80.c
> > @@ -231,8 +231,11 @@ static int m25p_probe(struct spi_mem *spimem)
>
> Can we add this to function that is generic to all spi-nor devices,
> instead of making this specific to m25p?
I can't find a better way to insert the spi_nor_debugfs_create()
inside spi_nor.c.
Another way is adding spi_nor_debugfs_create() to all of the caller.
What do you think? Any other suggestion?
>
> >         if (ret)
> >                 return ret;
> >
> > -       return mtd_device_register(&nor->mtd, data ? data->parts : NULL,
> > +       ret = mtd_device_register(&nor->mtd, data ? data->parts : NULL,
> >                                    data ? data->nr_parts : 0);
> > +       if (!ret)
> > +               spi_nor_debugfs_create(nor);
> > +       return ret;
> >  }
> >
> >
> > diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
> > index 6e13bbd1aaa5..004b6adf5866 100644
> > --- a/drivers/mtd/spi-nor/spi-nor.c
> > +++ b/drivers/mtd/spi-nor/spi-nor.c
> > @@ -21,6 +21,8 @@
> >  #include <linux/of_platform.h>
> >  #include <linux/spi/flash.h>
> >  #include <linux/mtd/spi-nor.h>
> > +#include <linux/debugfs.h>
> > +#include <linux/seq_file.h>
> >
> >  /* Define max times to check status register before we give up. */
> >
> > @@ -4161,6 +4163,66 @@ int spi_nor_scan(struct spi_nor *nor, const char *name,
> >  }
> >  EXPORT_SYMBOL_GPL(spi_nor_scan);
> >
> > +static int flashid_dbg_show(struct seq_file *s, void *p)
> > +{
> > +       struct spi_nor *nor = (struct spi_nor *)s->private;
> > +       const struct flash_info *info = nor->info;
> > +
> > +       if (!info->id_len)
> > +               return 0;
> > +       seq_printf(s, "%*phN\n", info->id_len, info->id);
> > +       return 0;
> > +}
> > +
> > +static int flashid_debugfs_open(struct inode *inode, struct file *file)
> > +{
> > +       return single_open(file, flashid_dbg_show, inode->i_private);
> > +}
> > +
> > +static const struct file_operations flashid_dbg_fops = {
> > +       .open           = flashid_debugfs_open,
> > +       .read           = seq_read,
> > +       .llseek         = seq_lseek,
> > +       .release        = single_release,
> > +};
> > +
> > +static int flashname_dbg_show(struct seq_file *s, void *p)
> > +{
> > +       struct spi_nor *nor = (struct spi_nor *)s->private;
> > +       const struct flash_info *info = nor->info;
> > +
> > +       if (!info->name)
> > +               return 0;
> > +       seq_printf(s, "%s\n", info->name);
> > +       return 0;
> > +}
> > +
> > +static int flashname_debugfs_open(struct inode *inode, struct file *file)
> > +{
> > +       return single_open(file, flashname_dbg_show, inode->i_private);
> > +}
> > +
> > +static const struct file_operations flashname_dbg_fops = {
> > +       .open           = flashname_debugfs_open,
> > +       .read           = seq_read,
> > +       .llseek         = seq_lseek,
> > +       .release        = single_release,
> > +};
> > +
> > +void spi_nor_debugfs_create(struct spi_nor *nor)
> > +{
> > +       struct mtd_info *mtd = &nor->mtd;
> > +       struct dentry *root = mtd->dbg.dfs_dir;
> > +
> > +       if (IS_ERR_OR_NULL(root) || IS_ERR_OR_NULL(nor)) {
>
> The second check looks useless. Or, to be precise, the kernel should
> already have crashed above. I'd just drop the check.
Ah.. i restructured the code and forgot to change this. I'll remove
this on the next patch.
>
> > +               return;
> > +       }
> > +       debugfs_create_file("flashid", S_IRUSR, root, nor,
> > +                       &flashid_dbg_fops);
> > +       debugfs_create_file("flashname", S_IRUSR, root, nor,
> > +                       &flashname_dbg_fops);
>
> Should we do something with the return values?
ok, i will add it on the next patch.
>
> Look at nandsim_debugfs_create for an example (also, we probably want
> to check for CONFIG_DEBUG_FS before calling these.
Do you mean adding the change like this?
                if (IS_ENABLED(CONFIG_DEBUG_FS) &&
                    !IS_ENABLED(CONFIG_MTD_PARTITIONED_MASTER))
                        NS_WARN("CONFIG_MTD_PARTITIONED_MASTER must be
enabled to expose debugfs stuff\n");
>
> > +}
> > +
> >  MODULE_LICENSE("GPL v2");
> >  MODULE_AUTHOR("Huang Shijie <shijie8@gmail.com>");
> >  MODULE_AUTHOR("Mike Lavender");
> > diff --git a/include/linux/mtd/spi-nor.h b/include/linux/mtd/spi-nor.h
> > index fa2d89e38e40..eadb5230c6d0 100644
> > --- a/include/linux/mtd/spi-nor.h
> > +++ b/include/linux/mtd/spi-nor.h
> > @@ -530,4 +530,10 @@ int spi_nor_scan(struct spi_nor *nor, const char *name,
> >   */
> >  void spi_nor_restore(struct spi_nor *nor);
> >
> > +/**
> > + * spi_nor_debugfs_create() - create debug fs
> > + * @mtd:       the spi_nor structure
>
> @nor
>
> > + */
> > +void spi_nor_debugfs_create(struct spi_nor *nor);
> > +
> >  #endif
> > --
> > 2.21.0.1020.gf2820cf01a-goog
> >

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
