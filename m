Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2BCCD232FC
	for <linux-mtd@archiver.kernel.org>; Fri,  9 Jan 2026 09:23:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LCgyd6AOwpZ+uD0IMkC6NZ2hJEC5P4057LxBxDV7Mc4=; b=CDf13731pZG4lZ
	TlPrTn4P4X8pwQAiewSq8ZdfPq4Nz48jdSQtlV6Q69FJ0g5grM5tlDHLILeoi54/GPX2ZNMHb42UB
	QcLkxHqvTfBS9mjLiYwjZRY4IoF3BEigw6Z6whROeU5OA5EWDbNxVMNESk1JiUv14ifGJHnjMqwiR
	H3YtvaQZNXTvUU7BsYsUADCA9C7X1mjvL2KFs8tFls8lNtW+tE0fHM/93csu/3PCc/zkLtzArf+c1
	qowGzqe8y/UlrXAxfRrDs0/2vEqS5ak6h1ERcKCn/orYQuosImEF1sOHaCi5H5dlME6keV3tZ7trm
	aJOutlIXtaO6ihgHogPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ve8i3-0000000202A-3hNy;
	Fri, 09 Jan 2026 09:23:08 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ve8hx-00000001zwH-1i0D
	for linux-mtd@lists.infradead.org;
	Fri, 09 Jan 2026 09:23:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 5BF4060171;
	Fri,  9 Jan 2026 09:23:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D165C4CEF1;
	Fri,  9 Jan 2026 09:22:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767950580;
	bh=fDjknpTo2lzuUrNgnyE3m0P/unrZfxoS8RB6wXYpCeM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aRVF5er2sAorYuc5fNexanbpCVcOxfnFyMsBvt3WyA8sGEKwXL3nCkQvCNmdiuLRH
	 atKxffbSuoWb9O+SNDmWqPhMNJ0Zr+Xsp2Tbgu9zcSPrjEatme9Yj3r3ytQ4bA2h+V
	 wWnXATGGNajVPFpHIkBa2OqrbPXKGpan/hXE1FBjb4BxdivUlt4hwxzQR6uHtYyW8z
	 2SplE3ARhWk8Uu+e5MjlaTc3YwLbAVDe9oDEcmKSvL69rrM07wqBzYYQsfICiRX4eM
	 nNVP/ZqL8L2Efg8+/qOED8hIo2ZG8/uJRaeg1ZNDWOcBNTZ3ij3AvXYNUvWBGcM/EQ
	 3qNiP3KJYQCHA==
Date: Fri, 9 Jan 2026 10:22:57 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, 
	Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Brian Norris <computersforpeace@gmail.com>, Kamal Dasu <kdasu.kdev@gmail.com>, 
	William Zhang <william.zhang@broadcom.com>, Nick Terrell <terrelln@fb.com>, David Sterba <dsterba@suse.com>, 
	=?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, Simon Glass <sjg@chromium.org>, 
	Linus Walleij <linusw@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>, 
	Marcus Folkesson <marcus.folkesson@gmail.com>, Tony Lindgren <tony@atomide.com>, 
	Roger Quadros <rogerq@kernel.org>, Hauke Mehrtens <hauke@hauke-m.de>, linux-mtd@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org
Subject: Re: [PATCH 03/10] dt-bindings: mtd: partitions: Move
 "sercomm,scpart-id" to partition.yaml
Message-ID: <20260109-clay-giraffe-of-typhoon-cb954f@quoll>
References: <20260108-dt-mtd-partitions-v1-0-124a53ce6279@kernel.org>
 <20260108-dt-mtd-partitions-v1-3-124a53ce6279@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260108-dt-mtd-partitions-v1-3-124a53ce6279@kernel.org>
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

On Thu, Jan 08, 2026 at 11:53:12AM -0600, Rob Herring (Arm) wrote:
> Defining child node properties specific to the parent schema doesn't work
> unless all the child node properties are known. They aren't known because
> any partition can define its own properties. The solution to this is
> typically something like spi-peripheral-props.yaml, but that's overkill for
> this single property. Just move it to partition.yaml instead.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>  .../devicetree/bindings/mtd/partitions/fixed-partitions.yaml   | 10 ----------
>  .../devicetree/bindings/mtd/partitions/partition.yaml          |  9 +++++++++
>  2 files changed, 9 insertions(+), 10 deletions(-)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
