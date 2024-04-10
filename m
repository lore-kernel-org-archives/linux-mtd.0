Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 441AFCD11C2
	for <linux-mtd@archiver.kernel.org>; Wed, 10 Apr 2024 23:11:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8jw6vxHrkMDMf2NUvp8q+12VwTY8m4rvT2HppCVKLss=; b=cCsgNnZXcBzpC9
	W5G/QHWdv1MXxySHUDiFBudfkxKHs36OQNeYEFtCJO5h9V74rFU6+SLglbIGQPaxlI+UgZKq2uaAY
	4NS2OyT80Lmc7uoxbao9xZuFZ1kd6b3N1d2rQydGqQ/PIYrSNA4ChoFCG8Z3xbk8MTDXYfpcd9oeU
	6/oonFlLYihcexQejUt2aEg2kCP8ghsoBV0Cv06bZxUbtMecMjTr4+PiR6rcUPABA7zb180tYtefT
	tOnKTbO22cIOR+0BA+shOaMZv1eZRT3irwauaqU1+csBOD7Zy8sAJfVrBQyt1eLM6MTMc/4XumBQ2
	cY7JBpkjCF6Z5aXeyktw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruh5z-00000009Os8-2Fdi;
	Wed, 10 Apr 2024 23:11:11 +0000
Received: from pidgin.makrotopia.org ([185.142.180.65])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruh5w-00000009Or7-2Fkq
	for linux-mtd@lists.infradead.org;
	Wed, 10 Apr 2024 23:11:09 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.96.2)
	(envelope-from <daniel@makrotopia.org>)
	id 1ruh5l-0002ER-22;
	Wed, 10 Apr 2024 23:10:57 +0000
Date: Thu, 11 Apr 2024 00:10:55 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: Zhihao Cheng <chengzhihao1@huawei.com>
Cc: richard@nod.at, linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] ubi: ubi_init: Fix missed ubiblock cleanup in error
 handling path
Message-ID: <Zhccfw4HbC_MKj65@makrotopia.org>
References: <20240410074033.2523399-1-chengzhihao1@huawei.com>
 <20240410074033.2523399-3-chengzhihao1@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240410074033.2523399-3-chengzhihao1@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240410_161108_600753_C3C5F03D 
X-CRM114-Status: GOOD (  18.29  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi!

On Wed, Apr 10, 2024 at 03:40:33PM +0800, Zhihao Cheng wrote:
> The ubiblock_init called by ubi_init will register device number, but
> device number is not released in error handling path of ubi_init when
> ubi is loaded by inserting module (eg. attaching failure), which leads
> to subsequent ubi_init calls failed by running out of device number
> (dmesg shows that "__register_blkdev: failed to get major for ubiblock").
> Fix it by invoking ubiblock_exit() in corresponding error handling path.

Thank you for taking care of this issue.

See my comment inline below:

> 
> Fixes: 927c145208b0 ("mtd: ubi: attach from device tree")
> Signed-off-by: Zhihao Cheng <chengzhihao1@huawei.com>
> ---
>  drivers/mtd/ubi/build.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/mtd/ubi/build.c b/drivers/mtd/ubi/build.c
> index 7f95fd7968a8..354517194099 100644
> --- a/drivers/mtd/ubi/build.c
> +++ b/drivers/mtd/ubi/build.c
> @@ -1380,12 +1380,13 @@ static int __init ubi_init(void)
>  	if (ubi_is_module()) {
>  		err = ubi_init_attach();
>  		if (err)
> -			goto out_mtd_notifier;
> +			goto out_block_exit;
>  	}
>  
>  	return 0;
>  
> -out_mtd_notifier:
> +out_block_exit:
> +	ubiblock_exit();

I believe that this call is the reason for the section mismatch we
are seeing on Intel's kernel test builds:

https://lore.kernel.org/oe-kbuild-all/202404110656.wLLc5mHR-lkp@intel.com/

Also note that Ben Hutchings has supplied a more complete and imho
better solution for this problem, which yet still suffers from the
same problem (calling __exit function from __init function which
results in section mismatch).


>  	unregister_mtd_user(&ubi_mtd_notifier);
>  out_debugfs:
>  	ubi_debugfs_exit();
> -- 
> 2.39.2
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
