Return-Path: <SRS0=uaub=TX=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,T_DKIMWL_WL_HIGH,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80B25C282DD
	for <linux-mtd@archiver.kernel.org>; Thu, 23 May 2019 21:39:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4368D2168B
	for <linux-mtd@archiver.kernel.org>; Thu, 23 May 2019 21:39:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="A0SgF948";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="JBXJKln3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4368D2168B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=t2MN2Z1T8ByY5cwn7qGf4VXRDdlUlFqoIJJwR5UxK7g=; b=A0SgF948oF564Y
	OuXbHTAslTmtHfJOnlARlobDAqe8caJhIgOl7Qgg56rYGQZ+hMtSB7Jd8T3RAv+1vPE1lfWlc9obS
	4knJgPdqCVee+Uz6o3y9vKadcS/eNb+YRoah3b3qb7nMm2Y5WUMfwIiEcKkyKp8OxkHHR21Srfunj
	lSrZJP/8PLVTeJ9eLF++qur6yMAobj01HZ73PtZarcPLhRrTmXk7tks4cyvUE837c+s4d8nNGMELp
	MnMtQxHq0XaSMVDksPKdiC6oV0TPLhKRNvajsMeaNiUUEgpc++tM49wJL4/YmNbpErZKWUT9qXaiL
	Bu45NAO5q0//564j19rg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hTvQc-0000t5-EL; Thu, 23 May 2019 21:39:10 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hTvQZ-0000sL-2N
 for linux-mtd@lists.infradead.org; Thu, 23 May 2019 21:39:08 +0000
Received: by mail-wr1-x442.google.com with SMTP id f10so7821005wre.7
 for <linux-mtd@lists.infradead.org>; Thu, 23 May 2019 14:39:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=y0xz3G2w/pcWarna8kPJ4muprzBoVbA2p82SC8mNkzU=;
 b=JBXJKln3Q+Hgg2st8MXF2bq6GFrv6XmfiG5ib9vVMkVxJB/eByWRwv9sPWvYbc5OW3
 /QCP+ss6sOObvhpF0H2kBeoVqKc1SEqab34+PPKySiImw1oaWdu6I1l6Z9PjuBgXFze5
 Wb/g2AzYi/gTQcwmyW9pY9fdUefUlPq+hYhHc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=y0xz3G2w/pcWarna8kPJ4muprzBoVbA2p82SC8mNkzU=;
 b=D9Arh80KwdaSFBgWPu1Z53Fz9tZH8QejybeokQoJruXD+gJJPbfkxgvXRaMAYhqYlf
 NaZOWdcJjns8iytZFi1Ie5rY2tk/sunB7jx/gWRtx9yP8dcL/JWAElFoUnlqvpBqxOlb
 entVewNuoi1ZXki6GyX9t19yxSafIcgt/yVbWmxCkfSEuMkdn3dB4nIBGPvs+9auRnXn
 roqwIK/V//07W27T0A8I9bF2Atv0wqwdL9IdJp2rNY/5XtPwTWiiDrBNVvrJCatAgxWd
 0SQI/DYt5UxLDc8/ZSxBvDOH8dE6OgPPdbdlfK5aGZ03wPh+L79jSBu6ApzuziNtHkgB
 wrzQ==
X-Gm-Message-State: APjAAAXjVjWu1UEMJ/oufHwaiCkRC4erEBKle9TZ96dLKl9SeYzKldvS
 N87FyyjFRdHXEMrrguznmKqA4IRV57s79LEpq2/KoxeK9js=
X-Google-Smtp-Source: APXvYqx3/khYt4EW6kCyXEA8/p5dI+ObiRwkM1zs8cDG5LDQSBqd0olpEglR8N+vaXbWgYg2ktvgWBQ9Qr5Yyaxh6jQ=
X-Received: by 2002:a5d:6849:: with SMTP id o9mr7604772wrw.196.1558647544530; 
 Thu, 23 May 2019 14:39:04 -0700 (PDT)
MIME-Version: 1.0
References: <20190509071005.198887-1-zhuohao@chromium.org>
In-Reply-To: <20190509071005.198887-1-zhuohao@chromium.org>
From: Zhuohao Lee <zhuohao@chromium.org>
Date: Thu, 23 May 2019 14:38:53 -0700
Message-ID: <CABD5ybnG9PwbZ1KC1nfCiT6mP5H1VLDgLWcMLzpPnyr=8wMKJQ@mail.gmail.com>
Subject: Re: [PATCH v3] mtd: spi-nor: add debugfs nodes for querying the flash
 name and id
To: linux-mtd@lists.infradead.org, 
 Boris Brezillon <boris.brezillon@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190523_143907_213300_B8D866C8 
X-CRM114-Status: GOOD (  27.30  )
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

Hi all, May i have your comment for this patch? Thanks.

On Thu, May 9, 2019 at 12:10 AM Zhuohao Lee <zhuohao@chromium.org> wrote:
>
> Currently, we don't have vfs nodes for querying the underlying flash name
> and flash id. This information is important especially when we want to
> know the flash detail of the defective system. In order to support the
> query, we add mtd_debugfs_create() to create two debugfs nodes
> (ie. partname and partid). The upper driver can assign the pointer to
> partname and partid before calling mtd_device_register().
> This patch is modified based on the SPI-NOR flash system as we only have
> the SPI-NOR system now. But the idea should be applied to the other flash
> driver like NAND flash.
>
> The output of new debugfs nodes on my device are:
> cat /sys/kernel/debug/mtd/mtd0/partid
> spi-nor:ef6017
> cat /sys/kernel/debug/mtd/mtd0/partname
> w25q64dw
>
> Signed-off-by: Zhuohao Lee <zhuohao@chromium.org>
> ---
> Changes in v3:
> - Add partname and partid to mtd.h and create debugfs inside mtdcore.c
> - Previous discussion: https://patchwork.ozlabs.org/patch/1095731/
> Changes in v2:
> - Change to use debugfs to output flash name and id
> - Previous discussion: https://patchwork.ozlabs.org/patch/1067763/
> ---
>  drivers/mtd/mtdcore.c         | 68 +++++++++++++++++++++++++++++++++++
>  drivers/mtd/spi-nor/spi-nor.c | 19 ++++++++++
>  include/linux/mtd/mtd.h       |  4 +++
>  3 files changed, 91 insertions(+)
>
> diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
> index 3ef01baef9b6..f68f055bfd47 100644
> --- a/drivers/mtd/mtdcore.c
> +++ b/drivers/mtd/mtdcore.c
> @@ -357,6 +357,71 @@ static const struct device_type mtd_devtype = {
>         .release        = mtd_release,
>  };
>
> +static int mtd_partid_show(struct seq_file *s, void *p)
> +{
> +       struct mtd_info *mtd = s->private;
> +
> +       if (!mtd->partid)
> +               return 0;
> +
> +       seq_printf(s, "%s\n", mtd->partid);
> +
> +       return 0;
> +}
> +
> +static int mtd_partid_dbgfs_open(struct inode *inode, struct file *file)
> +{
> +       return single_open(file, mtd_partid_show, inode->i_private);
> +}
> +
> +static const struct file_operations mtd_partid_dbg_fops = {
> +       .open           = mtd_partid_dbgfs_open,
> +       .read           = seq_read,
> +       .llseek         = seq_lseek,
> +       .release        = single_release,
> +};
> +
> +static int mtd_partname_show(struct seq_file *s, void *p)
> +{
> +       struct mtd_info *mtd = s->private;
> +
> +       if (!mtd->partname)
> +               return 0;
> +
> +       seq_printf(s, "%s\n", mtd->partname);
> +
> +       return 0;
> +}
> +
> +static int mtd_partname_dbgfs_open(struct inode *inode, struct file *file)
> +{
> +       return single_open(file, mtd_partname_show, inode->i_private);
> +}
> +
> +static const struct file_operations mtd_partname_dbg_fops = {
> +       .open           = mtd_partname_dbgfs_open,
> +       .read           = seq_read,
> +       .llseek         = seq_lseek,
> +       .release        = single_release,
> +};
> +
> +static int mtd_debugfs_create(struct mtd_info *mtd)
> +{
> +       struct dentry *root = mtd->dbg.dfs_dir;
> +       struct dentry *dent_id, *dent_name;
> +
> +       dent_id = debugfs_create_file("partid", S_IRUSR, root, mtd,
> +                                     &mtd_partid_dbg_fops);
> +       dent_name = debugfs_create_file("partname", S_IRUSR, root, mtd,
> +                                       &mtd_partname_dbg_fops);
> +       if (IS_ERR_OR_NULL(dent_id) || IS_ERR_OR_NULL(dent_name)) {
> +               pr_err("cannot create debugfs entry\n");
> +               return -1;
> +       }
> +
> +       return 0;
> +}
> +
>  #ifndef CONFIG_MMU
>  unsigned mtd_mmap_capabilities(struct mtd_info *mtd)
>  {
> @@ -626,6 +691,9 @@ int add_mtd_device(struct mtd_info *mtd)
>                 if (IS_ERR_OR_NULL(mtd->dbg.dfs_dir)) {
>                         pr_debug("mtd device %s won't show data in debugfs\n",
>                                  dev_name(&mtd->dev));
> +               } else if (mtd_debugfs_create(mtd)) {
> +                       pr_debug("mtd device %s can't create debugfs\n",
> +                                dev_name(&mtd->dev));
>                 }
>         }
>
> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
> index 6e13bbd1aaa5..9f157dff0f2c 100644
> --- a/drivers/mtd/spi-nor/spi-nor.c
> +++ b/drivers/mtd/spi-nor/spi-nor.c
> @@ -38,6 +38,7 @@
>
>  #define SPI_NOR_MAX_ID_LEN     6
>  #define SPI_NOR_MAX_ADDR_WIDTH 4
> +#define SPI_NOR_MAX_ID_STRING  (SPI_NOR_MAX_ID_LEN + 9)
>
>  struct spi_nor_read_command {
>         u8                      num_mode_clocks;
> @@ -240,6 +241,12 @@ struct flash_info {
>          */
>         u8              id[SPI_NOR_MAX_ID_LEN];
>         u8              id_len;
> +       /*
> +        * This string stores the output format of the id
> +        * The format looks like this: spi-nor:xxxxxx\0
> +        * The max length of the string is 8 + SPI_NOR_MAX_ID_LEN + 1
> +        */
> +       char            id_string[SPI_NOR_MAX_ID_STRING];
>
>         /* The size listed here is what works with SPINOR_OP_SE, which isn't
>          * necessarily called a "sector" by the vendor.
> @@ -3935,6 +3942,15 @@ static void spi_nor_resume(struct mtd_info *mtd)
>                 dev_err(dev, "resume() failed\n");
>  }
>
> +static void spi_nor_format_id_string(const struct flash_info *info)
> +{
> +       char *id_string = (char *)info->id_string;
> +
> +       if (!snprintf(id_string, SPI_NOR_MAX_ID_STRING,
> +                     "spi-nor:%*phN", info->id_len, info->id))
> +               memset(id_string, 0, SPI_NOR_MAX_ID_STRING);
> +}
> +
>  void spi_nor_restore(struct spi_nor *nor)
>  {
>         /* restore the addressing mode */
> @@ -4009,6 +4025,7 @@ int spi_nor_scan(struct spi_nor *nor, const char *name,
>         }
>
>         nor->info = info;
> +       spi_nor_format_id_string(info);
>
>         mutex_init(&nor->lock);
>
> @@ -4027,6 +4044,8 @@ int spi_nor_scan(struct spi_nor *nor, const char *name,
>
>         if (!mtd->name)
>                 mtd->name = dev_name(dev);
> +       mtd->partname = info->name;
> +       mtd->partid = info->id_string;
>         mtd->priv = nor;
>         mtd->type = MTD_NORFLASH;
>         mtd->writesize = 1;
> diff --git a/include/linux/mtd/mtd.h b/include/linux/mtd/mtd.h
> index 677768b21a1d..f7b193167680 100644
> --- a/include/linux/mtd/mtd.h
> +++ b/include/linux/mtd/mtd.h
> @@ -344,6 +344,10 @@ struct mtd_info {
>         int usecount;
>         struct mtd_debug_info dbg;
>         struct nvmem_device *nvmem;
> +
> +       /* debugfs stuff starts here */
> +       const char *partname;
> +       const char *partid;
>  };
>
>  int mtd_ooblayout_ecc(struct mtd_info *mtd, int section,
> --
> 2.21.0.1020.gf2820cf01a-goog
>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
