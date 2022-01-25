Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D17C6C433FE
	for <linux-mtd@archiver.kernel.org>; Tue, 25 Jan 2022 12:09:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1cLDwqUWOtUrGmh8K14qoa1oh3tY8bMIUNde+lCSFnA=; b=0Xhv/6A+zNE1cZ
	xLFpvk5RVuQYpFNwA80p8NW9KVddk9GmXw06lvRxF4ozJ21wI7+rsdjDTbJ2iNPPBe+gjol8b1rS+
	OmALZzQ9VFr0711Xp0T5IVdz9xNPvDab5uW3m3xjf/XpNutmadwRYnYFWpPpC1z6bYDEUIAlYN8sO
	cntvp4Nap6a0QrQX4QrC9oxNDTf6bpuumHen3yE7S0Poevl7lmkY4BZ4g6NcBXCyW64llPf778l0M
	3+Ty/QM5EaZ150V/qaOKbqCnn2lQQ7c8/og1Q2X7ojfm5yygVW/KxsvMrrW5ZomGMyj9OiR9lfKXs
	nL3GQVbOEC0J/8dtuTHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nCKdF-007j7D-SW; Tue, 25 Jan 2022 12:09:05 +0000
Received: from mail-lj1-x236.google.com ([2a00:1450:4864:20::236])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nCKdD-007j6H-4Q; Tue, 25 Jan 2022 12:09:04 +0000
Received: by mail-lj1-x236.google.com with SMTP id z20so5675514ljo.6;
 Tue, 25 Jan 2022 04:09:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:to:cc:references
 :from:in-reply-to:content-transfer-encoding;
 bh=jYOvh3TluQrcjkgjx/socsMLlC7b20Fo9pmrYGjtKZg=;
 b=e50pbGE8w0eIJVRReXoEZVlQD4WcZK070mmTC4q8/+TTueNm/GMXLNhx9y45Qn7pw4
 3QN+rL4MuXizPS4/DiGvDnLrR2hzhZGpfizBtgxZkXcAVdNaM6ggpYxgV6WcklQczb9x
 fb3nicof9MjMt/YxSlFv4dpx5t23LRTM504/diB50diJnpn0aNkW1pu3pO4zylBw6Aes
 OTJFU28m8O5V9ohzYoFxI4FZNIktw2CKVOkIqeDHvNmbcghbjhGyeGR9TIS/jMuFhlF5
 e2VyU+246N0qkNcHwErKtrUPGOfBbNCxUKcNmuQn+28pH4N5HGEwda9Yt+odv8k+s3jz
 Y4jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :to:cc:references:from:in-reply-to:content-transfer-encoding;
 bh=jYOvh3TluQrcjkgjx/socsMLlC7b20Fo9pmrYGjtKZg=;
 b=ekFK0HyvW12pNiIRJZBlFWlJZvGyRtWxZSHd64e4owy/RcSGa+XpPVEo+EURNTCNF8
 CPuyYLLMlcJvzKJD1t5xdd8XvDs1Xr9C93yyVxwZiGEgGdJEIsxWJw4WAsWy3YOZBjYg
 8tW66OUJ0WK8pJGXYyHA5Uo1c4pY9xoydLG4ByaEc2d+1malzWP6wamcE39VmrayGknP
 UcExkZ7AOM+kuM/F0ZCqT9U3x94hqkbZMoc+6yTqb3R0f17qAlXDC4XLfvla/iSSha79
 i5Ecvgt2kwMtYagjf76kefLkkhmfeQO55nj53niz9aELnW7o3hQiqC/l8NvdWfPQfpsc
 kAEg==
X-Gm-Message-State: AOAM533LSZQBT+StxGunvXiLF/HgpIzDPaiNGFnRpWsQmS2v4uGTHnAp
 4NZaFdoJPkNorgQRBVFoFdw=
X-Google-Smtp-Source: ABdhPJwVub3zDKTOB+wjBLNORR7sCU9xt8UfpG/X3/KvRRBcVKHVtkjQDkJBg0tA78MsiLJC2g6uDA==
X-Received: by 2002:a2e:a5c9:: with SMTP id n9mr14649555ljp.220.1643112540915; 
 Tue, 25 Jan 2022 04:09:00 -0800 (PST)
Received: from [192.168.26.149]
 (ip-194-187-74-233.konfederacka.maverick.com.pl. [194.187.74.233])
 by smtp.googlemail.com with ESMTPSA id y11sm1168942ljj.122.2022.01.25.04.08.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Jan 2022 04:09:00 -0800 (PST)
Message-ID: <455f4360-34fe-7fee-66d5-fd945fe1e086@gmail.com>
Date: Tue, 25 Jan 2022 13:08:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:96.0) Gecko/20100101
 Thunderbird/96.0
Subject: Re: [PATCH 6/8] nvmem: transformations: ethernet address offset
 support
To: Michael Walle <michael@walle.cc>, linux-mtd@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Rob Herring <robh+dt@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Shawn Guo <shawnguo@kernel.org>, Li Yang <leoyang.li@nxp.com>,
 Frank Rowand <frowand.list@gmail.com>, "David S . Miller"
 <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Ansuel Smith <ansuelsmth@gmail.com>, Andrew Lunn <andrew@lunn.ch>
References: <20211228142549.1275412-1-michael@walle.cc>
 <20211228142549.1275412-7-michael@walle.cc>
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
In-Reply-To: <20211228142549.1275412-7-michael@walle.cc>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220125_040903_216258_D29FE7E2 
X-CRM114-Status: GOOD (  28.18  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 28.12.2021 15:25, Michael Walle wrote:
> An nvmem cell might just contain a base MAC address. To generate a
> address of a specific interface, add a transformation to add an offset
> to this base address.
> 
> Add a generic implementation and the first user of it, namely the sl28
> vpd storage.
> 
> Signed-off-by: Michael Walle <michael@walle.cc>
> ---
>   drivers/nvmem/transformations.c | 45 +++++++++++++++++++++++++++++++++
>   1 file changed, 45 insertions(+)
> 
> diff --git a/drivers/nvmem/transformations.c b/drivers/nvmem/transformations.c
> index 61642a9feefb..15cd26da1f83 100644
> --- a/drivers/nvmem/transformations.c
> +++ b/drivers/nvmem/transformations.c
> @@ -12,7 +12,52 @@ struct nvmem_transformations {
>   	nvmem_cell_post_process_t pp;
>   };
>   
> +/**
> + * nvmem_transform_mac_address_offset() - Add an offset to a mac address cell
> + *
> + * A simple transformation which treats the index argument as an offset and add
> + * it to a mac address. This is useful, if the nvmem cell stores a base
> + * ethernet address.
> + *
> + * @index: nvmem cell index
> + * @data: nvmem data
> + * @bytes: length of the data
> + *
> + * Return: 0 or negative error code on failure.
> + */
> +static int nvmem_transform_mac_address_offset(int index, unsigned int offset,
> +					      void *data, size_t bytes)
> +{
> +	if (bytes != ETH_ALEN)
> +		return -EINVAL;
> +
> +	if (index < 0)
> +		return -EINVAL;
> +
> +	if (!is_valid_ether_addr(data))
> +		return -EINVAL;
> +
> +	eth_addr_add(data, index);
> +
> +	return 0;
> +}
> +
> +static int nvmem_kontron_sl28_vpd_pp(void *priv, const char *id, int index,
> +				     unsigned int offset, void *data,
> +				     size_t bytes)
> +{
> +	if (!id)
> +		return 0;
> +
> +	if (!strcmp(id, "mac-address"))
> +		return nvmem_transform_mac_address_offset(index, offset, data,
> +							  bytes);
> +
> +	return 0;
> +}
> +
>   static const struct nvmem_transformations nvmem_transformations[] = {
> +	{ .compatible = "kontron,sl28-vpd", .pp = nvmem_kontron_sl28_vpd_pp },
>   	{}
>   };

I think it's a rather bad solution that won't scale well at all.

You'll end up with a lot of NVMEM device specific strings and code in a
NVMEM core.

You'll have a lot of duplicated code (many device specific functions
calling e.g. nvmem_transform_mac_address_offset()).

I think it also ignores fact that one NVMEM device can be reused in
multiple platforms / device models using different (e.g. vendor / device
specific) cells.


What if we have:
1. Foo company using "kontron,sl28-vpd" with NVMEM cells:
    a. "mac-address"
    b. "mac-address-2"
    c. "mac-address-3"
2. Bar company using "kontron,sl28-vpd" with NVMEM cell:
    a. "mac-address"

In the first case you don't want any transformation.


If you consider using transformations for ASCII formats too then it
causes another conflict issue. Consider two devices:

1. Foo company device with BIN format of MAC
2. Bar company device with ASCII format of MAC

Both may use exactly the same binding:

partition@0 {
         compatible = "nvmem-cells";
         reg = <0x0 0x100000>;
         label = "bootloader";

         #address-cells = <1>;
         #size-cells = <1>;

         mac-address@100 {
                 reg = <0x100 0x6>;
         };
};

how are you going to handle them with proposed implementation? You can't
support both if you share "nvmem-cells" compatible string.


I think that what can solve those problems is assing "compatible" to
NVMEM cells.

Let me think about details of that possible solution.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
