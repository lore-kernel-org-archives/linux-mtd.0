Return-Path: <SRS0=pM9p=R4=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCC49C43381
	for <linux-mtd@archiver.kernel.org>; Mon, 25 Mar 2019 20:14:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9BBE32087C
	for <linux-mtd@archiver.kernel.org>; Mon, 25 Mar 2019 20:14:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="HVU5MtiF";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=cogentembedded-com.20150623.gappssmtp.com header.i=@cogentembedded-com.20150623.gappssmtp.com header.b="XHlyZlEX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9BBE32087C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=cogentembedded.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ixG0J9F8PYy/wzCzrCfPZNvH+kI8jg42VYxQvjAcIvM=; b=HVU5MtiFPStPif
	r/5/k6fKNfBP/UqlvNs3fH89iUl7Ht3Z5jNB/tZlHOl+k4w+rRUx5MdyBkGwrYoXHpUjoUdI2uQQR
	590PJDLun/KY3rb5tnonBZLDaLPvMpgQG3e433WHnbNIkflA7r7sNgHiKtOM/qHvUV6DeG8ZPGEto
	J/20J1XpI4wWWgiTW0kGoANbLWavjirmK5Mm+4t5oMlyKuR60V7aNIaLh9d1AkAvqVO3Nn502TOhZ
	a6QQsTvL/DlXHW1lJQzybnfjEVoVt3Xi1rt5Vl4iNJk9mxINVitPOBZwKVGmMNDx2pKwQ0i1uMBE0
	d8oJxqDm8iqgmHVmf/KQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h8Vyl-0000SC-SV; Mon, 25 Mar 2019 20:13:55 +0000
Received: from mail-lj1-x241.google.com ([2a00:1450:4864:20::241])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h8Vyc-0000Kx-Pr
 for linux-mtd@lists.infradead.org; Mon, 25 Mar 2019 20:13:49 +0000
Received: by mail-lj1-x241.google.com with SMTP id v22so9032997lje.9
 for <linux-mtd@lists.infradead.org>; Mon, 25 Mar 2019 13:13:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=M3hXDey3IsqYK6xV0My06hiJ6NVz3dADomQ8EMGTigc=;
 b=XHlyZlEXqAr/6HdDejMjq1iO643MRL4V/TSUyGvXM/jUxsPpr0AbRmzN0+mHcuvaS5
 GDRr9JcKh1JgcAxanV7S8OYXpMZ+6CIHcZIjj7dnA9Moa7qGAeJU1wXckWxUeoVkPGgp
 ZzEKU9wwwWQ98qJ3XeNvajS98ZLQKL/cnSXZejVcyW8siHGHTOVYBWxOqZTR7eYnn7+g
 57i38NKB3OLN/QGq66FDckUhbLkLAnQkIfj3jJcHzYhZW5Pfi24HW+KI0m/M4OVxskrO
 MnBi2mgSfHrz+AVRNCJKqhuYGv7Opj86hgpsbwMZCiVnS7tBTkjtIubV4ttKFYF8PC3k
 qVsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=M3hXDey3IsqYK6xV0My06hiJ6NVz3dADomQ8EMGTigc=;
 b=RtzduGpWSQU3ZU4qiGgQGgUZEPZVEgZynZUQqXT8JOQBD1aUl8gULqsfR+lnTTg2p/
 pE6amsD2ngIEQUrQfCfcqxF03RiUkAaqOvKwxPzZuv6o5ngNxU4cGbO44ho4VAk22rpb
 uUQxlHl7rbn2+mqGH+ZWNqn4lCpe/rUy28ZAycl+CZCHtoJXOrdjhnDVz2tx/JQpjMbL
 mUBUCMq7IrUy6ZK/ui3v5yI6HxAO2LxyDrv1kIk8GVRaAAFeO1n3YvsF0WghejSrcnjM
 DNR2dE1RbKiFWUfLQmtL55zLJneodr9nlRxPcW02aCE+ABJa2kdB13BVWT341j9bQmOA
 fxqw==
X-Gm-Message-State: APjAAAXjhIZo5WqstGgVk2OrYU4TIvloXM2cGnXRlMboloEDOldhojeV
 wy3OQSs6EHqvCTvvaeIrO2Hscw==
X-Google-Smtp-Source: APXvYqzsd/W7vnU7xF4ONRLt9pqNJWHefN44Y95JakvzZJ4LJfKyhVUWh94uVt9zu1cNGNAI1lQRnw==
X-Received: by 2002:a2e:2d02:: with SMTP id t2mr1838734ljt.148.1553544822428; 
 Mon, 25 Mar 2019 13:13:42 -0700 (PDT)
Received: from wasted.cogentembedded.com ([31.173.83.129])
 by smtp.gmail.com with ESMTPSA id g79sm3670443lje.25.2019.03.25.13.13.40
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 25 Mar 2019 13:13:41 -0700 (PDT)
Subject: Re: [RFC PATCH v2 3/5] mtd: Add support for Hyperbus memory devices
To: Vignesh Raghavendra <vigneshr@ti.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <bbrezillon@kernel.org>, Marek Vasut
 <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Rob Herring <robh+dt@kernel.org>
References: <20190321174548.9288-1-vigneshr@ti.com>
 <20190321174548.9288-4-vigneshr@ti.com>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Organization: Cogent Embedded
Message-ID: <98e1e3ad-75d3-670f-bcf7-27389cc60a98@cogentembedded.com>
Date: Mon, 25 Mar 2019 23:13:40 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <20190321174548.9288-4-vigneshr@ti.com>
Content-Language: en-MW
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190325_131347_005636_369BC17B 
X-CRM114-Status: GOOD (  30.16  )
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
Cc: devicetree@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 tudor.ambarus@microchip.com, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 nsekhar@ti.com, linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 Mason Yang <masonccyang@mxic.com.tw>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hello!

On 03/21/2019 08:45 PM, Vignesh Raghavendra wrote:

> Cypress' Hyperbus is Low Signal Count, High Performance Double Data Rate

   It's HyperBus, according to the spec...

> Bus interface between a host system master and one or more slave
> interfaces. Hyperbus is used to connect microprocessor, microcontroller,
> or ASIC devices with random access NOR flash memory (called Hyperflash)
> or self refresh DRAM (called HyperRAM).
> 
> Its a 8-bit data bus (DQ[7:0]) with  Read-Write Data Strobe (RWDS)
> signal and either Single-ended clock(3.0V parts) or Differential clock
> (1.8V parts). It uses ChipSelect lines to select b/w multiple slaves.
> At bus level, it follows a separate protocol described in Hyperbus
> specification[1].

   HyperBus. 
> Hyperflash follows CFI AMD/Fujitsu Extended Command Set (0x0002) similar
> to that of existing parallel NORs. Since Hyperbus is x8 DDR bus,
> its equivalent to x16 parallel NOR flash wrt bits per clock cycle. But
> Hyperbus operates at >166MHz frequencies.
> HyperRAM provides direct random read/write access to flash memory
> array.
> 
> But, Hyperbus memory controllers seem to abstract implementation details

   HyperBus.

> and expose a simple MMIO interface to access connected flash.
> 
> Add support for registering Hyperflash devices with MTD framework. MTD

   HyperFlash.

> maps framework along with CFI chip support framework are used to support
> communicating with flash.
> 
> Framework is modelled along the lines of spi-nor framework. Hyperbus

   HyperBus.

> memory controller (HBMC) drivers calls hyperbus_register_device() to
> register a single Hyperflash device. Hyperflash core parses MMIO access

   HyperFlash.

> information from DT, sets up the map_info struct, probes CFI flash and
> registers it with MTD framework.
> 
> Some HBMC masters need calibration/training sequence[3] to be carried
> out, in order for DLL inside the controller to lock, by reading a known
> string/pattern. This is done by repeatedly reading CFI Query
> Identification String. Calibration needs to be done before trying to detect
> flash as part of CFI flash probe.
> 
> HyperRAM is not supported at the moment.
> 
> Hyperbus specification can be found at[1]
> Hyperflash datasheet can be found at[2]

  HyperBus & HyperFlash.
 
> [1] https://www.cypress.com/file/213356/download
> [2] https://www.cypress.com/file/213346/download
> [3] http://www.ti.com/lit/ug/spruid7b/spruid7b.pdf
>     Table 12-5741. HyperFlash Access Sequence
> 
> Signed-off-by: Vignesh Raghavendra <vigneshr@ti.com>
[...]
> diff --git a/drivers/mtd/hyperbus/hyperbus-core.c b/drivers/mtd/hyperbus/hyperbus-core.c
> new file mode 100644
> index 000000000000..4c2876c367fc
> --- /dev/null
> +++ b/drivers/mtd/hyperbus/hyperbus-core.c
> @@ -0,0 +1,183 @@
> +// SPDX-License-Identifier: GPL-2.0
> +//
> +// Copyright (C) 2019 Texas Instruments Incorporated - http://www.ti.com/
> +// Author: Vignesh Raghavendra <vigneshr@ti.com>
> +
> +#include <linux/err.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/mtd/hyperbus.h>
> +#include <linux/mtd/map.h>
> +#include <linux/mtd/mtd.h>
> +#include <linux/mtd/cfi.h>
> +#include <linux/of.h>
> +#include <linux/of_address.h>
> +#include <linux/types.h>
> +
> +#define HYPERBUS_CALIB_COUNT 25

   As I said, this seems platform specific...

[...]
> +/* Default calibration routine for use by Hyperbus controller.

   No, there should be easy opt-out from the calibration method.
Currently, the driver will have to define its own calibrate method, even
if does't need any calibration...

> + * Controller is calibrated by repeatedly reading known pattern ("QRY"
> + * string from CFI space)
> + * It is not enough to just ensure "QRY" string is read correctly, need
> + * to read mulitple times to ensure stability of the DLL lock.
> + */
> +int hyperbus_calibrate(struct hyperbus_device *hbdev)
> +{
> +	struct map_info *map = &hbdev->map;
> +	struct cfi_private cfi;
> +	int count = HYPERBUS_CALIB_COUNT;
> +	int ret;
> +
> +	cfi.interleave = 1;
> +	cfi.device_type = CFI_DEVICETYPE_X16;
> +	cfi_send_gen_cmd(0xF0, 0, 0, map, &cfi, cfi.device_type, NULL);
> +	cfi_send_gen_cmd(0x98, 0x55, 0, map, &cfi, cfi.device_type, NULL);
> +
> +	while (count--)
> +		cfi_qry_present(map, 0, &cfi);

   I still don't understand why we have to spin all 25 times here if QRY
appears earlier than that.

> +
> +	ret = cfi_qry_present(map, 0, &cfi);
> +	cfi_qry_mode_off(0, map, &cfi);
> +
> +	return ret;
> +}
> +EXPORT_SYMBOL_GPL(hyperbus_calibrate);
[...]
> diff --git a/include/linux/mtd/hyperbus.h b/include/linux/mtd/hyperbus.h
> new file mode 100644
> index 000000000000..57f273e87f29
> --- /dev/null
> +++ b/include/linux/mtd/hyperbus.h
> @@ -0,0 +1,91 @@
> +/* SPDX-License-Identifier: GPL-2.0
> + *
> + * Copyright (C) 2019 Texas Instruments Incorporated - http://www.ti.com/
> + */
> +
> +#ifndef __LINUX_MTD_HYPERBUS_H__
> +#define __LINUX_MTD_HYPERBUS_H__
> +
> +#include <linux/mtd/map.h>
> +
> +enum hyperbus_memtype {
> +	HYPERFLASH,
> +	HYPERRAM,
> +};
> +
> +/**
> + * struct hyerbus_device - struct representing Hyperbus slave device

   hyperbus_device.

> + * @map: map_info struct for accessing MMIO Hyperbus flash memory
> + * @np:	pointer to Hyperbus slave device node
> + * @mtd: pointer to MTD struct
> + * @ctlr: pointer to Hyperbus controller struct
> + * @memtype: type of memory device: Hyperflash or HyperRAM

   HyperFlash.

[...]
> +/**
> + * hyperbus_calibrate - default calibration routine for use by Hyperbus ctlr.
> + * @hbdev: hyperbus_device to be used for calibration

   HyperBus.

[...]

MBR, Sergei

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
