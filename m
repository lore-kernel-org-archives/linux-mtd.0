Return-Path: <SRS0=ioUS=UC=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,T_DKIMWL_WL_HIGH,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6803FC04AB6
	for <linux-mtd@archiver.kernel.org>; Mon,  3 Jun 2019 07:21:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3B00827C95
	for <linux-mtd@archiver.kernel.org>; Mon,  3 Jun 2019 07:21:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="solyu5RI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3B00827C95
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BwEf/CcrnZZiLY4fURbEICELhoXal2G9eyI98xeNM54=; b=solyu5RIim3eOA
	fU1tKiuf1H/D+crz13DOF52PRQ2dJ+nLpTFxiS17wD9DqdtyEImGzc1e4SLmVLohA1iZKISkiQP3c
	M8nqeKpgWNMLciPDwCn29aZDaPQNXlisHJoQO6Wc9lIj0MEA5IJMWhT+id6FJxMqILY7rlTcnRV3f
	HE+p5c6Kb4ahSbIBN/3Ui+dXQWkemHrA4w7l1m5DdLPQVh14RC0oz/++CYh/GumbcbXACuO8kL0Tj
	tHyLzBG0XtRtuIYIy9gg01M3Zy7qNsv78G52hhub0Dsk5mdHQjH9IJ60kjQXdoUk23aOESCqZqCzB
	aJzB/hztMHlr2ZD5FZcw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hXhHI-0007Cx-KJ; Mon, 03 Jun 2019 07:21:08 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hXhHE-0007BU-D7
 for linux-mtd@lists.infradead.org; Mon, 03 Jun 2019 07:21:07 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 830CB26D296;
 Mon,  3 Jun 2019 08:20:59 +0100 (BST)
Date: Mon, 3 Jun 2019 09:20:56 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Zhuohao Lee <zhuohao@chromium.org>
Subject: Re: [PATCH v5 1/2] mtd: mtdcore: add debugfs nodes for querying the
 flash name and id
Message-ID: <20190603092056.34f136d0@collabora.com>
In-Reply-To: <20190603031451.60749-1-zhuohao@chromium.org>
References: <20190603031451.60749-1-zhuohao@chromium.org>
Organization: Collabora
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190603_002104_700719_E57748ED 
X-CRM114-Status: GOOD (  25.77  )
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
Cc: drinkcat@chromium.org, bbrezillon@kernel.org, richard@nod.at,
 briannorris@chromium.org, marek.vasut@gmail.com, linux-mtd@lists.infradead.org,
 computersforpeace@gmail.com, dwmw2@infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Mon,  3 Jun 2019 11:14:50 +0800
Zhuohao Lee <zhuohao@chromium.org> wrote:

> Currently, we don't have vfs nodes for querying the underlying flash name
> and flash id. This information is important especially when we want to
> know the flash detail of the defective system. In order to support the
> query, we add mtd_debugfs_populate() to create two debugfs nodes
> (ie. partname and partid). The upper driver can assign the pointer to
> partname and partid before calling mtd_device_register().
> 
> Signed-off-by: Zhuohao Lee <zhuohao@chromium.org>
> ---
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
>  drivers/mtd/mtdcore.c   | 88 ++++++++++++++++++++++++++++++++++++-----
>  include/linux/mtd/mtd.h |  4 ++
>  2 files changed, 83 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
> index 3ef01baef9b6..b1911c21eb1a 100644
> --- a/drivers/mtd/mtdcore.c
> +++ b/drivers/mtd/mtdcore.c
> @@ -357,6 +357,84 @@ static const struct device_type mtd_devtype = {
>  	.release	= mtd_release,
>  };
>  
> +static int mtd_partid_show(struct seq_file *s, void *p)
> +{
> +	struct mtd_info *mtd = s->private;
> +
> +	if (!mtd->dbg.partid)
> +		return 0;
> +
> +	seq_printf(s, "%s\n", mtd->dbg.partid);
> +
> +	return 0;
> +}
> +
> +static int mtd_partid_debugfs_open(struct inode *inode, struct file *file)
> +{
> +	return single_open(file, mtd_partid_show, inode->i_private);
> +}
> +
> +static const struct file_operations mtd_partid_debug_fops = {
> +	.open           = mtd_partid_debugfs_open,
> +	.read           = seq_read,
> +	.llseek         = seq_lseek,
> +	.release        = single_release,
> +};
> +
> +static int mtd_partname_show(struct seq_file *s, void *p)
> +{
> +	struct mtd_info *mtd = s->private;
> +
> +	if (!mtd->dbg.partname)
> +		return 0;
> +
> +	seq_printf(s, "%s\n", mtd->dbg.partname);
> +
> +	return 0;
> +}
> +
> +static int mtd_partname_debugfs_open(struct inode *inode, struct file *file)
> +{
> +	return single_open(file, mtd_partname_show, inode->i_private);
> +}
> +
> +static const struct file_operations mtd_partname_debug_fops = {
> +	.open           = mtd_partname_debugfs_open,
> +	.read           = seq_read,
> +	.llseek         = seq_lseek,
> +	.release        = single_release,
> +};
> +
> +static struct dentry *dfs_dir_mtd;
> +
> +static void mtd_debugfs_populate(struct mtd_info *mtd)
> +{
> +	struct device *dev = &mtd->dev;
> +	struct dentry *root, *dent;
> +
> +	if (IS_ERR_OR_NULL(dfs_dir_mtd))
> +		return;
> +
> +	root = mtd->dbg.dfs_dir = debugfs_create_dir(dev_name(dev),
> +						     dfs_dir_mtd);
> +	if (IS_ERR_OR_NULL(root)) {
> +		pr_debug("mtd device %s won't show data in debugfs\n",
> +			 dev_name(dev));
> +		return;
> +	}
> +
> +	dent = debugfs_create_file("partid", S_IRUSR, root, mtd,
> +				   &mtd_partid_debug_fops);
> +	if (IS_ERR_OR_NULL(dent)) {
> +		pr_err("cannot create debugfs entry for partid\n");
> +		return;
> +	}
> +	dent = debugfs_create_file("partname", S_IRUSR, root, mtd,
> +				   &mtd_partname_debug_fops);
> +	if (IS_ERR_OR_NULL(dent))
> +		pr_err("cannot create debugfs entry for partname\n");

I wonder if it's not better to create those files only when
mtd->dbg.part{name,id} != NULL. This way you could get rid of the
if (!mtd->dbg.part{name,id}) test in the show funcs, and most
importantly, the user would know when this fields are not present
without having to read the file and test for an empty string.

> +}
> +
>  #ifndef CONFIG_MMU
>  unsigned mtd_mmap_capabilities(struct mtd_info *mtd)
>  {
> @@ -534,8 +612,6 @@ static int mtd_nvmem_add(struct mtd_info *mtd)
>  	return 0;
>  }
>  
> -static struct dentry *dfs_dir_mtd;
> -
>  /**
>   *	add_mtd_device - register an MTD device
>   *	@mtd: pointer to new MTD device info structure
> @@ -621,13 +697,7 @@ int add_mtd_device(struct mtd_info *mtd)
>  	if (error)
>  		goto fail_nvmem_add;
>  
> -	if (!IS_ERR_OR_NULL(dfs_dir_mtd)) {
> -		mtd->dbg.dfs_dir = debugfs_create_dir(dev_name(&mtd->dev), dfs_dir_mtd);
> -		if (IS_ERR_OR_NULL(mtd->dbg.dfs_dir)) {
> -			pr_debug("mtd device %s won't show data in debugfs\n",
> -				 dev_name(&mtd->dev));
> -		}
> -	}
> +	mtd_debugfs_populate(mtd);
>  
>  	device_create(&mtd_class, mtd->dev.parent, MTD_DEVT(i) + 1, NULL,
>  		      "mtd%dro", i);
> diff --git a/include/linux/mtd/mtd.h b/include/linux/mtd/mtd.h
> index 677768b21a1d..c20f53c77899 100644
> --- a/include/linux/mtd/mtd.h
> +++ b/include/linux/mtd/mtd.h
> @@ -203,6 +203,10 @@ struct module;	/* only needed for owner field in mtd_info */
>   */
>  struct mtd_debug_info {
>  	struct dentry *dfs_dir;
> +
> +	/* debugfs stuff starts here */

This comment is no longer valid: the whole struct contains debugfs
stuff :P.

> +	const char *partname;
> +	const char *partid;
>  };
>  
>  struct mtd_info {


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
