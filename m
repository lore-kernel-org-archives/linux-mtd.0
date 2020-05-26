Return-Path: <SRS0=PBLV=7I=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16E0FC433DF
	for <linux-mtd@archiver.kernel.org>; Tue, 26 May 2020 22:42:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D786E208C3
	for <linux-mtd@archiver.kernel.org>; Tue, 26 May 2020 22:42:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Oo3Sr4Ol"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D786E208C3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZL+88MPBB2FAzu4OehwkTaPgBXtS2cdMcDLp0wAAnlo=; b=Oo3Sr4Olm6VHvm
	qvbcbbPayi+MKvVxWzy/LHpoP7JPKW6ku98dQpG2yTR7dAhYoD5ukUkvUiG8PBSAEysLHJ0EmSuab
	Y77r9O+V62+YC94x6Bib/ZrCF+IYaUFmZtoC405Q/w3eG10Bp7HqANr4Y+DfI8XudCmQZMl0OTIMW
	5VsRfX3r+WGP7f4T4cypNqydpPh2A4B+849Qcny9x593grqMOUDG71g8vJfK0ozfLNqOEgazHV/qt
	9FagghkTyk4WqjBLQNKep+TG7z2bAZSaPe79ifSClexUFcPyC+mZFD6eyCNH/FQHMv725UnOSj5n2
	nOSMNSOLYQct7tiAJFOQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jdiHP-0006Hd-Mv; Tue, 26 May 2020 22:42:39 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jdiHN-0006H7-9O
 for linux-mtd@lists.infradead.org; Tue, 26 May 2020 22:42:38 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:b93f:9fae:b276:a89a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id F1A092A3607;
 Tue, 26 May 2020 23:42:35 +0100 (BST)
Date: Wed, 27 May 2020 00:42:33 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [RESEND v5 04/21] dt-bindings: mtd: Deprecate OOB_FIRST mode
Message-ID: <20200527004233.61a78abc@collabora.com>
In-Reply-To: <20200526195633.11543-5-miquel.raynal@bootlin.com>
References: <20200526195633.11543-1-miquel.raynal@bootlin.com>
 <20200526195633.11543-5-miquel.raynal@bootlin.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200526_154237_453285_A1A66F2F 
X-CRM114-Status: GOOD (  18.95  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Richard Weinberger <richard@nod.at>, Rob Herring <robh+dt@kernel.org>,
 linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Tue, 26 May 2020 21:56:16 +0200
Miquel Raynal <miquel.raynal@bootlin.com> wrote:

> This mode has never actually been used, it was introduced for a single
> driver and even this driver did not use it in the DT but only in the
> code. Now that this mode has been removed, let's trim the bindings
> definition to avoid carrying useless properties.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>

> ---
>  Documentation/devicetree/bindings/mtd/atmel-nand.txt       | 3 +--
>  Documentation/devicetree/bindings/mtd/nand-controller.yaml | 2 +-
>  2 files changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/mtd/atmel-nand.txt b/Documentation/devicetree/bindings/mtd/atmel-nand.txt
> index 3aa297c97ab6..ead1826d0d51 100644
> --- a/Documentation/devicetree/bindings/mtd/atmel-nand.txt
> +++ b/Documentation/devicetree/bindings/mtd/atmel-nand.txt
> @@ -143,8 +143,7 @@ Required properties:
>  Optional properties:
>  - atmel,nand-has-dma : boolean to support dma transfer for nand read/write.
>  - nand-ecc-mode : String, operation mode of the NAND ecc mode, soft by default.
> -  Supported values are: "none", "soft", "hw", "hw_syndrome", "hw_oob_first",
> -  "soft_bch".
> +  Supported values are: "none", "soft", "hw", "hw_syndrome", "soft_bch".
>  - atmel,has-pmecc : boolean to enable Programmable Multibit ECC hardware,
>    capable of BCH encoding and decoding, on devices where it is present.
>  - atmel,pmecc-cap : error correct capability for Programmable Multibit ECC
> diff --git a/Documentation/devicetree/bindings/mtd/nand-controller.yaml b/Documentation/devicetree/bindings/mtd/nand-controller.yaml
> index d261b7096c69..d529f8587ba6 100644
> --- a/Documentation/devicetree/bindings/mtd/nand-controller.yaml
> +++ b/Documentation/devicetree/bindings/mtd/nand-controller.yaml
> @@ -49,7 +49,7 @@ patternProperties:
>        nand-ecc-mode:
>          allOf:
>            - $ref: /schemas/types.yaml#/definitions/string
> -          - enum: [ none, soft, hw, hw_syndrome, hw_oob_first, on-die ]
> +          - enum: [ none, soft, hw, hw_syndrome, on-die ]
>          description:
>            Desired ECC engine, either hardware (most of the time
>            embedded in the NAND controller) or software correction


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
