Return-Path: <SRS0=7c/v=ID=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E5BAC433DB
	for <linux-mtd@archiver.kernel.org>; Fri,  5 Mar 2021 23:38:23 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8C810650A0
	for <linux-mtd@archiver.kernel.org>; Fri,  5 Mar 2021 23:38:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8C810650A0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=c2TkcMOYzgpLrPdMNwBOkoKR32utj1pPVzw2YOZznMU=; b=l+fpMZJT1j53oilfOZSilN9TD
	xd8Lu7DIOJ2tKJ8vsdUYv+Ic8Av8VPjU71AOkjHi+9PlNcKJzcY/XeTjMSvxMu8YahipOU5L4jSlM
	gkng9YeYYFnQOxjPsRVcMBimdwDeaYE2Prm2y2e82y6rGAcrbME37qmvs+2DIj3VPaFX2Y4S6gAOQ
	OzUiZxVnu+uPLa/+OWYNIhYUTDa47u92sCtkgcQqpKRprT5B7kl7VeIx118n9MwOGM2sORlrBBL9h
	MEUhu+DgujShO44wCEm32c27Xvbnk29g1RiYA0rns213xIP7vfKXBh8BcJmd2ubkGwwzWccCMExsJ
	yh94+HRRQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lIK0P-00H94e-3I; Fri, 05 Mar 2021 23:37:13 +0000
Received: from mail-ot1-f45.google.com ([209.85.210.45])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lIK0D-00H92S-LD
 for linux-mtd@lists.infradead.org; Fri, 05 Mar 2021 23:37:07 +0000
Received: by mail-ot1-f45.google.com with SMTP id a17so3479622oto.5
 for <linux-mtd@lists.infradead.org>; Fri, 05 Mar 2021 15:37:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=1tLdHqPjOw0oS3E1Aqx3XDxrDkeAhsjwl8ce7IJGqqI=;
 b=XQBHheQ4fexInWoefmkVlXQ2H3ORpgI1M1L/uhUB9b9zH6YITD8EXtw9vWmBsCm367
 7JDhg42+sv+FqfEmesUgqz+BIMTeQ/9A2BBI2sdAPjh2Pi3GKPzNCm/tnhrq9Tw3qrbV
 /31S5kPUbOjgkDUyh958PuS5JBbzS3Y/n3BiiIHfOG/xt60O+IVnpvu4g4xjPMz3OFvJ
 WARaTKF9O18h5kiY2NnyGnOQq7GiXuUMHpsTyZxyKFraDQeabR+bqimyIcxnYMXsiOSn
 aPMvl/d7dwqK55pHcSMoXTTIHMaT9qXltvTWKN2oNUA6OnZ4OLvga/0ZZvBOa/djxqej
 fmbw==
X-Gm-Message-State: AOAM531H96jJWvxlh9skHrnYYPEBTFClhTJMckfB1FTPyPtZAoIAJlle
 J1oiIqYE6F/biCjRCdVwqw==
X-Google-Smtp-Source: ABdhPJzHIrEx/psMaWb5sExfGryDm/kqhblVrz2IFl77edEGkv1dHe6mbZVPg7UElvfJxzq0E6btvw==
X-Received: by 2002:a9d:63d1:: with SMTP id e17mr10054802otl.183.1614987420688; 
 Fri, 05 Mar 2021 15:37:00 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id l25sm831240oic.49.2021.03.05.15.36.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Mar 2021 15:36:58 -0800 (PST)
Received: (nullmailer pid 849924 invoked by uid 1000);
 Fri, 05 Mar 2021 23:36:57 -0000
Date: Fri, 5 Mar 2021 17:36:57 -0600
From: Rob Herring <robh@kernel.org>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 linux-arm-msm@vger.kernel.org, linux-mtd@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 boris.brezillon@collabora.com
Subject: Re: [PATCH 2/3] dt-bindings: mtd: Add a property to declare secure
 regions in Qcom NANDc
Message-ID: <20210305233657.GA839767@robh.at.kernel.org>
References: <20210222120259.94465-1-manivannan.sadhasivam@linaro.org>
 <20210222120259.94465-3-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210222120259.94465-3-manivannan.sadhasivam@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210305_233702_086725_4618CC20 
X-CRM114-Status: GOOD (  19.63  )
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

On Mon, Feb 22, 2021 at 05:32:58PM +0530, Manivannan Sadhasivam wrote:
> On a typical end product, a vendor may choose to secure some regions in
> the NAND memory which are supposed to stay intact between FW upgrades.
> The access to those regions will be blocked by a secure element like
> Trustzone. So the normal world software like Linux kernel should not
> touch these regions (including reading).
> 
> So let's add a property for declaring such secure regions so that the
> driver can skip touching them.
> 
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> ---
>  Documentation/devicetree/bindings/mtd/qcom,nandc.yaml | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/mtd/qcom,nandc.yaml b/Documentation/devicetree/bindings/mtd/qcom,nandc.yaml
> index 84ad7ff30121..7500e20da9c1 100644
> --- a/Documentation/devicetree/bindings/mtd/qcom,nandc.yaml
> +++ b/Documentation/devicetree/bindings/mtd/qcom,nandc.yaml
> @@ -48,6 +48,13 @@ patternProperties:
>          enum:
>            - 512
>  
> +      qcom,secure-regions:
> +        $ref: /schemas/types.yaml#/definitions/uint32-array

Don't you need 64-bit regions potentially? Though 4GB should be enough 
for anyone.

If more than one addr+size, then you need a matrix.

> +        description:
> +          Regions in the NAND memory which are protected using a secure element
> +          like Trustzone. This property contains the start address and size of
> +          the secure regions present (optional).
> +
>  allOf:
>    - $ref: "nand-controller.yaml#"
>  
> -- 
> 2.25.1
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
