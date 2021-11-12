Return-Path: <SRS0=6Wn1=P7=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44123C433EF
	for <linux-mtd@archiver.kernel.org>; Fri, 12 Nov 2021 16:54:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0331461073
	for <linux-mtd@archiver.kernel.org>; Fri, 12 Nov 2021 16:54:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0331461073
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ttZHzrhzKqPezNp4KPdrBd9D2ldhLagU8Xcbf5E6MNY=; b=Zsn4kgPCzExXZ+
	X+/ytJ5mQYbbQ+Vp0kjx34Fz3YjsoyM7On4dZflGmSweewVeb/2yUjUbqMl3rIDMEi+b+vSe1PWw7
	qGCN7N+//XnBDXZ/pqOHH3BJZhUimN3/eKRGhAkAXcTliX8zl9m3r3Ktew8uA1p3uiqFd3Ghv5Uhe
	A4b3IXD3+ljtz9IcDiZTJeoWXcnC06pfEivwYTcSyZAAyMOtqlNhQL2lffh7bFBq3WV9JRxbIOxit
	byaQxy9On1BHB13mBOICfJFF5piF5nG8VP6AuvHGZ+y5cz3nm1gxjwagsZYNBu6BdfjxPue5Zq8re
	rkS8j1Lr+AHS51+jPo6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mlZod-00BGoK-IB; Fri, 12 Nov 2021 16:54:15 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mlZoZ-00BGn8-Fn
 for linux-mtd@lists.infradead.org; Fri, 12 Nov 2021 16:54:13 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 350DC610A8
 for <linux-mtd@lists.infradead.org>; Fri, 12 Nov 2021 16:54:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1636736051;
 bh=YJ3b6qghz4CJTSI3Bn/PLFDREBcPXJdKnMO8g47aw8w=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=m1UfXESd5EwNlEltVKh5JPDTxiEyeR9zujtshfMP9BC9++MsZU4cDIGwZijx63iHc
 ZGY/wMYD2P2tjlDJUosP4fwqD7Hg0qddwzXCd/VC48els+GsekqRXcn5Sr05hGnur+
 k1P56KYwKXO3HhF/xNYuez2lU/TJcNvguYXFNZP+52Cj63FzpFWwCJU0wAJlGnKH9d
 gtbqI1NAwTAxDeXRxvEOrowO5NoBqUS+d5+GBWix3vybTyZnqnS7oVTm3Wrp+j6sos
 hywERqVNIxkHafIGJ5txf0SrSkMsyEyzZVFiiw8dniKmJhal4Q/hSPLc+VtBx456up
 u9bdjr7ElljEg==
Received: by mail-qv1-f51.google.com with SMTP id j9so6657482qvm.10
 for <linux-mtd@lists.infradead.org>; Fri, 12 Nov 2021 08:54:11 -0800 (PST)
X-Gm-Message-State: AOAM533hlPyvkqv9BJmk6niAWS7nDoux0J94Xfa07GpiOr2k98H6TG81
 LoucfXL8Ttm7hg46mokJXVhhrjEAB11e8sDTAg==
X-Google-Smtp-Source: ABdhPJx5fitBGetF0tHL7BBcB7eTcVJS54gjY94AaDWCXRDWRoOBOSjN50+p/cXmqORQuy5yRL9d3oUeVjPhfKzV1q8=
X-Received: by 2002:a0c:c984:: with SMTP id b4mr16054318qvk.45.1636736050298; 
 Fri, 12 Nov 2021 08:54:10 -0800 (PST)
MIME-Version: 1.0
References: <20211112152411.818321-1-miquel.raynal@bootlin.com>
 <20211112152411.818321-3-miquel.raynal@bootlin.com>
In-Reply-To: <20211112152411.818321-3-miquel.raynal@bootlin.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Fri, 12 Nov 2021 10:53:59 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+uU-wngeko0SP-fBCM1OaBu0iTa0uC4ykK4SkastH9bQ@mail.gmail.com>
Message-ID: <CAL_Jsq+uU-wngeko0SP-fBCM1OaBu0iTa0uC4ykK4SkastH9bQ@mail.gmail.com>
Subject: Re: [RFC PATCH 2/3] dt-binding: mtd: spi-nor: Allow two CS per device
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Pratyush Yadav <p.yadav@ti.com>, 
 Michael Walle <michael@walle.cc>, Mark Brown <broonie@kernel.org>, 
 MTD Maling List <linux-mtd@lists.infradead.org>,
 Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Michal Simek <monstr@monstr.eu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211112_085411_579144_FDB822E3 
X-CRM114-Status: GOOD (  15.03  )
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

On Fri, Nov 12, 2021 at 9:24 AM Miquel Raynal <miquel.raynal@bootlin.com> wrote:
>
> This will be needed in order to be able to describe Xilinx QSPI
> controller stacked and parallel modes.
>
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml b/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml
> index ed590d7c6e37..dc99629e40db 100644
> --- a/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml
> +++ b/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml
> @@ -46,7 +46,7 @@ properties:
>        identified by the JEDEC READ ID opcode (0x9F).
>
>    reg:
> -    maxItems: 1
> +    maxItems: 2

You need minItems here.

>
>    spi-max-frequency: true
>    spi-rx-bus-width: true
> --
> 2.27.0
>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
