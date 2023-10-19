Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BE2BCDB483
	for <linux-mtd@archiver.kernel.org>; Thu, 19 Oct 2023 07:45:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t+nngsytJDgf5aGrznWHJsKz6OqrVMqhsuwuh+h+85k=; b=kaNYu+bdTfkr58NXiWFMHw3MkW
	fKRwjs+nRJ0Ah/b3hCu/+6AboFiOrb4wP6Fy02uSJyavJTZ87x8iuspFNm9zv6XUoeNpqHybWs7no
	AVoFVvSt7zP3JyVPVObe6joWU+XiOvg/HoJzLFJe8JBjrNNjH/tfFMdFrT2CT72+y22dCe9YCSDs2
	/DbJZxJpnKjwRIXoMvKxVKqj0NmqlkKwlXpIbkJhEHgJd9EDkSQHNs7MHd8vD08rZgiodrrR1/F1q
	ttzycf30HKwWXE++X4V5aXAKeNcwbrDlNeN+dsKmzytWeVPk7wfzR3rczbjLnyZWf30cO9WCuUz8i
	6E6jeCTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qtNiB-00GdEQ-1I;
	Thu, 19 Oct 2023 07:44:55 +0000
Received: from 0001.3ffe.de ([159.69.201.130] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qtNi7-00GdCS-14
	for linux-mtd@lists.infradead.org;
	Thu, 19 Oct 2023 07:44:53 +0000
Received: from 3ffe.de (0001.3ffe.de [IPv6:2a01:4f8:c0c:9d57::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id CAEFAA3A;
	Thu, 19 Oct 2023 09:44:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2022082101;
	t=1697701484;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UHhHJ2y+Q+UNfBPleafnf7D6uFO4IuCG7DUy+7588gM=;
	b=wbPuvufBMzu65294UcblHg5bAM0606+pdGi0GET0b+BpVlJEl4pNBRDa0QDCeanql6EVpd
	0wRWaVh2cgZXwVCQ92fBWMNy/T2Cl3TPtW5V8z0SgLyl35ZGLQ8UGxyxOPnvjigrDE4xRc
	Bj9BwtuvhAg3N0hOTgN2AditZXB+y3NDgDTS7A1mqA5I7/45RckfrskC5o0FcSRBoiZNHG
	p2rBMgMxKrt5cUTFuL3YOkUR+uVEvfCKjMf4GojW0psIsBPm1J2cR4jN5KMLMhQYBpWQnd
	DNGXi5VKpWrit+UTMh2sYMJ9ftjzkz0W2lSFpDFJBfFCIoKTFiDhJlDMU7U8tA==
MIME-Version: 1.0
Date: Thu, 19 Oct 2023 09:44:44 +0200
From: Michael Walle <michael@walle.cc>
To: AceLan Kao <acelan.kao@canonical.com>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, Pratyush Yadav
 <pratyush@kernel.org>, Miquel Raynal <miquel.raynal@bootlin.com>, Richard
 Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: spi-nor: Lower the priority of the software reset
 failure message
In-Reply-To: <20231019064547.348446-1-acelan.kao@canonical.com>
References: <20231019064547.348446-1-acelan.kao@canonical.com>
Message-ID: <cf4143937dea52a4a4f40ed602ec74b1@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231019_004451_703534_E9DC99D4 
X-CRM114-Status: GOOD (  16.28  )
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

Hi,

> Not all SPI drivers support soft reset enable and soft reset commands.
> This failure is expected and not critical.

This is not really expected. What driver is this? Let me guess, the 
intel
SPI driver.

Please mention this in the commit message.

> Thus, we avoid reporting it
> to regular users to prevent potential confusion regarding power-off 
> issues.
> 
> Signed-off-by: Chia-Lin Kao (AceLan) <acelan.kao@canonical.com>
> ---
>  drivers/mtd/spi-nor/core.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> index 1b0c6770c14e..7bca8ffcd756 100644
> --- a/drivers/mtd/spi-nor/core.c
> +++ b/drivers/mtd/spi-nor/core.c
> @@ -3252,7 +3252,7 @@ static void spi_nor_soft_reset(struct spi_nor 
> *nor)
> 
>  	ret = spi_mem_exec_op(nor->spimem, &op);
>  	if (ret) {
> -		dev_warn(nor->dev, "Software reset failed: %d\n", ret);
> +		dev_info(nor->dev, "Software reset failed: %d\n", ret);

What is the value of ret here? Ideally it should be -EOPNOTSUPP and then
don't print this message at all. Otherwise leave it at dev_warn(). Also,
please add a comment here.

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
