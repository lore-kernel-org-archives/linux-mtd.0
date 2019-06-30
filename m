Return-Path: <SRS0=n829=U5=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E45C9C5B576
	for <linux-mtd@archiver.kernel.org>; Sun, 30 Jun 2019 06:13:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A69C92086D
	for <linux-mtd@archiver.kernel.org>; Sun, 30 Jun 2019 06:13:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="oO7/eXGt";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="M2EATKnt"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A69C92086D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xIXxK88rwVDmUyrWDGfDsmA+Kk677MnndBXmvFhfHcY=; b=oO7/eXGt0aVz6R
	OTX9zMRe4AOqxdtY7K5+iVwsV7/NT8g8D0AvyVBJjrolPS7Jw0bqeY70c3MlAElGeIdSfYC/Iggjn
	C8G5o9xMBT/hZmrCB9kZLvaB9Zs2nJQUkdLk81oJeee2GdvOCTh2MCjWcuGA+jMExsF/JcEUoBr72
	poBmon2k2BNqnBQ8c27fc7r8+m2qnFYJn29g/k05CPZyfGnILGIztxErCH4Js4XhSzrWb5qAxAa6S
	rSSeMzmFDhxUgw7pfazwmgnEuIWSKX9aSIIkOKesvmYKcgqx7caMUuc5EQRLdjhws14Y4NK47BzCA
	Oi7GaE/QE6ykrZE3LbgQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hhT55-0007xx-Qn; Sun, 30 Jun 2019 06:12:55 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hhT52-0007xa-LK
 for linux-mtd@lists.infradead.org; Sun, 30 Jun 2019 06:12:54 +0000
Received: by mail-wm1-x344.google.com with SMTP id c6so12623757wml.0
 for <linux-mtd@lists.infradead.org>; Sat, 29 Jun 2019 23:12:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=aCbcCL94RNOC3Vfw8seUdbAmKn7uC7OVM/Bexv6YXaI=;
 b=M2EATKntOHHlNb69I/NE5iCq4RJBpuAfD/FRAnwfZM8Ao+X+8l2KXp92Ovpqc/kHpm
 w59kmiHzZS71mwlGbx5H44n3AKFyrXzR+tjoy1PTnijasO8gEhD3DyGBTTYFHP2HeMaG
 ER8X0HzjhK8Y19ZpyoTuxyQiBb+NtTNkdbLuc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=aCbcCL94RNOC3Vfw8seUdbAmKn7uC7OVM/Bexv6YXaI=;
 b=rH8lQQbypQ07QwnB9k6wNfxG9yx+qDkgJs/XsU97p3oRGT098gqv/1ydyuYR9c5WMf
 Gd23c2VJwvtgeTHS5caovF1SZK5QinnkUAae9G5g0e/YAO8kOjyAm78hN0ThgaEmfuGk
 GCYu4zWswfjl8Vc98GeUxIE5BA8s0pHS0sL8RXo1AxlNPv/mUrqstgVCW9sUvgOShHaC
 bg/a3NpwmzkNPCzIuJfMMnOU7UGTje/CDrOmuqhL+d9nl4SUwdo/z5Czn1kCnru5DmqO
 eiKDesEoNcEwJjdT+bb54xITOFx54sZBc2qTP86QecxvgZYORsS208OyL7frBWWwFZ/a
 kg7A==
X-Gm-Message-State: APjAAAVR+PICsWc/WqTmXkdgRPY1obdHauMgEw+USxklrpdUo98EJpYB
 kP5IrTkfWn5saCZgH/q0LQaVuHqFuVZ4zEJIykQ6lJDh
X-Google-Smtp-Source: APXvYqzSsFzlNcKkVZ9rE14g3KJ3LM4b0fkGb80bYVzejOmYSsJ8m3isWg7Y6NrucZWVkYqEVz//0fwL8QZVXEDD+2k=
X-Received: by 2002:a1c:c109:: with SMTP id r9mr13521760wmf.143.1561875169063; 
 Sat, 29 Jun 2019 23:12:49 -0700 (PDT)
MIME-Version: 1.0
References: <20190603123835.65536-1-zhuohao@chromium.org>
 <CABD5ybmjR3m28K7eK2XvUFgJmyeBY2DsjxCJpNdy6MKMHqM+-w@mail.gmail.com>
In-Reply-To: <CABD5ybmjR3m28K7eK2XvUFgJmyeBY2DsjxCJpNdy6MKMHqM+-w@mail.gmail.com>
From: Zhuohao Lee <zhuohao@chromium.org>
Date: Sun, 30 Jun 2019 14:12:38 +0800
Message-ID: <CABD5ybkopg55ZC9M153q3cat=+nigci_0E-rQcTmwmn4heE35A@mail.gmail.com>
Subject: Re: [PATCH v7 1/2] mtd: mtdcore: add debugfs nodes for querying the
 flash name and id
To: linux-mtd@lists.infradead.org, 
 Boris Brezillon <boris.brezillon@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190629_231252_728124_F319BBD7 
X-CRM114-Status: GOOD (  27.27  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Nicolas Boichat <drinkcat@chromium.org>, bbrezillon@kernel.org,
 richard@nod.at, Brian Norris <briannorris@chromium.org>,
 =?UTF-8?B?TWFyZWsgVmHFoXV0?= <marek.vasut@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Boris and all,

May i have your review for this patch?
I have changed the code based on the previous discussion?
Thank you for your time and effort :)

On Mon, Jun 17, 2019 at 10:13 AM Zhuohao Lee <zhuohao@chromium.org> wrote:
>
> Hi all, May i have your comment for this patch? Thanks.
>
> On Mon, Jun 3, 2019 at 8:38 PM Zhuohao Lee <zhuohao@chromium.org> wrote:
> >
> > Currently, we don't have vfs nodes for querying the underlying flash name
> > and flash id. This information is important especially when we want to
> > know the flash detail of the defective system. In order to support the
> > query, we add mtd_debugfs_populate() to create two debugfs nodes
> > (ie. partname and partid). The upper driver can assign the pointer to
> > partname and partid before calling mtd_device_register().
> >
> > Signed-off-by: Zhuohao Lee <zhuohao@chromium.org>
> > ---
> > Changes in V7:
> > - Remove unused check for partname/partid
> > - Previous discussion: https://patchwork.ozlabs.org/patch/1109200/
> > Changes in V6:
> > - Create the debugfs only when the partname/partid is not NULL
> > - Previous discussion: https://patchwork.ozlabs.org/patch/1109041/
> > Changes in V5:
> > - Move debugfs_create_dir() to mtd_debugfs_populate()
> > - Previous discussion: https://patchwork.ozlabs.org/patch/1107810/
> > Changes in V4:
> > - Separate the change to two patches. The first patch is adding the general
> >   handling for the partname and partid in the mtdcore.c. The second patch
> >   is enabling the two debugfs nodes for spi-nor.
> > - Previous discussion: https://patchwork.ozlabs.org/patch/1097377/
> > Changes in v3:
> > - Add partname and partid to mtd.h and create debugfs inside mtdcore.c
> > - Previous discussion: https://patchwork.ozlabs.org/patch/1095731/
> > Changes in v2:
> > - Change to use debugfs to output flash name and id
> > - Previous discussion: https://patchwork.ozlabs.org/patch/1067763/
> > ---
> >  drivers/mtd/mtdcore.c   | 84 ++++++++++++++++++++++++++++++++++++-----
> >  include/linux/mtd/mtd.h |  3 ++
> >  2 files changed, 78 insertions(+), 9 deletions(-)
> >
> > diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
> > index 3ef01baef9b6..d4603bc1d4eb 100644
> > --- a/drivers/mtd/mtdcore.c
> > +++ b/drivers/mtd/mtdcore.c
> > @@ -357,6 +357,80 @@ static const struct device_type mtd_devtype = {
> >         .release        = mtd_release,
> >  };
> >
> > +static int mtd_partid_show(struct seq_file *s, void *p)
> > +{
> > +       struct mtd_info *mtd = s->private;
> > +
> > +       seq_printf(s, "%s\n", mtd->dbg.partid);
> > +
> > +       return 0;
> > +}
> > +
> > +static int mtd_partid_debugfs_open(struct inode *inode, struct file *file)
> > +{
> > +       return single_open(file, mtd_partid_show, inode->i_private);
> > +}
> > +
> > +static const struct file_operations mtd_partid_debug_fops = {
> > +       .open           = mtd_partid_debugfs_open,
> > +       .read           = seq_read,
> > +       .llseek         = seq_lseek,
> > +       .release        = single_release,
> > +};
> > +
> > +static int mtd_partname_show(struct seq_file *s, void *p)
> > +{
> > +       struct mtd_info *mtd = s->private;
> > +
> > +       seq_printf(s, "%s\n", mtd->dbg.partname);
> > +
> > +       return 0;
> > +}
> > +
> > +static int mtd_partname_debugfs_open(struct inode *inode, struct file *file)
> > +{
> > +       return single_open(file, mtd_partname_show, inode->i_private);
> > +}
> > +
> > +static const struct file_operations mtd_partname_debug_fops = {
> > +       .open           = mtd_partname_debugfs_open,
> > +       .read           = seq_read,
> > +       .llseek         = seq_lseek,
> > +       .release        = single_release,
> > +};
> > +
> > +static struct dentry *dfs_dir_mtd;
> > +
> > +static void mtd_debugfs_populate(struct mtd_info *mtd)
> > +{
> > +       struct device *dev = &mtd->dev;
> > +       struct dentry *root, *dent;
> > +
> > +       if (IS_ERR_OR_NULL(dfs_dir_mtd))
> > +               return;
> > +
> > +       root = mtd->dbg.dfs_dir = debugfs_create_dir(dev_name(dev),
> > +                                                    dfs_dir_mtd);
> > +       if (IS_ERR_OR_NULL(root)) {
> > +               pr_debug("mtd device %s won't show data in debugfs\n",
> > +                        dev_name(dev));
> > +               return;
> > +       }
> > +
> > +       if (mtd->dbg.partid) {
> > +               dent = debugfs_create_file("partid", S_IRUSR, root, mtd,
> > +                                          &mtd_partid_debug_fops);
> > +               if (IS_ERR_OR_NULL(dent))
> > +                       pr_err("cannot create debugfs entry for partid\n");
> > +       }
> > +       if (mtd->dbg.partname) {
> > +               dent = debugfs_create_file("partname", S_IRUSR, root, mtd,
> > +                                          &mtd_partname_debug_fops);
> > +               if (IS_ERR_OR_NULL(dent))
> > +                       pr_err("cannot create debugfs entry for partname\n");
> > +       }
> > +}
> > +
> >  #ifndef CONFIG_MMU
> >  unsigned mtd_mmap_capabilities(struct mtd_info *mtd)
> >  {
> > @@ -534,8 +608,6 @@ static int mtd_nvmem_add(struct mtd_info *mtd)
> >         return 0;
> >  }
> >
> > -static struct dentry *dfs_dir_mtd;
> > -
> >  /**
> >   *     add_mtd_device - register an MTD device
> >   *     @mtd: pointer to new MTD device info structure
> > @@ -621,13 +693,7 @@ int add_mtd_device(struct mtd_info *mtd)
> >         if (error)
> >                 goto fail_nvmem_add;
> >
> > -       if (!IS_ERR_OR_NULL(dfs_dir_mtd)) {
> > -               mtd->dbg.dfs_dir = debugfs_create_dir(dev_name(&mtd->dev), dfs_dir_mtd);
> > -               if (IS_ERR_OR_NULL(mtd->dbg.dfs_dir)) {
> > -                       pr_debug("mtd device %s won't show data in debugfs\n",
> > -                                dev_name(&mtd->dev));
> > -               }
> > -       }
> > +       mtd_debugfs_populate(mtd);
> >
> >         device_create(&mtd_class, mtd->dev.parent, MTD_DEVT(i) + 1, NULL,
> >                       "mtd%dro", i);
> > diff --git a/include/linux/mtd/mtd.h b/include/linux/mtd/mtd.h
> > index 677768b21a1d..b11afb85d962 100644
> > --- a/include/linux/mtd/mtd.h
> > +++ b/include/linux/mtd/mtd.h
> > @@ -203,6 +203,9 @@ struct module;      /* only needed for owner field in mtd_info */
> >   */
> >  struct mtd_debug_info {
> >         struct dentry *dfs_dir;
> > +
> > +       const char *partname;
> > +       const char *partid;
> >  };
> >
> >  struct mtd_info {
> > --
> > 2.22.0.rc1.311.g5d7573a151-goog
> >

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
