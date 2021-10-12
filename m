Return-Path: <SRS0=HPMf=PA=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 780BBC433F5
	for <linux-mtd@archiver.kernel.org>; Tue, 12 Oct 2021 12:53:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 460FA604DB
	for <linux-mtd@archiver.kernel.org>; Tue, 12 Oct 2021 12:53:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 460FA604DB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PPqjfz5hecjH78ylv5j+8uf0buBbNyMJiB0h/u/uaKg=; b=AhTNUK+pK8FORx
	MulqAErWQfqaDZ+it5N4uxvF3yUL85WnG9L7YfUpQ0metB4NlJiFUiEgGQEtBm1Wezd4qSg3AlIsR
	48NOwWLH4M0t5Z3E+c5zLjbVuyiMP20uDkYSGqYoptZIzYnbDTmJoxVLdRh6vkV2BQXErb3rRUV7c
	9eltZDxrL1u4bCoTeubhnH+qO7xXzMoYxKVYI2mZ6y/XnvYUpfQJcicD6G2in5of64JMC/Tqj20fm
	5+gqn95+sNyhImIYXUk8lbbzwGjj2E6VtjxvuOhfarZsxLY2OnuLV5B95PXgGvLJ7lrQzv8QbPqPv
	QjCt1k/oAgDnKA+EmkQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1maHGZ-00Cndt-LX; Tue, 12 Oct 2021 12:52:23 +0000
Received: from mail-oi1-f178.google.com ([209.85.167.178])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1maHGW-00CncO-GH
 for linux-mtd@lists.infradead.org; Tue, 12 Oct 2021 12:52:22 +0000
Received: by mail-oi1-f178.google.com with SMTP id q129so8202546oib.0
 for <linux-mtd@lists.infradead.org>; Tue, 12 Oct 2021 05:52:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=GH/rUNldGDrQWZbHGHNnv3z7yGjMSKDvdbkj2ZpIpc4=;
 b=cizMvJily0q+fBVs0Wzw7OQysxQDJGQGtVCLrmxlCib+WVnJNv/+4guH5D42Jkdg8C
 l/7liqO5MzALurn/+QncOE3Xvmz/izvTEwh1aRFycOv8YdkGU/bDNPuGpOq14qVILZzb
 Ij6oo67kCmmfpbGiWuW/DTcx8ADBX4aDZ49lQ6G8RYn9u/cRG7HQsXetQ6Y2gIP+F8F/
 252DGt4ceIKhrCmrYgrcpYV46HoXStbhfZoabhWB3bWfUJVP70qXvtEnAErCKdXFNMyJ
 Ovaqe+RV7VX3eJd1/oU8YyrR0iwGcov4a5hhAi7YhkjTWfHR5nYTjqCO3Vk5hBlh7nwK
 G3SA==
X-Gm-Message-State: AOAM530ko13MFgE0Z/kMPD60DKItr+rZvWgiOYOtM51NlmZd0Si9FAd8
 0yaVpdAEGNPzblsZ2X1hJT2vtC6WiQ==
X-Google-Smtp-Source: ABdhPJz8As3l+5i35LUl/3j8/RYdO3uMxHOhk3l3WiuYe0C4KBDwdJpcQI1vNwr1VfPoZj4l4G6kSA==
X-Received: by 2002:aca:6747:: with SMTP id b7mr3524949oiy.46.1634043139688;
 Tue, 12 Oct 2021 05:52:19 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id l45sm2090151ooi.30.2021.10.12.05.52.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Oct 2021 05:52:18 -0700 (PDT)
Received: (nullmailer pid 2551195 invoked by uid 1000);
 Tue, 12 Oct 2021 12:52:17 -0000
Date: Tue, 12 Oct 2021 07:52:17 -0500
From: Rob Herring <robh@kernel.org>
To: Alexander Stein <Alexander.Stein@tq-systems.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Pratyush Yadav <p.yadav@ti.com>, Michael Walle <michael@walle.cc>,
 Tudor Ambarus <tudor.ambarus@microchip.com>,
 Alexander Stein <alexander.stein@ew.tq-group.com>,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: mtd: spi-nor: Add
 output-driver-strength property
Message-ID: <YWWFAXeekLS80bOR@robh.at.kernel.org>
References: <20211004111529.211089-1-Alexander.Stein@tq-systems.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211004111529.211089-1-Alexander.Stein@tq-systems.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211012_055220_855591_8913014D 
X-CRM114-Status: GOOD (  19.48  )
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

On Mon, Oct 04, 2021 at 01:15:28PM +0200, Alexander Stein wrote:
> From: Alexander Stein <alexander.stein@ew.tq-group.com>
> 
> This property is for optimizing output voltage impedance and is
> specific to each board.
> 
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> ---
> I checked Micron and Macronix datasheets. Both have similar but not
> identical supported values. Also the register locations are different.
> For those reasons I decided to specify the Ohms value directly and let
> the device specfic driver figure out if it is supported where to write
> it to.
> BTW: Are the Ohm values and the corresponding register bits standardized
> somewhere?
> 
>  Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml b/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml
> index ed590d7c6e37..7d7f20a741b5 100644
> --- a/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml
> +++ b/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml
> @@ -72,6 +72,12 @@ properties:
>        be used on such systems, to denote the absence of a reliable reset
>        mechanism.
>  
> +  output-driver-strength:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      Output driver strength in Ohms which optimizes the impedance at Vcc/2
> +      output voltage.

Use a standard unit suffix.

Though, specifying 'drive strength' in ohms rather than amps is a bit 
strange.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
