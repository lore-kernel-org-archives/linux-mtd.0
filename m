Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C124C63797
	for <linux-mtd@archiver.kernel.org>; Sun, 15 Jan 2023 14:38:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OJUlQaEVVBpXQn3wAwPA+P6vXiAxBghgZXH/A4LeVvo=; b=DJk846/hi5vACB
	sHfs6khwN6eZ93m6wvBG3L264bjp8RWfnm5hV8qjUCndNwRU1V0PVo3aFsw9y/cOHbqhvoNPXxYjD
	cb/XIkPqdwttKK3QX/q5kwUKPxEwIjoj+UKd/VEqM7SoPMuqu1e4XJj5DYwpJ24ZhdTYTUygEdtGP
	S7c7xuB1QBAcQGHlFyiT7KzhctQ1sRC2arAjgCIkQYkAAkWOGplSdLxx+Y08CQFVyNR5GARS0+YJj
	+49zcQwfR3unfSf16WN2aZaNm6urn8YB10epmAW6FQCWZQu1m/oemEqik2cBI+/yfWB0xQirD3FEg
	zsuAvoi6TT/FeQjov15w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pH48k-007T6D-6N; Sun, 15 Jan 2023 14:37:42 +0000
Received: from phobos.denx.de ([85.214.62.61])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pH48g-007T5S-OD
	for linux-mtd@lists.infradead.org; Sun, 15 Jan 2023 14:37:40 +0000
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id B1E7185258;
	Sun, 15 Jan 2023 15:37:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1673793455;
	bh=l0rdYd6oeUSNdKDPj4d7hzvSnudY0NjHgZefAMHTuCk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=lOMQH9G94sVkWXF2xsoG8n7/x9PjNWzF+FmmFeku+/N1r6GJcK1a5Itx73jK4yZDQ
	 i7hFIc9f9xWz8NlZDOfsKfE6Md6BMFoPo/D3eFL0C4z18oEquI2rsNVBqcLxla7Lth
	 Av209S0CdY581b1Xd/sVroAO83mP0tiuHNC38B2WY3bEt+mC9llUH2f3f4pQ/qesJw
	 4Blhc83NHetNRiIopUSNht2UxOFpdH+tlMuTuECUZA/QjQXbK3sntoDDsgg3E6dCjj
	 icrLWVzdHEpozjxk9tBAIkFpK/SwO0f2szRLMpTJlQYr2FhnbWsaxpIV1LoDHhOq1o
	 YOX+jD7OY5z+A==
Message-ID: <9ed3b4e4-7336-baf3-5a5a-8e77543e210d@denx.de>
Date: Sun, 15 Jan 2023 15:35:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v1 1/3] fdt: validate/fix cells count on mtdpart fixup
Content-Language: en-US
To: Francesco Dolcini <francesco@dolcini.it>, Simon Glass <sjg@chromium.org>,
 u-boot@lists.denx.de, Marcel Ziswiler <marcel.ziswiler@toradex.com>
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-mtd@lists.infradead.org
References: <20230113184547.487322-1-francesco@dolcini.it>
 <20230113184547.487322-2-francesco@dolcini.it>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20230113184547.487322-2-francesco@dolcini.it>
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230115_063739_136347_189229A9 
X-CRM114-Status: GOOD (  32.88  )
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

On 1/13/23 19:45, Francesco Dolcini wrote:
> From: Francesco Dolcini <francesco.dolcini@toradex.com>
> 
> Fixup #size-cells value when updating the MTD partitions, this is
> required to prevent issues in case the MTD parent set #size-cells to
> zero.
> This could happen for example in the legacy case in which the partitions
> are created as direct child of the mtd node and that specific node has
> no children. Recent clean-up on Linux device tree files created a boot
> regression on colibri-imx7.
> 
> This fixup has the limitation to assume 32-bit (#size-cells=1)
> addressing, therefore it will not work with device bigger than 4GiB.
> 
> This change also enforce #address-cells to be the same as #size-cells,
> this was already silently enforced by fdt_node_set_part_info(), now this
> is checked explicitly and partition fixup will just fail in such case.
> 
> In general board should not generally need nor use this functionality
> and should be just deprecated, passing mtdparts= in the kernel command
> line is the preferred way according to Linux MTD subsystem maintainer.
> 
> Link: https://lore.kernel.org/all/20221202071900.1143950-1-francesco@dolcini.it/
> Link: https://lore.kernel.org/all/Y4dgBTGNWpM6SQXI@francesco-nb.int.toradex.com/
> Cc: Marek Vasut <marex@denx.de>
> Cc: Miquel Raynal <miquel.raynal@bootlin.com>
> Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
> ---
>   common/fdt_support.c | 45 ++++++++++++++++++++++++++++++++++----------
>   1 file changed, 35 insertions(+), 10 deletions(-)
> 
> diff --git a/common/fdt_support.c b/common/fdt_support.c
> index dbceec6f2dcc..3aee826e60cf 100644
> --- a/common/fdt_support.c
> +++ b/common/fdt_support.c
> @@ -877,27 +877,20 @@ static int fdt_del_partitions(void *blob, int parent_offset)
>   	return 0;
>   }
>   
> -static int fdt_node_set_part_info(void *blob, int parent_offset,
> +/* This expects #address-cells and #size-cells to have same value */
> +static int fdt_node_set_part_info(void *blob, int parent_offset, int sizecell,
>   				  struct mtd_device *dev)
>   {
>   	struct list_head *pentry;
>   	struct part_info *part;
>   	int off, ndepth = 0;
>   	int part_num, ret;
> -	int sizecell;
>   	char buf[64];
>   
>   	ret = fdt_del_partitions(blob, parent_offset);
>   	if (ret < 0)
>   		return ret;
>   
> -	/*
> -	 * Check if size/address is 1 or 2 cells.
> -	 * We assume #address-cells and #size-cells have same value.
> -	 */
> -	sizecell = fdt_getprop_u32_default_node(blob, parent_offset,
> -						0, "#size-cells", 1);
> -
>   	/*
>   	 * Check if it is nand {}; subnode, adjust
>   	 * the offset in this case
> @@ -992,6 +985,31 @@ err_prop:
>   	return ret;
>   }
>   
> +static int fdt_mtdparts_cell_cnt(void *fdt, int off)
> +{
> +	int sizecell, addrcell;
> +
> +	sizecell = fdt_getprop_u32_default_node(fdt, off, 0, "#size-cells", 0);
> +	if (sizecell != 1 && sizecell != 2) {
> +		printf("%s: Invalid or missing #size-cells %d value, assuming 1\n",
> +		       __func__, sizecell);
> +
> +		sizecell = 1;
> +		if (fdt_setprop_u32(fdt, off, "#size-cells", sizecell))
> +			return -1;
> +	}
> +
> +	addrcell = fdt_getprop_u32_default_node(fdt, off, 0,
> +						"#address-cells", 0);
> +	if (addrcell != sizecell) {
> +		printf("%s: Invalid #address-cells %d != #size-cells %d, aborting\n",
> +		       __func__, addrcell, sizecell);
> +		return -1;
> +	}
> +
> +	return sizecell;
> +}
> +
>   /*
>    * Update partitions in nor/nand nodes using info from
>    * mtdparts environment variable. The nodes to update are
> @@ -1037,12 +1055,19 @@ void fdt_fixup_mtdparts(void *blob, const struct node_info *node_info,
>   
>   			dev = device_find(node_info[i].type, idx++);
>   			if (dev) {
> +				int cell;
> +
>   				parts = fdt_subnode_offset(blob, noff,
>   							   "partitions");
>   				if (parts < 0)
>   					parts = noff;
>   
> -				if (fdt_node_set_part_info(blob, parts, dev))
> +				cell = fdt_mtdparts_cell_cnt(blob, parts);
> +				if (cell < 0)
> +					return;
> +
> +				if (fdt_node_set_part_info(blob, parts,
> +							   cell, dev))
>   					return; /* return on error */
>   			}
>   		}

Can you please include the resulting gpmi node content with this fixup 
applied in the commit message , so it can be validated ?

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
