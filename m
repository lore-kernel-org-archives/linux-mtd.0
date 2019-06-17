Return-Path: <SRS0=mO4J=UQ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04E19C31E49
	for <linux-mtd@archiver.kernel.org>; Mon, 17 Jun 2019 02:14:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CEE462089E
	for <linux-mtd@archiver.kernel.org>; Mon, 17 Jun 2019 02:14:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lmjGIpUt";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="fr0zjmP7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CEE462089E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Fmu4YWX6jl/1EcxlYgkGHbo2RsDyDZiGtW/szY0xgzg=; b=lmjGIpUtrdmPMk
	h+o7wKzrfY+V5upIt1YA9tCiVqQST9jW8IVUVznRhdjGloGrZ1iTpKXp3IECaydbtUd+dAzwuZv9v
	fHaMudmPcsLnrj4cKpe3v8waLCkPKtW6Jh9I6wvPTqQ4l7dCCuTtEdmUA7u2M3sZxZTOLkZHWSxD3
	fegLd1biHscpFFMtn+mHV2iaEOOP07WO53+cDr4NWV2zLA2AEJoBVbJ1hHA4fslz98mhZQFJjGVCO
	4/tXS8GGtNikD6TdMfSxPh2olTW0MW2rIEf1J0itElh3Bb8m/IXzKxy0/Pef7GPZFT0N9SA0bfV3o
	sA7he5nKf0mgn617BRnQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hch9q-0000JU-L9; Mon, 17 Jun 2019 02:14:06 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hch9n-0000It-Eb
 for linux-mtd@lists.infradead.org; Mon, 17 Jun 2019 02:14:05 +0000
Received: by mail-wr1-x444.google.com with SMTP id x4so8133215wrt.6
 for <linux-mtd@lists.infradead.org>; Sun, 16 Jun 2019 19:14:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zj8tzUPpH7Ysdeq0DeukpeRyPQ1mHGXnNsVsN7SZ/08=;
 b=fr0zjmP7IWU77lxbsnjszz8GGk2k6qdShv1k6ym5JBX7MRu6CrrCECR7pvjjAmqp0r
 VxdAUY3Frq7WOa2xcnVJKgAkBNaQ7KG1tNLfGn/EoOlc5oaRcQ3Zb5n+qfxU9VR6ud1t
 znMmyqyzZYX28UwQiyVyuqFQV/YFhZH6eoXYs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zj8tzUPpH7Ysdeq0DeukpeRyPQ1mHGXnNsVsN7SZ/08=;
 b=BC58hcPj9AjrtqfGAdmYOR8e4WSYchYdw9P1qmOuQggVir8Kt2h9aCXKP5nflFwNOq
 JZO4qT1qwWYM1FLG+p3Hql2zsSPgtDU+JJp9fxE2L+6qcLyTIf+nZXHT/5/rYLyhx2nu
 1fGsANHDB8XgHcll6pHi5XwDGuPaONN2MyCc/pcaMpqyUVVTiLvreCFA0mhb7j0pTciV
 rTJ6m29vgcXM2DLYgdis/wxiXvz8Fbq+8dpMMD6oLgUp/AtQf4iWHjH0RpJXVHtIK4A4
 IdiEmDL/zOzVF1hCEBJhDLbHxjNPxHOREW19W8++g1JbgBCo3DAjzhQAd7M36KP0l7QD
 6Ryg==
X-Gm-Message-State: APjAAAUg94P2GMXsOm2/DMYYUE8gx1e8Fx8iJeup5GSqKQwC+sxG65uB
 r/VvF8ve875TcVNYy9ni2nb+2NZaLLk5+wdl75bLyJdPNYI=
X-Google-Smtp-Source: APXvYqx4Duqe4xf7p+pF3AMwIYzSr6PoXy5gwrhjz1hp9NIUHhkW7/AmouEciKaAfpPrATTw1O1z1ibKzTzfCxq3QL8=
X-Received: by 2002:adf:b64e:: with SMTP id i14mr21237285wre.248.1560737639712; 
 Sun, 16 Jun 2019 19:13:59 -0700 (PDT)
MIME-Version: 1.0
References: <20190603123835.65536-1-zhuohao@chromium.org>
In-Reply-To: <20190603123835.65536-1-zhuohao@chromium.org>
From: Zhuohao Lee <zhuohao@chromium.org>
Date: Mon, 17 Jun 2019 10:13:49 +0800
Message-ID: <CABD5ybmjR3m28K7eK2XvUFgJmyeBY2DsjxCJpNdy6MKMHqM+-w@mail.gmail.com>
Subject: Re: [PATCH v7 1/2] mtd: mtdcore: add debugfs nodes for querying the
 flash name and id
To: linux-mtd@lists.infradead.org, 
 Boris Brezillon <boris.brezillon@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190616_191403_519020_C87FDBB0 
X-CRM114-Status: GOOD (  24.46  )
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

Hi all, May i have your comment for this patch? Thanks.

On Mon, Jun 3, 2019 at 8:38 PM Zhuohao Lee <zhuohao@chromium.org> wrote:
>
> Currently, we don't have vfs nodes for querying the underlying flash name
> and flash id. This information is important especially when we want to
> know the flash detail of the defective system. In order to support the
> query, we add mtd_debugfs_populate() to create two debugfs nodes
> (ie. partname and partid). The upper driver can assign the pointer to
> partname and partid before calling mtd_device_register().
>
> Signed-off-by: Zhuohao Lee <zhuohao@chromium.org>
> ---
> Changes in V7:
> - Remove unused check for partname/partid
> - Previous discussion: https://patchwork.ozlabs.org/patch/1109200/
> Changes in V6:
> - Create the debugfs only when the partname/partid is not NULL
> - Previous discussion: https://patchwork.ozlabs.org/patch/1109041/
> Changes in V5:
> - Move debugfs_create_dir() to mtd_debugfs_populate()
> - Previous discussion: https://patchwork.ozlabs.org/patch/1107810/
> Changes in V4:
> - Separate the change to two patches. The first patch is adding the general
>   handling for the partname and partid in the mtdcore.c. The second patch
>   is enabling the two debugfs nodes for spi-nor.
> - Previous discussion: https://patchwork.ozlabs.org/patch/1097377/
> Changes in v3:
> - Add partname and partid to mtd.h and create debugfs inside mtdcore.c
> - Previous discussion: https://patchwork.ozlabs.org/patch/1095731/
> Changes in v2:
> - Change to use debugfs to output flash name and id
> - Previous discussion: https://patchwork.ozlabs.org/patch/1067763/
> ---
>  drivers/mtd/mtdcore.c   | 84 ++++++++++++++++++++++++++++++++++++-----
>  include/linux/mtd/mtd.h |  3 ++
>  2 files changed, 78 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
> index 3ef01baef9b6..d4603bc1d4eb 100644
> --- a/drivers/mtd/mtdcore.c
> +++ b/drivers/mtd/mtdcore.c
> @@ -357,6 +357,80 @@ static const struct device_type mtd_devtype = {
>         .release        = mtd_release,
>  };
>
> +static int mtd_partid_show(struct seq_file *s, void *p)
> +{
> +       struct mtd_info *mtd = s->private;
> +
> +       seq_printf(s, "%s\n", mtd->dbg.partid);
> +
> +       return 0;
> +}
> +
> +static int mtd_partid_debugfs_open(struct inode *inode, struct file *file)
> +{
> +       return single_open(file, mtd_partid_show, inode->i_private);
> +}
> +
> +static const struct file_operations mtd_partid_debug_fops = {
> +       .open           = mtd_partid_debugfs_open,
> +       .read           = seq_read,
> +       .llseek         = seq_lseek,
> +       .release        = single_release,
> +};
> +
> +static int mtd_partname_show(struct seq_file *s, void *p)
> +{
> +       struct mtd_info *mtd = s->private;
> +
> +       seq_printf(s, "%s\n", mtd->dbg.partname);
> +
> +       return 0;
> +}
> +
> +static int mtd_partname_debugfs_open(struct inode *inode, struct file *file)
> +{
> +       return single_open(file, mtd_partname_show, inode->i_private);
> +}
> +
> +static const struct file_operations mtd_partname_debug_fops = {
> +       .open           = mtd_partname_debugfs_open,
> +       .read           = seq_read,
> +       .llseek         = seq_lseek,
> +       .release        = single_release,
> +};
> +
> +static struct dentry *dfs_dir_mtd;
> +
> +static void mtd_debugfs_populate(struct mtd_info *mtd)
> +{
> +       struct device *dev = &mtd->dev;
> +       struct dentry *root, *dent;
> +
> +       if (IS_ERR_OR_NULL(dfs_dir_mtd))
> +               return;
> +
> +       root = mtd->dbg.dfs_dir = debugfs_create_dir(dev_name(dev),
> +                                                    dfs_dir_mtd);
> +       if (IS_ERR_OR_NULL(root)) {
> +               pr_debug("mtd device %s won't show data in debugfs\n",
> +                        dev_name(dev));
> +               return;
> +       }
> +
> +       if (mtd->dbg.partid) {
> +               dent = debugfs_create_file("partid", S_IRUSR, root, mtd,
> +                                          &mtd_partid_debug_fops);
> +               if (IS_ERR_OR_NULL(dent))
> +                       pr_err("cannot create debugfs entry for partid\n");
> +       }
> +       if (mtd->dbg.partname) {
> +               dent = debugfs_create_file("partname", S_IRUSR, root, mtd,
> +                                          &mtd_partname_debug_fops);
> +               if (IS_ERR_OR_NULL(dent))
> +                       pr_err("cannot create debugfs entry for partname\n");
> +       }
> +}
> +
>  #ifndef CONFIG_MMU
>  unsigned mtd_mmap_capabilities(struct mtd_info *mtd)
>  {
> @@ -534,8 +608,6 @@ static int mtd_nvmem_add(struct mtd_info *mtd)
>         return 0;
>  }
>
> -static struct dentry *dfs_dir_mtd;
> -
>  /**
>   *     add_mtd_device - register an MTD device
>   *     @mtd: pointer to new MTD device info structure
> @@ -621,13 +693,7 @@ int add_mtd_device(struct mtd_info *mtd)
>         if (error)
>                 goto fail_nvmem_add;
>
> -       if (!IS_ERR_OR_NULL(dfs_dir_mtd)) {
> -               mtd->dbg.dfs_dir = debugfs_create_dir(dev_name(&mtd->dev), dfs_dir_mtd);
> -               if (IS_ERR_OR_NULL(mtd->dbg.dfs_dir)) {
> -                       pr_debug("mtd device %s won't show data in debugfs\n",
> -                                dev_name(&mtd->dev));
> -               }
> -       }
> +       mtd_debugfs_populate(mtd);
>
>         device_create(&mtd_class, mtd->dev.parent, MTD_DEVT(i) + 1, NULL,
>                       "mtd%dro", i);
> diff --git a/include/linux/mtd/mtd.h b/include/linux/mtd/mtd.h
> index 677768b21a1d..b11afb85d962 100644
> --- a/include/linux/mtd/mtd.h
> +++ b/include/linux/mtd/mtd.h
> @@ -203,6 +203,9 @@ struct module;      /* only needed for owner field in mtd_info */
>   */
>  struct mtd_debug_info {
>         struct dentry *dfs_dir;
> +
> +       const char *partname;
> +       const char *partid;
>  };
>
>  struct mtd_info {
> --
> 2.22.0.rc1.311.g5d7573a151-goog
>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
