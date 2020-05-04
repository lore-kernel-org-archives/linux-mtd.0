Return-Path: <SRS0=hi6L=6S=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32E4CC3A5A9
	for <linux-mtd@archiver.kernel.org>; Mon,  4 May 2020 08:43:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 057D5206B9
	for <linux-mtd@archiver.kernel.org>; Mon,  4 May 2020 08:43:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="IG3BE3L9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 057D5206B9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XOkYM1UPmhruW5v8JubCnYkXJYPf+fi9lpST5SqeCj8=; b=IG3BE3L9nklZF3
	4Ybt95Iomr0W0Ns7sj8t03zYQTUosbyts7ah3DGPAe23VCq7S/CezzW4g7YLA7g6J7sMg3qfIlJdN
	s73W1TvThl2a5HTzLl4buJ0IUQMiWm/FLSZNeYEbpGfgsbdCilW05aag1uAHa4ddWNeDdQjNhN7J/
	nqNk6UCangb+M0j/eDEj1GdRUri64ikieHi6a3FfeUhZG1mgPeHUXG14/nzlk2G31MoDBWWi0MPMG
	63CymF+Yjdkm+z/YIywYmolkWUE+wGHoS+1in5nft2AHM4Hk0bOyWl+kHh0h9jY21J5X3OyfDYuYv
	VLhfb7dX0CGXMwBbO1AA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jVWgq-0008EC-FA; Mon, 04 May 2020 08:43:04 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jVWgn-0008DE-KN
 for linux-mtd@lists.infradead.org; Mon, 04 May 2020 08:43:03 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id BE0522A0151;
 Mon,  4 May 2020 09:42:59 +0100 (BST)
Date: Mon, 4 May 2020 10:42:57 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH v3 08/13] mtd: rawnand: Give the possibility to verify a
 read operation is supported
Message-ID: <20200504104257.7e6f1877@collabora.com>
In-Reply-To: <20200504082414.7327-9-miquel.raynal@bootlin.com>
References: <20200504082414.7327-1-miquel.raynal@bootlin.com>
 <20200504082414.7327-9-miquel.raynal@bootlin.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200504_014301_798088_3453F40C 
X-CRM114-Status: GOOD (  15.96  )
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
Cc: Michal Simek <monstr@monstr.eu>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Naga Sureshkumar Relli <nagasure@xilinx.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Mon,  4 May 2020 10:24:09 +0200
Miquel Raynal <miquel.raynal@bootlin.com> wrote:

> This can be used to discriminate between two path in the parameter
> page detection: use data_in cycles (like before) if supported, use the
> CHANGE READ COLUMN command otherwise.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  drivers/mtd/nand/raw/fsmc_nand.c    |  2 +-
>  drivers/mtd/nand/raw/marvell_nand.c |  4 +--
>  drivers/mtd/nand/raw/nand_base.c    | 48 +++++++++++++++++------------
>  drivers/mtd/nand/raw/nand_jedec.c   |  2 +-
>  drivers/mtd/nand/raw/nand_legacy.c  |  8 +++--
>  drivers/mtd/nand/raw/nand_micron.c  |  6 ++--
>  drivers/mtd/nand/raw/nand_onfi.c    |  3 +-
>  include/linux/mtd/rawnand.h         |  2 +-
>  8 files changed, 44 insertions(+), 31 deletions(-)
> 
> diff --git a/drivers/mtd/nand/raw/fsmc_nand.c b/drivers/mtd/nand/raw/fsmc_nand.c
> index 59ef2b6a21b5..735c2216149f 100644
> --- a/drivers/mtd/nand/raw/fsmc_nand.c
> +++ b/drivers/mtd/nand/raw/fsmc_nand.c
> @@ -694,7 +694,7 @@ static int fsmc_read_page_hwecc(struct nand_chip *chip, u8 *buf,
>  	for (i = 0, s = 0; s < eccsteps; s++, i += eccbytes, p += eccsize) {
>  		nand_read_page_op(chip, page, s * eccsize, NULL, 0);
>  		chip->ecc.hwctl(chip, NAND_ECC_READ);
> -		ret = nand_read_data_op(chip, p, eccsize, false);
> +		ret = nand_read_data_op(chip, p, eccsize, false, false);

I feel like we should provide wrappers around those functions that take
a check_only param:

static inline int nand_exec_read_data_op(...)
{
	return nand_read_data_op(..., false);
}

static inline int nand_check_read_data_op(...)
{
	return nand_read_data_op(..., true);
}

but let's keep that for later.

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
