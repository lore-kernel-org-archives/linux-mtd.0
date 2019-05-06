Return-Path: <SRS0=tMSz=TG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,T_DKIMWL_WL_HIGH,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9E42C04AAA
	for <linux-mtd@archiver.kernel.org>; Mon,  6 May 2019 08:47:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8C9B1204FD
	for <linux-mtd@archiver.kernel.org>; Mon,  6 May 2019 08:47:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="KSwdT658";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="DrICLTtM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8C9B1204FD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JcMCLMe97+drGVFQSAOs/274D0skT5mFYnJlmufohaM=; b=KSwdT658ufhx/x
	U80MJ1/PY+SvmI/GXDRt87bo7XcMIDRK+4AuRHxIn3nvdIeQyt00ItOp64sfGrY6uILdvJAAlnJui
	4yoAdgn5H5pHJr+zEWBpt5x/tKyAKY32LxJjGCMSOYXA3oaVgVraX0vClYKSj6Z7Df+OXoOTcncKd
	/RLwb1YZuNLZdkvB09oLsEytX16lGcKxOV8lbk4vap22SHqf56ZHsIrm9/HmTCRRGfn3q1gx9HidF
	GXyzjhxJooShI375MAwttHd5Nwvz8ktF9mqCuwq/X08cFqtbJeYKi/d/tXg8iXarOeB/Ii1Hk5VSK
	zhQcJkxAXkG2ZlzqVxsA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hNZHS-0007GB-Nv; Mon, 06 May 2019 08:47:26 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hNZHP-0007Fq-SQ
 for linux-mtd@lists.infradead.org; Mon, 06 May 2019 08:47:25 +0000
Received: by mail-wm1-x341.google.com with SMTP id q15so14689209wmf.3
 for <linux-mtd@lists.infradead.org>; Mon, 06 May 2019 01:47:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wvvCez5gYM3/lSeU5YwS6wqkaYEfpuwOKkJqcFGfZvY=;
 b=DrICLTtM7BZfLGrg72a3+rTudjWuIptBToVmDun7fNKLMHc+HAbWuoxiQTEJb65iEW
 Gag6T1i1CI3NbUdJW4N9CmHLGXUhh3Vyd2H1ZSIy1Cgiyhib4/56R9fJjPd4q5F3RD81
 33+YBsFhTqZrdfacmX1AF3VhUXpNt3VlTO6SE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wvvCez5gYM3/lSeU5YwS6wqkaYEfpuwOKkJqcFGfZvY=;
 b=T0PXflLqFW7XTOJkYaz88rGQ7Bvhpulu8UUjF9z4u/rwSD/Cxjz4YAo/7kbulexWrM
 qhQ5W6W0MMZf6b43tb4Kb8til62sfska1MJMoemAcF37Js/DJN0yMyN5+NzrFyX361Rn
 ErshzP5Gb2rIGN0Kt9/pGXui8fp4qkw/RGERgC7fVY98WW+4ZpPy0N2ZpywIWNDgFCbF
 EtCVu/SBn2xMVjVJ7B5CmPx/pXjN2gZHF1qyhalPBwVx6QREnnswqH+7JBw9bkJftQNb
 zGeOHh0bp0rocbEw6JDhzwRwFYM/qriNavTIG8AfN8cowhmyaUdDwHrHBdfa+8OiKs8w
 7QdA==
X-Gm-Message-State: APjAAAUqx+mVLIHG5XYxgewnmZ1duu9rZCN9rz/OzMjDJtpazI/JcJd3
 HA9lOjBMWdZ4j+91VxJOks/W31bqSeuNE3+Z/CYoCsAsovQ=
X-Google-Smtp-Source: APXvYqy16lmg4yamsXy5mSc8ZOJEad24vTk+Il4Sb7j9kiwDof7nZIZYzWxrV+WiXWPzhypXfYoo8VGEXHFbU5AT9RQ=
X-Received: by 2002:a1c:9cd1:: with SMTP id f200mr15081929wme.91.1557132441225; 
 Mon, 06 May 2019 01:47:21 -0700 (PDT)
MIME-Version: 1.0
References: <20190506084414.89702-1-zhuohao@chromium.org>
In-Reply-To: <20190506084414.89702-1-zhuohao@chromium.org>
From: Zhuohao Lee <zhuohao@chromium.org>
Date: Mon, 6 May 2019 16:47:10 +0800
Message-ID: <CABD5ybkgQhwjLEStx1GsRNFvB8bbxtMqqi9DEV8J+dHU-yVcCQ@mail.gmail.com>
Subject: Re: [PATCH v2] mtd: spi-nor: add debugfs nodes for querying the flash
 name and id
To: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190506_014723_916032_8C5E5647 
X-CRM114-Status: GOOD (  24.55  )
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
Cc: Nicolas Boichat <drinkcat@chromium.org>, bbrezillon@kernel.org,
 richard@nod.at, Brian Norris <briannorris@chromium.org>,
 =?UTF-8?B?TWFyZWsgVmHFoXV0?= <marek.vasut@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

The previous discussion thread:  https://patchwork.ozlabs.org/patch/1067763/

On Mon, May 6, 2019 at 4:44 PM Zhuohao Lee <zhuohao@chromium.org> wrote:
>
> Currently, we don't have vfs nodes for querying the underlying
> flash name and flash id. This information is important especially
> when we want to know the flash detail of the defective system.
> In order to support the query, we add a function spi_nor_debugfs_create()
> to create the debugfs node (ie. flashname and flashid)
> This patch is modified based on the SPI-NOR flash system as we
> only have the SPI-NOR system now. But the idea should be applied to
> the other flash driver like NAND flash.
>
> The output of new debugfs nodes on my device are:
> cat /sys/kernel/debug/mtd/mtd0/flashid
> ef6017
> cat /sys/kernel/debug/mtd/mtd0/flashname
> w25q64dw
>
> Signed-off-by: Zhuohao Lee <zhuohao@chromium.org>
> ---
>  drivers/mtd/devices/m25p80.c  |  5 ++-
>  drivers/mtd/spi-nor/spi-nor.c | 62 +++++++++++++++++++++++++++++++++++
>  include/linux/mtd/spi-nor.h   |  6 ++++
>  3 files changed, 72 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
> index c4a1d04b8c80..be11e7d96646 100644
> --- a/drivers/mtd/devices/m25p80.c
> +++ b/drivers/mtd/devices/m25p80.c
> @@ -231,8 +231,11 @@ static int m25p_probe(struct spi_mem *spimem)
>         if (ret)
>                 return ret;
>
> -       return mtd_device_register(&nor->mtd, data ? data->parts : NULL,
> +       ret = mtd_device_register(&nor->mtd, data ? data->parts : NULL,
>                                    data ? data->nr_parts : 0);
> +       if (!ret)
> +               spi_nor_debugfs_create(nor);
> +       return ret;
>  }
>
>
> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
> index 6e13bbd1aaa5..004b6adf5866 100644
> --- a/drivers/mtd/spi-nor/spi-nor.c
> +++ b/drivers/mtd/spi-nor/spi-nor.c
> @@ -21,6 +21,8 @@
>  #include <linux/of_platform.h>
>  #include <linux/spi/flash.h>
>  #include <linux/mtd/spi-nor.h>
> +#include <linux/debugfs.h>
> +#include <linux/seq_file.h>
>
>  /* Define max times to check status register before we give up. */
>
> @@ -4161,6 +4163,66 @@ int spi_nor_scan(struct spi_nor *nor, const char *name,
>  }
>  EXPORT_SYMBOL_GPL(spi_nor_scan);
>
> +static int flashid_dbg_show(struct seq_file *s, void *p)
> +{
> +       struct spi_nor *nor = (struct spi_nor *)s->private;
> +       const struct flash_info *info = nor->info;
> +
> +       if (!info->id_len)
> +               return 0;
> +       seq_printf(s, "%*phN\n", info->id_len, info->id);
> +       return 0;
> +}
> +
> +static int flashid_debugfs_open(struct inode *inode, struct file *file)
> +{
> +       return single_open(file, flashid_dbg_show, inode->i_private);
> +}
> +
> +static const struct file_operations flashid_dbg_fops = {
> +       .open           = flashid_debugfs_open,
> +       .read           = seq_read,
> +       .llseek         = seq_lseek,
> +       .release        = single_release,
> +};
> +
> +static int flashname_dbg_show(struct seq_file *s, void *p)
> +{
> +       struct spi_nor *nor = (struct spi_nor *)s->private;
> +       const struct flash_info *info = nor->info;
> +
> +       if (!info->name)
> +               return 0;
> +       seq_printf(s, "%s\n", info->name);
> +       return 0;
> +}
> +
> +static int flashname_debugfs_open(struct inode *inode, struct file *file)
> +{
> +       return single_open(file, flashname_dbg_show, inode->i_private);
> +}
> +
> +static const struct file_operations flashname_dbg_fops = {
> +       .open           = flashname_debugfs_open,
> +       .read           = seq_read,
> +       .llseek         = seq_lseek,
> +       .release        = single_release,
> +};
> +
> +void spi_nor_debugfs_create(struct spi_nor *nor)
> +{
> +       struct mtd_info *mtd = &nor->mtd;
> +       struct dentry *root = mtd->dbg.dfs_dir;
> +
> +       if (IS_ERR_OR_NULL(root) || IS_ERR_OR_NULL(nor)) {
> +               return;
> +       }
> +       debugfs_create_file("flashid", S_IRUSR, root, nor,
> +                       &flashid_dbg_fops);
> +       debugfs_create_file("flashname", S_IRUSR, root, nor,
> +                       &flashname_dbg_fops);
> +}
> +
>  MODULE_LICENSE("GPL v2");
>  MODULE_AUTHOR("Huang Shijie <shijie8@gmail.com>");
>  MODULE_AUTHOR("Mike Lavender");
> diff --git a/include/linux/mtd/spi-nor.h b/include/linux/mtd/spi-nor.h
> index fa2d89e38e40..eadb5230c6d0 100644
> --- a/include/linux/mtd/spi-nor.h
> +++ b/include/linux/mtd/spi-nor.h
> @@ -530,4 +530,10 @@ int spi_nor_scan(struct spi_nor *nor, const char *name,
>   */
>  void spi_nor_restore(struct spi_nor *nor);
>
> +/**
> + * spi_nor_debugfs_create() - create debug fs
> + * @mtd:       the spi_nor structure
> + */
> +void spi_nor_debugfs_create(struct spi_nor *nor);
> +
>  #endif
> --
> 2.21.0.1020.gf2820cf01a-goog
>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
