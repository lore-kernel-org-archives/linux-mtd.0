Return-Path: <SRS0=O8Pa=FO=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD871C433FE
	for <linux-mtd@archiver.kernel.org>; Thu, 10 Dec 2020 04:10:37 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5FA3D23142
	for <linux-mtd@archiver.kernel.org>; Thu, 10 Dec 2020 04:10:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5FA3D23142
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=CNuHGRewhrgcpRS4V/HDcFtbjnM11bsXU36Q781qVOE=; b=KjfVXa+0b9uzfBZbf8HxdwYiR
	Rd3qEU8r+nOC4KiYeDTxYxkPmgrI7cErCIYEheR3NPTyWsbwkVXF6IAfVhFZIZDMgGWN0J99Eathv
	wkB/K5viylMjX45M3k2DJTu1ca9u+eEB9AexRJ6GeM7VJZmLOrPd2nhp/jC9NgW/tvqavqBib3QDj
	nzqjcIN8LAOmZd+SgsGhww0XK+Yjx35Ub1qN7/ArBCcPcFITkTjR8ef+qOdKpTYG0tDy2vv0PB827
	rakXuQ1Zu5EPMToQOM7fenR+8IhlZCluJJNmEmcu/zkL8IUZFey4OpoOGe0wGXhOAFeHbOiRpVOsV
	IB9WhHY/g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1knDHB-0000Tf-Bl; Thu, 10 Dec 2020 04:09:57 +0000
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1knDH7-0000T0-ES
 for linux-mtd@lists.infradead.org; Thu, 10 Dec 2020 04:09:55 +0000
Received: by mail-pf1-x442.google.com with SMTP id s21so2787824pfu.13
 for <linux-mtd@lists.infradead.org>; Wed, 09 Dec 2020 20:09:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=xcTIK9EuU/nUrywQ42KgiTpojaNUUcCg7lCxBZYe+ro=;
 b=fnU7LyieLQoXRkcIpEG2TC3KGf26P25XUm6Aa6vvnyslUXabLXMqgRcSSk0q+a2ihy
 +Pzl5zOd0BFQiyuVETdHmIMeGm/KkS1MnMfWFVtHcse2QmqwFWUzMWzTUKj5D5x7ENBo
 GrN1HC56GzpnHhGR/+rRgD2jz/0h+izZOjbrfUV87HG130n2pspoymgRfrvWTKjj7Hrx
 xzCZCMUGrCDnGGF/kVXtirv9w3I2QAHMZLTaOlVABbsMKRaj4wkgzhVQCvFoj76/1oN3
 uPnbvD2PN+w42/aVF2V1qL+kvSYOu3ullENf5LsTKM5WAKwKjF1Axdgd7iHzUaAU79m5
 Z9jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=xcTIK9EuU/nUrywQ42KgiTpojaNUUcCg7lCxBZYe+ro=;
 b=dzj0t9CGy7eIH5mEksgRWQRuSxKrccLTesUDCGHhupBHPbWTbXNZy52WCEz3G5fy2w
 4zCUvZBc6IKOT65b0gC88gk/xsr4Tz+Igfcn0TOorqReAuIoUqcEwnaBwalNh/4uWEdB
 YJz9IqB63ten1SJd9HiOlsgUCUBOPad+Da9H1lqaM6LRk6+YJ08ocpu52jzBZbD8GOif
 Qd+i2WJwwuk7/aVGMkqHe7s7kBxlxucl1TJ9wOfuJakscv823bKIMjvjtM9D7TOmjJrB
 QaKtGTJgrtib/3OPniQ+kYrbwkbv6GzwT80XQ6XQ/DLTQO8qHwY1Rf6ofgiiegEVqxM2
 yKCg==
X-Gm-Message-State: AOAM531WiVmqA8jVRZ0oCP5uMF7Q6GuJEvpm+/R5EiQhQaSwVnCZuNv6
 C5ZzBMlV210pwTaeen30dwb7
X-Google-Smtp-Source: ABdhPJx79zoeXoS4V9GMiwip0g7YFZBRf2fkNcpngbFSVvFH5NMQ3Dqxbn0fdY79tWGZS1R4YEeA9Q==
X-Received: by 2002:a17:90a:d790:: with SMTP id
 z16mr5493949pju.88.1607573391179; 
 Wed, 09 Dec 2020 20:09:51 -0800 (PST)
Received: from thinkpad ([103.59.133.81])
 by smtp.gmail.com with ESMTPSA id f29sm4587205pfk.32.2020.12.09.20.09.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Dec 2020 20:09:50 -0800 (PST)
Date: Thu, 10 Dec 2020 09:39:42 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 robh+dt@kernel.org
Subject: Re: [PATCH v3 0/4] Add support for Qcom SMEM based NAND parser
Message-ID: <20201210040942.GD6466@thinkpad>
References: <20201119071308.9292-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201119071308.9292-1-manivannan.sadhasivam@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201209_230953_562624_676D8CC4 
X-CRM114-Status: GOOD (  17.13  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 bjorn.andersson@linaro.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi,

On Thu, Nov 19, 2020 at 12:43:04PM +0530, Manivannan Sadhasivam wrote:
> Hello,
> 
> This series adds support for parsing the partitions defined in Shared
> Memory (SMEM) of the Qualcomm platforms supporting NAND interface.
> Current parser only supports V3 and V4 of the partition tables.
> 
> This series has been tested on SDX55 MTP board which has an onboard NAND
> device.
> 

Any update on this series?

Thanks,
Mani

> Thanks,
> Mani
> 
> Changes in v3:
> 
> * Handled le32 parameters in parser, collected review from Linus W.
> 
> Changes in v2:
> 
> * Added additionalProperties: false and removed unit address in binding
> 
> Manivannan Sadhasivam (4):
>   dt-bindings: mtd: partitions: Add binding for Qcom SMEM parser
>   mtd: parsers: Add Qcom SMEM parser
>   mtd: rawnand: qcom: Add support for Qcom SMEM parser
>   mtd: parsers: afs: Fix freeing the part name memory in failure
> 
>  .../mtd/partitions/qcom,smem-part.yaml        |  33 ++++
>  drivers/mtd/nand/raw/qcom_nandc.c             |   4 +-
>  drivers/mtd/parsers/Kconfig                   |   8 +
>  drivers/mtd/parsers/Makefile                  |   1 +
>  drivers/mtd/parsers/afs.c                     |   4 +-
>  drivers/mtd/parsers/qcomsmempart.c            | 170 ++++++++++++++++++
>  6 files changed, 216 insertions(+), 4 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/mtd/partitions/qcom,smem-part.yaml
>  create mode 100644 drivers/mtd/parsers/qcomsmempart.c
> 
> -- 
> 2.17.1
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
