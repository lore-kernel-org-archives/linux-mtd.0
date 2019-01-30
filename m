Return-Path: <SRS0=xpyr=QG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DD56C282D7
	for <linux-mtd@archiver.kernel.org>; Wed, 30 Jan 2019 17:25:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E00EA20869
	for <linux-mtd@archiver.kernel.org>; Wed, 30 Jan 2019 17:25:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="R+ZEBDXt";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="07LxU4WC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E00EA20869
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=e6EwCuhm6EWRi7C3Yxlm2zFcFsgyoFYsAXlMn2pkAVk=; b=R+ZEBDXt6cjuef
	nYDhT6+oX2Ck/YH4+eSlHh5S081VlDxmE8NKHQG7j7p3mAGlv5l/FmjEGXsQVHI1R9m7wNYhQSuGI
	CSUSBg7J+dlYb4/SVw7TMq7myU8fFItECZDwkOg/rOzY09D73tZmz0F0Cka+zOkpyaNDvYgsy88/A
	5PQHlAPkVrAIeEjOXHwn/uKd3ABOi7GjbtHpI4BpckKLsI73QILHmpnA7S8/uuuyW0qkv/nerUsTB
	9pjcv+ADYd1Gp3705uPpMSftoLZuRYwvFE8be1ftiDuK/jsZrIxYk0jx65EB6oav+P4MINIYsue1N
	DARuMWAeptjj4Gu5RwHQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gotcX-0008L8-3R; Wed, 30 Jan 2019 17:25:53 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gotcL-00085F-MH; Wed, 30 Jan 2019 17:25:43 +0000
Received: from bbrezillon (91-160-177-164.subs.proxad.net [91.160.177.164])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 897462087F;
 Wed, 30 Jan 2019 17:25:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1548869141;
 bh=2c0XT3l/QdixLhUgC6hLFl2q9n6ZZ3qCYZwNv41aJ2A=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=07LxU4WCW6m+otNDW5u/wHd7LXr5MgZMIH1qKskc2TQ9ypgENnOkL9ce1S6rEXBYq
 Us/NRYC77Ic2+Ngvf4QagTxTHYn9X2hrYw4hKAu0bNNW0OP1bvEwquq5bmSdQggoCb
 poiTwYl30u+rzcE09sbdaxL/d9cPCFMeOoOUjt9U=
Date: Wed, 30 Jan 2019 18:25:30 +0100
From: Boris Brezillon <bbrezillon@kernel.org>
To: <Tudor.Ambarus@microchip.com>
Subject: Re: [PATCH 7/9] dt-bindings: spi: atmel-quadspi: update example to
 new clock binding
Message-ID: <20190130182517.3d4c620b@bbrezillon>
In-Reply-To: <20190130150818.24902-8-tudor.ambarus@microchip.com>
References: <20190130150818.24902-1-tudor.ambarus@microchip.com>
 <20190130150818.24902-8-tudor.ambarus@microchip.com>
X-Mailer: Claws Mail 3.16.0 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190130_092541_747579_8D52FFE0 
X-CRM114-Status: GOOD (  12.41  )
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
Cc: alexandre.belloni@bootlin.com, Nicolas.Ferre@microchip.com,
 linux-kernel@vger.kernel.org, Ludovic.Desroches@microchip.com,
 broonie@kernel.org, linux-mtd@lists.infradead.org, linux-spi@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Wed, 30 Jan 2019 15:08:43 +0000
<Tudor.Ambarus@microchip.com> wrote:

> From: Tudor Ambarus <tudor.ambarus@microchip.com>
> 
> Introduced in:
> commit b60557876849 ("ARM: dts: at91: sama5d2: switch to new clock binding")
> 
> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>

Reviewed-by: Boris Brezillon <bbrezillon@kernel.org>

> ---
>  Documentation/devicetree/bindings/spi/atmel-quadspi.txt | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/spi/atmel-quadspi.txt b/Documentation/devicetree/bindings/spi/atmel-quadspi.txt
> index b93c1e2f25dd..e9dae6264d89 100644
> --- a/Documentation/devicetree/bindings/spi/atmel-quadspi.txt
> +++ b/Documentation/devicetree/bindings/spi/atmel-quadspi.txt
> @@ -19,7 +19,7 @@ spi@f0020000 {
>  	reg = <0xf0020000 0x100>, <0xd0000000 0x8000000>;
>  	reg-names = "qspi_base", "qspi_mmap";
>  	interrupts = <52 IRQ_TYPE_LEVEL_HIGH 7>;
> -	clocks = <&spi0_clk>;
> +	clocks = <&pmc PMC_TYPE_PERIPHERAL 52>;
>  	#address-cells = <1>;
>  	#size-cells = <0>;
>  	pinctrl-names = "default";


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
