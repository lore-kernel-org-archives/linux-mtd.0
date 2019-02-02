Return-Path: <SRS0=Axir=QJ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D654C282D7
	for <linux-mtd@archiver.kernel.org>; Sat,  2 Feb 2019 07:14:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E7EE420815
	for <linux-mtd@archiver.kernel.org>; Sat,  2 Feb 2019 07:14:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="A1gDDjzR";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="MuzRsxeE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E7EE420815
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mdEtd6zBOzxA6iQ/UklDUwmj2JDkoIVHsKLjQC15Ix8=; b=A1gDDjzRBej3mS
	5GufIbisM1XT3Y/Jn9zI1250txMI0/OpTrqXY1MwGSSQiO5wax3SrBohzzbIOyd79l2M7WV2KnzTT
	XGhd6dCJ7p4kET3Rmd3g4scdFR/5MZCo0DyOmRABF7+M6YOmhW2REmf10TU1TJTNmbYwi0WX65vPk
	4NVoeAmU5EaFh1VuBNADlLI7nyd8G/JQSJ2HOfFXYj/b86rFVlK1QQ5l93VYUqAiiiUWd5pNuWUQf
	2aNlk7h8ExVKmK8gkzzG1Rpzoom1xyJILbjnvy/BMtK5rCQL3Xc9+SO2iiMcc2XojNLyqY5+mjAG5
	R6CxIAmCK6BNM5mlcrag==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gppV5-00019Y-Vj; Sat, 02 Feb 2019 07:14:03 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gppUt-0000yP-Oc; Sat, 02 Feb 2019 07:13:53 +0000
Received: from bbrezillon (91-160-177-164.subs.proxad.net [91.160.177.164])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C22D720863;
 Sat,  2 Feb 2019 07:13:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1549091631;
 bh=d5lF9CVaOgTQMmq5P4+NuVQmBMfctFDudkgRa1bohRU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=MuzRsxeEyBOGiRnh+++cbohi26d/RarfvYnYCqk4gFP89Kqf6AKOkJmFzmblDTV+r
 ANlFAO3m4Px0pf83OdIc9GQcza/mIM3Z1/pPS5urxSq6OhZS5hH1wy3R017qe5JpPb
 DeYLn5ueptsdb8d0bygXYWUY2vNcgO74Ro6FJZ/Y=
Date: Sat, 2 Feb 2019 08:13:38 +0100
From: Boris Brezillon <bbrezillon@kernel.org>
To: <Tudor.Ambarus@microchip.com>
Subject: Re: [PATCH v3 08/13] spi: atmel-quadspi: drop unused and NOP
 transfer macros
Message-ID: <20190202081338.01056dce@bbrezillon>
In-Reply-To: <20190202040653.1217-9-tudor.ambarus@microchip.com>
References: <20190202040653.1217-1-tudor.ambarus@microchip.com>
 <20190202040653.1217-9-tudor.ambarus@microchip.com>
X-Mailer: Claws Mail 3.16.0 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190201_231351_813681_8A4AD8F7 
X-CRM114-Status: GOOD (  13.92  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 alexandre.belloni@bootlin.com, linux-kernel@vger.kernel.org,
 Cyrille.Pitchen@microchip.com, Nicolas.Ferre@microchip.com, robh+dt@kernel.org,
 linux-spi@vger.kernel.org, Ludovic.Desroches@microchip.com, broonie@kernel.org,
 linux-mtd@lists.infradead.org, bugalski.piotr@gmail.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Sat, 2 Feb 2019 04:07:33 +0000
<Tudor.Ambarus@microchip.com> wrote:

> From: Tudor Ambarus <tudor.ambarus@microchip.com>
> 
> Remove NOP when setting read transfer type. Remove useless
> setting of write transfer type when
> op->data.dir == SPI_MEM_DATA_IN && !op->data.nbytes.
> 
> QSPI_IFR_TFRTYP_TRSFR_WRITE is specific just to sama5d2 qspi,
> rename it to QSPI_IFR_SAMA5D2_WRITE_TRSFR.
> 
> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
> ---
> v3: new patch
> 
>  drivers/spi/atmel-quadspi.c | 12 +++---------
>  1 file changed, 3 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/spi/atmel-quadspi.c b/drivers/spi/atmel-quadspi.c
> index d26d4cd0e36b..bfa5f5e92d96 100644
> --- a/drivers/spi/atmel-quadspi.c
> +++ b/drivers/spi/atmel-quadspi.c
> @@ -113,11 +113,7 @@
>  #define QSPI_IFR_OPTL_4BIT              (2 << 8)
>  #define QSPI_IFR_OPTL_8BIT              (3 << 8)
>  #define QSPI_IFR_ADDRL                  BIT(10)
> -#define QSPI_IFR_TFRTYP_MASK            GENMASK(13, 12)
> -#define QSPI_IFR_TFRTYP_TRSFR_READ      (0 << 12)
> -#define QSPI_IFR_TFRTYP_TRSFR_READ_MEM  (1 << 12)
> -#define QSPI_IFR_TFRTYP_TRSFR_WRITE     (2 << 12)
> -#define QSPI_IFR_TFRTYP_TRSFR_WRITE_MEM (3 << 13)
> +#define QSPI_IFR_SAMA5D2_WRITE_TRSFR	BIT(13)

Can you define QSPI_IFR_TFRTYP_MEM (bit 12) even if it's not used yet?

>  #define QSPI_IFR_CRM                    BIT(14)
>  #define QSPI_IFR_NBDUM_MASK             GENMASK(20, 16)
>  #define QSPI_IFR_NBDUM(n)               (((n) << 16) & QSPI_IFR_NBDUM_MASK)
> @@ -273,10 +269,8 @@ static int atmel_qspi_exec_op(struct spi_mem *mem, const struct spi_mem_op *op)
>  	if (op->data.nbytes)
>  		ifr |= QSPI_IFR_DATAEN;
>  
> -	if (op->data.dir == SPI_MEM_DATA_IN && op->data.nbytes)
> -		ifr |= QSPI_IFR_TFRTYP_TRSFR_READ;
> -	else
> -		ifr |= QSPI_IFR_TFRTYP_TRSFR_WRITE;
> +	if (op->data.dir == SPI_MEM_DATA_OUT)
> +		ifr |= QSPI_IFR_SAMA5D2_WRITE_TRSFR;
>  
>  	/* Clear pending interrupts */
>  	(void)readl_relaxed(base + QSPI_SR);


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
