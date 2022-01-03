Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55DC1C433F5
	for <linux-mtd@archiver.kernel.org>; Mon,  3 Jan 2022 10:06:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tbz1eSuOHKICS+SiuH5yy3msuVH4M6NKrN8fflxNZT0=; b=M/2/ghmK+Bf1Jq
	bToGX+Z0rxYEtw0WFt4EP9TNq2nUPDMdsPzsAUA/ZCESoDPM1lX/Nz8Sz3dqgVVhq6/uXNG6nLNi7
	K70KtI4JfAvMwvAK11zSYjugX28sZvECvKU0IQb5zQjimrKEAgGkXiIQ+vYjUXbTaCUPFE5hk1JQe
	RL0LqtfY31lLuH2K+Jy9ngypH8heKdnQgmDuP6BElu+eXAHSRsPjvcELAH8D+I7hUSbpo2Jvo23vn
	I5R5gfAxeuFvDyfZacGLJqDfWtUIcHLtfqXAMRMl460VxkOKaqqUGN4VCfQ3EHmAVlD9GnEk+E6Sa
	BfqVoYrsngxsFjFxnYUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n4KDa-008jiD-Eh; Mon, 03 Jan 2022 10:05:30 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n4KDX-008jhQ-2b
 for linux-mtd@lists.infradead.org; Mon, 03 Jan 2022 10:05:29 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 574FE1F4202F;
 Mon,  3 Jan 2022 10:05:25 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1641204325;
 bh=hntGeXyWsiKe+xbghtUjPiIlp26k8TkBB3PhDBV5vno=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ZRdBI3CFXyyzoojXOtCsMSQGlX1rntSNsz4C0Kg7mxyUtp7ExCSjSRvt2VO/dsQ/b
 BLs+3PXLwrQj/0ADWrH0nLzmzu7+5L1vrcCBPPtUYbjPPcgPQBOoTcPdHckuDotKe0
 71M5lgaFPDMHVne249GHoQq9b4/RL0UNRynsIxiyx4KwHvIoMREvEEGoCbDWHhsdD3
 AB5jSZgQVSoARx3RkCNKK77HOI/3IKbHH9WgCZbcxruaBwsmGtZ7z0omRcGzAc7vwn
 mr0+w1iwMQ9Pi/Nb9564kJp2qsE2djOmTtSaHm9nMSqJuBK8L/+o64IBaTs4JDM4dP
 WwuGw+rGaTcRg==
Date: Mon, 3 Jan 2022 11:05:21 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Apurva Nandan <a-nandan@ti.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger
 <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Mark Brown
 <broonie@kernel.org>, Patrice Chotard <patrice.chotard@foss.st.com>,
 Christophe Kerello <christophe.kerello@foss.st.com>, Daniel Palmer
 <daniel@0x0f.com>, Alexander Lobakin <alobakin@pm.me>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-spi@vger.kernel.org>, <p.yadav@ti.com>
Subject: Re: [PATCH v3 03/17] mtd: spinand: Add enum spinand_protocol to
 indicate current SPI IO mode
Message-ID: <20220103110521.72532e21@collabora.com>
In-Reply-To: <20220101074250.14443-4-a-nandan@ti.com>
References: <20220101074250.14443-1-a-nandan@ti.com>
 <20220101074250.14443-4-a-nandan@ti.com>
Organization: Collabora
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.30; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220103_020527_281680_0C126098 
X-CRM114-Status: GOOD (  11.57  )
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

On Sat, 1 Jan 2022 13:12:36 +0530
Apurva Nandan <a-nandan@ti.com> wrote:

> diff --git a/include/linux/mtd/spinand.h b/include/linux/mtd/spinand.h
> index 69e06e741717..77927afcea0f 100644
> --- a/include/linux/mtd/spinand.h
> +++ b/include/linux/mtd/spinand.h
> @@ -194,6 +194,18 @@
>  		   SPI_MEM_OP_NO_DUMMY,					\
>  		   SPI_MEM_OP_DATA_OUT_DTR(len, buf, 8))
>  
> +/**
> + * enum spinand_protocol - List of SPI protocols to denote the op protocol and
> + *			   SPI NAND flash IO modes.
> + */
> +enum spinand_protocol {
> +	SPINAND_1S_1S_1S,
> +	SPINAND_2S_2S_2S,
> +	SPINAND_4S_4S_4S,
> +	SPINAND_8S_8S_8S,
> +	SPINAND_8D_8D_8D,

I'd just name those SPINAND_PROTO_<width><S or D> since what really
matters is the command cycle.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
