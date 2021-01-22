Return-Path: <SRS0=x7NS=GZ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2E39C433DB
	for <linux-mtd@archiver.kernel.org>; Fri, 22 Jan 2021 17:18:38 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8DB4523433
	for <linux-mtd@archiver.kernel.org>; Fri, 22 Jan 2021 17:18:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8DB4523433
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=vYmTXdkvuc/j+MtZfmhYiamrONIcoAyfsbFpK0zS+38=; b=TXUyugMQ+5znjZU220XIsc2Px
	bLRI83Ko5xMLpt2dcM0wTJhGAWQWhccOS9wOZcdc/Tp9UhpwysJNBb+3qTvBwLaqkJ4KnJFC0rkvg
	e8JOXndIobZwPL/sd/JUP2ZiB2//LLt5cgwOvLHLFQie/b0hObv7zQbUGc/mWODJrmJ8dPDwfLAho
	Q+cI4lYdHZgFvSOripMAPQ55Pr29kGWudIV//YVQpik79bAPmBzfQLcKGSnVQhk7lacNf/JTYme1y
	he8Eh1AerfQnh1UOojAmahIpGENo4lQh7qoqShgum7qr4Eap92tLhI9d5YyHpH9YcrmmqinXLiiAR
	Zigviexqw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l303b-0002QX-No; Fri, 22 Jan 2021 17:17:11 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l303Z-0002PK-1N
 for linux-mtd@merlin.infradead.org; Fri, 22 Jan 2021 17:17:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=e9tNa+DNAK/w7dHpnhE9CZv0XhYPTiZ1o5OgFm/xBsA=; b=HGrf2jV89DXp1qFlvf/Z0Zxq1W
 ywMouOAB70GaSgY+sA4xH55a6JvJmXF7I1ynCpLdj4kEhi69eEXkSq31X9Ap+eamSVGjTxE2QdwCv
 12hNDxJfSkz0mqtyfts/2VdvLRupP2l/bmIHKeRgUNy7p/iThlHlNTAudehFMwFMgRJH+ll6CzzAG
 VG2vpsnzXwC+AXh0xgmu3Hc/TPpIxl9L3qaRiF4wva225YhzJJqXdaPsKjxCvM8M1jKxZziqBlktN
 xNg4dTWlPTfpyu2mdr0PFIyOzsylQNh3kpA9sh4Vnoo5a8+05GDkPmL1k+w3hcZj6dXlqt2WWfGBo
 6X0Z+T6g==;
Received: from hch by casper.infradead.org with local (Exim 4.94 #2 (Red Hat
 Linux)) id 1l303O-0010KD-C7; Fri, 22 Jan 2021 17:17:01 +0000
Date: Fri, 22 Jan 2021 17:16:58 +0000
From: Christoph Hellwig <hch@infradead.org>
To: Sascha Hauer <s.hauer@pengutronix.de>
Subject: Re: [PATCH 1/8] quota: Allow to pass mount path to quotactl
Message-ID: <20210122171658.GA237653@infradead.org>
References: <20210122151536.7982-1-s.hauer@pengutronix.de>
 <20210122151536.7982-2-s.hauer@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210122151536.7982-2-s.hauer@pengutronix.de>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
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
Cc: linux-fsdevel@vger.kernel.org, Richard Weinberger <richard@nod.at>,
 linux-mtd@lists.infradead.org, kernel@pengutronix.de, Jan Kara <jack@suse.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Fri, Jan 22, 2021 at 04:15:29PM +0100, Sascha Hauer wrote:
> This patch introduces the Q_PATH flag to the quotactl cmd argument.
> When given, the path given in the special argument to quotactl will
> be the mount path where the filesystem is mounted, instead of a path
> to the block device.
> This is necessary for filesystems which do not have a block device as
> backing store. Particularly this is done for upcoming UBIFS support.
> 
> Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>

I hate overloading quotactl even more.  Why not add a new quotactl_path
syscall instead?

> +static struct super_block *quotactl_sb(dev_t dev, int cmd)
>  {
>  	struct super_block *sb;
>  	bool excl = false, thawed = false;
>  
>  	if (quotactl_cmd_onoff(cmd)) {
>  		excl = true;
> @@ -901,12 +887,50 @@ static struct super_block *quotactl_block(const char __user *special, int cmd)
>  		goto retry;
>  	}
>  	return sb;
> +}
> +
> +/*
> + * look up a superblock on which quota ops will be performed
> + * - use the name of a block device to find the superblock thereon
> + */
> +static struct super_block *quotactl_block(const char __user *special, int cmd)
> +{
> +#ifdef CONFIG_BLOCK
> +	struct filename *tmp = getname(special);
> +	int error;
> +	dev_t dev;
>  
> +	if (IS_ERR(tmp))
> +		return ERR_CAST(tmp);
> +	error = lookup_bdev(tmp->name, &dev);
> +	putname(tmp);
> +	if (error)
> +		return ERR_PTR(error);
> +
> +	return quotactl_sb(dev, cmd);
>  #else
>  	return ERR_PTR(-ENODEV);
>  #endif

Normal kernel style would be to keep the ifdef entirely outside the
function.

> +static struct super_block *quotactl_path(const char __user *special, int cmd)
> +{
> +	struct super_block *sb;
> +	struct path path;
> +	int error;
> +
> +	error = user_path_at(AT_FDCWD, special, LOOKUP_FOLLOW | LOOKUP_AUTOMOUNT,
> +			   &path);

This adds an overly long line.

> +	if (error)
> +		return ERR_PTR(error);
> +
> +	sb = quotactl_sb(path.mnt->mnt_sb->s_dev, cmd);

I think quotactl_sb should take the superblock directly.  This will
need a little refactoring of user_get_super, but will lead to much
better logic.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
