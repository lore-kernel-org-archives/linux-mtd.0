Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DAD4C32771
	for <linux-mtd@archiver.kernel.org>; Tue, 16 Aug 2022 09:11:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aCp3MQG0m94x2/HvwGVtXBh7weJvP+q6M3AXFRJCpYI=; b=P66Lquc+EoOhZL
	+GltC9c7ahlQ6Q6d4YnYnJHnrmNddQsydsOilCDc3k+rIeZffhYRKWBIx97ripbVHdv/F56b3kS8j
	FoNZiE+2YiY0MsmYZjU0cDpYopgDwrrt1+vOMTXlTbJPZmE+aR5J4h/jAbn7BRDvP+nQCCOpam62R
	yXZht3DoUeimNYWxuTniX/DOHS0Q3YyrmwtVUnmw5O9j5SU0x633aBbxTQofQFjqCe1mKV4XS5LOG
	z2F5SbquPC9Y/dpk37iBCLbwbr5LIcx+A0NqrpZsvNwmbABjjvhz2zbkUdhGADY6TiizuYXf9gYkj
	8rx9a/Jj6YwGAxQ07rUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNsai-00HV1J-Qj; Tue, 16 Aug 2022 09:10:28 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNsaH-00HU3n-Fz; Tue, 16 Aug 2022 09:10:13 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bbrezillon)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 9CDC96600363;
	Tue, 16 Aug 2022 10:09:55 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1660640996;
	bh=UwVGjoVej6+DPEt5C/pkEjitJeLt0M/cBydSA/bfdQQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=AosFn7pt+1QLjDkVNSdhDB41d34g7CimXuprljhvI4FPZzI/laLs4D7OYOoDW36HS
	 dOu6VsOLip5jf3+BQYcKxmFeS00kV++m/EStvYtkOpLTaM7BYTaVP5WknUdN6m9VAs
	 65C0t5G+EYsLoqJhAHp38iC5F/L5ypYw4cFpL4NMifsE8ffzL+P+xNE9AU85EI2Fyu
	 th6t3OcJIFVpGOyBfjYDss2KPSrGNjB7gqMERN7M8eqTqd9QIdRuL7VXjVwnkX2XNd
	 chHsM/k9URQXyEceZkksJXFEm4wbSUA5eG7TGAlnSe6/gKFI54MqHzQcrhBkU94HU/
	 IB/mHt905bmsA==
Date: Tue, 16 Aug 2022 11:09:52 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Tudor Ambarus <tudor.ambarus@microchip.com>
Cc: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
 <peda@axentia.se>, <nicolas.ferre@microchip.com>,
 <alexandre.belloni@bootlin.com>, <claudiu.beznea@microchip.com>,
 <bbrezillon@kernel.org>, <linux-mtd@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <stable@vger.kernel.org>
Subject: Re: [PATCH] mtd: rawnand: atmel: Unmap streaming DMA mappings
Message-ID: <20220816110952.31cf212b@collabora.com>
In-Reply-To: <20220728074014.145406-1-tudor.ambarus@microchip.com>
References: <20220728074014.145406-1-tudor.ambarus@microchip.com>
Organization: Collabora
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220816_021001_818313_EED3AE97 
X-CRM114-Status: GOOD (  12.95  )
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

On Thu, 28 Jul 2022 10:40:14 +0300
Tudor Ambarus <tudor.ambarus@microchip.com> wrote:

> Every dma_map_single() call should have its dma_unmap_single() counterpart,
> because the DMA address space is a shared resource and one could render the
> machine unusable by consuming all DMA addresses.
> 
> Cc: stable@vger.kernel.org
> Fixes: f88fc122cc34 ("mtd: nand: Cleanup/rework the atmel_nand driver")
> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>

> ---
>  drivers/mtd/nand/raw/atmel/nand-controller.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/mtd/nand/raw/atmel/nand-controller.c b/drivers/mtd/nand/raw/atmel/nand-controller.c
> index 6ef14442c71a..330d2dafdd2d 100644
> --- a/drivers/mtd/nand/raw/atmel/nand-controller.c
> +++ b/drivers/mtd/nand/raw/atmel/nand-controller.c
> @@ -405,6 +405,7 @@ static int atmel_nand_dma_transfer(struct atmel_nand_controller *nc,
>  
>  	dma_async_issue_pending(nc->dmac);
>  	wait_for_completion(&finished);
> +	dma_unmap_single(nc->dev, buf_dma, len, dir);
>  
>  	return 0;
>  


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
