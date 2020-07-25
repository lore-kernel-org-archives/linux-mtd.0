Return-Path: <SRS0=DDtA=BE=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B64E5C433DF
	for <linux-mtd@archiver.kernel.org>; Sat, 25 Jul 2020 06:37:31 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 83FA32074A
	for <linux-mtd@archiver.kernel.org>; Sat, 25 Jul 2020 06:37:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="AAHREjnC";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="itgm4Lpp"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 83FA32074A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=4SmrFAu3fe8hRyHZGJRQFYRU+IkUq8sXG2bXLCaHl8c=; b=AAHREjnCQwIn8bG3pMbZazFan
	Tf1Fp319bzZakwPA0vkpzKIe7ReE2EcQs1Has+Nak8NTIRaVXxZilwA/jCDN7uXcOgrMGg9vuJWMg
	bx95YTbj2Nt+0JRB1qoGdEU9x7XVNH+WrIg1f3/ut9+8GxOtDo0zEX+gx+V+tMkd+kas+nHqAlf98
	nQ8zoL/Yts1NfSRim3bKPa19pxCNZ8M+7rSsxhz2syON8q+f6r5cgB5vobL66F6Yppubv6KBDJL9i
	1jMlFEYdWfdUiYrwJGSTB/yt0ff27vcNJkH2jpdDG6FFyVWQf9COwTLgPk3bSb/YzbjGQK3fH1ecy
	ZpLxXovmw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jzDnt-0001wB-5t; Sat, 25 Jul 2020 06:37:05 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jzDnq-0001vJ-2t
 for linux-mtd@lists.infradead.org; Sat, 25 Jul 2020 06:37:02 +0000
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C2F812070E;
 Sat, 25 Jul 2020 06:37:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1595659021;
 bh=TqBid881gbTdHYWUqMo1o1X4MNRMshLRJeGzN4al/UU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=itgm4LppO2guNmU4POTZuG0/5SrzYDgkpKnsojwJbWKL13TF4trwhVTzHL4dK4H2t
 u1VlQ6Ruhosttf2w2vRaksx89173u1V9PZqyhPR9wlYaghf58p6UN/6hc0yJySZsaf
 PFrQuP4Wn818Gk4flt289c+few8n9VH7cA/WNK1Q=
Date: Sat, 25 Jul 2020 08:37:01 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Wei Yongjun <weiyongjun1@huawei.com>
Subject: Re: [PATCH -next] mtd: fix missing unlock on error in
 mtdchar_compat_ioctl()
Message-ID: <20200725063701.GA1058480@kroah.com>
References: <20200725063416.172037-1-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200725063416.172037-1-weiyongjun1@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200725_023702_195053_496121E9 
X-CRM114-Status: GOOD (  17.46  )
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>, Richard Weinberger <richard@nod.at>,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 Hulk Robot <hulkci@huawei.com>, linux-mtd@lists.infradead.org,
 Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Sat, Jul 25, 2020 at 06:34:16AM +0000, Wei Yongjun wrote:
> Add the missing unlock before return from function mtdchar_compat_ioctl()
> in the error handling case.
> 
> Fixes: 210bec567936 ("mtd: properly check all write ioctls for permissions")
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> ---
>  drivers/mtd/mtdchar.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/mtd/mtdchar.c b/drivers/mtd/mtdchar.c
> index 52c120f9fb0d..b40f46a43fc6 100644
> --- a/drivers/mtd/mtdchar.c
> +++ b/drivers/mtd/mtdchar.c
> @@ -1064,8 +1064,10 @@ static long mtdchar_compat_ioctl(struct file *file, unsigned int cmd,
>  		struct mtd_oob_buf32 buf;
>  		struct mtd_oob_buf32 __user *buf_user = argp;
>  
> -		if (!(file->f_mode & FMODE_WRITE))
> -			return -EPERM;
> +		if (!(file->f_mode & FMODE_WRITE)) {
> +			ret = -EPERM;
> +			break;
> +		}
>  
>  		if (copy_from_user(&buf, argp, sizeof(buf)))
>  			ret = -EFAULT;
> 
> 
> 

I think Richard already resolved this in his tree, but I could be wrong.

And nice detection by your bot, that's good to see.

thanks,

greg k-h

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
