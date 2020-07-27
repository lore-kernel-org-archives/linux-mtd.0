Return-Path: <SRS0=kfRK=BG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4B62C433E4
	for <linux-mtd@archiver.kernel.org>; Mon, 27 Jul 2020 13:37:05 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7F7F820672
	for <linux-mtd@archiver.kernel.org>; Mon, 27 Jul 2020 13:37:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ITdlfNic";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="cOdBxxBt"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7F7F820672
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=jFHCgjXcNVwwtq29uCcJfCwnwxcJ5xmmM0Kci/sU1gw=; b=ITdlfNic1P6uYFIEAYZH+T51Y
	5lgTR2z+WM7NQZEp8TjKKKgPBhe8/KPdy3fOvpwrbs42KiphdSM+Sg2c2z8ZdWu+8ADz+cDdpMx3H
	d8Fx+p84LBxtcsw32duKAegarRd+jW/RLzAhvbuIxWt/3L6HUA9ltJhE3Ffm3DY7NkS6D/fo0zrkT
	53IHghn3jqNT9Avq7OWU877l0TPBfgsDJUtFbxRgq/r8+hcTi64Zu6NG55bEDcjZhrgYXRTAjVj8x
	ZZZkZI3dgWeMTSA9xUZ0qiTbq9d0gJ373bYaEyPZQUWp5yXzKpUgf49YnstYJClG4V8gzrbnUMrRr
	xfuBgcD3A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k03IU-0005sV-8E; Mon, 27 Jul 2020 13:36:06 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k03IR-0005rc-Mb
 for linux-mtd@lists.infradead.org; Mon, 27 Jul 2020 13:36:04 +0000
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6E1732073E;
 Mon, 27 Jul 2020 13:36:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1595856963;
 bh=2Yq+MaLWcEj3edk4hAYe+/GUUNPl7bYKU7VolZjMk8Q=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=cOdBxxBt/q+rrdy3v0XAXcFUS9vLPTef2+ciFH6pn48TwW3z9CDqh5QGLeWXVS+bH
 XVsm7rkGWrJ+1AopPHwnzOS1Uw3vKOllI2CF4R2i0T0l2LyF+0Pnkv3M2Zy8ffsd9r
 o3wA/ex3iBmweMnlQ6936OrNIRMYqlRTwIuIfOm8=
Date: Mon, 27 Jul 2020 15:35:58 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [PATCH] mtd: unlock on error in ioctl
Message-ID: <20200727133558.GA28751@kroah.com>
References: <20200727112050.GF389488@mwanda>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200727112050.GF389488@mwanda>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200727_093603_846006_EEE20C78 
X-CRM114-Status: GOOD (  21.62  )
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
 linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Mon, Jul 27, 2020 at 02:20:50PM +0300, Dan Carpenter wrote:
> We need to unlock before returning on this error path.
> 
> Fixes: 210bec567936 ("mtd: properly check all write ioctls for permissions")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  drivers/mtd/mtdchar.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/mtd/mtdchar.c b/drivers/mtd/mtdchar.c
> index 52c120f9fb0d..05f9218592df 100644
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
> +			goto unlock;
> +		}
>  
>  		if (copy_from_user(&buf, argp, sizeof(buf)))
>  			ret = -EFAULT;
> @@ -1117,6 +1119,7 @@ static long mtdchar_compat_ioctl(struct file *file, unsigned int cmd,
>  		ret = mtdchar_ioctl(file, cmd, (unsigned long)argp);
>  	}
>  
> +unlock:
>  	mutex_unlock(&mtd_mutex);
>  
>  	return ret;
> -- 
> 2.27.0
> 

I think this is already fixed up in the mtd tree.

thanks,

greg k-h

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
