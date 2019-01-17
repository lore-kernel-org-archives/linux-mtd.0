Return-Path: <SRS0=A6BC=PZ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B881C43387
	for <linux-mtd@archiver.kernel.org>; Thu, 17 Jan 2019 20:29:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 04C6F20868
	for <linux-mtd@archiver.kernel.org>; Thu, 17 Jan 2019 20:29:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hHTRmLWB";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="VabtL9+O"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 04C6F20868
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZCn+HeVhOKHIAtiN83BEQDpOwgD0ruLv+BNe0eLV768=; b=hHTRmLWBMadNuC
	ViL74drHDj6jAnOC5b1AZwATdFRkIOs8SmLaSPD5MP3qw/56Z11LwpIau+ZCtA6dYQA0yxFSI/F/R
	cVx8O47oiROe+achdcaL0sEh2oCbSMsaj7441tqz3xRcgy4Rdx723SW+kIi95Sto/qqeTJIBsimdl
	D3YDhPthmJmQ0QlpZ9Lr3d/5KJ4q8+fuJg1YWDbFZs9z3h99/E78IXGoZgMySb6iQBw/GgZUbdZpy
	tLtWpNHPsw1Yxl7ANm4908ngM2CMSgrxu3gK/c500/AF9VErzSKq5RVJQLNv2xLazPKWfVpIRjbTL
	gskdQm6VQF90W1oSAPsg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gkEIA-00069A-1O; Thu, 17 Jan 2019 20:29:34 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gkEI6-00068p-Q2
 for linux-mtd@lists.infradead.org; Thu, 17 Jan 2019 20:29:32 +0000
Received: from bbrezillon (91-160-177-164.subs.proxad.net [91.160.177.164])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id BC41620855;
 Thu, 17 Jan 2019 20:29:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1547756969;
 bh=0iqwkRoJcWZ4foZ4Dj9fCPimMi2Cvcu2PSjt8SYomLI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=VabtL9+Or8DTzdHStkbtLcoSNzxSXxIlrUY0T6Y+hQ+4t08BowARlRcAUI9aeBzBc
 xadUYOWuvsYQFyMmLIgwwfZt9eOaL8NPoVeKq7HeWqyDezhPupj77XOPDO6oANDhh9
 GeR1N1paGqTC9NLbPOXdcdwrxdonu4YOXzX2xuYU=
Date: Thu, 17 Jan 2019 21:29:16 +0100
From: Boris Brezillon <bbrezillon@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH v3 2/2] mtd: rework partitions handling
Message-ID: <20190117212916.70ad1269@bbrezillon>
In-Reply-To: <20190117152929.28256-2-miquel.raynal@bootlin.com>
References: <20190117152929.28256-1-miquel.raynal@bootlin.com>
 <20190117152929.28256-2-miquel.raynal@bootlin.com>
X-Mailer: Claws Mail 3.16.0 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190117_122930_877975_DC274134 
X-CRM114-Status: GOOD (  18.49  )
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
Cc: Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Richard Weinberger <richard@nod.at>, Marek Vasut <marek.vasut@gmail.com>,
 linux-mtd@lists.infradead.org, Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Thu, 17 Jan 2019 16:29:29 +0100
Miquel Raynal <miquel.raynal@bootlin.com> wrote:

> @@ -600,6 +601,7 @@ static int mtdchar_blkpg_ioctl(struct mtd_info *mtd,
>  static int mtdchar_write_ioctl(struct mtd_info *mtd,
>  		struct mtd_write_req __user *argp)
>  {
> +	struct mtd_info *master = mtd_get_master(mtd);
>  	struct mtd_write_req req;
>  	struct mtd_oob_ops ops;
>  	const void __user *usr_data, *usr_oob;
> @@ -611,9 +613,8 @@ static int mtdchar_write_ioctl(struct mtd_info *mtd,
>  	usr_data = (const void __user *)(uintptr_t)req.usr_data;
>  	usr_oob = (const void __user *)(uintptr_t)req.usr_oob;
>  
> -	if (!mtd->_write_oob)
> +	if (!master->_write_oob)
>  		return -EOPNOTSUPP;
> -

Keep this blank line.

>  	ops.mode = req.mode;
>  	ops.len = (size_t)req.len;
>  	ops.ooblen = (size_t)req.ooblen;

> @@ -936,20 +942,26 @@ EXPORT_SYMBOL_GPL(get_mtd_device);
>  
>  int __get_mtd_device(struct mtd_info *mtd)
>  {
> +	struct mtd_info *master = mtd_get_master(mtd);
>  	int err;
>  
> -	if (!try_module_get(mtd->owner))
> +	if (!try_module_get(master->owner))
>  		return -ENODEV;
>  
> -	if (mtd->_get_device) {
> -		err = mtd->_get_device(mtd);
> +	if (master->_get_device) {
> +		err = master->_get_device(mtd);

					 ^ master

I think I mentioned that one in my previous review ;-).

>  
>  		if (err) {
> -			module_put(mtd->owner);
> +			module_put(master->owner);
>  			return err;
>  		}
>  	}
> -	mtd->usecount++;
> +
> +	while (mtd->parent) {
> +		mtd->usecount++;
> +		mtd = mtd->parent;
> +	}
> +
>  	return 0;
>  }
>  EXPORT_SYMBOL_GPL(__get_mtd_device);

...

>  int mtd_block_markbad(struct mtd_info *mtd, loff_t ofs)
>  {
> -	if (!mtd->_block_markbad)
> +	struct mtd_info *master = mtd_get_master(mtd);
> +	int ret;
> +
> +	if (!master->_block_markbad)
>  		return -EOPNOTSUPP;
>  	if (ofs < 0 || ofs >= mtd->size)
>  		return -EINVAL;
>  	if (!(mtd->flags & MTD_WRITEABLE))
>  		return -EROFS;
> -	return mtd->_block_markbad(mtd, ofs);
> +
> +	ret = master->_block_markbad(master, mtd_get_master_offset(mtd, ofs));
> +	if (ret)
> +		return ret;
> +
> +	while (mtd->parent) {
> +		mtd->ecc_stats.badblocks++;
> +		mtd = mtd->parent;
> +	}

Not exactly related to this patch, but if we mark a block bad on the
master device this information is not propagated to parts exposing this
block.

> +
> +	return 0;
>  }
>  EXPORT_SYMBOL_GPL(mtd_block_markbad);

...

>  
>  /*
>   * This function unregisters and destroy all slave MTD objects which are
> - * attached to the given MTD object.
> + * attached to the given MTD object, recursively.
>   */
> +int del_mtd_partitions_locked(struct mtd_info *mtd)

Should be static as the only users are in mtdpart.c.

> +{
> +	struct mtd_info *child, *next;
> +	int ret, err = 0;
> +
> +	list_for_each_entry_safe(child, next, &mtd->partitions,
> +				 props.part.node) {
> +		if (mtd_has_partitions(child))
> +			del_mtd_partitions_locked(child);
> +
> +		pr_info("Deleting %s MTD partition\n", child->name);
> +		ret = del_mtd_device(child);
> +		if (ret < 0) {
> +			pr_err("Error when deleting partition \"%s\" (%d)\n",
> +			       child->name, ret);
> +			err = ret;
> +			continue;
> +		}
> +
> +		list_del(&child->props.part.node);
> +		free_partition(child);
> +	}
> +
> +	return err;
> +}

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
