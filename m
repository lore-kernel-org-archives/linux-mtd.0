Return-Path: <SRS0=HPMf=PA=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D27B4C433EF
	for <linux-mtd@archiver.kernel.org>; Tue, 12 Oct 2021 07:49:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6F98660D43
	for <linux-mtd@archiver.kernel.org>; Tue, 12 Oct 2021 07:49:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6F98660D43
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=walle.cc
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AEpl4da5OEBXq6ZSutnfZJmP2HMEOtzNLqCAS1Uu3ks=; b=icpAYOll9h0lJqSpR28WKLPmQ5
	s7aVdohtD8GTpKjbxEu4jc2Xf6G8ntOGddXKv5pwhMBSrCaHl0eSRI+dSU0zUUAapAnnnr2rcO29l
	VcU4QHt77vLrzs8bYRmhtrtydXNmAgOxt9Y720lVS81P9OLriTfOBFxK+f7KOitLw1HRDkgCl9Ulg
	gGCUh5OW2Fd+b00JSHUeI/Nok53barCt9SNtyizF+UtZrziYba8UFfvbThzKcb51v0/hMLjN27hph
	nCGl1LxedBw78UCuHiP/DMr5VlrbjEU41hAMEVYe5pa5ePdEV0n8SEYLUyvLYalfD1cRDSqqDz+uU
	+MppJFqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1maCWu-00BqsK-91; Tue, 12 Oct 2021 07:48:56 +0000
Received: from ssl.serverraum.org ([2a01:4f8:151:8464::1:2])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1maCWq-00Bqpr-Ox
 for linux-mtd@lists.infradead.org; Tue, 12 Oct 2021 07:48:55 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id DD8A822205;
 Tue, 12 Oct 2021 09:48:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1634024927;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XTY/Z+zotHcX5KpcuZaorS0sZpvLJgkD21qg7w9gSRQ=;
 b=LWsI1mI6pSamxpDS/0+dFr2odTpKKzNiH6/1yG4SErONEZ2/U+oBsSryCX6kdka0owzZMP
 DhXdqjh+2CuV/P8auid/ozf8cdDxmpTGrRZc1+gBbUPCEgCMQeKqfe6uxsO40QV3wn5VNG
 E5LGJih/KiyGiPJztKa8y0OH1XN3seM=
MIME-Version: 1.0
Date: Tue, 12 Oct 2021 09:48:46 +0200
From: Michael Walle <michael@walle.cc>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger
 <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Rob Herring
 <robh+dt@kernel.org>, Pratyush Yadav <p.yadav@ti.com>, Tudor Ambarus
 <tudor.ambarus@microchip.com>, linux-mtd@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: mtd: spi-nor: Add
 output-driver-strength property
In-Reply-To: <20211012061704.284214-1-alexander.stein@ew.tq-group.com>
References: <20211012061704.284214-1-alexander.stein@ew.tq-group.com>
User-Agent: Roundcube Webmail/1.4.11
Message-ID: <a347541ba3f8c76912d4afdb6dc64d4d@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211012_004853_245491_436C3497 
X-CRM114-Status: GOOD (  20.29  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Am 2021-10-12 08:17, schrieb Alexander Stein:
> This property is for optimizing output voltage impedance and is
> specific to each board. It overwrites the default set by the flash
> device. Various flash devices support different impedances.
> 
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> ---
> Changes in v2:
> * Updated the property description and the commit message accordingly
> 
>  Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml
> b/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml
> index ed590d7c6e37..4c3c506a8853 100644
> --- a/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml
> +++ b/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml
> @@ -72,6 +72,14 @@ properties:
>        be used on such systems, to denote the absence of a reliable 
> reset
>        mechanism.
> 
> +  output-driver-strength:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      Output driver strength in ohms which optimizes the impedance at 
> Vcc/2
> +      output voltage. This property overwrites the default set by the 
> flash
> +      device. This is board specific and should be determined by the
> +      manufacturer. Various flash devices support different 
> impedances.

Mh, this seems to be very tailored to this flash chip. Eg. the "Vcc/2", 
is
this something specific to this flash or is this some kind of common 
usage?
For example, Winbond flashes specifies the output driver strength in 
percent.
Settings are 25%, 50%, 75%, 100% there.

I'd have to ask a hardware guy, if one could convert between these two
representations of the driver strength.

Rob, do you know how is this case ususally handled? Can there be 
different
properties, like:

output-driver-strength-ohms
output-driver-strength-percent

or similar.

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
