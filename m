Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5A72C54EBE
	for <linux-mtd@archiver.kernel.org>; Mon, 16 Jan 2023 14:25:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EfbLvHtcns5xuDilzO1/FRJ6C5h7mTWei18HsQO1ZqY=; b=iM/Y9LpPv0Pa5y
	tWiomP6Cwwjwn2pTP2dpKLjQHRas4LLH4YvCY+qEibfSSncqRvg4quAmPsl1l1dA/Vit3OEEgky6+
	qUhOOGgvcbZlm5t1arbFDF5ya5ihy8u6FFerKqGtde/CrCoH8NjrYFLxTJFfWxVJN9IR/EmHomEiB
	Ur42EvKHO7zmW3EFLzfbUMTd0SfEpMI44D12m0bB7HR1JR/c27rQ/nhEHaaGDdDPoDIBaM70rTJrt
	EkeiCh6D0+9s38907uz36N/opS59O5VKRBmVhOQHHnPw/QI1mICpZLCzH5vZvCrl8iIWjqc7Dn5nI
	WYlWtlsmai2KkXrn/55g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHQQI-00AsUM-FU; Mon, 16 Jan 2023 14:25:18 +0000
Received: from smtp-out-03.comm2000.it ([212.97.32.66])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHQMM-00AqZT-4Z
	for linux-mtd@lists.infradead.org; Mon, 16 Jan 2023 14:21:16 +0000
Received: from francesco-nb.int.toradex.com (31-10-206-125.static.upc.ch [31.10.206.125])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: francesco@dolcini.it)
	by smtp-out-03.comm2000.it (Postfix) with ESMTPSA id B1070B44363;
	Mon, 16 Jan 2023 15:20:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailserver.it;
	s=mailsrv; t=1673878858;
	bh=yL9Ogy6GboqxWVw58SVCHgkK+pUmpOC6hDiIs26fdyM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=xsTGe5vfmIVWgoXnHE9TgMGijTqEYY8yi3HBnaRRNHJBeKx2w6nkD7fXgvGMMGR+7
	 pgPsenHOTy5do1/p30yaawd7xEWG4G+Nle7l3/CJBoVeuul9vUMx/AHM/ySilkqrvQ
	 0mNcbD/Lm+5V6NDlA/DE8gdKQ8aRVAHjtJT42O8070viKu0xoGjSudw5PFckAQPRMo
	 1JrOkoZP/9TFQBxTVtulC9xQdQTzgu3tHz0rBIYeNXg5rxao5GwDnsCrREQbCHcxCg
	 V9Yql9xPadOAEZAZ0gzjyM/fjDSZTPvZZ006TOygLsMLjyDuvGH7kKRJaGXKo0TaBM
	 JmgFV/YdMEX4A==
Date: Mon, 16 Jan 2023 15:20:55 +0100
From: Francesco Dolcini <francesco@dolcini.it>
To: Marek Vasut <marex@denx.de>
Cc: Francesco Dolcini <francesco@dolcini.it>,
	Simon Glass <sjg@chromium.org>, u-boot@lists.denx.de,
	Marcel Ziswiler <marcel.ziswiler@toradex.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	linux-mtd@lists.infradead.org
Subject: Re: [PATCH v1 1/3] fdt: validate/fix cells count on mtdpart fixup
Message-ID: <Y8VdR4iCcuj9/rT+@francesco-nb.int.toradex.com>
References: <20230113184547.487322-1-francesco@dolcini.it>
 <20230113184547.487322-2-francesco@dolcini.it>
 <9ed3b4e4-7336-baf3-5a5a-8e77543e210d@denx.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <9ed3b4e4-7336-baf3-5a5a-8e77543e210d@denx.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230116_062114_371801_DC94DC8C 
X-CRM114-Status: GOOD (  38.41  )
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

On Sun, Jan 15, 2023 at 03:35:25PM +0100, Marek Vasut wrote:
> On 1/13/23 19:45, Francesco Dolcini wrote:
> > From: Francesco Dolcini <francesco.dolcini@toradex.com>
> > 
> > Fixup #size-cells value when updating the MTD partitions, this is
> > required to prevent issues in case the MTD parent set #size-cells to
> > zero.
> > This could happen for example in the legacy case in which the partitions
> > are created as direct child of the mtd node and that specific node has
> > no children. Recent clean-up on Linux device tree files created a boot
> > regression on colibri-imx7.
> > 
> > This fixup has the limitation to assume 32-bit (#size-cells=1)
> > addressing, therefore it will not work with device bigger than 4GiB.
> > 
> > This change also enforce #address-cells to be the same as #size-cells,
> > this was already silently enforced by fdt_node_set_part_info(), now this
> > is checked explicitly and partition fixup will just fail in such case.
> > 
> > In general board should not generally need nor use this functionality
> > and should be just deprecated, passing mtdparts= in the kernel command
> > line is the preferred way according to Linux MTD subsystem maintainer.
> > 
> > Link: https://lore.kernel.org/all/20221202071900.1143950-1-francesco@dolcini.it/
> > Link: https://lore.kernel.org/all/Y4dgBTGNWpM6SQXI@francesco-nb.int.toradex.com/
> > Cc: Marek Vasut <marex@denx.de>
> > Cc: Miquel Raynal <miquel.raynal@bootlin.com>
> > Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
> > ---
> >   common/fdt_support.c | 45 ++++++++++++++++++++++++++++++++++----------
> >   1 file changed, 35 insertions(+), 10 deletions(-)
> > 
> > diff --git a/common/fdt_support.c b/common/fdt_support.c
> > index dbceec6f2dcc..3aee826e60cf 100644
> > --- a/common/fdt_support.c
> > +++ b/common/fdt_support.c
> > @@ -877,27 +877,20 @@ static int fdt_del_partitions(void *blob, int parent_offset)
> >   	return 0;
> >   }
> > -static int fdt_node_set_part_info(void *blob, int parent_offset,
> > +/* This expects #address-cells and #size-cells to have same value */
> > +static int fdt_node_set_part_info(void *blob, int parent_offset, int sizecell,
> >   				  struct mtd_device *dev)
> >   {
> >   	struct list_head *pentry;
> >   	struct part_info *part;
> >   	int off, ndepth = 0;
> >   	int part_num, ret;
> > -	int sizecell;
> >   	char buf[64];
> >   	ret = fdt_del_partitions(blob, parent_offset);
> >   	if (ret < 0)
> >   		return ret;
> > -	/*
> > -	 * Check if size/address is 1 or 2 cells.
> > -	 * We assume #address-cells and #size-cells have same value.
> > -	 */
> > -	sizecell = fdt_getprop_u32_default_node(blob, parent_offset,
> > -						0, "#size-cells", 1);
> > -
> >   	/*
> >   	 * Check if it is nand {}; subnode, adjust
> >   	 * the offset in this case
> > @@ -992,6 +985,31 @@ err_prop:
> >   	return ret;
> >   }
> > +static int fdt_mtdparts_cell_cnt(void *fdt, int off)
> > +{
> > +	int sizecell, addrcell;
> > +
> > +	sizecell = fdt_getprop_u32_default_node(fdt, off, 0, "#size-cells", 0);
> > +	if (sizecell != 1 && sizecell != 2) {
> > +		printf("%s: Invalid or missing #size-cells %d value, assuming 1\n",
> > +		       __func__, sizecell);
> > +
> > +		sizecell = 1;
> > +		if (fdt_setprop_u32(fdt, off, "#size-cells", sizecell))
> > +			return -1;
> > +	}
> > +
> > +	addrcell = fdt_getprop_u32_default_node(fdt, off, 0,
> > +						"#address-cells", 0);
> > +	if (addrcell != sizecell) {
> > +		printf("%s: Invalid #address-cells %d != #size-cells %d, aborting\n",
> > +		       __func__, addrcell, sizecell);
> > +		return -1;
> > +	}
> > +
> > +	return sizecell;
> > +}
> > +
> >   /*
> >    * Update partitions in nor/nand nodes using info from
> >    * mtdparts environment variable. The nodes to update are
> > @@ -1037,12 +1055,19 @@ void fdt_fixup_mtdparts(void *blob, const struct node_info *node_info,
> >   			dev = device_find(node_info[i].type, idx++);
> >   			if (dev) {
> > +				int cell;
> > +
> >   				parts = fdt_subnode_offset(blob, noff,
> >   							   "partitions");
> >   				if (parts < 0)
> >   					parts = noff;
> > -				if (fdt_node_set_part_info(blob, parts, dev))
> > +				cell = fdt_mtdparts_cell_cnt(blob, parts);
> > +				if (cell < 0)
> > +					return;
> > +
> > +				if (fdt_node_set_part_info(blob, parts,
> > +							   cell, dev))
> >   					return; /* return on error */
> >   			}
> >   		}
> 
> Can you please include the resulting gpmi node content with this fixup
> applied in the commit message , so it can be validated ?

I will add it to v2, I would wait a little bit more time to get
additional feedback sending it however.

In the meantime here the output, but nothing really changed!
What this change is doing is just
 - setting #size-cells to <1> when it is invalid
 - skip generation at all when #size-cells != #address-cells. Former
   code was just generating a broken table without any error
   message.

Here what is generated for colibri-imx7

nand-controller@33002000 {
	compatible = "fsl,imx7d-gpmi-nand";

	#address-cells = <0x01>;
	#size-cells = <0x01>;

[...snip...]

	partition@0 {
		label = "mx7-bcb";
		reg = <0x00 0x80000>;
	};

	partition@400000 {
		label = "ubi";
		reg = <0x400000 0x1fc00000>;
	};

	partition@80000 {
		read_only;
		label = "u-boot1";
		reg = <0x80000 0x180000>;
	};

	partition@380000 {
		label = "u-boot-env";
		reg = <0x380000 0x80000>;
	};

	partition@200000 {
		read_only;
		label = "u-boot2";
		reg = <0x200000 0x180000>;
	};
};


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
