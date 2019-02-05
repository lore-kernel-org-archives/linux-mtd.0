Return-Path: <SRS0=GMtL=QM=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD5ECC282D7
	for <linux-mtd@archiver.kernel.org>; Tue,  5 Feb 2019 22:48:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AB9B0206DD
	for <linux-mtd@archiver.kernel.org>; Tue,  5 Feb 2019 22:48:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="szF+4Ksj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AB9B0206DD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HpGisQVLPQ9j3mrSccHMjgyy9ORJLEa0+dJN+3jEUq0=; b=szF+4Ksj8HpJnF
	uFut6BgmQO7DEHQ36hsjt0xOOVuV/f0doETZGhKXalk78rMXiK0iJKnziQLtkTONAWJEyZxg8JULK
	TevLjD5MlS8ECkw7UPP6V8PsvFOiY4l3LEt6BjXdM/nPj16nw+ae54kgKZOA7aij/RnhLvDNBybKC
	Pz8KK+LoDDbuH85a+rwJMICC+fbSqQLzKjchxZ+ODBLtXJTX73uP0o7Jibxgs3X1dRtDxYcmgQ9F6
	hMlV5gDL0k3jSrDGECqC4St6EW+IhaFmz1G7vfkzsT0Q8ed3bkUIbG1OXvltcrj+QuhglHqFVzD9u
	DbKnawGIGiJokdYHz/gQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gr9WO-000198-6f; Tue, 05 Feb 2019 22:48:52 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gr9WK-00018d-EG
 for linux-mtd@lists.infradead.org; Tue, 05 Feb 2019 22:48:50 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:b93f:9fae:b276:a89a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id BB31E27FFA4;
 Tue,  5 Feb 2019 22:48:46 +0000 (GMT)
Date: Tue, 5 Feb 2019 23:48:43 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Subject: Re: [PATCH] drivers/mtd: Fix device registration error
Message-ID: <20190205234805.5558ef98@gmail.com>
In-Reply-To: <20190205090547.8418-1-aneesh.kumar@linux.ibm.com>
References: <20190205090547.8418-1-aneesh.kumar@linux.ibm.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190205_144848_738473_128BC67E 
X-CRM114-Status: GOOD (  17.47  )
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
Cc: linux-mtd@lists.infradead.org, Alban Bedel <albeu@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hello Aneesh,

On Tue,  5 Feb 2019 14:35:47 +0530
"Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com> wrote:

> This change helps me to get multiple mtd device registered. Without this
> I get
> 
> sysfs: cannot create duplicate filename '/bus/nvmem/devices/flash0'
> CPU: 0 PID: 1 Comm: swapper/0 Not tainted 5.0.0-rc2-00557-g1ef20ef21f22 #13
> Call Trace:
> [c0000000b38e3220] [c000000000b58fe4] dump_stack+0xe8/0x164 (unreliable)
> [c0000000b38e3270] [c0000000004cf074] sysfs_warn_dup+0x84/0xb0
> [c0000000b38e32f0] [c0000000004cf6c4] sysfs_do_create_link_sd.isra.0+0x114/0x150
> [c0000000b38e3340] [c000000000726a84] bus_add_device+0x94/0x1e0
> [c0000000b38e33c0] [c0000000007218f0] device_add+0x4d0/0x830
> [c0000000b38e3480] [c0000000009d54a8] nvmem_register.part.2+0x1c8/0xb30
> [c0000000b38e3560] [c000000000834530] mtd_nvmem_add+0x90/0x120
> [c0000000b38e3650] [c000000000835bc8] add_mtd_device+0x198/0x4e0
> [c0000000b38e36f0] [c00000000083619c] mtd_device_parse_register+0x11c/0x280
> [c0000000b38e3780] [c000000000840830] powernv_flash_probe+0x180/0x250
> [c0000000b38e3820] [c00000000072c120] platform_drv_probe+0x60/0xf0
> [c0000000b38e38a0] [c0000000007283c8] really_probe+0x138/0x4d0
> [c0000000b38e3930] [c000000000728acc] driver_probe_device+0x13c/0x1b0
> [c0000000b38e39b0] [c000000000728c7c] __driver_attach+0x13c/0x1c0
> [c0000000b38e3a30] [c000000000725130] bus_for_each_dev+0xa0/0x120
> [c0000000b38e3a90] [c000000000727b2c] driver_attach+0x2c/0x40
> [c0000000b38e3ab0] [c0000000007270f8] bus_add_driver+0x228/0x360
> [c0000000b38e3b40] [c00000000072a2e0] driver_register+0x90/0x1a0
> [c0000000b38e3bb0] [c00000000072c020] __platform_driver_register+0x50/0x70
> [c0000000b38e3bd0] [c00000000105c984] powernv_flash_driver_init+0x24/0x38
> [c0000000b38e3bf0] [c000000000010904] do_one_initcall+0x84/0x464
> [c0000000b38e3cd0] [c000000001004548] kernel_init_freeable+0x530/0x634
> [c0000000b38e3db0] [c000000000011154] kernel_init+0x1c/0x168
> [c0000000b38e3e20] [c00000000000bed4] ret_from_kernel_thread+0x5c/0x68
> mtd mtd1: Failed to register NVMEM device
> 
> With the change we now have
> 
> /sys/bus/nvmem/devices# ls -al
> total 0
> drwxr-xr-x 2 root root 0 Feb  5 12:21 .
> drwxr-xr-x 4 root root 0 Feb  5 12:21 ..
> lrwxrwxrwx 1 root root 0 Feb  5 12:21 flash0 -> ../../../devices/platform/ibm,opal:flash@0/mtd/mtd0/flash0
> lrwxrwxrwx 1 root root 0 Feb  5 12:21 flash1 -> ../../../devices/platform/ibm,opal:flash@1/mtd/mtd1/flash1
> 
> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
> ---
>  drivers/mtd/mtdcore.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
> index 999b705769a8..90035da3423c 100644
> --- a/drivers/mtd/mtdcore.c
> +++ b/drivers/mtd/mtdcore.c
> @@ -503,10 +503,11 @@ static int mtd_nvmem_reg_read(void *priv, unsigned int offset,
>  	return retlen == bytes ? 0 : -EIO;
>  }
>  
> -static int mtd_nvmem_add(struct mtd_info *mtd)
> +static int mtd_nvmem_add(struct mtd_info *mtd, int i)
>  {
>  	struct nvmem_config config = {};
>  
> +	config.id = i;
>  	config.dev = &mtd->dev;
>  	config.name = mtd->name;

mtd->name should be unique in the first place, otherwise mtdparts
parsing won't work (it's using mtd->name to match the device
partitions should be applied to) and I guess there might be other
issues. I know it's currently not enforced, but this kind of
situation makes me realize we should enforce it.

So the right fix would be to have config.id = -1 and ensure mtd->name
is unique at MTD registration time.

Back to your specific powernv case, using DT node name doesn't work, as
the @<id> suffix is dropped, which means all your flash devices are
named 'flash'.

>  	config.owner = THIS_MODULE;
> @@ -616,7 +617,7 @@ int add_mtd_device(struct mtd_info *mtd)
>  		goto fail_added;
>  
>  	/* Add the nvmem provider */
> -	error = mtd_nvmem_add(mtd);
> +	error = mtd_nvmem_add(mtd, i);
>  	if (error)
>  		goto fail_nvmem_add;
>  

Regards,

Boris

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
