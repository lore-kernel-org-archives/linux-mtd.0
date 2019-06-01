Return-Path: <SRS0=JwiN=UA=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,T_DKIMWL_WL_HIGH,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0D23C28CC1
	for <linux-mtd@archiver.kernel.org>; Sat,  1 Jun 2019 08:09:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AB84E27173
	for <linux-mtd@archiver.kernel.org>; Sat,  1 Jun 2019 08:09:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="svlvzhgw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AB84E27173
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VdrWqTpsJYpc0AaceB7eVR0ad4c3WS02EB4MQ8n+2Lg=; b=svlvzhgwAbDo91
	yLt2xg7Kw8k9dhVrJwlWg+lSr+Q2s9VNUB2i97R4h9Ey+Jm9h7nwjsWi0p9NK353tWgrvcAGRXrOS
	+2NRz+hQpCc/Fgb7Tpo3/LzPU73DyuZdVLEXe46levT1oxWyUYY/aSmBB3MjLzbKOygR/kXVjfxD/
	GauVdFs13ce4OTBCOLOyujqNjnpdT7h0m/lQYh56vEBRHuI9c+qgtVQur36yCRlSdh4r2HslNk+lD
	0uDQanfHnRQPZJeF37FsOn0h7x5hEdbW+0I6gS/b1hylAgwMAnWA90KXxS0LjXZXCq0HmgBie1MCH
	WkWvuflxq55JlmI5uj2Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hWz4z-0003yB-BV; Sat, 01 Jun 2019 08:09:29 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hWz4v-0003xd-6a
 for linux-mtd@lists.infradead.org; Sat, 01 Jun 2019 08:09:27 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 18858263975;
 Sat,  1 Jun 2019 09:09:23 +0100 (BST)
Date: Sat, 1 Jun 2019 10:09:20 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Zhuohao Lee <zhuohao@chromium.org>
Subject: Re: [PATCH v4 1/2] mtd: mtdcore: add debugfs nodes for querying the
 flash name and id
Message-ID: <20190601100920.44ec2a3e@collabora.com>
In-Reply-To: <20190530152101.176431-1-zhuohao@chromium.org>
References: <20190530152101.176431-1-zhuohao@chromium.org>
Organization: Collabora
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190601_010925_502104_6D9078EB 
X-CRM114-Status: GOOD (  21.27  )
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

On Thu, 30 May 2019 23:21:00 +0800
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
>  drivers/mtd/mtdcore.c   | 72 +++++++++++++++++++++++++++++++++++++++++
>  include/linux/mtd/mtd.h |  4 +++
>  2 files changed, 76 insertions(+)
> 
> diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
> index 3ef01baef9b6..b53b40cb2f04 100644
> --- a/drivers/mtd/mtdcore.c
> +++ b/drivers/mtd/mtdcore.c
> @@ -357,6 +357,75 @@ static const struct device_type mtd_devtype = {
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
> +static int mtd_debugfs_populate(struct mtd_info *mtd)
> +{
> +	struct dentry *root = mtd->dbg.dfs_dir;
> +	struct dentry *dent;
> +
> +	dent = debugfs_create_file("partid", S_IRUSR, root, mtd,
> +				   &mtd_partid_debug_fops);
> +	if (IS_ERR_OR_NULL(dent)) {
> +		pr_err("cannot create debugfs entry for partid\n");
> +		return -ENODEV;
> +	}
> +	dent = debugfs_create_file("partname", S_IRUSR, root, mtd,
> +				   &mtd_partname_debug_fops);
> +	if (IS_ERR_OR_NULL(dent)) {
> +		pr_err("cannot create debugfs entry for partname\n");
> +		return -ENODEV;
> +	}
> +
> +	return 0;
> +}
> +
>  #ifndef CONFIG_MMU
>  unsigned mtd_mmap_capabilities(struct mtd_info *mtd)
>  {
> @@ -626,6 +695,9 @@ int add_mtd_device(struct mtd_info *mtd)
>  		if (IS_ERR_OR_NULL(mtd->dbg.dfs_dir)) {
>  			pr_debug("mtd device %s won't show data in debugfs\n",
>  				 dev_name(&mtd->dev));
> +		} else if (mtd_debugfs_populate(mtd)) {
> +			pr_debug("mtd device %s can't create debugfs\n",

						      s/create/populate/

Also, not sure we really need a dbg message here since you already have
error messages in mtd_debugfs_populate().

One last thing: can we move the debugfs_create_dir() call to
mtd_debugfs_populate() so all you have to do from add_mtd_device()
is call mtd_debugfs_populate().

Once addressed, you can add

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>

> +				 dev_name(&mtd->dev));
>  		}
>  	}
>  
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
> +	const char *partname;
> +	const char *partid;
>  };
>  
>  struct mtd_info {


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
