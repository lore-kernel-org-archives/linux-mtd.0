Return-Path: <SRS0=TNsO=N4=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8050C433F5
	for <linux-mtd@archiver.kernel.org>; Mon,  6 Sep 2021 15:09:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A1EEA6054F
	for <linux-mtd@archiver.kernel.org>; Mon,  6 Sep 2021 15:09:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A1EEA6054F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pJMfzNBiXkxtT6TEBrVEZcwbFil/Ns3sizzcxWvj+QI=; b=hDQpDgXC09qsTn
	LqK8mvGK3HbMXYi8I6fkv2uh9/uA1uKKhRCYzevC5mPAPQvSIYCFEruSygKx3HkoSIo0qL+/Mb5Io
	+m2FM4xRhRJIotsKfHNgyn7gB3qRgItb2LhtV79m9Bec/2bRddzh7sxc3D7VM8iwadN0bShZCMAHY
	fSKjxzSk8NbS6JbdXPrs6K6meLu1QWayts+B3reDw8ZBZFPiBz2TbcorPa2JUguvkAhyDYZg0cOID
	ZjPfnte5hQ+mMGLoFxCO+tvzjGc6ZTgJumHKDLRU08B1ySiXLvoQ+I8Um6c20p/9NpdsgKy48n/ax
	qUfzw2NVeIfhsE3eB0UA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mNGEm-001Bhx-Qt; Mon, 06 Sep 2021 15:08:44 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mNGEj-001Bej-3O
 for linux-mtd@lists.infradead.org; Mon, 06 Sep 2021 15:08:42 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id C7CAF1F4276A;
 Mon,  6 Sep 2021 16:08:31 +0100 (BST)
Date: Mon, 6 Sep 2021 17:08:27 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Naga Sureshkumar Relli <nagasure@xilinx.com>, Michal Simek
 <monstr@monstr.eu>, Amit Kumar Mahapatra <akumarma@xilinx.com>, Richard
 Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Tudor
 Ambarus <Tudor.Ambarus@microchip.com>, <linux-mtd@lists.infradead.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH 2/3] mtd: rawnand: Check the CHANGE_READ_COLUMN from
 nand_read_subpage() is supported
Message-ID: <20210906170827.02ab8b96@collabora.com>
In-Reply-To: <20210906132942.36972-2-miquel.raynal@bootlin.com>
References: <20210906132942.36972-1-miquel.raynal@bootlin.com>
 <20210906132942.36972-2-miquel.raynal@bootlin.com>
Organization: Collabora
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210906_080841_330030_5AEDECCE 
X-CRM114-Status: GOOD (  18.78  )
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

On Mon,  6 Sep 2021 15:29:41 +0200
Miquel Raynal <miquel.raynal@bootlin.com> wrote:

> There are constraint controllers which do not support
> CHANGE_READ_COLUMNs at any offset. In particular, the offset alignment
> might be an issue. Ensure that the operation is supported before trying
> it.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  drivers/mtd/nand/raw/nand_base.c | 17 +++++++++++++----
>  1 file changed, 13 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
> index 7f29f27bb6fd..8175635b9802 100644
> --- a/drivers/mtd/nand/raw/nand_base.c
> +++ b/drivers/mtd/nand/raw/nand_base.c
> @@ -3065,10 +3065,19 @@ static int nand_read_subpage(struct nand_chip *chip, uint32_t data_offs,
>  		    (busw - 1))
>  			aligned_len++;
>  
> -		ret = nand_change_read_column_op(chip,
> -						 mtd->writesize + aligned_pos,
> -						 &chip->oob_poi[aligned_pos],
> -						 aligned_len, false);
> +		ret = nand_check_change_read_column_op(chip,
> +						       mtd->writesize + aligned_pos,
> +						       &chip->oob_poi[aligned_pos],
> +						       aligned_len, false, true);
> +		if (!ret)
> +			ret = nand_change_read_column_op(chip,
> +							 mtd->writesize + aligned_pos,
> +							 &chip->oob_poi[aligned_pos],
> +							 aligned_len, false);
> +		else
> +			ret = nand_change_read_column_op(chip, mtd->writesize,
> +							 chip->oob_poi,
> +							 mtd->oobsize, false);
>  		if (ret)
>  			return ret;

So you just fail if the CHANGE column op is not supported? Looks like
this check should be done before we assign ecc->read_subpage to
nand_read_subpage in
nand_set_ecc_on_host_ops()/nand_set_ecc_soft_ops()...

>  	}


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
