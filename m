Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 566E9C54EBE
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Jan 2023 01:46:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Lag7OCwtOVLbxI8cKI43V2yOPsGGuGfPR5zUfC7wxqY=; b=nFMWU/EG+ZwsCo
	1DGl9Q8Vr0Ivw7UZLqD4+USEx1o08YYz1bi3hZUXaRqIDPATyVtYnFWRJEMQW01pKRr8VYPgVs6iC
	Mej+ryv9E++pIQkE+RG5EinMHAw7pUCOpmvn7dXf2fy2zQF+dJWSADk2iDj0SE+v4wm0VJQYG+nMK
	e6F/m15WsAGSUNjM+ctG7baAZy5cjZ1D/hSXMMuznKBoz1V6QW8PrS2dmT+1i95JhkxqWVG63m6LB
	yIa+T6UvzmA/k0gThyLJ22JhFFWYo/0DoglKKa980sNlWcWj4NJvKj595119M/OcyIyh4FbqEuOQ1
	sP7E6Ty/wcOBBxY58gsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHb3g-00CYUI-Hl; Tue, 17 Jan 2023 01:46:40 +0000
Received: from phobos.denx.de ([2a01:238:438b:c500:173d:9f52:ddab:ee01])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHb3c-00CYR2-TZ
	for linux-mtd@lists.infradead.org; Tue, 17 Jan 2023 01:46:39 +0000
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 7BF4C855B3;
	Tue, 17 Jan 2023 02:46:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1673919993;
	bh=9t+GT2j8iPQSv3jyzBTWyagcrzf32X61XBFG9XEUVa4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=VtG+tJDApGbrIq6NObejHcT5fXy8iPLUqg0e1AQAhyjq8cScSNUgLnBZcvW6lasur
	 /qua/E7Gr4DT9afSrk6ofMDT5o2To0ZOTVvzvWQtxvwFTpyJ83Gg6Ru7ca+mTfDiqU
	 Gtw4hy0B6MQP1uCdAZjDciDIzGz7dL6C8cEMQFwoROQ5p8MqWJd+4TD07VJxEPfoRk
	 bY2i3YyG7VA22MmUm27LPykcgs40ozTLH3+Fii7ql7halV4cODRHrKtSeTdWvkAFxw
	 m+rw38zCq2pbXMH0mYdg0ASMuWqGnQ4r5EEX+BJucP9RpP2dGPtz6L4WoJ3jNMP/+2
	 Q29+mOemzki8A==
Message-ID: <0584cc0e-eacb-ce71-0317-27d10264d3bf@denx.de>
Date: Tue, 17 Jan 2023 01:59:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v1 1/3] fdt: validate/fix cells count on mtdpart fixup
Content-Language: en-US
To: Francesco Dolcini <francesco@dolcini.it>
Cc: Simon Glass <sjg@chromium.org>, u-boot@lists.denx.de,
 Marcel Ziswiler <marcel.ziswiler@toradex.com>,
 Francesco Dolcini <francesco.dolcini@toradex.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-mtd@lists.infradead.org
References: <20230113184547.487322-1-francesco@dolcini.it>
 <20230113184547.487322-2-francesco@dolcini.it>
 <9ed3b4e4-7336-baf3-5a5a-8e77543e210d@denx.de>
 <Y8VdR4iCcuj9/rT+@francesco-nb.int.toradex.com>
 <06279fe3-a3b3-f3c4-276f-7cd0d4773875@denx.de>
 <Y8WQsIHXEDuJJuLd@francesco-nb.int.toradex.com>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <Y8WQsIHXEDuJJuLd@francesco-nb.int.toradex.com>
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230116_174637_304348_5A5C77EC 
X-CRM114-Status: GOOD (  34.41  )
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

On 1/16/23 19:00, Francesco Dolcini wrote:
> On Mon, Jan 16, 2023 at 06:54:44PM +0100, Marek Vasut wrote:
>> On 1/16/23 15:20, Francesco Dolcini wrote:
>>> On Sun, Jan 15, 2023 at 03:35:25PM +0100, Marek Vasut wrote:
>>>> On 1/13/23 19:45, Francesco Dolcini wrote:
>>>>> From: Francesco Dolcini <francesco.dolcini@toradex.com>
>>>>>
>>>>> Fixup #size-cells value when updating the MTD partitions, this is
>>>>> required to prevent issues in case the MTD parent set #size-cells to
>>>>> zero.
>>>>> This could happen for example in the legacy case in which the partitions
>>>>> are created as direct child of the mtd node and that specific node has
>>>>> no children. Recent clean-up on Linux device tree files created a boot
>>>>> regression on colibri-imx7.
>>>>>
>>>>> This fixup has the limitation to assume 32-bit (#size-cells=1)
>>>>> addressing, therefore it will not work with device bigger than 4GiB.
>>>>>
>>>>> This change also enforce #address-cells to be the same as #size-cells,
>>>>> this was already silently enforced by fdt_node_set_part_info(), now this
>>>>> is checked explicitly and partition fixup will just fail in such case.
>>>>>
>>>>> In general board should not generally need nor use this functionality
>>>>> and should be just deprecated, passing mtdparts= in the kernel command
>>>>> line is the preferred way according to Linux MTD subsystem maintainer.
>>>>>
>>>>> Link: https://lore.kernel.org/all/20221202071900.1143950-1-francesco@dolcini.it/
>>>>> Link: https://lore.kernel.org/all/Y4dgBTGNWpM6SQXI@francesco-nb.int.toradex.com/
>>>>> Cc: Marek Vasut <marex@denx.de>
>>>>> Cc: Miquel Raynal <miquel.raynal@bootlin.com>
>>>>> Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
>>>>> ---
>>>>>     common/fdt_support.c | 45 ++++++++++++++++++++++++++++++++++----------
>>>>>     1 file changed, 35 insertions(+), 10 deletions(-)
>>>>>
>>>>> diff --git a/common/fdt_support.c b/common/fdt_support.c
>>>>> index dbceec6f2dcc..3aee826e60cf 100644
>>>>> --- a/common/fdt_support.c
>>>>> +++ b/common/fdt_support.c
>>>>> @@ -877,27 +877,20 @@ static int fdt_del_partitions(void *blob, int parent_offset)
>>>>>     	return 0;
>>>>>     }
>>>>> -static int fdt_node_set_part_info(void *blob, int parent_offset,
>>>>> +/* This expects #address-cells and #size-cells to have same value */
>>>>> +static int fdt_node_set_part_info(void *blob, int parent_offset, int sizecell,
>>>>>     				  struct mtd_device *dev)
>>>>>     {
>>>>>     	struct list_head *pentry;
>>>>>     	struct part_info *part;
>>>>>     	int off, ndepth = 0;
>>>>>     	int part_num, ret;
>>>>> -	int sizecell;
>>>>>     	char buf[64];
>>>>>     	ret = fdt_del_partitions(blob, parent_offset);
>>>>>     	if (ret < 0)
>>>>>     		return ret;
>>>>> -	/*
>>>>> -	 * Check if size/address is 1 or 2 cells.
>>>>> -	 * We assume #address-cells and #size-cells have same value.
>>>>> -	 */
>>>>> -	sizecell = fdt_getprop_u32_default_node(blob, parent_offset,
>>>>> -						0, "#size-cells", 1);
>>>>> -
>>>>>     	/*
>>>>>     	 * Check if it is nand {}; subnode, adjust
>>>>>     	 * the offset in this case
>>>>> @@ -992,6 +985,31 @@ err_prop:
>>>>>     	return ret;
>>>>>     }
>>>>> +static int fdt_mtdparts_cell_cnt(void *fdt, int off)
>>>>> +{
>>>>> +	int sizecell, addrcell;
>>>>> +
>>>>> +	sizecell = fdt_getprop_u32_default_node(fdt, off, 0, "#size-cells", 0);
>>>>> +	if (sizecell != 1 && sizecell != 2) {
>>>>> +		printf("%s: Invalid or missing #size-cells %d value, assuming 1\n",
>>>>> +		       __func__, sizecell);
>>>>> +
>>>>> +		sizecell = 1;
>>>>> +		if (fdt_setprop_u32(fdt, off, "#size-cells", sizecell))
>>>>> +			return -1;
>>>>> +	}
>>>>> +
>>>>> +	addrcell = fdt_getprop_u32_default_node(fdt, off, 0,
>>>>> +						"#address-cells", 0);
>>>>> +	if (addrcell != sizecell) {
>>>>> +		printf("%s: Invalid #address-cells %d != #size-cells %d, aborting\n",
>>>>> +		       __func__, addrcell, sizecell);
>>>>> +		return -1;
>>>>> +	}
>>>>> +
>>>>> +	return sizecell;
>>>>> +}
>>>>> +
>>>>>     /*
>>>>>      * Update partitions in nor/nand nodes using info from
>>>>>      * mtdparts environment variable. The nodes to update are
>>>>> @@ -1037,12 +1055,19 @@ void fdt_fixup_mtdparts(void *blob, const struct node_info *node_info,
>>>>>     			dev = device_find(node_info[i].type, idx++);
>>>>>     			if (dev) {
>>>>> +				int cell;
>>>>> +
>>>>>     				parts = fdt_subnode_offset(blob, noff,
>>>>>     							   "partitions");
>>>>>     				if (parts < 0)
>>>>>     					parts = noff;
>>>>> -				if (fdt_node_set_part_info(blob, parts, dev))
>>>>> +				cell = fdt_mtdparts_cell_cnt(blob, parts);
>>>>> +				if (cell < 0)
>>>>> +					return;
>>>>> +
>>>>> +				if (fdt_node_set_part_info(blob, parts,
>>>>> +							   cell, dev))
>>>>>     					return; /* return on error */
>>>>>     			}
>>>>>     		}
>>>>
>>>> Can you please include the resulting gpmi node content with this fixup
>>>> applied in the commit message , so it can be validated ?
>>>
>>> I will add it to v2, I would wait a little bit more time to get
>>> additional feedback sending it however.
>>>
>>> In the meantime here the output, but nothing really changed!
>>> What this change is doing is just
>>>    - setting #size-cells to <1> when it is invalid
>>>    - skip generation at all when #size-cells != #address-cells. Former
>>>      code was just generating a broken table without any error
>>>      message.
>>>
>>> Here what is generated for colibri-imx7
>>>
>>> nand-controller@33002000 {
>>> 	compatible = "fsl,imx7d-gpmi-nand";
>>>
>>> 	#address-cells = <0x01>;
>>> 	#size-cells = <0x01>;
>>>
>>> [...snip...]
>>>
>>> 	partition@0 {
>>> 		label = "mx7-bcb";
>>> 		reg = <0x00 0x80000>;
>>> 	};
>>>
>>> 	partition@400000 {
>>> 		label = "ubi";
>>> 		reg = <0x400000 0x1fc00000>;
>>> 	};
>>>
>>> 	partition@80000 {
>>> 		read_only;
>>> 		label = "u-boot1";
>>> 		reg = <0x80000 0x180000>;
>>> 	};
>>>
>>> 	partition@380000 {
>>> 		label = "u-boot-env";
>>> 		reg = <0x380000 0x80000>;
>>> 	};
>>>
>>> 	partition@200000 {
>>> 		read_only;
>>> 		label = "u-boot2";
>>> 		reg = <0x200000 0x180000>;
>>> 	};
>>> };
>>
>> This is what I was afraid of, shouldn't this contain the partitions in
>> per-chipselect sub-node instead of directly in the GPMI node ?
> 
> That does not exists in my source DTS, this function just look for a
> partitions node and update it when it exists.
> I do not have a nand chip, and I do not want to add.

I know. I wonder if the function should convert the bindings to latest 
greatest, but I am starting to feel like hard-coding this kind of 
complex logic into bootloader is not a great idea .

> The reason is what I wrote in my other email, if I would do something
> like older U-Boot's would ignore it and just generate the partitions
> as direct children of the nand-controller.
> 
> Commit 36fee2f7621e ("common: fdt_support: add support for "partitions"
> subnode to fdt_fixup_mtdparts()") was introduced only in v2022.04.

There is the Linux BOOT_CONFIG , that might be some sort of alternative 
to complex kernel command line, but that's a bit more work. I figured 
I'd mention it here.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
