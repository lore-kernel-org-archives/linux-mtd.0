Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9002EEB8FAF
	for <linux-mtd@archiver.kernel.org>; Wed,  6 Sep 2023 06:55:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FCxsiTYVOEEm3SeXAAlz58gqgtCMndKZjrfEhukm0GE=; b=r1MOdlsvV9RUZM+O7xHdnyAdED
	7hWJTRQ4UgzFlDkpox440as2xTuop4/DCFalBk1SFDBQoiQjdX5kLmpFJssWXQWGmqzt7xl6umk71
	yee8UYcxGcy3OGrIBceCqRKs9cf+NnaKj/oLHwCpW/VYY9/1cZ6kyuysvjvdNdCCvBgVK6saPfL73
	RFDXiXa2pTJQXAa5jZXqFhDDvW2533mpx8La+3S7C7Qc/Kes9FLe1ofh0Z3sKMZbtWSnJ8nPbO6yb
	NZ9i0j4aE0DI+lji9g9RzfkmHmZRPmxbmdUHEWIjHHT6M67Xj2iu1hWJlm9gqPrVvY/XBGiaOeTBV
	2wWMy2qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qdmRh-007Pkj-1g;
	Wed, 06 Sep 2023 06:55:25 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qdmRe-007PkA-2d
	for linux-mtd@lists.infradead.org;
	Wed, 06 Sep 2023 06:55:23 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 229F660F60;
	Wed,  6 Sep 2023 06:55:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00EFAC433C7;
	Wed,  6 Sep 2023 06:55:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693983321;
	bh=Zf26d3LHnHPCdwo6hyJ0XXRfY39HmKvzvzs6PL2TM4Y=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=CUzpFTDPOT3yfzqVKkqHTYVGmbpyHyy7baE5JthZyB4oWJNIg/RZv/T2mvQky2/k/
	 dD73tGVbvtzVkILmVYC0N3l1UcpDJ727FL3GPQdfg/auqFjFGgFNIUmCNUhLSwXU8j
	 b5cJ5rdWKtrb6Hf1ridOJ+M/T5MbzcE4+VTyrfp8B6VgR/86wj5C5nYyjq7EPdfal5
	 tMqdtGHOR51L1vLH78aT5F2JFrxX+EkCKKr9wyQojfKj8VdWPO/dJF2HB4XjQ4H9JY
	 8U9FuSn1GrOTGm7drvWyLY7sk7CUmOetj2qFohPAd1oynjcYBIIunsZPHuMH1cJTce
	 Zc7KIPYUPt9kg==
MIME-Version: 1.0
Date: Wed, 06 Sep 2023 08:55:17 +0200
From: Michael Walle <mwalle@kernel.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Pratyush Yadav <pratyush@kernel.org>, Miquel Raynal
 <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org
Subject: Re: [PATCH v2 11/41] mtd: spi-nor: drop .parse_sfdp
In-Reply-To: <e7387e77-0397-4d1f-99d5-d465c63951d9@linaro.org>
References: <20230807-mtd-flash-info-db-rework-v2-0-291a0f39f8d8@kernel.org>
 <20230807-mtd-flash-info-db-rework-v2-11-291a0f39f8d8@kernel.org>
 <e7387e77-0397-4d1f-99d5-d465c63951d9@linaro.org>
Message-ID: <3ce6bedfa306afae0cbae3fcf5b3ba64@kernel.org>
X-Sender: mwalle@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230905_235522_901321_98B99767 
X-CRM114-Status: GOOD (  11.11  )
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

>> +	{ "gd25q256", INFO(0xc84019, 0, 64 * 1024, 0)
>>  		FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_TB_SR_BIT6)
>>  		FIXUP_FLAGS(SPI_NOR_4B_OPCODES)
>>  		.fixups = &gd25q256_fixups },
> 
> We might get in trouble here if SFDP advertises a wrong flash size. And
> this is because in BP, instead of relying on the info->sector_size, we
> now compute locally the sector size based on the size advertised by
> SFDP. And if the SFDP flash size is wrong, we'll break BP for this
> flash.

I'd say if the SFDP advertises a wrong flash size we are in larger
trouble than a non-working BP :)

> I'm ok taking this risk, but please update the commit message and
> inform readers about what they may hit, and what would be the fix.

sure :)

-michael

> With that feel free to add:
> 
> Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
