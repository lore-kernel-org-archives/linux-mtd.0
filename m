Return-Path: <SRS0=xpyr=QG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 400B5C282D7
	for <linux-mtd@archiver.kernel.org>; Wed, 30 Jan 2019 17:21:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0565620855
	for <linux-mtd@archiver.kernel.org>; Wed, 30 Jan 2019 17:21:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="uveBasqE";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="PMTX5C9Q"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0565620855
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kwRz1nyeYzDQchBuq4De1EK025T0qXqFTsVQOv/9+Fw=; b=uveBasqEpCqE4h
	BZ5gpNK5pJ22QCkbwtU1TvGp8xQ7Tgo8iE6KNEEqijOX42Wq+42EEOtxu2cCx5DQwgqFxVgcpNSZM
	CbVTL8lCWTIIlVTUIQo/fewdNr0y075vTCOQijb4jOgYCeq5Bi4YhhYVV8OcINgjKe3s6OOrPRAxw
	tVf2YP40jRETrZuaSCtnfj9Y0K8FicumkG7vDJp+pA0GGFH0SIqiG8ryohJjQqv65sm6ixbg3WfDF
	xXE5jv4bMekIgS258THZf3GwhP2UFGg7VNMU0O4qvWxGkuqwvJfegUiRpT2M++n9XXR7c/Srb1zhB
	2vApYhfazPcPLbB0qZGg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gotYB-00055a-JQ; Wed, 30 Jan 2019 17:21:23 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gotXz-0004ug-0L; Wed, 30 Jan 2019 17:21:12 +0000
Received: from bbrezillon (91-160-177-164.subs.proxad.net [91.160.177.164])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0761F20855;
 Wed, 30 Jan 2019 17:21:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1548868870;
 bh=RQtcdk/R8L4tDjBvAw5e5DwzsQUK3bOrQIKxSFHlHu8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=PMTX5C9QwHmQCdUbNV1tS5hkrkyl2TLbnUCvHPaqWu1H8n3ljG4z399fsxhxTKEee
 rXc+shwkMegZqMajh6yneZf6LR48ne6E0Dy8MgblH1OtaYWb7A0+EGpGnJ+sSSrhel
 b28LO+l/5kAj77HWehuXmCGELXTgwyT8oDWx1rAc=
Date: Wed, 30 Jan 2019 18:21:00 +0100
From: Boris Brezillon <bbrezillon@kernel.org>
To: <Tudor.Ambarus@microchip.com>
Subject: Re: [PATCH 5/9] spi: atmel-quadspi: return appropriate error code
Message-ID: <20190130182100.3429fa36@bbrezillon>
In-Reply-To: <20190130150818.24902-6-tudor.ambarus@microchip.com>
References: <20190130150818.24902-1-tudor.ambarus@microchip.com>
 <20190130150818.24902-6-tudor.ambarus@microchip.com>
X-Mailer: Claws Mail 3.16.0 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190130_092111_070771_EE43D52F 
X-CRM114-Status: GOOD (  13.55  )
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

On Wed, 30 Jan 2019 15:08:38 +0000
<Tudor.Ambarus@microchip.com> wrote:

> From: Tudor Ambarus <tudor.ambarus@microchip.com>
> 
> Return -ENOTSUPP when atmel_qspi_find_mode() fails. Propagate
> the error in atmel_qspi_exec_op().
> 
> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>

Reviewed-by: Boris Brezillon <bbrezillon@kernel.org>

> ---
>  drivers/spi/atmel-quadspi.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/spi/atmel-quadspi.c b/drivers/spi/atmel-quadspi.c
> index 3643f0c851b0..e6de6e3d1345 100644
> --- a/drivers/spi/atmel-quadspi.c
> +++ b/drivers/spi/atmel-quadspi.c
> @@ -208,7 +208,7 @@ static int atmel_qspi_find_mode(const struct spi_mem_op *op)
>  		if (atmel_qspi_is_compatible(op, &sama5d2_qspi_modes[i]))
>  			return i;
>  
> -	return -1;
> +	return -ENOTSUPP;
>  }
>  
>  static bool atmel_qspi_supports_op(struct spi_mem *mem,
> @@ -239,7 +239,7 @@ static int atmel_qspi_exec_op(struct spi_mem *mem, const struct spi_mem_op *op)
>  
>  	mode = atmel_qspi_find_mode(op);
>  	if (mode < 0)
> -		return -ENOTSUPP;
> +		return mode;
>  
>  	ifr |= sama5d2_qspi_modes[mode].config;
>  


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
