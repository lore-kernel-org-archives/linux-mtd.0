Return-Path: <SRS0=xpyr=QG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FD44C282D7
	for <linux-mtd@archiver.kernel.org>; Wed, 30 Jan 2019 17:20:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D183F20855
	for <linux-mtd@archiver.kernel.org>; Wed, 30 Jan 2019 17:20:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rgcTRa3r";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="Zws77S8+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D183F20855
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0nJ8u65k38LEEngLy1YlJS3NfYiq7kbb1bgxj031yHE=; b=rgcTRa3rxlgQHv
	0a/1kyYAWvCZHgGZlQ7IUPqoFL2v+TjdivGWn9jg450TILDqEpiobbJTJIv5D/TkrS3Zt2Y6M71Dt
	BCo6tIHM8F9fMOySLWBXy/YIqpsgoWScvbduHid9tLIGSB+pg3lmbt4eJ3m+KxjcX0tH/l1NZiFnq
	YvJ9ZeWT2DE8ZaG/IvdMGUwOTtQLeinQNJby0HEjM0zlGY5im6qiIUOesO0R8T56D6Su5Rw6O5ZOV
	EtOsH0M5/GFxSOLITY6pef15XEZwPJS57cVev+47iIkLkiikC4A7NMlZ9eIYUxFIMqmh05RYMFDeo
	8P1jqLvyYgq9KR/rhAMg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gotXG-0004aK-Aw; Wed, 30 Jan 2019 17:20:26 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gotX4-0004Pv-JK; Wed, 30 Jan 2019 17:20:15 +0000
Received: from bbrezillon (91-160-177-164.subs.proxad.net [91.160.177.164])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9352020855;
 Wed, 30 Jan 2019 17:20:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1548868814;
 bh=e1EgPBBSxkVBZIffLs813GMhAV6aodZH7KaCX9WAE4o=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Zws77S8+N9qMQti08li0S/tTA1HnIV0Xep42Ebch25pjgvPzkWvvORe8sc/amS6SS
 8bvLeHilIisDE2e4+xcw5S13WcQo3BRAyE/lpFtKpu2CWLlTeIjLoydBR8p35vHXaF
 3y7mcKeA+sTTD1dK88LGc2aeDZRw5gtfcWq5FG5o=
Date: Wed, 30 Jan 2019 18:20:05 +0100
From: Boris Brezillon <bbrezillon@kernel.org>
To: <Tudor.Ambarus@microchip.com>
Subject: Re: [PATCH 4/9] spi: atmel-quadspi: remove unnecessary cast
Message-ID: <20190130181955.48309a21@bbrezillon>
In-Reply-To: <20190130150818.24902-5-tudor.ambarus@microchip.com>
References: <20190130150818.24902-1-tudor.ambarus@microchip.com>
 <20190130150818.24902-5-tudor.ambarus@microchip.com>
X-Mailer: Claws Mail 3.16.0 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190130_092014_650686_8281C6FA 
X-CRM114-Status: GOOD (  12.61  )
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
Cc: alexandre.belloni@bootlin.com, Nicolas.Ferre@microchip.com,
 linux-kernel@vger.kernel.org, Ludovic.Desroches@microchip.com,
 broonie@kernel.org, linux-mtd@lists.infradead.org, linux-spi@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Wed, 30 Jan 2019 15:08:35 +0000
<Tudor.Ambarus@microchip.com> wrote:

> From: Tudor Ambarus <tudor.ambarus@microchip.com>
> 
> The cast is done implicitly.
> 
> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>

Reviewed-by: Boris Brezillon <bbrezillon@kernel.org>

> ---
>  drivers/spi/atmel-quadspi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/spi/atmel-quadspi.c b/drivers/spi/atmel-quadspi.c
> index e156c345705b..3643f0c851b0 100644
> --- a/drivers/spi/atmel-quadspi.c
> +++ b/drivers/spi/atmel-quadspi.c
> @@ -389,7 +389,7 @@ static int atmel_qspi_init(struct atmel_qspi *aq)
>  
>  static irqreturn_t atmel_qspi_interrupt(int irq, void *dev_id)
>  {
> -	struct atmel_qspi *aq = (struct atmel_qspi *)dev_id;
> +	struct atmel_qspi *aq = dev_id;
>  	u32 status, mask, pending;
>  
>  	status = atmel_qspi_readl(aq, QSPI_SR);


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
