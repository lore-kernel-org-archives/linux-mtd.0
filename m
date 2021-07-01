Return-Path: <SRS0=sguX=LZ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49A3AC11F67
	for <linux-mtd@archiver.kernel.org>; Thu,  1 Jul 2021 21:35:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0B68E613ED
	for <linux-mtd@archiver.kernel.org>; Thu,  1 Jul 2021 21:35:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0B68E613ED
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZB4ByTl6bDqv1K4aYjRLGaWlRX0d5mN4BaZvwR6lx9Y=; b=ZhDpxYcW/RdQKW
	/IBEQhiaeQLgE+t6eZ2Ao0jTTu7jn4cH+zSgD5j3NzEK90meK/CcBTw5JgENGuDAJaGnwQwK9C6ZP
	vWKpIpwFdoU1aSXhAI63Zu6hTk3qpMVzeOhRyD4BNrtUrAcEsCWHNd87abw0gAR8aB68gs6vrNNR/
	mDHqAkPIbpDgmZqOJJ377cdsb7Zywy4XMZqYNpvZeVfhvcIcvyChPK4wXXwibSsfdw3uCJpau42V0
	98xL2Z9EJiOwT2Ob6cICr498mwrNJBTQp8er4CnWsL+I7YDlG77ix4Uk1Ifdby7qpQkw/gtuigfhB
	//joZ+wHIfsBxbhfFJ/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lz4KK-001DKg-86; Thu, 01 Jul 2021 21:34:28 +0000
Received: from mail-ot1-x329.google.com ([2607:f8b0:4864:20::329])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lz4KG-001DJ7-6n
 for linux-mtd@lists.infradead.org; Thu, 01 Jul 2021 21:34:26 +0000
Received: by mail-ot1-x329.google.com with SMTP id
 t24-20020a9d7f980000b029046f4a1a5ec4so8068899otp.1
 for <linux-mtd@lists.infradead.org>; Thu, 01 Jul 2021 14:34:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=zHaOcbhEOP65MYJ0K1yzWm33CLB3MFmc9gWhgP2wXaY=;
 b=rkqHUlsGlzPxAhoH7T5uLJncAlKgs9ugPtSWKeoCmE4L0ZBdZCM98Pza7jQAMAf42d
 z0dnAxtAHQSHh+HsTLphvB8rTGgxIv4z0tSC+kgeuSLCbWEnaePN5omIk0OQiJyURsUB
 Rqi9IqDosvCi8f4JlSGnxdPwK+AqXHHgq19JUG6SFouuy6JPZutmSKtDInzpIQMQZBW4
 1AUL24mk+M5JM9FY8p9OzG+Ogo18RM9tLY7pUgT6Qt4rEjOuNi5bYHkT+Bdhxi6HhLnv
 gzYsvjn2Gxgt1w7kALIPmpdicLoOD3iyOXjAdGWClYT4XlDuwzHzarXwq56jYRXrOOuQ
 UVxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to;
 bh=zHaOcbhEOP65MYJ0K1yzWm33CLB3MFmc9gWhgP2wXaY=;
 b=XkRjdHtVQhm8ySqs2N/+0VW7TLvzl2LckDSrlmh46oDACJp5F+fdxGkgldi1OZCqqr
 zClU2t1jtyOr5SD8fqbhUXjuMQ4TzPS1CbTSmKwQWNuPcybk0kxqmZoVoEwbqP8dTZVQ
 6W4l+PHuP8vDrY4LzLYugiT4kmBb58LQZt+c3McECRihfZgmZKfB1nYlcaUqKF+zt8j0
 LiGohDYw0jRB7CgrsXdet2+748ujX/0lOehzduMEQM6+13aC1TIamoRD3b7mbvfCp706
 PLOrPMNb5h7Qds7+64nzLg+4UxkCSEe3C5IoE+YlPbiOqzrTqBf5ahuHr8ljJSr363H7
 QRrQ==
X-Gm-Message-State: AOAM5315B3ozDesG+YQ8nVD8leRAlBLPKfqA1pphJItqh8ac62TtK1lF
 oen65W7LR8Fm87AHLZSg6lI=
X-Google-Smtp-Source: ABdhPJyoSr8NM2yT52A+wLopriUYiot4+d+HlIMbiI5BEev+z6QMQpUN36Pmfe1GSV6Y3RHLDk7V1A==
X-Received: by 2002:a9d:6244:: with SMTP id i4mr1664023otk.136.1625175262965; 
 Thu, 01 Jul 2021 14:34:22 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id g1sm209321otq.22.2021.07.01.14.34.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Jul 2021 14:34:22 -0700 (PDT)
Date: Thu, 1 Jul 2021 14:34:20 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Michael Walle <michael@walle.cc>
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Rob Herring <robh+dt@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH v2 5/5] mtd: core: add OTP nvmem provider support
Message-ID: <20210701213420.GA1131789@roeck-us.net>
References: <20210424110608.15748-1-michael@walle.cc>
 <20210424110608.15748-6-michael@walle.cc>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210424110608.15748-6-michael@walle.cc>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210701_143424_304459_AD82190F 
X-CRM114-Status: GOOD (  37.39  )
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

Hi,

On Sat, Apr 24, 2021 at 01:06:08PM +0200, Michael Walle wrote:
> Flash OTP regions can already be read via user space. Some boards have
> their serial number or MAC addresses stored in the OTP regions. Add
> support for them being a (read-only) nvmem provider.
> 
> The API to read the OTP data is already in place. It distinguishes
> between factory and user OTP, thus there are up to two different
> providers.
> 
> Signed-off-by: Michael Walle <michael@walle.cc>

This patch causes a boot failure with one of my qemu tests.
With the patch in place, the flash fails to instantiate.

[    1.156578] Creating 3 MTD partitions on "physmap-flash":
[    1.157192] 0x000000000000-0x000000040000 : "U-Boot Bootloader"
[    1.184632] 0x000000040000-0x000000060000 : "U-Boot Environment"
[    1.201767] 0x000000060000-0x000000800000 : "Flash"
[    1.222320] Deleting MTD partitions on "physmap-flash":
[    1.222744] Deleting U-Boot Bootloader MTD partition
[    1.303597] Deleting U-Boot Environment MTD partition
[    1.368751] Deleting Flash MTD partition
[    1.430619] physmap-flash: probe of physmap-flash failed with error -61

-61 is -ENODATA.

Other boot tests with different flash chips can still boot.
Reverting this patch (as well as the follow-up patches) fixes
the problem.

I do not know if this is a problem with qemu or a problem with the
patch, but, as I mentioned, other flash chips do still instantiate.

Do you have an idea what to look for when I try to track down the problem ?

Thanks,
Guenter

> ---
> Changes since v1:
>  - combine name and compatible string in mtd_otp_nvmem_register()
> 
> Changes since RFC:
>  - none
> 
>  drivers/mtd/mtdcore.c   | 148 ++++++++++++++++++++++++++++++++++++++++
>  include/linux/mtd/mtd.h |   2 +
>  2 files changed, 150 insertions(+)
> 
> diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
> index 9aaeadd53eb4..72e7000a86fd 100644
> --- a/drivers/mtd/mtdcore.c
> +++ b/drivers/mtd/mtdcore.c
> @@ -777,6 +777,146 @@ static void mtd_set_dev_defaults(struct mtd_info *mtd)
>  	mutex_init(&mtd->master.chrdev_lock);
>  }
>  
> +static ssize_t mtd_otp_size(struct mtd_info *mtd, bool is_user)
> +{
> +	struct otp_info *info = kmalloc(PAGE_SIZE, GFP_KERNEL);
> +	ssize_t size = 0;
> +	unsigned int i;
> +	size_t retlen;
> +	int ret;
> +
> +	if (is_user)
> +		ret = mtd_get_user_prot_info(mtd, PAGE_SIZE, &retlen, info);
> +	else
> +		ret = mtd_get_fact_prot_info(mtd, PAGE_SIZE, &retlen, info);
> +	if (ret)
> +		goto err;
> +
> +	for (i = 0; i < retlen / sizeof(*info); i++) {
> +		size += info->length;
> +		info++;
> +	}
> +
> +	kfree(info);
> +	return size;
> +
> +err:
> +	kfree(info);
> +	return ret;
> +}
> +
> +static struct nvmem_device *mtd_otp_nvmem_register(struct mtd_info *mtd,
> +						   const char *compatible,
> +						   int size,
> +						   nvmem_reg_read_t reg_read)
> +{
> +	struct nvmem_device *nvmem = NULL;
> +	struct nvmem_config config = {};
> +	struct device_node *np;
> +
> +	/* DT binding is optional */
> +	np = of_get_compatible_child(mtd->dev.of_node, compatible);
> +
> +	/* OTP nvmem will be registered on the physical device */
> +	config.dev = mtd->dev.parent;
> +	/* just reuse the compatible as name */
> +	config.name = compatible;
> +	config.id = NVMEM_DEVID_NONE;
> +	config.owner = THIS_MODULE;
> +	config.type = NVMEM_TYPE_OTP;
> +	config.root_only = true;
> +	config.reg_read = reg_read;
> +	config.size = size;
> +	config.of_node = np;
> +	config.priv = mtd;
> +
> +	nvmem = nvmem_register(&config);
> +	/* Just ignore if there is no NVMEM support in the kernel */
> +	if (IS_ERR(nvmem) && PTR_ERR(nvmem) == -EOPNOTSUPP)
> +		nvmem = NULL;
> +
> +	of_node_put(np);
> +
> +	return nvmem;
> +}
> +
> +static int mtd_nvmem_user_otp_reg_read(void *priv, unsigned int offset,
> +				       void *val, size_t bytes)
> +{
> +	struct mtd_info *mtd = priv;
> +	size_t retlen;
> +	int ret;
> +
> +	ret = mtd_read_user_prot_reg(mtd, offset, bytes, &retlen, val);
> +	if (ret)
> +		return ret;
> +
> +	return retlen == bytes ? 0 : -EIO;
> +}
> +
> +static int mtd_nvmem_fact_otp_reg_read(void *priv, unsigned int offset,
> +				       void *val, size_t bytes)
> +{
> +	struct mtd_info *mtd = priv;
> +	size_t retlen;
> +	int ret;
> +
> +	ret = mtd_read_fact_prot_reg(mtd, offset, bytes, &retlen, val);
> +	if (ret)
> +		return ret;
> +
> +	return retlen == bytes ? 0 : -EIO;
> +}
> +
> +static int mtd_otp_nvmem_add(struct mtd_info *mtd)
> +{
> +	struct nvmem_device *nvmem;
> +	ssize_t size;
> +	int err;
> +
> +	if (mtd->_get_user_prot_info && mtd->_read_user_prot_reg) {
> +		size = mtd_otp_size(mtd, true);
> +		if (size < 0)
> +			return size;
> +
> +		if (size > 0) {
> +			nvmem = mtd_otp_nvmem_register(mtd, "user-otp", size,
> +						       mtd_nvmem_user_otp_reg_read);
> +			if (IS_ERR(nvmem)) {
> +				dev_err(&mtd->dev, "Failed to register OTP NVMEM device\n");
> +				return PTR_ERR(nvmem);
> +			}
> +			mtd->otp_user_nvmem = nvmem;
> +		}
> +	}
> +
> +	if (mtd->_get_fact_prot_info && mtd->_read_fact_prot_reg) {
> +		size = mtd_otp_size(mtd, false);
> +		if (size < 0) {
> +			err = size;
> +			goto err;
> +		}
> +
> +		if (size > 0) {
> +			nvmem = mtd_otp_nvmem_register(mtd, "factory-otp", size,
> +						       mtd_nvmem_fact_otp_reg_read);
> +			if (IS_ERR(nvmem)) {
> +				dev_err(&mtd->dev, "Failed to register OTP NVMEM device\n");
> +				err = PTR_ERR(nvmem);
> +				goto err;
> +			}
> +			mtd->otp_factory_nvmem = nvmem;
> +		}
> +	}
> +
> +	return 0;
> +
> +err:
> +	if (mtd->otp_user_nvmem)
> +		nvmem_unregister(mtd->otp_user_nvmem);
> +	return err;
> +}
> +
>  /**
>   * mtd_device_parse_register - parse partitions and register an MTD device.
>   *
> @@ -852,6 +992,8 @@ int mtd_device_parse_register(struct mtd_info *mtd, const char * const *types,
>  		register_reboot_notifier(&mtd->reboot_notifier);
>  	}
>  
> +	ret = mtd_otp_nvmem_add(mtd);
> +
>  out:
>  	if (ret && device_is_registered(&mtd->dev))
>  		del_mtd_device(mtd);
> @@ -873,6 +1015,12 @@ int mtd_device_unregister(struct mtd_info *master)
>  	if (master->_reboot)
>  		unregister_reboot_notifier(&master->reboot_notifier);
>  
> +	if (master->otp_user_nvmem)
> +		nvmem_unregister(master->otp_user_nvmem);
> +
> +	if (master->otp_factory_nvmem)
> +		nvmem_unregister(master->otp_factory_nvmem);
> +
>  	err = del_mtd_partitions(master);
>  	if (err)
>  		return err;
> diff --git a/include/linux/mtd/mtd.h b/include/linux/mtd/mtd.h
> index a89955f3cbc8..88227044fc86 100644
> --- a/include/linux/mtd/mtd.h
> +++ b/include/linux/mtd/mtd.h
> @@ -380,6 +380,8 @@ struct mtd_info {
>  	int usecount;
>  	struct mtd_debug_info dbg;
>  	struct nvmem_device *nvmem;
> +	struct nvmem_device *otp_user_nvmem;
> +	struct nvmem_device *otp_factory_nvmem;
>  
>  	/*
>  	 * Parent device from the MTD partition point of view.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
