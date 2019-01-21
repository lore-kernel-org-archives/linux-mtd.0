Return-Path: <SRS0=TRF+=P5=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3698C282F6
	for <linux-mtd@archiver.kernel.org>; Mon, 21 Jan 2019 10:03:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9167320663
	for <linux-mtd@archiver.kernel.org>; Mon, 21 Jan 2019 10:03:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="W+Mqd84D";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="cX0NIkos"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9167320663
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kIeE8UoqWW5Bghkkat3KzD4ixeHt6gFLOpr5JC5q7pc=; b=W+Mqd84DsbbSIw
	o2DQ/d77y7HoGD5v97nPz6hHLwBTL31/SSQhrDnG8C523y1f/kkB9dqUhcGWZ9bxHlVON+kP8aSt5
	LZ4Tn8796/ci1iS+Ur6F3Xj/l1mlkFF7iBNTgZiQySyZosAQslLjW91T+Qb86eSI95HcR5JdgP2jV
	e/pcJc3wUoORAgN/JLn7SeIqiwyW8zSmn3WTqXqGLcq/Rnwm2ImNFeB+WSQzCAiOxmF6Vx95pwhqS
	T9uwdXUJHbYgVNB+aNerRwwdNKUKnSeEhOzRD7harGzCVX3010V5cZB6T4yuFYp6zXlO0QzikPLf3
	WSVSdEzQT+/BZ2hn1f1A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1glWQc-0005hm-Cu; Mon, 21 Jan 2019 10:03:38 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1glWQY-0005gr-VQ
 for linux-mtd@lists.infradead.org; Mon, 21 Jan 2019 10:03:36 +0000
Received: from bbrezillon (91-160-177-164.subs.proxad.net [91.160.177.164])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7D6C620663;
 Mon, 21 Jan 2019 10:03:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1548065014;
 bh=ZtSJuBRIYBRIijp0GH12A+02D8AWmXri1+Gbk+XJ5vA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=cX0NIkosIYUJiC9PjNDiZ9lHTbqqDQNPoeHTJAEI4Mrm6jogennbboA6BoCPwdQ7U
 xIV8E2gfCnsKdw9hIJWjRaqZNLSpnNqtqvfs4lXJzQKDUA0BAR+7F2VWlZwrTR/UyV
 ejoLObA3VuRh6/GH2arhC/Fo1AlB/onr2UdI9h90=
Date: Mon, 21 Jan 2019 11:03:24 +0100
From: Boris Brezillon <bbrezillon@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH v3 1/2] mtd: partitions: clarify __mtd_del_partition() name
Message-ID: <20190121110324.1367d527@bbrezillon>
In-Reply-To: <20190117152929.28256-1-miquel.raynal@bootlin.com>
References: <20190117152929.28256-1-miquel.raynal@bootlin.com>
X-Mailer: Claws Mail 3.16.0 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190121_020335_027642_51AEA8BE 
X-CRM114-Status: GOOD (  19.17  )
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

On Thu, 17 Jan 2019 16:29:28 +0100
Miquel Raynal <miquel.raynal@bootlin.com> wrote:

> __mtd_del_partition() is a helper that must be called after the
> partition lock has ben taken. As there are already a few similar names

		     ^been

> (mtd_del_partitions(), del_mtd_partitions(), __mtd_del_partitions()),
> make this clear by renaming the helper mtd_del_partition_locked().

That's indeed a good step forward, but we still have all those variants
using sightly different names (mtd_<action>() and <action>_mtd()).
Would be great if we could make the names more explicit for those
functions too (or remove those that are unneeded). 

> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  drivers/mtd/mtdpart.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/mtd/mtdpart.c b/drivers/mtd/mtdpart.c
> index b6af41b04622..32beb9c2641f 100644
> --- a/drivers/mtd/mtdpart.c
> +++ b/drivers/mtd/mtdpart.c
> @@ -627,20 +627,20 @@ int mtd_add_partition(struct mtd_info *parent, const char *name,
>  EXPORT_SYMBOL_GPL(mtd_add_partition);
>  
>  /**
> - * __mtd_del_partition - delete MTD partition
> + * mtd_del_partition_locked - delete MTD partition
>   *
>   * @priv: internal MTD struct for partition to be deleted
>   *
>   * This function must be called with the partitions mutex locked.
>   */
> -static int __mtd_del_partition(struct mtd_part *priv)
> +static int mtd_del_partition_locked(struct mtd_part *priv)
>  {
>  	struct mtd_part *child, *next;
>  	int err;
>  
>  	list_for_each_entry_safe(child, next, &mtd_partitions, list) {
>  		if (child->parent == &priv->mtd) {
> -			err = __mtd_del_partition(child);
> +			err = mtd_del_partition_locked(child);
>  			if (err)
>  				return err;
>  		}
> @@ -670,7 +670,7 @@ int del_mtd_partitions(struct mtd_info *mtd)
>  	mutex_lock(&mtd_partitions_mutex);
>  	list_for_each_entry_safe(slave, next, &mtd_partitions, list)
>  		if (slave->parent == mtd) {
> -			ret = __mtd_del_partition(slave);
> +			ret = mtd_del_partition_locked(slave);
>  			if (ret < 0)
>  				err = ret;
>  		}
> @@ -688,7 +688,7 @@ int mtd_del_partition(struct mtd_info *mtd, int partno)
>  	list_for_each_entry_safe(slave, next, &mtd_partitions, list)
>  		if ((slave->parent == mtd) &&
>  		    (slave->mtd.index == partno)) {
> -			ret = __mtd_del_partition(slave);
> +			ret = mtd_del_partition_locked(slave);
>  			break;
>  		}
>  	mutex_unlock(&mtd_partitions_mutex);


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
