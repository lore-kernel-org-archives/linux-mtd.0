Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2B99C433F5
	for <linux-mtd@archiver.kernel.org>; Mon, 20 Dec 2021 18:59:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jSU9KyCrX7kFN4Ew0644L0u6TlHZSgNXy6OfOCd1nEY=; b=GARszfwMOFzduc
	VyuqSOq3Xg7Yt8PwReVHjGreCsmsFuUXaYwdsM3cQYdpkfqg5FHQDhEmk7SeCMNtykOvWK6C9dvMk
	KCtfEYUUska6YeNgsKvT4AA2sGXZCpi+lJ7syp+1j6tK5MuY9ENGrdmvTKeMyw+sBVqL2DOWYgRWk
	NdNdppUSMnQK5BvPHjahJg3JNAjtdU7haPINsx3MZ8Y80UqZ1nw0VbyknpfMllKmuz5PzqkJYRkiI
	TJ0ey495NzUzyUAFlPD19l4VUtBm+Wvx7qgFxpxWGkkVqrFz1zL8ft5MeebWoc1fYgIMjFCVs/GLJ
	r2DGYfZ5UJqjvy06YVyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mzNs6-003x3h-49; Mon, 20 Dec 2021 18:58:54 +0000
Received: from fllv0015.ext.ti.com ([198.47.19.141])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mzNs3-003x2W-9G
 for linux-mtd@lists.infradead.org; Mon, 20 Dec 2021 18:58:52 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 1BKIwhTO005478;
 Mon, 20 Dec 2021 12:58:43 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1640026723;
 bh=AKdr7jyMz7gRpPAjrABem0B3PL3aJ+32yCdhKQS2QVY=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=uwtHvDyW2t1LptjKMzt1V6qQIIDoeJ+2LpAXHAMWYYDj7Kw0zCWwmo4rRMz4Psy4r
 8R6LYpPcLVs+t757QCHv4FALvgwgkZW4ztiZHvyiiOaa9CCf4ItZMfGW0oORBEuKIJ
 t/zl1sgXQvuUWaGt/DjaEt1nPPRrbkIV6p/qvw7c=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 1BKIwhIJ008405
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 20 Dec 2021 12:58:43 -0600
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Mon, 20
 Dec 2021 12:58:43 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Mon, 20 Dec 2021 12:58:43 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 1BKIwgGi016575;
 Mon, 20 Dec 2021 12:58:43 -0600
Date: Tue, 21 Dec 2021 00:28:42 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
CC: Mark Brown <broonie@kernel.org>, <linux-spi@vger.kernel.org>, Richard
 Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Tudor
 Ambarus <Tudor.Ambarus@microchip.com>,
 Michael Walle <michael@walle.cc>, <linux-mtd@lists.infradead.org>,
 Julien Su <juliensu@mxic.com.tw>, Jaime Liao <jaimeliao@mxic.com.tw>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Boris Brezillon <boris.brezillon@collabora.com>
Subject: Re: [PATCH v7 06/14] spi: spi-mem: Kill the
 spi_mem_dtr_supports_op() helper
Message-ID: <20211220185840.ox5hs44hej6nhkxo@ti.com>
References: <20211217161654.367782-1-miquel.raynal@bootlin.com>
 <20211217161654.367782-7-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211217161654.367782-7-miquel.raynal@bootlin.com>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211220_105851_458616_230EFD63 
X-CRM114-Status: GOOD (  17.00  )
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

On 17/12/21 05:16PM, Miquel Raynal wrote:
> Now that spi_mem_default_supports_op() has access to the static
> controller capabilities (related to memory operations), and now that
> these capabilities have been filled by the impacted controllers, there
> is no need for a specific helper checking only DTR operations, so let's
> just kill spi_mem_dtr_supports_op() and simply use
> spi_mem_default_supports_op() instead.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  drivers/spi/spi-cadence-quadspi.c |  5 +----
>  drivers/spi/spi-mem.c             | 10 ----------
>  drivers/spi/spi-mxic.c            | 10 +---------
>  include/linux/spi/spi-mem.h       | 11 -----------
>  4 files changed, 2 insertions(+), 34 deletions(-)
> 
> diff --git a/drivers/spi/spi-mxic.c b/drivers/spi/spi-mxic.c
> index e137b1ec85d4..67d05ee8d6a0 100644
> --- a/drivers/spi/spi-mxic.c
> +++ b/drivers/spi/spi-mxic.c
> @@ -335,8 +335,6 @@ static int mxic_spi_data_xfer(struct mxic_spi *mxic, const void *txbuf,
>  static bool mxic_spi_mem_supports_op(struct spi_mem *mem,
>  				     const struct spi_mem_op *op)
>  {
> -	bool all_false;
> -
>  	if (op->data.buswidth > 8 || op->addr.buswidth > 8 ||
>  	    op->dummy.buswidth > 8 || op->cmd.buswidth > 8)
>  		return false;
> @@ -348,13 +346,7 @@ static bool mxic_spi_mem_supports_op(struct spi_mem *mem,
>  	if (op->addr.nbytes > 7)
>  		return false;
>  
> -	all_false = !op->cmd.dtr && !op->addr.dtr && !op->dummy.dtr &&
> -		    !op->data.dtr;
> -
> -	if (all_false)
> -		return spi_mem_default_supports_op(mem, op);
> -	else
> -		return spi_mem_dtr_supports_op(mem, op);
> +	return spi_mem_default_supports_op(mem, op);

Does this controller support mixed DTR modes? If it doesn't then it 
should reject mixed DTR ops before calling 
spi_mem_default_supports_op(). Anyway, the current driver doesn't check 
for it either so this change does not make anything worse at the very 
least.

Reviewed-by: Pratyush Yadav <p.yadav@ti.com>


-- 
Regards,
Pratyush Yadav
Texas Instruments Inc.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
