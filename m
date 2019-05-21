Return-Path: <SRS0=joji=TV=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7A98C04AAF
	for <linux-mtd@archiver.kernel.org>; Tue, 21 May 2019 09:31:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9C3DB21743
	for <linux-mtd@archiver.kernel.org>; Tue, 21 May 2019 09:31:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="K5Gq2mnY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9C3DB21743
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=kontron.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OoFb2lYcwK28WAhooEwdMrJk9ZlWXDE+VEJPmTHI574=; b=K5Gq2mnY6jTVYc
	Z43EFUUiRVICu6HTc/PewCcj4WfAvOMVKrl/vPFO3tW7lLDOmzxijl5Yvq+iHpP98MKmHTv/0T1c3
	YzYneg6PXKgKHie67VPcyWmo+QiGtIS/tosYXfQF86k4czM7HIkqpCA4TQjMA4vPFxEGg7MO0AAfn
	hJYerXZ07Z2WwZq7rHJjZZJwWvXag7meVR4MyeJjFYrBT/Pb7Ej4FZPZdM17IMsDP9byg6qFhIKbK
	IteVwdW519/K4BlXWI/CzkyaWXbC+P80jNRpZD+zGjg3EcuNp914Bl58xa8gvf/F+nFoi+jBVRHwV
	oMiaTAa0NJCubI5SPpkA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hT172-0004y8-Ml; Tue, 21 May 2019 09:31:12 +0000
Received: from skedge03.snt-world.com ([91.208.41.68])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hT16z-0004xA-3Y
 for linux-mtd@lists.infradead.org; Tue, 21 May 2019 09:31:11 +0000
Received: from sntmail14r.snt-is.com (unknown [10.203.32.184])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by skedge03.snt-world.com (Postfix) with ESMTPS id 67FAE712765;
 Tue, 21 May 2019 11:31:05 +0200 (CEST)
Received: from sntmail12r.snt-is.com (10.203.32.182) by sntmail14r.snt-is.com
 (10.203.32.184) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Tue, 21 May
 2019 11:31:04 +0200
Received: from sntmail12r.snt-is.com ([fe80::e551:8750:7bba:3305]) by
 sntmail12r.snt-is.com ([fe80::e551:8750:7bba:3305%3]) with mapi id
 15.01.1713.004; Tue, 21 May 2019 11:31:04 +0200
From: Schrempf Frieder <frieder.schrempf@kontron.de>
To: Kamal Dasu <kdasu.kdev@gmail.com>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: mtd: brcmnand: Make nand-ecc-strength
 and nand-ecc-step-size optional
Thread-Topic: [PATCH v2 1/2] dt-bindings: mtd: brcmnand: Make
 nand-ecc-strength and nand-ecc-step-size optional
Thread-Index: AQHVDz8jb5hF1+WcOEmTRsDzDEmg4aZ1L8wA
Date: Tue, 21 May 2019 09:31:04 +0000
Message-ID: <5986da5d-2a61-b98d-9d44-d972a19ab732@kontron.de>
References: <1558379144-28283-1-git-send-email-kdasu.kdev@gmail.com>
In-Reply-To: <1558379144-28283-1-git-send-email-kdasu.kdev@gmail.com>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.25.9.193]
x-c2processedorg: 51b406b7-48a2-4d03-b652-521f56ac89f3
Content-ID: <B54EE96B077D034D931F5F0990D55015@snt-world.com>
MIME-Version: 1.0
X-SnT-MailScanner-Information: Please contact the ISP for more information
X-SnT-MailScanner-ID: 67FAE712765.AEBDC
X-SnT-MailScanner: Not scanned: please contact your Internet E-Mail Service
 Provider for details
X-SnT-MailScanner-SpamCheck: 
X-SnT-MailScanner-From: frieder.schrempf@kontron.de
X-SnT-MailScanner-To: bcm-kernel-feedback-list@broadcom.com,
 computersforpeace@gmail.com, devicetree@vger.kernel.org,
 dwmw2@infradead.org, kdasu.kdev@gmail.com,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 marek.vasut@gmail.com, mark.rutland@arm.com,
 miquel.raynal@bootlin.com, richard@nod.at, robh+dt@kernel.org,
 vigneshr@ti.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190521_023109_476647_6AD2C39D 
X-CRM114-Status: GOOD (  14.96  )
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Vignesh Raghavendra <vigneshr@ti.com>, Richard Weinberger <richard@nod.at>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Marek Vasut <marek.vasut@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 "bcm-kernel-feedback-list@broadcom.com"
 <bcm-kernel-feedback-list@broadcom.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Kamal,

On 20.05.19 21:05, Kamal Dasu wrote:
> nand-ecc-strength and nand-ecc-step-size can be made optional as
> brcmnand driver can support using raw NAND layer detected values.
> 
> Signed-off-by: Kamal Dasu <kdasu.kdev@gmail.com>
> ---
>   Documentation/devicetree/bindings/mtd/brcm,brcmnand.txt | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/mtd/brcm,brcmnand.txt b/Documentation/devicetree/bindings/mtd/brcm,brcmnand.txt
> index bcda1df..29feaba 100644
> --- a/Documentation/devicetree/bindings/mtd/brcm,brcmnand.txt
> +++ b/Documentation/devicetree/bindings/mtd/brcm,brcmnand.txt
> @@ -101,10 +101,10 @@ Required properties:
>                                 number (e.g., 0, 1, 2, etc.)
>   - #address-cells            : see partition.txt
>   - #size-cells               : see partition.txt
> -- nand-ecc-strength         : see nand.txt
> -- nand-ecc-step-size        : must be 512 or 1024. See nand.txt
>   
>   Optional properties:
> +- nand-ecc-strength         : see nand.txt
> +- nand-ecc-step-size        : must be 512 or 1024. See nand.txt
>   - nand-on-flash-bbt         : boolean, to enable the on-flash BBT for this
>                                 chip-select. See nand.txt
>   - brcm,nand-oob-sector-size : integer, to denote the spare area sector size

I think you also need to change all references to nand.txt. This file 
was recently moved to nand-controller.yaml.

Regards,
Frieder
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
