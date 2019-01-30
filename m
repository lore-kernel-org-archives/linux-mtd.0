Return-Path: <SRS0=xpyr=QG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF299C282D7
	for <linux-mtd@archiver.kernel.org>; Wed, 30 Jan 2019 17:24:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8EA5B20869
	for <linux-mtd@archiver.kernel.org>; Wed, 30 Jan 2019 17:24:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="W+06GLDJ";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="ANd4YPqq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8EA5B20869
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1rqOyAIhFyJ/9SP+UL1XEY6S7wOvMVOlOsUxggEduo8=; b=W+06GLDJahPCTr
	CXCQScP1czr7fyts2DMB81V4ahFQCJmeawbleTlB2SUBTtbP+VfY25VImV4Moi5TyMR3C0Lce/q/P
	VuXH21tzmPuBba2nLU1Kc7YL6hnmLMykD81unX7AuqKmn8uPzpWOFyQnbu9CA1So2tirZD4v4DxZL
	++klJ7G/fse1eK+e/yMu2DS+cRgrAlt4xKBWsT56L2vUEuWvFpHb81B1CjZImJofg1oHZABFDdnv8
	Ox+JfglQSoKuZGZZBpi5DonEa8WCvBkd4y94+ENhHeV8oj1UCNobQ8fFc1i2juGtlTiQcQ1GYitOK
	sb2M1VqCSFEry0zIBWYg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gotb9-0006Nk-8b; Wed, 30 Jan 2019 17:24:27 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gotaq-000671-Up; Wed, 30 Jan 2019 17:24:10 +0000
Received: from bbrezillon (91-160-177-164.subs.proxad.net [91.160.177.164])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B92DB2082F;
 Wed, 30 Jan 2019 17:24:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1548869048;
 bh=+qexuxyzZUXCvUAFV0o1R9tjZx4Et7tW4L3+Zv2mgis=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ANd4YPqqC6IyP3tlK8Ra9P/rIpieQeuauCECrQA21M/0YqDThQKdIamrmhEzlEx97
 vNA7FNVXfuS3Ze1hoT67VHaPhjHM8PIdNtzmhgMS/yr362T8iZoXsumOey1uFuvz9s
 DkAf851PTC84gyG/0KsJTylhltxLgjbWd61h4RTs=
Date: Wed, 30 Jan 2019 18:23:58 +0100
From: Boris Brezillon <bbrezillon@kernel.org>
To: <Tudor.Ambarus@microchip.com>
Subject: Re: [PATCH 6/9] spi: atmel-quadspi: switch to SPDX license identifiers
Message-ID: <20190130182344.07e1d635@bbrezillon>
In-Reply-To: <20190130150818.24902-7-tudor.ambarus@microchip.com>
References: <20190130150818.24902-1-tudor.ambarus@microchip.com>
 <20190130150818.24902-7-tudor.ambarus@microchip.com>
X-Mailer: Claws Mail 3.16.0 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190130_092409_003614_97FF7132 
X-CRM114-Status: GOOD (  16.11  )
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

On Wed, 30 Jan 2019 15:08:40 +0000
<Tudor.Ambarus@microchip.com> wrote:

> From: Tudor Ambarus <tudor.ambarus@microchip.com>
> 
> Adopt the SPDX license identifiers to ease license compliance
> management.
> 
> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>

Reviewed-by: Boris Brezillon <bbrezillon@kernel.org>

> ---
>  drivers/spi/atmel-quadspi.c | 13 +------------
>  1 file changed, 1 insertion(+), 12 deletions(-)
> 
> diff --git a/drivers/spi/atmel-quadspi.c b/drivers/spi/atmel-quadspi.c
> index e6de6e3d1345..1d21db7851e9 100644
> --- a/drivers/spi/atmel-quadspi.c
> +++ b/drivers/spi/atmel-quadspi.c
> @@ -1,3 +1,4 @@
> +// SPDX-License-Identifier: GPL-2.0
>  /*
>   * Driver for Atmel QSPI Controller
>   *
> @@ -7,18 +8,6 @@
>   * Author: Cyrille Pitchen <cyrille.pitchen@atmel.com>
>   * Author: Piotr Bugalski <bugalski.piotr@gmail.com>
>   *
> - * This program is free software; you can redistribute it and/or modify
> - * it under the terms of the GNU General Public License version 2 as
> - * published by the Free Software Foundation.
> - *
> - * This program is distributed in the hope that it will be useful, but WITHOUT
> - * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
> - * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
> - * more details.
> - *
> - * You should have received a copy of the GNU General Public License along with
> - * this program.  If not, see <http://www.gnu.org/licenses/>.
> - *
>   * This driver is based on drivers/mtd/spi-nor/fsl-quadspi.c from Freescale.
>   */
>  


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
