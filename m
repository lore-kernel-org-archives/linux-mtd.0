Return-Path: <SRS0=/vOe=RA=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E824C43381
	for <linux-mtd@archiver.kernel.org>; Mon, 25 Feb 2019 19:33:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F0F5C20842
	for <linux-mtd@archiver.kernel.org>; Mon, 25 Feb 2019 19:33:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="iVEERQLm";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=cogentembedded-com.20150623.gappssmtp.com header.i=@cogentembedded-com.20150623.gappssmtp.com header.b="fbvQibqK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F0F5C20842
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=cogentembedded.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0D3PpLh49lzIP40g3e+DY5yyx/MeomVs53exOwxxp/k=; b=iVEERQLmpI9MF7
	Q/TCPa6SWFZcC1wqDyNJNw1/mgE6FHaDZUCDQkqHrbW/1TInCZx24NjI1H9Gnx/nH0LHCMKqSI1iN
	85tMeQ0Eqp8a9KQfXHcKTSPaCOZYmzfAT1e4dWmZK1eleFK/PjJF9Wm+Xtc6fLwk/fg1lSxC3u+zV
	qah5eZ80vKcgxUpSHl/lKp+N8hpDsmK58WoeBClVQBfaD5U3wykVNVmo6YzsS6XL4Di2uhsFvMufr
	y5A1JfkXpI4dEguj3K8K7gAr3dstGDccUw33uEirKcAfRQnm/GcQBwBPKD+Bm54zk5vn+SNzGYsbd
	MmvuNXpuXMHsTMRnT03g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gyM0N-0005Qg-To; Mon, 25 Feb 2019 19:33:35 +0000
Received: from mail-lj1-x241.google.com ([2a00:1450:4864:20::241])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gyM0A-0005Hx-K1
 for linux-mtd@lists.infradead.org; Mon, 25 Feb 2019 19:33:24 +0000
Received: by mail-lj1-x241.google.com with SMTP id z7so8314713lji.0
 for <linux-mtd@lists.infradead.org>; Mon, 25 Feb 2019 11:33:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=eX6EJTdHV8W5AjvTP6REm4fH1/SpIVw5AXuQai7r+rs=;
 b=fbvQibqKvsZ6TRQfCU6cGibqZcZ87dkwtjA8KtIPZ6wWDDn704Ai3q33CF+FYWFp1c
 sxWyiI9MXYFsIaoDQUeuHfpjNrWYoqijK1OEaLSWBKHhpSDvvpYxxKVmTMd+1GI4omWm
 22LCyZVVQG/NRJmjY8D8dym5KoSNrBHDpldadFcV0k5XWgOo561ObwwPgdFMdtAtap1X
 3l6HAXBEjULMRIwwuqlKs97RTSoaAD/XeICSI9VgvLN9rWGIcLEeV76PQM68ffaypbht
 RJwK4pdHwk9qKGVB95p88b7GnaCgiq9J3vazjHpU+xB/TOAUVYxGaG44oG6BmC6o4olr
 H5tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=eX6EJTdHV8W5AjvTP6REm4fH1/SpIVw5AXuQai7r+rs=;
 b=g4oUm1jd0Xi6vPh/HKCuUv+JygA5yy6ySCRj6t9A34jyquDNjz+v+HhFWxuUHTY+56
 mAA4C3C11a0BtnNSzy26so3TkGl73Thy1ywKd/3RKAyof+nzT9bKNGwUbWW5vdLuWYX/
 nSMlcZpkJLlrKhlabs0PnlStcT9T4yvzFj9v5n3AYSm9OQ1pGFSIjL0Lr+W0YdrX8NB8
 EwdGIsybiu+SsfhBFD3DJlUOW3V68tNM0KhnOkPNZKi38bvPTxtaUEzCKDpDKZoAtKXB
 RDSGq1LB5mVRNOEAl01AYbP2RIV3qQAYHemDLZEjejEY1rcwSJO4sMgB1iVw4nJy6gfe
 fjtg==
X-Gm-Message-State: AHQUAubshUGUD+e7dbGRhmOYBs6gkTO0NiAyA2cQgMY7WEYoBPfSj9Ov
 Cjw+hEXqyUYuBYkUGNgI7PwUSA==
X-Google-Smtp-Source: AHgI3IbIilnOZiPAqOZ5AONrpIASHaGfLRcB3yWwGkOBQBfwSU28ZmV8PkOeMH01udfQTWuRrqP3bg==
X-Received: by 2002:a2e:98c8:: with SMTP id s8mr10931450ljj.84.1551123199758; 
 Mon, 25 Feb 2019 11:33:19 -0800 (PST)
Received: from wasted.cogentembedded.com ([31.173.84.85])
 by smtp.gmail.com with ESMTPSA id j14sm2739819lfc.28.2019.02.25.11.33.18
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 25 Feb 2019 11:33:18 -0800 (PST)
Subject: Re: [RFC PATCH 3/5] mtd: Add support for Hyperbus memory devices
To: Vignesh R <vigneshr@ti.com>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <bbrezillon@kernel.org>, Marek Vasut
 <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Rob Herring <robh+dt@kernel.org>
References: <20190219063607.29949-1-vigneshr@ti.com>
 <20190219063607.29949-4-vigneshr@ti.com>
 <42d0fd7b-42e0-605c-70ee-6e308908fc90@cogentembedded.com>
 <4910fda5-133d-7ebb-6ab3-49e0839ea920@ti.com>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Organization: Cogent Embedded
Message-ID: <95344724-214f-20b7-b629-149ddf396117@cogentembedded.com>
Date: Mon, 25 Feb 2019 22:33:17 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <4910fda5-133d-7ebb-6ab3-49e0839ea920@ti.com>
Content-Language: en-MW
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190225_113322_798261_E8C54BD8 
X-CRM114-Status: GOOD (  24.34  )
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Arnd Bergmann <arnd@arndb.de>,
 "tudor.ambarus@microchip.com" <tudor.ambarus@microchip.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Nori,
 Sekhar" <nsekhar@ti.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 02/25/2019 09:21 PM, Vignesh R wrote:

[...]

>>> HyperBus specification can be found at[1]
>>> HyperFlash datasheet can be found at[2]
>>>
>>> [1] https://www.cypress.com/file/213356/download
>>> [2] https://www.cypress.com/file/213346/download
>>> [3] http://www.ti.com/lit/ug/spruid7b/spruid7b.pdf
>>>     Table 12-5741. HyperFlash Access Sequence
>>>
>>> Signed-off-by: Vignesh R <vigneshr@ti.com>
[...]
>>> diff --git a/drivers/mtd/hyperbus/core.c b/drivers/mtd/hyperbus/core.c
>>> new file mode 100644
>>> index 000000000000..d3d44aab7503
>>> --- /dev/null
>>> +++ b/drivers/mtd/hyperbus/core.c
[...]
>>> +int hb_register_device(struct hb_device *hbdev)
>>> +{
>>> +	struct resource res;
>>> +	struct device *dev;
>>> +	struct device_node *np;
>>> +	struct map_info *map;
>>> +	struct hb_ops *ops;
>>> +	int err;
>>> +
>>> +	if (!hbdev || !hbdev->dev || !hbdev->np) {
>>> +		pr_err("hyperbus: please fill all the necessary fields!\n");
>>> +		return -EINVAL;
>>> +	}
>>> +
>>> +	np = hbdev->np;
>>> +	if (!of_device_is_compatible(np, "cypress,hyperflash"))
>>> +		return -ENODEV;
>>> +
>>> +	hbdev->memtype = HYPERFLASH;
>>> +
>>> +	if (of_address_to_resource(np, 0, &res))
>>
>>     Isn't the direct mapping property of the HF controller, not of HyperFlash
>> itself?
>>
> 
> As I said in the cover letter, I could not find many examples of HF
> controllers, but couple of them that I studied provide MMIO access to
> flash. So, reg property of flash node would represent local address on
> the HyperBus and controller node would set up ranges properly to provide
> translation from CS to SoC address space.
> For example see patch 4/5 where reg property would indicate CS and Size
> of flash. This scheme is similar to whats described here [1]
> HBMC controllers usually have different MMIO regions to access flashes
> connected to different CS. So using ranges for address translation along
> with flash node describing local address works pretty well.
> 
> My understanding is that this part of code will be common for most MMIO
> based HB controllers and hence made part of core layer. But, if
> controllers uses different IO space for read vs write, then this needs a
> bit of thinking. In that case, mapping needs to be moved to controller
> drivers.
> 
> [1]https://elinux.org/Device_Tree_Usage#Ranges_.28Address_Translation.29
> 
>>> +		return -EINVAL;
>>> +
>>> +	dev = hbdev->dev;
>>> +	map = &hbdev->map;
>>> +	map->size = resource_size(&res);
>>> +	map->virt = devm_ioremap_resource(dev, &res);
>>> +	if (IS_ERR(map->virt))
>>> +		return PTR_ERR(map->virt);
>>> +
>>> +	map->name = dev_name(dev);
>>> +	map->bankwidth = 2;
>>> +
>>> +	simple_map_init(map);
>>
>>    It's not that simple, I'm afraid -- e.g. Renesas RPC-IF has read and write
>> mappings in the separate memory resources.
>>
> 
> Hmm, could you point me to public datasheet of the controller?

   See chapter 20 in [1]. Note that it's not the same SoC I'm developing for (R-Car
gen3 family, with NDA docs) but should be mostly the same RPC-IF core.

[1] https://www.renesas.com/us/en/doc/products/mpumcu/doc/rz/r01uh0746ej0200-rza2m.pdf?key=74862185b5e22ad09e648d21a35de615

> simple_map_init() provides default implementation for map operations
> which is overridden, if hb_ops is populated.
> I think, Renesas RPC-IF can populate custom hb_ops struct and use
> appropriate MMIO base for read vs write, while still reusing the map
> framework. Wouldnt that work?

   It probably would...

[...]

MBR, Sergei

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
