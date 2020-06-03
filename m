Return-Path: <SRS0=zMTj=7Q=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83342C433DF
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Jun 2020 13:54:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4E3D820772
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Jun 2020 13:54:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="D/fUPzfB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4E3D820772
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gFDNeFOxg2pKWr+LcnA3mX4e9tKt1W5XLs32qNy9EyE=; b=D/fUPzfBPU9P/F
	+FoEpaxqc8MGgH4pDq7KgFp6xo2KZhJi9TBv91XoAaOrm2O+Gq59NhgX/fq85eWQIl1zXv29hdyM6
	MgowWPkSGYoOQqYlTvFMeTqBQuXkVPc8s3qRDTljUpD2za4hOM/E90NgJ1x2OHrRTaBb9/R0EhWON
	zOzLDKqXuhzfukku6U/3S+KsNqsBcdh5h/g3JzXyfnFZyCHl0SlPrlEa4+6p/WWR2j+qSHDGWhfVA
	qbjeHYudqUCQ79KDW/ubbTc/eyu4Wo0CpFcH0HHwZ5m8bUMoLlEh5xtrY4ePGOzWof885SBJnlhFO
	n1uN+LgG0xqr+XkxslQQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jgTqe-00008N-K8; Wed, 03 Jun 2020 13:54:28 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jgToj-0006ly-Ny
 for linux-mtd@lists.infradead.org; Wed, 03 Jun 2020 13:52:32 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id E7B002A3D89;
 Wed,  3 Jun 2020 14:52:27 +0100 (BST)
Date: Wed, 3 Jun 2020 15:52:24 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Anton Vorontsov <anton@enomsg.org>, Miquel Raynal
 <miquel.raynal@bootlin.com>, linux-mtd@lists.infradead.org
Subject: Re: [PATCH 10/10] dt-bindings: mtd: fsl-upm-nand: Deprecate
 chip-delay and fsl,upm-wait-flags
Message-ID: <20200603155224.3baa35f9@collabora.com>
In-Reply-To: <20200603134922.1352340-11-boris.brezillon@collabora.com>
References: <20200603134922.1352340-1-boris.brezillon@collabora.com>
 <20200603134922.1352340-11-boris.brezillon@collabora.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200603_065229_936827_4EAA8A79 
X-CRM114-Status: GOOD (  17.56  )
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
Cc: devicetree@vger.kernel.org,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <tudor.ambarus@microchip.com>,
 Richard Weinberger <richard@nod.at>, Rob Herring <robh+dt@kernel.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>,
 linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

And I forgot to Cc the DT maintainer/ML on this one :-/

On Wed,  3 Jun 2020 15:49:22 +0200
Boris Brezillon <boris.brezillon@collabora.com> wrote:

> Those properties are no longer parsed by the driver which is being passed
> those information by the core now. Let's deprecate them.
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> ---
>  Documentation/devicetree/bindings/mtd/fsl-upm-nand.txt | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/mtd/fsl-upm-nand.txt b/Documentation/devicetree/bindings/mtd/fsl-upm-nand.txt
> index fce4894f5a98..25f07c1f9e44 100644
> --- a/Documentation/devicetree/bindings/mtd/fsl-upm-nand.txt
> +++ b/Documentation/devicetree/bindings/mtd/fsl-upm-nand.txt
> @@ -7,14 +7,16 @@ Required properties:
>  - fsl,upm-cmd-offset : UPM pattern offset for the command latch.
>  
>  Optional properties:
> -- fsl,upm-wait-flags : add chip-dependent short delays after running the
> -	UPM pattern (0x1), after writing a data byte (0x2) or after
> -	writing out a buffer (0x4).
>  - fsl,upm-addr-line-cs-offsets : address offsets for multi-chip support.
>  	The corresponding address lines are used to select the chip.
>  - gpios : may specify optional GPIOs connected to the Ready-Not-Busy pins
>  	(R/B#). For multi-chip devices, "n" GPIO definitions are required
>  	according to the number of chips.
> +
> +Deprecated properties:
> +- fsl,upm-wait-flags : add chip-dependent short delays after running the
> +	UPM pattern (0x1), after writing a data byte (0x2) or after
> +	writing out a buffer (0x4).
>  - chip-delay : chip dependent delay for transferring data from array to
>  	read registers (tR). Required if property "gpios" is not used
>  	(R/B# pins not connected).
> @@ -52,8 +54,6 @@ upm@3,0 {
>  	fsl,upm-cmd-offset = <0x08>;
>  	/* Multi-chip NAND device */
>  	fsl,upm-addr-line-cs-offsets = <0x0 0x200>;
> -	fsl,upm-wait-flags = <0x5>;
> -	chip-delay = <25>; // in micro-seconds
>  
>  	nand@0 {
>  		#address-cells = <1>;


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
