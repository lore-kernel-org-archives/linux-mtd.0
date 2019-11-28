Return-Path: <SRS0=Piv4=ZU=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81267C432C0
	for <linux-mtd@archiver.kernel.org>; Thu, 28 Nov 2019 14:21:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 52104215A5
	for <linux-mtd@archiver.kernel.org>; Thu, 28 Nov 2019 14:21:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hp2n4Vsg";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KBsr5Lpt"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 52104215A5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=NZgdXfzM4QcPouxDlWQWfumjsqJiHsgWkKopmTw6w7g=; b=hp2n4VsgSnpfoZIsSTlvPj4zA
	ezNQNQiUaT+S181rPBLhnse4/6RBfKitNADTScMCgWf7wKALcAKjkK3F6O40ndMIdHG/Ie4PGrGtt
	V5rllaqzVI4Ui5Sy3M/IUNe8nAkoaQQPjuehqVg9gfuB78/zrE7+c8/IALqJvWO73z8uyv7c/C+Gn
	jJFTDz6nanRlYGiBlk+A0Z2nUQ5mTzasxk8w1yB6eTrIAQRIKB1O7Malj1oj4uiGhJuGj5H7J4eIg
	VApyTQU9ehMgfHwN+TKBABNEuYZ/PDWNma+SQUjj+YcCES/g2ewTu1Rs3fT7bXvVKuC//GIvONvf7
	5bGO1VE4w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iaKfr-0002SE-Ms; Thu, 28 Nov 2019 14:21:39 +0000
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iaKfp-0002RS-Af
 for linux-mtd@lists.infradead.org; Thu, 28 Nov 2019 14:21:38 +0000
Received: by mail-ot1-x343.google.com with SMTP id l14so22305464oti.10
 for <linux-mtd@lists.infradead.org>; Thu, 28 Nov 2019 06:21:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=pAOuUXPMeoRavXucH0FHeoL8ht+w96IWOMyp3rFxFc8=;
 b=KBsr5LptVS2b+zcFfq8COkxUXZcEB1jGnIvoAk8NwagRT1ELTfEAXLdstWJYDI6aaB
 5ikq8r7yeXpZJUsmuCTsxVZBwkn5e6kdd3PYtYjd8hk5CMTpB+upcSPMdHn7RqXcRyw9
 RinpBwEXjmy04jpU+6TDm7qfEQIz8RRtOLvhFl/p/3aDgIWn9sG3G5vb3HKjgi+KSAAt
 ZaKa8rtzMcIV6WLvWbALGQEksQ5F0K8jfcop3LjNWaYqAbqrFM454dVpuZ9AJMzROeHP
 h6bHdcHeRJOvB9+/tVwZlbfYUfLwkG8drmkGEA3Rtv+y2WYKJmiBXol2B/oaLD4Jmf2p
 cFjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=pAOuUXPMeoRavXucH0FHeoL8ht+w96IWOMyp3rFxFc8=;
 b=biabKxiQfVb82uno4/HmfcKRUnMZw7fxXiK6uRd3rNqid7wbPmxXo8yKWARcRRRTOY
 ODB5IJWDi0oa+0qkHmihBCNyYBYrLmVyYD2cZvtsAONfkF79A9OiUjlqvzYFfgNJV6St
 sUqBrULAUX8t42bSK5mxwCE2nrOcg/j8ZrXfN5jMDmSjjVkI7oYIpOPLhrHzGQhl2OK+
 rZ7DhWMeI2zPuAVsj+G5yczP0Gkx1DrbZcI49bwv4/sMh/BNkibutJXKEt93pMDrumzW
 HvrmseICgZ7C+Le98w/NMGvlNZzzAcA4QmW7NF15ZaCHiVPxCeTQne1ZSDtIK9XjWr/Y
 FQqA==
X-Gm-Message-State: APjAAAVvERMRUsuAdM6i4ZmC0MpeBzNiYIQf5FA5kkjYDGjC1ABM6vDM
 0K9n5wIxqCcP2rqUIQoHkbU=
X-Google-Smtp-Source: APXvYqyg/dOuWAh3aONJFSxiOoY0asq6842kRVYbO07guEulmAV3bFhidrH7ncZ6zHHYAH92ywgZtA==
X-Received: by 2002:a9d:744a:: with SMTP id p10mr7122237otk.235.1574950896159; 
 Thu, 28 Nov 2019 06:21:36 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 l32sm6126339otl.74.2019.11.28.06.21.32
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 28 Nov 2019 06:21:34 -0800 (PST)
Subject: Re: [PATCH 6/6] (v3) drivers: hwmon: i5k_amb: simplify probing /
 device identification
To: "Enrico Weigelt, metux IT consult" <info@metux.net>,
 linux-kernel@vger.kernel.org
References: <20191128125406.10417-1-info@metux.net>
 <20191128125406.10417-6-info@metux.net>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <bee7ba11-6b4a-1cc7-ee8c-ddf17cb8daca@roeck-us.net>
Date: Thu, 28 Nov 2019 06:21:31 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191128125406.10417-6-info@metux.net>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191128_062137_372458_8909E190 
X-CRM114-Status: GOOD (  22.16  )
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
Cc: linux-hwmon@vger.kernel.org, jdelvare@suse.com, vigneshr@ti.com,
 richard@nod.at, linux-pci@vger.kernel.org, rrichter@marvell.com,
 james.morse@arm.com, linux-crypto@vger.kernel.org, miquel.raynal@bootlin.com,
 linux-mtd@lists.infradead.org, linux-edac@vger.kernel.org,
 tim@buttersideup.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 11/28/19 4:54 AM, Enrico Weigelt, metux IT consult wrote:
> Simpilify the probing by putting all chip-specific data directly
> into the pci match table, removing the redundant chipset_ids table.
> 
> Changes v3:
>      * use pci_get_device_by_id() introduces by a previous patch
>        of this queue
> 
> Changes v2:
>      * use PCI_DEVICE_DATA() macro in the pci match table
>      * directly pass the pci device id to i5k_channel_probe(),
>        instead of computing it internally by extra offset parameter
> 
> Submitted: 2019-06-06
> Signed-off-by: Enrico Weigelt <info@metux.net>

I don't immediately see how this is better. I am not even sure if it is correct.

Guenter

> ---
>   drivers/hwmon/i5k_amb.c | 38 +++++++++++++++-----------------------
>   1 file changed, 15 insertions(+), 23 deletions(-)
> 
> diff --git a/drivers/hwmon/i5k_amb.c b/drivers/hwmon/i5k_amb.c
> index b09c39abd3a8..cb85607d104f 100644
> --- a/drivers/hwmon/i5k_amb.c
> +++ b/drivers/hwmon/i5k_amb.c
> @@ -414,16 +414,14 @@ static int i5k_amb_add(void)
>   }
>   
>   static int i5k_find_amb_registers(struct i5k_amb_data *data,
> -					    unsigned long devid)
> +				  const struct pci_device_id *devid)
>   {
>   	struct pci_dev *pcidev;
>   	u32 val32;
>   	int res = -ENODEV;
>   
>   	/* Find AMB register memory space */
> -	pcidev = pci_get_device(PCI_VENDOR_ID_INTEL,
> -				devid,
> -				NULL);
> +	pcidev = pci_get_device_by_id(devid);
>   	if (!pcidev)
>   		return -ENODEV;
>   
> @@ -447,14 +445,15 @@ static int i5k_find_amb_registers(struct i5k_amb_data *data,
>   	return res;
>   }
>   
> -static int i5k_channel_probe(u16 *amb_present, unsigned long dev_id)
> +static int i5k_channel_probe(u16 *amb_present, unsigned int vendor,
> +			     unsigned int device)
>   {
>   	struct pci_dev *pcidev;
>   	u16 val16;
>   	int res = -ENODEV;
>   
>   	/* Copy the DIMM presence map for these two channels */
> -	pcidev = pci_get_device(PCI_VENDOR_ID_INTEL, dev_id, NULL);
> +	pcidev = pci_get_device(vendor, device, NULL);
>   	if (!pcidev)
>   		return -ENODEV;
>   
> @@ -473,23 +472,12 @@ static int i5k_channel_probe(u16 *amb_present, unsigned long dev_id)
>   	return res;
>   }
>   
> -static struct {
> -	unsigned long err;
> -	unsigned long fbd0;
> -} chipset_ids[]  = {
> -	{ PCI_DEVICE_ID_INTEL_5000_ERR, PCI_DEVICE_ID_INTEL_5000_FBD0 },
> -	{ PCI_DEVICE_ID_INTEL_5400_ERR, PCI_DEVICE_ID_INTEL_5400_FBD0 },
> -	{ 0, 0 }
> -};
> -
> -#ifdef MODULE
>   static const struct pci_device_id i5k_amb_ids[] = {
> -	{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_5000_ERR) },
> -	{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_5400_ERR) },
> +	{ PCI_DEVICE_DATA(INTEL, 5000_ERR, PCI_DEVICE_ID_INTEL_5000_FBD0) },
> +	{ PCI_DEVICE_DATA(INTEL, 5400_ERR, PCI_DEVICE_ID_INTEL_5400_FBD0) },
>   	{ 0, }
>   };
>   MODULE_DEVICE_TABLE(pci, i5k_amb_ids);
> -#endif
>   
>   static int i5k_amb_probe(struct platform_device *pdev)
>   {
> @@ -504,22 +492,26 @@ static int i5k_amb_probe(struct platform_device *pdev)
>   	/* Figure out where the AMB registers live */
>   	i = 0;
>   	do {
> -		res = i5k_find_amb_registers(data, chipset_ids[i].err);
> +		res = i5k_find_amb_registers(data, &i5k_amb_ids[i]);
>   		if (res == 0)
>   			break;
>   		i++;
> -	} while (chipset_ids[i].err);
> +	} while (i5k_amb_ids[i].device);
>   
>   	if (res)
>   		goto err;
>   
>   	/* Copy the DIMM presence map for the first two channels */
> -	res = i5k_channel_probe(&data->amb_present[0], chipset_ids[i].fbd0);
> +	res = i5k_channel_probe(&data->amb_present[0],
> +				i5k_amb_ids[i].vendor,
> +				i5k_amb_ids[i].driver_data);
>   	if (res)
>   		goto err;
>   
>   	/* Copy the DIMM presence map for the optional second two channels */
> -	i5k_channel_probe(&data->amb_present[2], chipset_ids[i].fbd0 + 1);
> +	i5k_channel_probe(&data->amb_present[2],
> +			  i5k_amb_ids[i].vendor,
> +			  i5k_amb_ids[i].driver_data+1);
>   
>   	/* Set up resource regions */
>   	reso = request_mem_region(data->amb_base, data->amb_len, DRVNAME);
> 


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
