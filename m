Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09847C47BC5
	for <linux-mtd@archiver.kernel.org>; Tue,  6 Jan 2026 07:49:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=E3ma7PWClIDZxkxUGX5Wg5lSZPzqmdAB/onkQvB1KKc=; b=AJ3k5Du+hjhfE6
	uqnE/ocvpS9BaHRIvs9D6iy/8f3A2NWXVXIMj+KG+w08OqolnKsS12ynbC3C1TsRj3Sdyd1TMBPVO
	SO1JwYbr6GdTf+CFs41Ae6ObAVfkq6GoSJzkHsyS/drwCyYBgzpfvjRN8NRWfGGESVh2JaHor02yX
	qWGMQ818ByU09aq8nWNB6bdvj8nhbmEiw2TSUT8A5vP4Bhxtmju0tqY7NhqGCZDTA5Ok0ALGf8M94
	JdxpaVBtkXz2Pz4mPaOh7JPG/k/3hf7gND1Lg8l9oyFf+rx72pHKsfrN3A5FOC8EnGupLvPBQe7CN
	7ZD4z4Jq8tjt4i/llD0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd1oj-0000000CYUV-1Fti;
	Tue, 06 Jan 2026 07:49:25 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd1oc-0000000CYUN-1zcg
	for linux-mtd@lists.infradead.org;
	Tue, 06 Jan 2026 07:49:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E40CB60147;
	Tue,  6 Jan 2026 07:49:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16364C116C6;
	Tue,  6 Jan 2026 07:49:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767685757;
	bh=EZD+IhNqBS9jJk9M1+uwhHIS69CMKejfXxB1jk7XPtw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eUCl1qANzqJgnoHtWUu7PNrUg0bPR9293m5MY9lUzgyPlUsRzbIBRSxVHTZZkoIby
	 +0anE6RgJAYUGKu+L5PK6U00RxwjpsDNafUXKqHlIUhUGQ+p+fSLPs7trAvmdMIGha
	 n2NCrD18wEbiCUN97sBN4X2odotDNyoXBuW2DpL/uVmvwfnj8XBnljW5zQWVdcfY5t
	 Z/1AAqb6ywBiHewN+45nD4bhsovTdokHfDnKA9U1de0hM2GaG4rI3+hpAUQ/cVOBFv
	 LjIawI6h6ADxWCDIN1DiQng1oPiDSsJxBY+XaSFfkG1ILvpMwUlxVzFgwoLw3g77aA
	 Ise1sHeFEPKKA==
Date: Tue, 6 Jan 2026 08:49:15 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Akhila YS <akhilayalmati@gmail.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, 
	Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] dt-bindings: mtd: microchip,mchp23k256: convert to DT
 schema
Message-ID: <20260106-talented-hare-of-glee-fd1e63@quoll>
References: <20260105-nxp-v3-1-05af634831ef@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260105-nxp-v3-1-05af634831ef@gmail.com>
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

On Mon, Jan 05, 2026 at 03:08:00PM +0000, Akhila YS wrote:
> Convert Microchip 23K256 SPI SRAM MTD binding to YAML format.
> Changes during conversion:
> - Remove "address-cells" and "size-cells" from properties and
>   required sections as there is no child node for sram.

I looked at the driver and clearly see usage of partitions from DT, thus
the binding needed both above and the partitions coming from MTD schema,
so this is not really correct. Looks like you did not really try to
understand this binding and the driver.

Converting bindings is not trivial task and you must really understand
also what was incomplete in the binding.

Anyway, I don't want to deal with this more, so:

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
