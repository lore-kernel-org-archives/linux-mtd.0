Return-Path: <SRS0=Axir=QJ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F06DC282D7
	for <linux-mtd@archiver.kernel.org>; Sat,  2 Feb 2019 07:07:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F1F4120870
	for <linux-mtd@archiver.kernel.org>; Sat,  2 Feb 2019 07:07:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="LXbExZ2J";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="nlOcOcvr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F1F4120870
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/7EFL5Lx9ytpKmlP/hELM9a7VpzEgMCoqJkJJG/UwAE=; b=LXbExZ2Jem9qQM
	JUHmcKr81VQ2YbMnXJeccr/+qANLko/EUVZgZgTNVRODlLaS8pXaeVi8TKWeSd1vmfmcuNnADrP7g
	0nAwqMip9q1EyERweB04E4KlNLW4vGK0KxvED5+bsDUhqMRWecvufa6ZqucXh5cJBcYq3wPqaPEwY
	AuFblZQjbnI8QLcdpjamEV6ubnngEZoLa5657sUj+i2uI6j5QgzT209VV6Bj3+OPQ9jLNSicNXScs
	pXMTnRZksDR5I2NvGYpSuJbk09QLMl+qGC4jBR08iONFjdcZwURQv0/k7t0DiFL3wnp23OdcPYCSb
	MyYzGXIA3qQSEOOnEwkg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gppOU-0006OC-GU; Sat, 02 Feb 2019 07:07:14 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gppOJ-0006GH-QH; Sat, 02 Feb 2019 07:07:05 +0000
Received: from bbrezillon (91-160-177-164.subs.proxad.net [91.160.177.164])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6B55B20870;
 Sat,  2 Feb 2019 07:06:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1549091223;
 bh=E3FJCRyIlElVvR6dxcgGbiQIi5lKYbeOzntDFZu4bJg=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=nlOcOcvrBqYWCQ3vNMPwvYhANUhKW+CJo5jIRvgL7zmJJckqXp3GQR/81RvP/wYKP
 jFhKV7VXZlzR9XuaGcicB3w3eSX1bJIs13A7jz51cV6SEnyyedDH2OjmYniKONjUO0
 OnDqvFf6hrT07g+UuvanbCCOM6IydxM8cFLxkhQ4=
Date: Sat, 2 Feb 2019 08:06:50 +0100
From: Boris Brezillon <bbrezillon@kernel.org>
To: <Tudor.Ambarus@microchip.com>
Subject: Re: [PATCH v3 01/13] spi: atmel-quadspi: cache MR value to avoid a
 write access
Message-ID: <20190202080650.44becc2d@bbrezillon>
In-Reply-To: <20190202040653.1217-2-tudor.ambarus@microchip.com>
References: <20190202040653.1217-1-tudor.ambarus@microchip.com>
 <20190202040653.1217-2-tudor.ambarus@microchip.com>
X-Mailer: Claws Mail 3.16.0 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190201_230703_876311_9C91E271 
X-CRM114-Status: GOOD (  17.47  )
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

On Sat, 2 Feb 2019 04:07:13 +0000
<Tudor.Ambarus@microchip.com> wrote:

> From: Tudor Ambarus <tudor.ambarus@microchip.com>
> 
> Cache Serial Memory Mode (SMM) value to avoid write access when
> setting the controller in serial memory mode. SMM is set in
> exec_op() and not at probe time, to let room for future regular
> SPI support.
> 
> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
> ---
> v3: update smm value when different. rename mr/smm
> v2: cache MR value instead of moving the write access at probe
> 
>  drivers/spi/atmel-quadspi.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/spi/atmel-quadspi.c b/drivers/spi/atmel-quadspi.c
> index ddc712410812..645284c6ec9a 100644
> --- a/drivers/spi/atmel-quadspi.c
> +++ b/drivers/spi/atmel-quadspi.c
> @@ -155,6 +155,7 @@ struct atmel_qspi {
>  	struct clk		*clk;
>  	struct platform_device	*pdev;
>  	u32			pending;
> +	u32			smm;
>  	struct completion	cmd_completion;
>  };
>  
> @@ -238,7 +239,11 @@ static int atmel_qspi_exec_op(struct spi_mem *mem, const struct spi_mem_op *op)
>  	icr = QSPI_ICR_INST(op->cmd.opcode);
>  	ifr = QSPI_IFR_INSTEN;
>  
> -	qspi_writel(aq, QSPI_MR, QSPI_MR_SMM);
> +	/* Set the QSPI controller in Serial Memory Mode */
> +	if (aq->smm != QSPI_MR_SMM) {

Sorry, I think I misunderstood your previous suggestion, I thought the
reg was called SMM. If the reg is called MR and the value you expect in
there is SMM, then the field should be named ->mr as it caches the
whole reg, not only the SMM bit. So it's actually:

	if (aq->mr != QSPI_MR_SMM) {

> +		qspi_writel(aq, QSPI_MR, QSPI_MR_SMM);
> +		aq->smm = QSPI_MR_SMM;
> +	}
>  
>  	mode = find_mode(op);
>  	if (mode < 0)


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
