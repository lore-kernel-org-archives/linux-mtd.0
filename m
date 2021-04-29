Return-Path: <SRS0=3Xy9=J2=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACB76C433ED
	for <linux-mtd@archiver.kernel.org>; Thu, 29 Apr 2021 15:40:52 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0A11361418
	for <linux-mtd@archiver.kernel.org>; Thu, 29 Apr 2021 15:40:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0A11361418
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:From:Subject:References:Mime-Version:
	Message-Id:In-Reply-To:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Mk5PZLtQROK/JlVsdKadKkBAOmSr+MYOVoEN6fvje7o=; b=p+WJAhlaL2t5PM
	TkviqoG4Y+64q/Q4hUgPwNbbMQFdeLqKNfwErL55sGcM8Ca4s4QqDX4yJ/2N34NHGtUmoJjJxz3st
	9Rh45WzTLV4FF1aRucquoFB5r0h6qmeF+g2cLKOHgiJk1ezpqwH12kqnYMvcMT3AHhGnA+jugI0+n
	lKKDJywW9g3KPmi6NUEFjSD284RHq8g2k16+9OZucfeJvRahDMCkEmxwvLxIiuhOYtP4qYBYOe0bW
	kHxb55/Hh6HBfIYx+J9vhc3txG+Db7Du+Bo4Cmb103DcRthvjT2RjnKegkRHNcNusZdBGpE4p1B9H
	7Yx8bAE2iD7JrbfhP6lQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lc8l1-005zgq-Nz; Thu, 29 Apr 2021 15:39:16 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lc8ku-005zez-NI
 for linux-mtd@desiato.infradead.org; Thu, 29 Apr 2021 15:39:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:Cc:To:From:Subject:
 References:Mime-Version:Message-Id:In-Reply-To:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=xC3KmY9xAqwoVwsFDm4WXfd4THuTAizTawn6IKvDgFU=; b=3T90PjF4qC1cYBm1MEEcBJacXM
 KsM/2J5HG6ELpNoBP/fS3XWnUwFnmYnPHcFVKhM5wX0NZuTsPiPfTIiFKVXa+ERYLNiaQBwCCqFRN
 EKYTxu3MdK0XysKh7rD74O12iahGRbirbjNHVeYRbaWs7YUwvgFXZWUz67P82QfHZ8d1h4s8yl6dd
 gmCyUw0j944tpxa54UixYX3XtAtWmMhknQ12RrHU+0CUjW0/S/ZP7mQQAGxCktZtlV1mkS+CLWYRz
 uODPeuIq5Jy0y0hUAkCQZ7ERBF0IZ70fEl5h7HRZ9ckoQbg3S02nOPRl4TWie9g4KUTjM2/uqHof2
 vKgKrnpw==;
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lc8kr-000jJ4-CE
 for linux-mtd@lists.infradead.org; Thu, 29 Apr 2021 15:39:07 +0000
Received: by mail-yb1-xb49.google.com with SMTP id
 s8-20020a5b04480000b029049fb35700b9so46557299ybp.5
 for <linux-mtd@lists.infradead.org>; Thu, 29 Apr 2021 08:39:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=xC3KmY9xAqwoVwsFDm4WXfd4THuTAizTawn6IKvDgFU=;
 b=N0GXApwTiwBnsTEHsxkhgW5osS2p2oNCf0cDSCUhCQOqGYZdaMUFoO8QuCsvVaxrBj
 OYL8XeShTQR2Om4Fr+8v4AjqUd5AOc5tzdG3y7IKvVDyTOWNwcZWVVcMT1GKlrQzW+2O
 KzBLpl2ECnPPMW9uNkFMmPmuSjKD94OsHg/yiowdywrwCmKrMiPIkfBCfc+30vA0AbKO
 lPYQOjJY23z2Z2y+Ssnk8NfoCXVxRptjp3MnjiAHgbv9zZ0SvkpF1tk97stcQ+2OKYSZ
 IK+6qGTb74FbWocm2eyWrEYyGB7Pl7UdHPnxpCQsb+KeQbjwoQS3yshEKs43zO6ZCDyX
 EawQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=xC3KmY9xAqwoVwsFDm4WXfd4THuTAizTawn6IKvDgFU=;
 b=a95OQGYQt99KvmDULiUxMWr7NVSXeSW3rFfAAdj8iMxhsNe1QBw69Nn7Vq+0+NXaGw
 sf+oKREW2sBmbXeIlqXoYu0SruaPfLqURG+jJcp+oNw2xvPZRG4GuH6ZSqM0ceR6POWZ
 f42BCRZzz7q8W4sRGMIoUWlgPi/a19O5d/XG7Fa+0RPUqWLEvgvTKmEuPSBS6uRz4Wmc
 oW0RrzU82kxlI+5AAuqxGKqSPOUlQyDZiz6zIY+ZRlOc5xqsmZWVYtsn0WuafuEprpUA
 0lACq+Us6uZQP9OGbwqdUsEcrFheac5drHLyh1+9Jnli8sqLAxb/RhIZRhGG3RCWujEp
 3Y+A==
X-Gm-Message-State: AOAM5308qh0qvAki/JI9bMqS0tcf+aodDvq5tDCw8UX7YwmJQoKbkXoU
 DislScMsxP4KpW2WBgErvqbP8Jv1zw==
X-Google-Smtp-Source: ABdhPJw8uCV+h3myux52+v9N6YFEXe/P/hczAhYH5IttRWYlc7BUcBirw8eoSB00nHMwQueL14wRbk8opQ==
X-Received: from peanut.svl.corp.google.com
 ([2620:15c:2c5:1:544d:6c9a:2020:fc52])
 (user=awill job=sendgmr) by 2002:a25:6fc5:: with SMTP id
 k188mr121216ybc.109.1619710743354; 
 Thu, 29 Apr 2021 08:39:03 -0700 (PDT)
Date: Thu, 29 Apr 2021 08:37:26 -0700
In-Reply-To: <20210318092406.5340-3-michael@walle.cc>
Message-Id: <20210429153725.15970-1-awill@google.com>
Mime-Version: 1.0
References: <20210318092406.5340-3-michael@walle.cc>
X-Mailer: git-send-email 2.31.1.527.g47e6f16901-goog
Subject: Re: [PATCH 2/2] mtd: spi-nor: add initial sysfs support
From: Alexander Williams <awill@google.com>
To: michael@walle.cc
Cc: linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, 
 miquel.raynal@bootlin.com, p.yadav@ti.com, richard@nod.at, 
 tudor.ambarus@microchip.com, vigneshr@ti.com, 
 Alexander Williams <awill@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210429_083905_464799_FE68B051 
X-CRM114-Status: GOOD (  31.29  )
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

Hi Michael,

> On Thu, Mar 18, 2021 at 10:24 AM Michael Walle <michael@walle.cc>
> wrote:
> Add support to show the name and JEDEC identifier as well as to dump the
> SFDP table. Not all flashes list their SFDP table contents in their
> datasheet. So having that is useful. It might also be helpful in bug
> reports from users.
> 
> The idea behind the sysfs module is also to have raw access to the SPI
> NOR flash device registers, which can also be useful for debugging.
> 
> Signed-off-by: Michael Walle <michael@walle.cc>
> ---
>  drivers/mtd/spi-nor/Makefile |  2 +-
>  drivers/mtd/spi-nor/core.c   |  5 +++
>  drivers/mtd/spi-nor/core.h   |  3 ++
>  drivers/mtd/spi-nor/sysfs.c  | 86 ++++++++++++++++++++++++++++++++++++
>  4 files changed, 95 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/mtd/spi-nor/sysfs.c
> 
> diff --git a/drivers/mtd/spi-nor/Makefile b/drivers/mtd/spi-nor/Makefile
> index 653923896205..aff308f75987 100644
> --- a/drivers/mtd/spi-nor/Makefile
> +++ b/drivers/mtd/spi-nor/Makefile
> @@ -1,6 +1,6 @@
>  # SPDX-License-Identifier: GPL-2.0
>  
> -spi-nor-objs			:= core.o sfdp.o
> +spi-nor-objs			:= core.o sfdp.o sysfs.o
>  spi-nor-objs			+= atmel.o
>  spi-nor-objs			+= catalyst.o
>  spi-nor-objs			+= eon.o
> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> index 4a315cb1c4db..2eaf4ba8c0f3 100644
> --- a/drivers/mtd/spi-nor/core.c
> +++ b/drivers/mtd/spi-nor/core.c
> @@ -3707,6 +3707,10 @@ static int spi_nor_probe(struct spi_mem *spimem)
>  	if (ret)
>  		return ret;
>  
> +	ret = spi_nor_sysfs_create(nor);

This appears to be racing with user space. By the time we reach probe(), the
device embedded in the spi_device has already been registered, with the uevent
sent out, right? udev may not see the new attributes created here.

Since we reuse a preexisting device throughout spi-nor, it seems awfully
challenging to be able to safely add sysfs attributes. Would it make sense to
create a spi-nor-specific device/class? Or perhaps attach these attributes to
the device in mtd_info like I've done in
https://lore.kernel.org/linux-mtd/20210428052725.530939-1-awill@google.com/ ?

- Alex

> +	if (ret)
> +		return ret;
> +
>  	return mtd_device_register(&nor->mtd, data ? data->parts : NULL,
>  				   data ? data->nr_parts : 0);
>  }
> @@ -3716,6 +3720,7 @@ static int spi_nor_remove(struct spi_mem *spimem)
>  	struct spi_nor *nor = spi_mem_get_drvdata(spimem);
>  
>  	spi_nor_restore(nor);
> +	spi_nor_sysfs_remove(nor);
>  
>  	/* Clean up MTD stuff. */
>  	return mtd_device_unregister(&nor->mtd);
> diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
> index 668f22011b1d..dd592f7b62d1 100644
> --- a/drivers/mtd/spi-nor/core.h
> +++ b/drivers/mtd/spi-nor/core.h
> @@ -488,4 +488,7 @@ static struct spi_nor __maybe_unused *mtd_to_spi_nor(struct mtd_info *mtd)
>  	return mtd->priv;
>  }
>  
> +int spi_nor_sysfs_create(struct spi_nor *nor);
> +void spi_nor_sysfs_remove(struct spi_nor *nor);
> +
>  #endif /* __LINUX_MTD_SPI_NOR_INTERNAL_H */
> diff --git a/drivers/mtd/spi-nor/sysfs.c b/drivers/mtd/spi-nor/sysfs.c
> new file mode 100644
> index 000000000000..0de031e246c5
> --- /dev/null
> +++ b/drivers/mtd/spi-nor/sysfs.c
> @@ -0,0 +1,86 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +#include <linux/mtd/spi-nor.h>
> +#include <linux/spi/spi.h>
> +#include <linux/spi/spi-mem.h>
> +#include <linux/sysfs.h>
> +
> +#include "core.h"
> +
> +static ssize_t name_show(struct device *dev,
> +			 struct device_attribute *attr, char *buf)
> +{
> +	struct spi_device *spi = to_spi_device(dev);
> +	struct spi_mem *spimem = spi_get_drvdata(spi);
> +	struct spi_nor *nor = spi_mem_get_drvdata(spimem);
> +
> +	return sprintf(buf, "%s\n", nor->info->name);
> +}
> +static DEVICE_ATTR_RO(name);
> +
> +static ssize_t jedec_id_show(struct device *dev,
> +			     struct device_attribute *attr, char *buf)
> +{
> +	struct spi_device *spi = to_spi_device(dev);
> +	struct spi_mem *spimem = spi_get_drvdata(spi);
> +	struct spi_nor *nor = spi_mem_get_drvdata(spimem);
> +
> +	return sprintf(buf, "%*phN\n", nor->info->id_len, nor->info->id);
> +}
> +static DEVICE_ATTR_RO(jedec_id);
> +
> +static struct attribute *spi_nor_sysfs_entries[] = {
> +	&dev_attr_name.attr,
> +	&dev_attr_jedec_id.attr,
> +	NULL
> +};
> +
> +static ssize_t sfdp_read(struct file *filp, struct kobject *kobj,
> +			 struct bin_attribute *bin_attr, char *buf,
> +			 loff_t off, size_t count)
> +{
> +	struct spi_device *spi = to_spi_device(kobj_to_dev(kobj));
> +	struct spi_mem *spimem = spi_get_drvdata(spi);
> +	struct spi_nor *nor = spi_mem_get_drvdata(spimem);
> +	struct sfdp *sfdp = nor->sfdp;
> +	size_t sfdp_size = sfdp->num_dwords * sizeof(*sfdp->dwords);
> +
> +	return memory_read_from_buffer(buf, count, &off, nor->sfdp->dwords,
> +				       sfdp_size);
> +}
> +static BIN_ATTR_RO(sfdp, PAGE_SIZE);
> +
> +static struct bin_attribute *spi_nor_sysfs_bin_entries[] = {
> +	&bin_attr_sfdp,
> +	NULL
> +};
> +
> +static umode_t spi_nor_sysfs_is_bin_visible(struct kobject *kobj,
> +					    struct bin_attribute *attr, int n)
> +{
> +	struct spi_device *spi = to_spi_device(kobj_to_dev(kobj));
> +	struct spi_mem *spimem = spi_get_drvdata(spi);
> +	struct spi_nor *nor = spi_mem_get_drvdata(spimem);
> +
> +	if (attr == &bin_attr_sfdp && nor->sfdp)
> +		return 0444;
> +
> +	return 0;
> +}
> +
> +static struct attribute_group spi_nor_sysfs_attr_group = {
> +	.name		= NULL,
> +	.is_bin_visible	= spi_nor_sysfs_is_bin_visible,
> +	.attrs		= spi_nor_sysfs_entries,
> +	.bin_attrs	= spi_nor_sysfs_bin_entries,
> +};
> +
> +int spi_nor_sysfs_create(struct spi_nor *nor)
> +{
> +	return sysfs_create_group(&nor->dev->kobj, &spi_nor_sysfs_attr_group);
> +}
> +
> +void spi_nor_sysfs_remove(struct spi_nor *nor)
> +{
> +	sysfs_remove_group(&nor->dev->kobj, &spi_nor_sysfs_attr_group);
> +}
> -- 
> 2.20.1

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
