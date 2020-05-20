Return-Path: <SRS0=rTSM=7C=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9618C433DF
	for <linux-mtd@archiver.kernel.org>; Wed, 20 May 2020 00:25:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 76C0920674
	for <linux-mtd@archiver.kernel.org>; Wed, 20 May 2020 00:25:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="G1KEzX6B";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=crapouillou.net header.i=@crapouillou.net header.b="ruGAnAg3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 76C0920674
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=crapouillou.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:To:
	Subject:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=CKqPDGSNPPuHG8hF0UKKcrFDlpCkKLDLvY+neUexhB0=; b=G1KEzX6BOscR+2dHkm5mJlqcO
	qnyTiZ+EFRIruQz4TG2bmbzIONulndptx5GxC0X42glkvtpYFbAR0Sp/zPnxLlsWkZDuwe+qXNaOZ
	tOWrn5x3tioOTb+xc0cSkfOM1Xb0Dayf7UG+cTqHE00o7JAcOGfYSRxxQpV/REfCGkFtlj5Lx6GbZ
	sR9ZZ2tH6J14HJ9Mhr3w5RpJLmvD5tuu6cYpRlvDKFwKWPyE6pnxohxtfXl1IQIdyYJHJVnJF3Dbw
	dm43yMXby+lg1cmoYxUMz7nsvp1YM4ZYc3N7nVjsnaVKXlhOZImgIU4hzI1EZpU0uMsUpWEBH9pEc
	EjGK5Ot8g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jbCY3-0007b7-21; Wed, 20 May 2020 00:25:27 +0000
Received: from outils.crapouillou.net ([89.234.176.41] helo=crapouillou.net)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jbCY0-0007af-C3
 for linux-mtd@lists.infradead.org; Wed, 20 May 2020 00:25:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1589934322; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=I7AwvCtB1QUal3/NGWrqtWi3IGaVg+1bWt/HFkMKu/E=;
 b=ruGAnAg3O7kRyBRXucEQgxm2vw3f7nstuQn1Dx6Q63V6jqQ3A8orguyJz+I61tAQI4DTB6
 cp8ITtjx2l1yFQ6qX4fOb92vzgu+NV3XmYHLLWWh1FRP1xgG0ZS5Nl6Ee875RDW8wy68WB
 8DWma5botrwtX4Yc/KC+36gSN6aieI4=
Date: Wed, 20 May 2020 02:25:12 +0200
From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v2 1/4] dt-bindings: mtd: rawnand: ingenic: Clarify the
 active state of the RB pin
To: Boris Brezillon <boris.brezillon@collabora.com>
Message-Id: <06TLAQ.BLU7G36K5D91@crapouillou.net>
In-Reply-To: <20200519232454.374081-1-boris.brezillon@collabora.com>
References: <20200519232454.374081-1-boris.brezillon@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200519_172524_599070_78E1D54F 
X-CRM114-Status: GOOD (  13.74  )
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
 Tudor Ambarus <tudor.ambarus@microchip.com>,
 Richard Weinberger <richard@nod.at>, Rob Herring <robh+dt@kernel.org>,
 Harvey Hunt <harveyhuntnexus@gmail.com>, linux-mtd@lists.infradead.org,
 Miquel Raynal <miquel.raynal@bootlin.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Boris,

This .txt file is going away, so there's no need to apply this one =

patch.

I Cc'd you on the V2 of the patchset that drops this file.

-Paul


Le mer. 20 mai 2020 =E0 1:24, Boris Brezillon =

<boris.brezillon@collabora.com> a =E9crit :
> Let's make things consistent with other bindings and clarify the
> expected active state.
> =

> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> ---
> Changes in v2:
> * New patch
> ---
>  Documentation/devicetree/bindings/mtd/ingenic,jz4780-nand.txt | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> =

> diff --git =

> a/Documentation/devicetree/bindings/mtd/ingenic,jz4780-nand.txt =

> b/Documentation/devicetree/bindings/mtd/ingenic,jz4780-nand.txt
> index c02259353327..4cbe13f94564 100644
> --- a/Documentation/devicetree/bindings/mtd/ingenic,jz4780-nand.txt
> +++ b/Documentation/devicetree/bindings/mtd/ingenic,jz4780-nand.txt
> @@ -30,7 +30,8 @@ Optional children node properties:
>  - nand-ecc-strength: ECC strength (max number of correctable bits).
>  - nand-ecc-mode: String, operation mode of the NAND ecc mode. "hw" =

> by default
>  - nand-on-flash-bbt: boolean to enable on flash bbt option, if not =

> present false
> -- rb-gpios: GPIO specifier for the busy pin.
> +- rb-gpios: GPIO specifier for the ready/busy pin. The active state =

> (ready)
> +            should be high unless the signal is inverted.
>  - wp-gpios: GPIO specifier for the write protect pin.
> =

>  Optional child node of NAND chip nodes:
> --
> 2.25.4
> =




______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
