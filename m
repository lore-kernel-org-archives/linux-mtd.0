Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23B0DC61DA4
	for <linux-mtd@archiver.kernel.org>; Thu,  2 Feb 2023 10:51:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ME2d6/04ASNaAg/h1RxbJLfWOQbkDKkuHPqwTSdlUXs=; b=PRtSQ4Mm6rBsLj
	K9rP5CeB5rw+2oDzuDgWz+jJ9TpUUeLq8oSGzLSDV3scBbVB7I2eqnOmY+vBuvlWy8gKD7o6fT25q
	GJgiJmhWySNZimTXFme03logcrH1PQooKvauaZCoA8GiAK/+jzSW5SXEMWhFvmyDZ1nLc1A8gp79u
	Bh6cJL8YGqgTaHQJiSGJYlwAUaMcuLpbLCbAZL3FkYHMOwfxVahGt6gX32A9LGMdmKZz8nRZ/pQj+
	JG5cT0SfLFgBvosDauzurBhD+Q4P2fW/eMw+NzgCImiTKJaayIJL7ss14I4CCjySnKHWG7HnOis/e
	DGQNaKxUBCfnr/utD7hA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNXAx-00FS3C-IU; Thu, 02 Feb 2023 10:50:43 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNXAT-00FRsV-SF; Thu, 02 Feb 2023 10:50:15 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 6980A61A69;
	Thu,  2 Feb 2023 10:50:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47FC3C433D2;
	Thu,  2 Feb 2023 10:50:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1675335011;
	bh=1Y4msb8HKqisz6WtPDfC58eZbJAg0tpZAMC5s1XfPWw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=E5uzUmvAh+yrTW3QZNlxMMS8lLvc40e4DSP2E384Hu9OxnyIlk4BnM6a7+Aaz0Qts
	 Or6MDjLlwI8WvSoJ2D3Af8Nig4NI1A7rXPg4Q4N3/G5Q/9IoDfHvT5RMzLFxbI+Z0G
	 GxFHoN+0BauQR3RHPBn/kHVcxzVlnx6BjDP4/bqk=
Date: Thu, 2 Feb 2023 11:50:03 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Damien Le Moal <damien.lemoal@opensource.wdc.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Linus Walleij <linusw@kernel.org>, Imre Kaloz <kaloz@openwrt.org>,
	Krzysztof Halasa <khalasa@piap.pl>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>, Marek Vasut <marex@denx.de>,
	Lubomir Rintel <lkundrak@v3.sk>, - <devicetree@vger.kernel.org>,
	Marc Zyngier <maz@kernel.org>, linux-ide@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mtd@lists.infradead.org, linux-serial@vger.kernel.org,
	linux-watchdog@vger.kernel.org
Subject: Re: [PATCH v2 0/3] dt-bindings: serial/mtd/mc/ata: use MC peripheral
 props
Message-ID: <Y9uVWz32O1vuIXpk@kroah.com>
References: <20230127093217.60818-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230127093217.60818-1-krzysztof.kozlowski@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230202_025014_042064_3628D7A9 
X-CRM114-Status: GOOD (  10.43  )
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

On Fri, Jan 27, 2023 at 10:32:14AM +0100, Krzysztof Kozlowski wrote:
> Hi,
> 
> Dependencies
> ============
> I think entire patchset should go via one tree (Rob's). Patch #2 depends on
> patch #1.  Patch #3 could go separate tree as long as others are in the
> linux-next.  However for simplicity let's push everything through Rob's DT
> tree?

No objection from me:

Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
