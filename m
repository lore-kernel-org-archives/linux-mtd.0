Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB03DC5479D
	for <linux-mtd@archiver.kernel.org>; Mon,  9 Jan 2023 14:24:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XDoxZsQ5g6ibInaZpf0N6gyJyTedeIC6D2Z3bGSsp10=; b=VOxwL/K2XrTK3tj5ktnv3IXLnr
	RFY6aDg/eqIaqGsqTT9ffjRhGfQ0ACxTD69Xx+LbcNbiMeMHEdMi+t3JoadMa+ocYej3NrvGzcJx7
	PGjv2sbcFVJO6UjpArRlFDtaHKqzSnCv3ppam8JypaT+h8GoVqGCdq8Io1S3nomYj3JlLX6ENwmTo
	ML4M+7/a1GQaUv4spFqTanR1L8ul13dwxMiSfzkaOUqn2Wr2o1mCSCPmSqOoEGUAcIVGPlJ1dOdE6
	VrqtHoJaEhWFcMPKiNMGGlR9f7UQE/rhELZEjb7XwtV5zhzHflZyGJEjBzS3aFRIq/4vcxgiOYsf0
	BK8MUnhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pEt47-001w1u-5S; Mon, 09 Jan 2023 14:23:55 +0000
Received: from 0001.3ffe.de ([159.69.201.130] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pEt0n-001uNA-1g
	for linux-mtd@lists.infradead.org; Mon, 09 Jan 2023 14:20:31 +0000
Received: from 3ffe.de (0001.3ffe.de [IPv6:2a01:4f8:c0c:9d57::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id D1C9A125C;
	Mon,  9 Jan 2023 15:20:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2022082101;
	t=1673274023;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DyTntcXGnalnFdsHW0+05dfmoCRtXXqGoOJ38tx3Qjg=;
	b=rHvEXkd7pS/Yc68kEcJCrc7wVwe5mQnP9xVyS6z19jMT4iyTLn1J8IcfMCq0MlQuPRJqxj
	6d6tFkhSMyxGcsEvCLpnPlATCUAe5JLKpam3ME8xiPDiTeFOgwnpURNJINi84x/MO+Ob1s
	YBfDxgtw8E5hltVraC/dHEVPLIt/OL/MYgcjjexATK4Mif2rnSYB+HS51Q8TPa68mLhlYy
	Y5Xv6nrwjoSjo2c8vKKpxkY/OlYOu0xfHiUPO5+TjPYCF2ZSUyMYZuYphVupx4v+ZUZUf8
	/XZfo6qYAVyxviYvt2m97XULJvd3s8gngau81UZi8UhkJOFC54rSN8iWPKu0Uw==
MIME-Version: 1.0
Date: Mon, 09 Jan 2023 15:20:23 +0100
From: Michael Walle <michael@walle.cc>
To: "Usyskin, Alexander" <alexander.usyskin@intel.com>
Cc: "Winkler, Tomas" <tomas.winkler@intel.com>, Tudor Ambarus
 <tudor.ambarus@microchip.com>, Pratyush Yadav <pratyush@kernel.org>,
 linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] mtd: spi-nor: macronix: add support for mx77l51250f
In-Reply-To: <CY5PR11MB636696A89B94C4C659738290EDFE9@CY5PR11MB6366.namprd11.prod.outlook.com>
References: <20230107214345.2524851-1-tomas.winkler@intel.com>
 <5076cc829fb5a9c5959687a401b120ca@walle.cc>
 <CY5PR11MB636696A89B94C4C659738290EDFE9@CY5PR11MB6366.namprd11.prod.outlook.com>
User-Agent: Roundcube Webmail/1.4.13
Message-ID: <6b4780f5366de7f0dd59da0ed4f9a948@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230109_062029_416931_8A02D155 
X-CRM114-Status: GOOD (  14.27  )
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

Am 2023-01-09 15:09, schrieb Usyskin, Alexander:
>> > --- a/drivers/mtd/spi-nor/macronix.c
>> > +++ b/drivers/mtd/spi-nor/macronix.c
>> > @@ -100,6 +100,8 @@ static const struct flash_info macronix_nor_parts[]
>> > = {
>> >  	{ "mx66u2g45g",	 INFO(0xc2253c, 0, 64 * 1024, 4096)
>> >  		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ |
>> SPI_NOR_QUAD_READ)
>> >  		FIXUP_FLAGS(SPI_NOR_4B_OPCODES) },
>> > +	{ "mx77l51250f", INFO(0xc2751a, 0, 64 * 1024, 4096)
>> > +		PARSE_SFDP },
>> 
>> With the newest generic spi nor driver [1] this patch shouldn't
>> be needed at all anymore. Could you verify, that your flash will work
>> without it?
>> 
>> -michael
>> 
>> [1]
>> https://elixir.bootlin.com/linux/v6.2-rc3/source/drivers/mtd/spi-
>> nor/core.c#L1637
> 
> Tested now, the v6.2-rc3 recognizes the chip.
> Does this mean that all SFDP-supporting chips will be recognized 
> automatically?

As long as you just want to use the standard features described by SFDP,
yes. There might be lacking support for some SFDP features, though. 
These
should then be added to the SFDP parser.

But, there are also features, which aren't supported by SFDP, i.e. 
locking
or OTP. If you want to use these, you still need a flash table entry.

-michael

> Tomas, we can abandon upstreaming effort, I'll save the patch if it
> will needed by older kernel versions.


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
