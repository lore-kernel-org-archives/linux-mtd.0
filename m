Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73752C54EBE
	for <linux-mtd@archiver.kernel.org>; Mon, 16 Jan 2023 17:55:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Oh6pR91Hpys7VAkejQVS39JgPg25Z7wsQ1imTnjtJQg=; b=LT3qmFRltDk82Y
	JcGlz94IKjJgpKVN/NiKOJJqReD2Xw3Mbscz8SZW5m1khq1SZ8H6ccnH/mit1Q+07K3pBHbG0ShCM
	hw1PyitlYcuQ9+ghD3VA+YJLTXG7AM6/DgXOrQKNNDWr71CXqNk14XJSNmRFPGZNX3/ZoW2Cvr1nx
	BkYEoGg9cdiL7xrBS+JcgqeJZQu6kinpUPOiiSX7v1cRUBnTcCy0OKU8Lhiyv9264Af4Kz0ZUv4ky
	ZIWZJYj/BaIIQ1v+Tj7836DobxRThBRaU66imcMsxf+9C+7JOcIe9pN7mwdlo8qUAQnLdGbb9gr6s
	ydr0saJdpTO0KMXviqfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHThD-00BbZ2-LR; Mon, 16 Jan 2023 17:54:59 +0000
Received: from phobos.denx.de ([2a01:238:438b:c500:173d:9f52:ddab:ee01])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHThA-00BbWk-2X
	for linux-mtd@lists.infradead.org; Mon, 16 Jan 2023 17:54:58 +0000
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 13DBD855B3;
	Mon, 16 Jan 2023 18:54:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1673891692;
	bh=YXTVQ7s1wdxXHSeV2Vcpw8UXIjIw/UuXyjAT3uscP0s=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=nLUCdK2hSsfssFNiSWI/RU7GXgIg6PW9cn3rE4RqovYjtdVQwwUksUCz2kvyzVuMa
	 8lUjvAXYNY0B1WyvJpG+w211J+eg+gOdNQlP+580kpFhYFB5gZtNk2d3M0QIRHDroM
	 ynSxxMsn0YjQdfhsNe67PDoRXy+rl+XH9BAIg1cM0LaqWrOcnk28N8gSlTTt15CwfP
	 Z2BNVhmqOI2gdafVhz5AzEcjPPgtkpxsz5GAQ10qQIivpvuCdYCvl/3rVdqbD/rxKP
	 zT/uqer/7K/MVSvxYlQDNj1iJta4QHH1z95xavP1n+qZz8Fifw9gOV4VJR/bkvYlPB
	 h5n6EQceSayiQ==
Message-ID: <06279fe3-a3b3-f3c4-276f-7cd0d4773875@denx.de>
Date: Mon, 16 Jan 2023 18:54:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v1 1/3] fdt: validate/fix cells count on mtdpart fixup
To: Francesco Dolcini <francesco@dolcini.it>
Cc: Simon Glass <sjg@chromium.org>, u-boot@lists.denx.de,
 Marcel Ziswiler <marcel.ziswiler@toradex.com>,
 Francesco Dolcini <francesco.dolcini@toradex.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-mtd@lists.infradead.org
References: <20230113184547.487322-1-francesco@dolcini.it>
 <20230113184547.487322-2-francesco@dolcini.it>
 <9ed3b4e4-7336-baf3-5a5a-8e77543e210d@denx.de>
 <Y8VdR4iCcuj9/rT+@francesco-nb.int.toradex.com>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <Y8VdR4iCcuj9/rT+@francesco-nb.int.toradex.com>
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230116_095456_580427_BFD868C9 
X-CRM114-Status: GOOD (  29.85  )
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

On 1/16/23 15:20, Francesco Dolcini wrote:
> On Sun, Jan 15, 2023 at 03:35:25PM +0100, Marek Vasut wrote:
>> On 1/13/23 19:45, Francesco Dolcini wrote:
>>> From: Francesco Dolcini <francesco.dolcini@toradex.com>
>>>
>>> Fixup #size-cells value when updating the MTD partitions, this is
>>> required to prevent issues in case the MTD parent set #size-cells to
>>> zero.
>>> This could happen for example in the legacy case in which the partitions
>>> are created as direct child of the mtd node and that specific node has
>>> no children. Recent clean-up on Linux device tree files created a boot
>>> regression on colibri-imx7.
>>>
>>> This fixup has the limitation to assume 32-bit (#size-cells=1)
>>> addressing, therefore it will not work with device bigger than 4GiB.
>>>
>>> This change also enforce #address-cells to be the same as #size-cells,
>>> this was already silently enforced by fdt_node_set_part_info(), now this
>>> is checked explicitly and partition fixup will just fail in such case.
>>>
>>> In general board should not generally need nor use this functionality
>>> and should be just deprecated, passing mtdparts= in the kernel command
>>> line is the preferred way according to Linux MTD subsystem maintainer.
>>>
>>> Link: https://lore.kernel.org/all/20221202071900.1143950-1-francesco@dolcini.it/
>>> Link: https://lore.kernel.org/all/Y4dgBTGNWpM6SQXI@francesco-nb.int.toradex.com/
>>> Cc: Marek Vasut <marex@denx.de>
>>> Cc: Miquel Raynal <miquel.raynal@bootlin.com>
>>> Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
>>> ---
>>>    common/fdt_support.c | 45 ++++++++++++++++++++++++++++++++++----------
>>>    1 file changed, 35 insertions(+), 10 deletions(-)
>>>
>>> diff --git a/common/fdt_support.c b/common/fdt_support.c
>>> index dbceec6f2dcc..3aee826e60cf 100644
>>> --- a/common/fdt_support.c
>>> +++ b/common/fdt_support.c
>>> @@ -877,27 +877,20 @@ static int fdt_del_partitions(void *blob, int parent_offset)
>>>    	return 0;
>>>    }
>>> -static int fdt_node_set_part_info(void *blob, int parent_offset,
>>> +/* This expects #address-cells and #size-cells to have same value */
>>> +static int fdt_node_set_part_info(void *blob, int parent_offset, int sizecell,
>>>    				  struct mtd_device *dev)
>>>    {
>>>    	struct list_head *pentry;
>>>    	struct part_info *part;
>>>    	int off, ndepth = 0;
>>>    	int part_num, ret;
>>> -	int sizecell;
>>>    	char buf[64];
>>>    	ret = fdt_del_partitions(blob, parent_offset);
>>>    	if (ret < 0)
>>>    		return ret;
>>> -	/*
>>> -	 * Check if size/address is 1 or 2 cells.
>>> -	 * We assume #address-cells and #size-cells have same value.
>>> -	 */
>>> -	sizecell = fdt_getprop_u32_default_node(blob, parent_offset,
>>> -						0, "#size-cells", 1);
>>> -
>>>    	/*
>>>    	 * Check if it is nand {}; subnode, adjust
>>>    	 * the offset in this case
>>> @@ -992,6 +985,31 @@ err_prop:
>>>    	return ret;
>>>    }
>>> +static int fdt_mtdparts_cell_cnt(void *fdt, int off)
>>> +{
>>> +	int sizecell, addrcell;
>>> +
>>> +	sizecell = fdt_getprop_u32_default_node(fdt, off, 0, "#size-cells", 0);
>>> +	if (sizecell != 1 && sizecell != 2) {
>>> +		printf("%s: Invalid or missing #size-cells %d value, assuming 1\n",
>>> +		       __func__, sizecell);
>>> +
>>> +		sizecell = 1;
>>> +		if (fdt_setprop_u32(fdt, off, "#size-cells", sizecell))
>>> +			return -1;
>>> +	}
>>> +
>>> +	addrcell = fdt_getprop_u32_default_node(fdt, off, 0,
>>> +						"#address-cells", 0);
>>> +	if (addrcell != sizecell) {
>>> +		printf("%s: Invalid #address-cells %d != #size-cells %d, aborting\n",
>>> +		       __func__, addrcell, sizecell);
>>> +		return -1;
>>> +	}
>>> +
>>> +	return sizecell;
>>> +}
>>> +
>>>    /*
>>>     * Update partitions in nor/nand nodes using info from
>>>     * mtdparts environment variable. The nodes to update are
>>> @@ -1037,12 +1055,19 @@ void fdt_fixup_mtdparts(void *blob, const struct node_info *node_info,
>>>    			dev = device_find(node_info[i].type, idx++);
>>>    			if (dev) {
>>> +				int cell;
>>> +
>>>    				parts = fdt_subnode_offset(blob, noff,
>>>    							   "partitions");
>>>    				if (parts < 0)
>>>    					parts = noff;
>>> -				if (fdt_node_set_part_info(blob, parts, dev))
>>> +				cell = fdt_mtdparts_cell_cnt(blob, parts);
>>> +				if (cell < 0)
>>> +					return;
>>> +
>>> +				if (fdt_node_set_part_info(blob, parts,
>>> +							   cell, dev))
>>>    					return; /* return on error */
>>>    			}
>>>    		}
>>
>> Can you please include the resulting gpmi node content with this fixup
>> applied in the commit message , so it can be validated ?
> 
> I will add it to v2, I would wait a little bit more time to get
> additional feedback sending it however.
> 
> In the meantime here the output, but nothing really changed!
> What this change is doing is just
>   - setting #size-cells to <1> when it is invalid
>   - skip generation at all when #size-cells != #address-cells. Former
>     code was just generating a broken table without any error
>     message.
> 
> Here what is generated for colibri-imx7
> 
> nand-controller@33002000 {
> 	compatible = "fsl,imx7d-gpmi-nand";
> 
> 	#address-cells = <0x01>;
> 	#size-cells = <0x01>;
> 
> [...snip...]
> 
> 	partition@0 {
> 		label = "mx7-bcb";
> 		reg = <0x00 0x80000>;
> 	};
> 
> 	partition@400000 {
> 		label = "ubi";
> 		reg = <0x400000 0x1fc00000>;
> 	};
> 
> 	partition@80000 {
> 		read_only;
> 		label = "u-boot1";
> 		reg = <0x80000 0x180000>;
> 	};
> 
> 	partition@380000 {
> 		label = "u-boot-env";
> 		reg = <0x380000 0x80000>;
> 	};
> 
> 	partition@200000 {
> 		read_only;
> 		label = "u-boot2";
> 		reg = <0x200000 0x180000>;
> 	};
> };

This is what I was afraid of, shouldn't this contain the partitions in 
per-chipselect sub-node instead of directly in the GPMI node ?

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
