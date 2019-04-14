Return-Path: <SRS0=XyTp=SQ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88785C10F13
	for <linux-mtd@archiver.kernel.org>; Sun, 14 Apr 2019 17:52:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 57ACF20896
	for <linux-mtd@archiver.kernel.org>; Sun, 14 Apr 2019 17:52:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="fOk7NAit";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=cogentembedded-com.20150623.gappssmtp.com header.i=@cogentembedded-com.20150623.gappssmtp.com header.b="Sdjw4js9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 57ACF20896
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=cogentembedded.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QiXZwdsRcfEv/ZsiGPNyih54Zt5ZA6+EKt/wTYbeWac=; b=fOk7NAitKWHkKG
	rLQ60IDBLs2T6B3Sr9TN+SpdVeYMKnxEv2dr+IhCM6vo55bxNOL0Fhsz0A91E78A0fnl4DTSloPTi
	GrtH2pDCq6kphZ0v0aSNsk8Ut8IGr8wZGhzGswFjYFVbOeCTXyjmHbK6QTx6fOe2zlHDFuWwCHfS2
	5co/JY9c/TsV/jDo28O3144ArZZ9WY3vmMpH+hFuNMNbljvBq9ebLyZN4PSYisgvipu4LqJ5eG8x7
	OeH09/3x0MFArjb7ovGn/SUK53b7HpLie6GoZry1ndVgsSJk0+fodPeY4oGHO6AoDpMLLP60ymO8h
	O+5usv6YzuYkV3jRzyNg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hFjIM-0001aI-Hy; Sun, 14 Apr 2019 17:51:58 +0000
Received: from mail-lj1-x244.google.com ([2a00:1450:4864:20::244])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hFjIB-0001Uh-M6
 for linux-mtd@lists.infradead.org; Sun, 14 Apr 2019 17:51:50 +0000
Received: by mail-lj1-x244.google.com with SMTP id v22so13432697lje.9
 for <linux-mtd@lists.infradead.org>; Sun, 14 Apr 2019 10:51:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=wDNbZFDfSFvMJbXwJGZWBP1FDY9RU5MYw0B/pPJFyO0=;
 b=Sdjw4js9kmZSBFAG+UQLVlJZJkpwtmFwxNY4QmvRZNZNewfETQxj8U3l4vSuo4Rr+M
 CPoLwCNW1piJq3tiQuSk6kmEsctA7L5w4eLtXXW240sQYuGkGBpcpPhWpQagS+14i2ZD
 po3TKPou6mDg64FZDp5beAQ4UVFBbRYC2d9+LSieBbJETXgUvvkpPX7nG8701k+aNm5x
 dGbkkfFyIwePxvwyKdd7btdbAPy3EfeG3QnNH+LHNcUH34j0KtlopLMR1ykOrcmO3GwP
 wEnzPOWeqhKrms2E6/VStkS18TcTvjttpT8dJkd032fEfq+pDhQzFIHJjHKkbHfWvsGU
 Btrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=wDNbZFDfSFvMJbXwJGZWBP1FDY9RU5MYw0B/pPJFyO0=;
 b=byx1ZEuNbBi+3W5inxtZ2F740PuAV1GVSgCkVsdcl0ebQBnD6/ozam7o+yiS5ZixO2
 hzpW4FZ71Acp6hb94zRWVuql/aUkm3FRfVQesBBWqI3jzowguZwcWeLUtStJpRs94XAe
 xq1le0Y0pUS9TQfDKneym8Q6sxp9DtWdvdZG3Dxbb3wUU1VqtNwNLM7IMdwMeVTOLQzw
 W6rQZnhmbNG83W2GDblomBuDI8TUnakunHylZbo03Y1F9ZMeFoR5anZkmxreoWjXK47z
 4lgH2wEA4fHVuZLV4spg5B9VlqGQlBYaOX8xKeyMhxejggJYe0nD/wT6ue24v/F8AyU7
 85jA==
X-Gm-Message-State: APjAAAU4I9W8OuCxZTND/vgPb6vipiPr4abioANrkqnePT8d8/GZ6Rcz
 ASnRVOUV1XZ7phSKIX3zIoZCQg==
X-Google-Smtp-Source: APXvYqx3R7LxyfpMUiIghvwGgEAAYM7RH/OvrfwCicN56t9hKHm34CxmmG8+DDut7lMASCdrqnJ4rQ==
X-Received: by 2002:a2e:9194:: with SMTP id f20mr37118089ljg.10.1555264303718; 
 Sun, 14 Apr 2019 10:51:43 -0700 (PDT)
Received: from wasted.cogentembedded.com ([31.173.85.5])
 by smtp.gmail.com with ESMTPSA id r19sm8644245lja.83.2019.04.14.10.51.41
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 14 Apr 2019 10:51:42 -0700 (PDT)
Subject: Re: [PATCH v3 3/5] mtd: Add support for HyperBus memory devices
To: Vignesh Raghavendra <vigneshr@ti.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <bbrezillon@kernel.org>, Marek Vasut
 <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Rob Herring <robh+dt@kernel.org>
References: <20190412092923.24919-1-vigneshr@ti.com>
 <20190412092923.24919-4-vigneshr@ti.com>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Organization: Cogent Embedded
Message-ID: <53a92396-2535-ace7-3a31-1daf719ff323@cogentembedded.com>
Date: Sun, 14 Apr 2019 20:51:40 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <20190412092923.24919-4-vigneshr@ti.com>
Content-Language: en-MW
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190414_105147_866502_C809059A 
X-CRM114-Status: GOOD (  31.25  )
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
Cc: devicetree@vger.kernel.org, Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 nsekhar@ti.com, linux-kernel@vger.kernel.org,
 Joakim Tjernlund <Joakim.Tjernlund@infinera.com>,
 linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>,
 Mason Yang <masonccyang@mxic.com.tw>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hello!

On 04/12/2019 12:29 PM, Vignesh Raghavendra wrote:

> Cypress' HyperBus is Low Signal Count, High Performance Double Data Rate
> Bus interface between a host system master and one or more slave
> interfaces. HyperBus is used to connect microprocessor, microcontroller,
> or ASIC devices with random access NOR flash memory (called HyperFlash)
> or self refresh DRAM (called HyperRAM).
> 
> Its a 8-bit data bus (DQ[7:0]) with  Read-Write Data Strobe (RWDS)
> signal and either Single-ended clock(3.0V parts) or Differential clock
> (1.8V parts). It uses ChipSelect lines to select b/w multiple slaves.
> At bus level, it follows a separate protocol described in HyperBus
> specification[1].
> 
> HyperFlash follows CFI AMD/Fujitsu Extended Command Set (0x0002) similar
> to that of existing parallel NORs. Since HyperBus is x8 DDR bus,
> its equivalent to x16 parallel NOR flash wrt bits per clock cycle. But
> HyperBus operates at >166MHz frequencies.
> HyperRAM provides direct random read/write access to flash memory
> array.
> 
> But, HyperBus memory controllers seem to abstract implementation details
> and expose a simple MMIO interface to access connected flash.
> 
> Add support for registering HyperFlash devices with MTD framework. MTD
> maps framework along with CFI chip support framework are used to support
> communicating with flash.
> 
> Framework is modelled along the lines of spi-nor framework. HyperBus
> memory controller (HBMC) drivers calls hyperbus_register_device() to
> register a single HyperFlash device. HyperFlash core parses MMIO access
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
> HyperBus specification can be found at[1]
> HyperFlash datasheet can be found at[2]
> 
> [1] https://www.cypress.com/file/213356/download
> [2] https://www.cypress.com/file/213346/download
> [3] http://www.ti.com/lit/ug/spruid7b/spruid7b.pdf
>     Table 12-5741. HyperFlash Access Sequence
> 
> Signed-off-by: Vignesh Raghavendra <vigneshr@ti.com>
[...]
> diff --git a/drivers/mtd/hyperbus/Kconfig b/drivers/mtd/hyperbus/Kconfig
> new file mode 100644
> index 000000000000..98147e28caa0
> --- /dev/null
> +++ b/drivers/mtd/hyperbus/Kconfig
> @@ -0,0 +1,11 @@
> +menuconfig MTD_HYPERBUS
> +	tristate "HyperBus support"
> +	select MTD_CFI
> +	select MTD_MAP_BANK_WIDTH_2
> +	select MTD_CFI_AMDSTD
> +	select MTD_COMPLEX_MAPPINGS
> +	help
> +	  This is the framework for the HyperBus which can be used by
> +	  the HyperBus Controller driver to communicate with
> +	  HyperFlash. See Cypress HyperBus specification for more
> +	  details
> diff --git a/drivers/mtd/hyperbus/Makefile b/drivers/mtd/hyperbus/Makefile
> new file mode 100644
> index 000000000000..ca61dedd730d
> --- /dev/null
> +++ b/drivers/mtd/hyperbus/Makefile
> @@ -0,0 +1,3 @@
> +# SPDX-License-Identifier: GPL-2.0
> +
> +obj-$(CONFIG_MTD_HYPERBUS)	+= hyperbus-core.o
> diff --git a/drivers/mtd/hyperbus/hyperbus-core.c b/drivers/mtd/hyperbus/hyperbus-core.c
> new file mode 100644
> index 000000000000..49aeb59742c6
> --- /dev/null
> +++ b/drivers/mtd/hyperbus/hyperbus-core.c
> @@ -0,0 +1,192 @@
> +// SPDX-License-Identifier: GPL-2.0
> +//
> +// Copyright (C) 2019 Texas Instruments Incorporated - http://www.ti.com/
> +// Author: Vignesh Raghavendra <vigneshr@ti.com>
[...]
> +/* Default calibration routine for use by HyperBus controller.
> + * Controller is calibrated by repeatedly reading known pattern ("QRY"
> + * string from CFI space)
> + * Lets ensure "QRY" string is read correctly at least 5 times to ensure
> + * stability of the DLL lock.
> + */
> +int hyperbus_calibrate(struct hyperbus_device *hbdev)
> +{
> +	struct map_info *map = &hbdev->map;
> +	struct cfi_private cfi;
> +	int count = HYPERBUS_CALIB_COUNT;
> +	int pass_count = 0;
> +	int ret;
> +
> +	cfi.interleave = 1;
> +	cfi.device_type = CFI_DEVICETYPE_X16;
> +	cfi_send_gen_cmd(0xF0, 0, 0, map, &cfi, cfi.device_type, NULL);
> +	cfi_send_gen_cmd(0x98, 0x55, 0, map, &cfi, cfi.device_type, NULL);
> +
> +	while (count--) {
> +		cfi_qry_present(map, 0, &cfi);
> +		ret = cfi_qry_present(map, 0, &cfi);

   Why call it twice in a row?

> +		if (ret)
> +			pass_count++;
> +		else
> +			pass_count = 0;
> +		if (pass_count == 5)
> +			break;
> +	}
> +
> +	cfi_qry_mode_off(0, map, &cfi);
> +
> +	return ret;
> +}
> +EXPORT_SYMBOL_GPL(hyperbus_calibrate);
[...]
> diff --git a/include/linux/mtd/hyperbus.h b/include/linux/mtd/hyperbus.h
> new file mode 100644
> index 000000000000..19340cc56aa4
> --- /dev/null
> +++ b/include/linux/mtd/hyperbus.h
> @@ -0,0 +1,91 @@
[...]
> +/**
> + * hb_unregister_device - deregister HyperBus slave memory device

   You forgot to update the function name in the kernel-doc. :-)

> + * @hbdev: hyperbus_device to be unregistered
> + *
> + * Return: 0 for success, others for failure.
> + */
> +int hyperbus_unregister_device(struct hyperbus_device *hbdev);
> +
> +#endif /* __LINUX_MTD_HYPERBUS_H__ */

MBR, Sergei

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
