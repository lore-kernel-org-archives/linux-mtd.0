Return-Path: <SRS0=q46N=OY=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DEF1C433F5
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Oct 2021 17:10:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4F874613CF
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Oct 2021 17:10:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4F874613CF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=swodAx3mXTZcJzdEoHIhBc1Of07OMSRTb8ICEfbrNLw=; b=1qG7qYhoaOSsw8
	ZzKhBAUHDJNxIOY1f0Ec4vCdNqiV8H6dp0uUfG0ZFDsl1llpbESlJ6jThV6OzwmwcubNuIGO0oqtb
	tQ0KCuRiaAXWT+RMG7fH8oSZZ1MGBzqWyZuMGs3+Yy/3Y36gEuNRZ7hhkMWZ0+EPXJH2c9MtRs4q5
	3moRM257KXo4En6LW3Py41XkcbTIhAsiYZMQu4BPE4BAwyFWX8W2roKhnrzjLkFVz3JbivJ/+cLiG
	dGm7FCnL50+Yb8AlW91muuK9JSPGWAX5x/r2TppKQ3kmrAXYbOG1GqyN2bdqkaPUWrWXoYs3mG8xW
	CKrB6c8Ww9vEd6z34qyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mXRTQ-007ITB-De; Mon, 04 Oct 2021 17:09:56 +0000
Received: from mail-oi1-f172.google.com ([209.85.167.172])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mXRTN-007IRv-A2
 for linux-mtd@lists.infradead.org; Mon, 04 Oct 2021 17:09:54 +0000
Received: by mail-oi1-f172.google.com with SMTP id s24so22504067oij.8
 for <linux-mtd@lists.infradead.org>; Mon, 04 Oct 2021 10:09:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=1KLq9MkcpxBGVB7sgiyeCQaUXR/d16n3LEbxVLt/cqg=;
 b=WHHHZsmeVWeHzMekX1j2la69P6mqJaSpl6CIBPV73aMKcvnjqsARpBoeQiWxXuyfid
 eLJpzH6FNAWSJPyGp72aM1NFpYprdBpU3C2dvaZXOtBJINppbICbT61puATuK/XwnsG1
 n2Ke0WmKIpLK7YyTfxFSmlI99BsKMgVEIbNJM+lOuN8j4u2+jWSmP8xWtA2rviJXxp92
 gM5T/+1rGK73gamf6RLgI1W1ylZtHdqRyL2R22AIJvAv6fyBKenGNAEK2Y0ksGlvE6nE
 1Dpf1FE+3SA3fReHFBr+RxeOXM/L9X8ZT6Y7Iz/7PqT3+eHZy/ZEZeAixMmhfzMaZ34e
 jikg==
X-Gm-Message-State: AOAM530FFuVbLFrDERypO8g3eh8yqUE1jIJMHVJLujIgfoRglhq4WfKm
 VJDk57br/2te9354BUS3RE4bHt/u+A==
X-Google-Smtp-Source: ABdhPJwpGLcCHuQ/ilTbzTySohMcTJl/JUKbz4U1S+2nZLmVieFfoTMv2OP5e4KmB3Dqpn/bYl08mg==
X-Received: by 2002:a05:6808:57d:: with SMTP id
 j29mr15099829oig.80.1633367392344; 
 Mon, 04 Oct 2021 10:09:52 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id f61sm2998816otf.73.2021.10.04.10.09.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Oct 2021 10:09:50 -0700 (PDT)
Received: (nullmailer pid 1488976 invoked by uid 1000);
 Mon, 04 Oct 2021 17:09:49 -0000
Date: Mon, 4 Oct 2021 12:09:49 -0500
From: Rob Herring <robh@kernel.org>
To: Pratyush Yadav <p.yadav@ti.com>
Cc: Mark Brown <broonie@kernel.org>,
 Tudor Ambarus <tudor.ambarus@microchip.com>, Michael Walle <michael@walle.cc>,
 Apurva Nandan <a-nandan@ti.com>, Nishanth Menon <nm@ti.com>,
 linux-spi@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org
Subject: Re: [PATCH v1] dt-bindings: mtd: spi-nor: use unevaluatedProperties:
 false
Message-ID: <YVs1XZmeIdix1m1V@robh.at.kernel.org>
References: <20210924180705.14021-1-p.yadav@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210924180705.14021-1-p.yadav@ti.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211004_100953_376088_6C26CFFE 
X-CRM114-Status: GOOD (  40.60  )
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

On Fri, Sep 24, 2021 at 11:37:05PM +0530, Pratyush Yadav wrote:
> Many SPI controllers need to add properties to slave devices. This could
> be the delay in clock or data lines, etc. These properties are
> controller specific but need to be defined in the slave node because
> they are per-slave and there can be multiple slaves attached to a
> controller.
> 
> If these properties are not added to the slave binding, then the dtbs
> check emits a warning. But these properties do not make much sense in
> the slave binding because they are controller-specific and they will
> just pollute every slave binding.
> 
> One option is to add a separate schema that collects all such properties
> from all such controllers. Slave bindings can simply refer to this
> binding and they should be rid of the warnings.
> 
> There are some limitations with this approach:
> 
> 1. There is no way to specify required properties. The schema would
> contain properties for all controllers and there would be no way to know
> which controller is being used.
> 
> 2. There would be no way to restrict additional properties. Since this
> schema will be used with an allOf operator, additionalProperties would
> need to be true. In addition, the slave schema will have to set
> unevaluatedProperties: false.

I don't see what is the problem. If there's a $ref, then 
unevaluatedProperties is what should be used.

> 
> A much simpler option would be to make controller schemas specify those
> properties in patternProperties and set unevaluatedProperties to false
> on slave schemas, which is done in the previous approach anyway. This
> approach would have the same limitations as the 2nd limitation in the
> previous approach. But it does not have the 1st limitation since the
> properties of all controllers are not collected in a single schema, but
> instead reside in the same schema as the controller. It also has the
> added benefit of being much simpler.
> 
> The SPI NOR binding is taken as the first one to follow this. Other
> bindings like SPI NAND can follow in later patches.
> 
> Signed-off-by: Pratyush Yadav <p.yadav@ti.com>
> 
> ---
> I sent the first approach mentioned in the commit message some time ago
> [0]. When re-rolling this series I realized that if we are going to use
> unevaluatedProperties: false, then it would be much simpler to just keep
> everything else as-is. This has clear positives with no negatives
> relative to [0], as explained in the commit message.
> 
> [0] https://lore.kernel.org/all/20210609111707.9555-1-p.yadav@ti.com/T/#u
> 
>  Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml b/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml
> index ed590d7c6e37..81be0620b264 100644
> --- a/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml
> +++ b/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml
> @@ -88,7 +88,7 @@ patternProperties:
>    "^otp(-[0-9]+)?$":
>      type: object
> 
> -additionalProperties: false
> +unevaluatedProperties: false

This only works until unevaluatedProperties support is actually 
implemented. Then it's back to the same warnings. In the mean time, we'd 
be allowing any extra random properties to be added for everyone.

Rob

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
