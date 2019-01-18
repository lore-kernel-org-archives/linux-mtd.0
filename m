Return-Path: <SRS0=FXe4=P2=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63342C43387
	for <linux-mtd@archiver.kernel.org>; Fri, 18 Jan 2019 08:20:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 310E52087E
	for <linux-mtd@archiver.kernel.org>; Fri, 18 Jan 2019 08:20:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hhqGNXRq";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="DXBGW6jT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 310E52087E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sKgMbnApXbKv/XNrHl9vvjb5f/0qi62/uKSsx/qKTUc=; b=hhqGNXRq1jUZ/Q
	RtITBDnKeKM5fXLXaCN678E/46lAdntjiGYoKfu2UPMzdOKqMhS6Vz+RZ4Uvt312Ty6GhoSNlzf/x
	wsyUOvdm3EnjAWyW9WSQA/c5KfdbaZH2AkzDc1rWgI4mW4Z52UpaYEkXmaTarsQKgnb6+VTdRjG1f
	t7sdb034Hs59nOKnjg9SThQJ7FU9HpcOyAH0vQXhDZF1yt2uVMrRNzorzKbkXZuWqne4dL/SIVAfz
	McYihn5PiaLHewTtzkApuSpf/wcNStxMxpklsa4cOwXDNkoix0FBLPunFzkiABUvAoGVBRxeuFIu+
	BsTOYZDl9TtNb486C20g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gkPO3-000311-M3; Fri, 18 Jan 2019 08:20:23 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gkPO0-00030b-Lv
 for linux-mtd@lists.infradead.org; Fri, 18 Jan 2019 08:20:22 +0000
Received: from bbrezillon (91-160-177-164.subs.proxad.net [91.160.177.164])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7B5E12086D;
 Fri, 18 Jan 2019 08:20:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1547799619;
 bh=yEimTCZEK6aNYjqPcmB/h0Z+F3CHTqoBGFr+UEAvb78=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=DXBGW6jTotGsMp+odRSlkp4yqxTdXvqY+j2UZglk8+m7fedjwBrAMueVaPYsfI/5D
 Z/rBZsWTFDmR3PG+zWQ3BouGxLQA87/GZvuNsfS0t2YEL9v3eqMGRc7EFhEt1fx1fF
 99qUhV0xnBZJ/1MlKcR5CD8p9qexMKmyUDPw8aDs=
Date: Fri, 18 Jan 2019 09:20:06 +0100
From: Boris Brezillon <bbrezillon@kernel.org>
To: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH 2/8] dt-bindings: mtd: ingenic: Add compatible strings
 for the JZ4725B
Message-ID: <20190118092006.79857045@bbrezillon>
In-Reply-To: <20190118010634.27399-2-paul@crapouillou.net>
References: <20190118010634.27399-1-paul@crapouillou.net>
 <20190118010634.27399-2-paul@crapouillou.net>
X-Mailer: Claws Mail 3.16.0 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190118_002020_745211_B0FF2B78 
X-CRM114-Status: GOOD (  18.83  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Richard Weinberger <richard@nod.at>, Miquel Raynal <miquel.raynal@bootlin.com>,
 linux-kernel@vger.kernel.org, Ralf Baechle <ralf@linux-mips.org>,
 linux-mips@vger.kernel.org, Marek Vasut <marek.vasut@gmail.com>,
 Paul Burton <paul.burton@mips.com>, Rob Herring <robh+dt@kernel.org>,
 linux-mtd@lists.infradead.org, Harvey Hunt <harveyhuntnexus@gmail.com>,
 James Hogan <jhogan@kernel.org>, Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Thu, 17 Jan 2019 22:06:28 -0300
Paul Cercueil <paul@crapouillou.net> wrote:

> Add compatible strings to probe the jz4780-nand and jz4780-bch drivers
> from devicetree on the JZ4725B SoC from Ingenic.
> 
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>

Reviewed-by: Boris Brezillon <bbrezillon@kernel.org>

> ---
>  Documentation/devicetree/bindings/mtd/ingenic,jz4780-nand.txt | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/mtd/ingenic,jz4780-nand.txt b/Documentation/devicetree/bindings/mtd/ingenic,jz4780-nand.txt
> index 29ea5853ca91..8ebed442ac55 100644
> --- a/Documentation/devicetree/bindings/mtd/ingenic,jz4780-nand.txt
> +++ b/Documentation/devicetree/bindings/mtd/ingenic,jz4780-nand.txt
> @@ -6,7 +6,9 @@ memory-controllers/ingenic,jz4780-nemc.txt), and thus NAND device nodes must
>  be children of the NEMC node.
>  
>  Required NAND controller device properties:
> -- compatible: Should be set to "ingenic,jz4780-nand".
> +- compatible: Should be one of:
> +  * ingenic,jz4725b-nand
> +  * ingenic,jz4780-nand
>  - reg: For each bank with a NAND chip attached, should specify a bank number,
>    an offset of 0 and a size of 0x1000000 (i.e. the whole NEMC bank).
>  
> @@ -72,7 +74,9 @@ NAND devices. The following is a description of the device properties for a
>  BCH controller.
>  
>  Required BCH properties:
> -- compatible: Should be set to "ingenic,jz4780-bch".
> +- compatible: Should be one of:
> +  * ingenic,jz4725b-bch
> +  * ingenic,jz4780-bch
>  - reg: Should specify the BCH controller registers location and length.
>  - clocks: Clock for the BCH controller.
>  


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
