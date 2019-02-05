Return-Path: <SRS0=GMtL=QM=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1661C282CB
	for <linux-mtd@archiver.kernel.org>; Tue,  5 Feb 2019 16:27:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 721C32175B
	for <linux-mtd@archiver.kernel.org>; Tue,  5 Feb 2019 16:27:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="gnMHCH2D"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 721C32175B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BYqdDoEogUmu5oRfF52qc19D1/bDCiej/X8EQJ0CC/4=; b=gnMHCH2DHm3sQ7
	FSfqY/PI1rsuNKI2HD+vSRKjFpiiTfQ/C/6Th+Nh08svW6gCIPr3b4zpRd7EdMyN2l+vsJvzqLgms
	qhcP+uYfkkQs3isQnYe++FJlKiZmiPYc+8HrC5CxGrOHJSy/+a5DwzhCoue/MTmYnB4Sf/wduQQRs
	3gRg5yoO9xgpui5ytEMRzczYVhcumtx7ciINP7bcjHWjAs+CjtDXdXMfWbpjCIur6jJgZgpgtOP/0
	JMizhNqAQSgEgjab0BfyE+wkW4PDqRewsWDE2G4A5ntgSzUL1H/njU4yWND5go2xlQD7kO3gZg/6M
	+kv2b2ZlkkJxFzhwWxTg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gr3Yl-0003Qq-Ud; Tue, 05 Feb 2019 16:26:55 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gr3Yb-0003Ig-5B; Tue, 05 Feb 2019 16:26:46 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:b93f:9fae:b276:a89a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 766D227FFA1;
 Tue,  5 Feb 2019 16:26:42 +0000 (GMT)
Date: Tue, 5 Feb 2019 17:26:38 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: <Tudor.Ambarus@microchip.com>
Subject: Re: [PATCH v5 13/13] spi: atmel-quadspi: add support for sam9x60
 qspi controller
Message-ID: <20190205172638.11a69968@collabora.com>
In-Reply-To: <20190205154257.29529-14-tudor.ambarus@microchip.com>
References: <20190205154257.29529-1-tudor.ambarus@microchip.com>
 <20190205154257.29529-14-tudor.ambarus@microchip.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190205_082645_321590_D4F66B03 
X-CRM114-Status: UNSURE (   9.90  )
X-CRM114-Notice: Please train this message.
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

On Tue, 5 Feb 2019 15:44:04 +0000
<Tudor.Ambarus@microchip.com> wrote:

> @@ -450,28 +499,49 @@ static int atmel_qspi_probe(struct
> platform_device *pdev) goto exit;
>  	}
>  
> +	aq->caps = of_device_get_match_data(&pdev->dev);
> +	if (aq->caps && aq->caps->has_qspick) {

Can we add a caps instance to the sama5d2 entry instead of allowing
caps to be NULL?

The rest looks good to me, feel free to add

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>

on your next version.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
