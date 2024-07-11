Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EB79C3DA4D
	for <linux-mtd@archiver.kernel.org>; Thu, 11 Jul 2024 11:56:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ufBgGjQej/UZWftNDvYevvW+xvFGfCQr4SgSk7bKeiU=; b=nbuOSDQh10j84A
	w/KdtHns5lnNAr5r4s3JjTE0Fb4srk4RHV6UqB+gle4JukQhPD76L4V75yjnX9L38DcY8zoooP2Aq
	tqdQlj1GGJgoEQhn4cUnUVYvUk7kJBxKkLyQYeagVxb5yDq2DY7iqP9mbG3LJgrJgA3oBAlPCLdvL
	earfqpkFdKrm2RgYdeb6fZLutS394beJM3j8qO6WFbcg/QRKR0gSq0177tJ04PY9W3pAf0MAp/YZ1
	B5QWLaYRhaFn0loE9NlDcYz1qqtf63n/+scLjLtKZZSPix3V9UsuMS0z7HMz5NuKWgk3FCLMqiEoz
	foWHBmQL+5T9pMSfJFkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRsPF-0000000DrLF-2Ja8;
	Thu, 11 Jul 2024 11:56:13 +0000
Received: from www530.your-server.de ([188.40.30.78])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRsP6-0000000DrHZ-2fT4
	for linux-mtd@lists.infradead.org;
	Thu, 11 Jul 2024 11:56:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=geanix.com;
	s=default2211; h=Content-Type:MIME-Version:Message-ID:Date:References:
	In-Reply-To:Subject:Cc:To:From:Sender:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=FmKQiCVwoJvQlzRn+/H/6S98Ji9W5JbPGtmsQUBhz88=; b=Po+6D5K3g32wOLM0bI2Fz6FySC
	Uz1m0uFf6/ibVas2/bMI11yotq1lvSJ501NnNrTQbiCL2X+kXH+YuGtz80Q38VrMIA+CzXZPtTeP6
	Lh8XHmI8ZD4Lm59oKCJdfK85+IoCjGmymEnaAvPqAUxeortxGCmjtlk+Hbf6B5xE5n7wwNAFZLiWj
	RNPhWeDzo5bD4rHKk3eb5FeWa/WO54LqViYXIUmvEe7RTa429ZJd4HDkyPkS7Ic7lJ5WX//HlGKgN
	tJKdI1G/pzOrPUiq5slTxOLrXME5lNYTQxa0iqL2OdId/ijlZFr+W9LUoWJ7LzmoegbRN/SKXtdzq
	l3ouvOLA==;
Received: from sslproxy04.your-server.de ([78.46.152.42])
	by www530.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <esben@geanix.com>)
	id 1sRsP0-00013f-Is; Thu, 11 Jul 2024 13:55:58 +0200
Received: from [87.49.147.209] (helo=localhost)
	by sslproxy04.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <esben@geanix.com>)
	id 1sRsOz-0006wb-2G;
	Thu, 11 Jul 2024 13:55:58 +0200
From: Esben Haabendal <esben@geanix.com>
To: "Michael Walle" <mwalle@kernel.org>
Cc: "Tudor Ambarus" <tudor.ambarus@linaro.org>,  "Pratyush Yadav"
 <pratyush@kernel.org>,  "Miquel Raynal" <miquel.raynal@bootlin.com>,
  "Richard Weinberger" <richard@nod.at>,  "Vignesh Raghavendra"
 <vigneshr@ti.com>,  <linux-mtd@lists.infradead.org>,
  <linux-kernel@vger.kernel.org>,  "Rasmus Villemoes"
 <rasmus.villemoes@prevas.dk>
Subject: Re: [PATCH v2 1/2] mtd: spi-nor: core: add flag for doing optional
 SFDP
In-Reply-To: <D2ML6RG09T38.RZU3CCH0XD9I@kernel.org> (Michael Walle's message
	of "Thu, 11 Jul 2024 11:02:39 +0200")
References: <20240603-macronix-mx25l3205d-fixups-v2-0-ff98da26835c@geanix.com>
	<20240603-macronix-mx25l3205d-fixups-v2-1-ff98da26835c@geanix.com>
	<a379a411-2c9e-4d9d-aa8f-4c4f3463cc27@linaro.org>
	<D1SZKLZBDDBA.1Z7ZD4UEOX05F@kernel.org> <871q413x72.fsf@geanix.com>
	<D2ML6RG09T38.RZU3CCH0XD9I@kernel.org>
Date: Thu, 11 Jul 2024 13:55:57 +0200
Message-ID: <87zfqoqh0y.fsf@geanix.com>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Authenticated-Sender: esben@geanix.com
X-Virus-Scanned: Clear (ClamAV 0.103.10/27333/Thu Jul 11 10:35:59 2024)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240711_045605_003629_1316A07E 
X-CRM114-Status: GOOD (  18.65  )
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

"Michael Walle" <mwalle@kernel.org> writes:

>> > I actually had the same concern. But currently there is no
>> > non-deprecated way to handle this case, right?
>> >
>> > Right now we have the following cases:
>> >  (1) pure SFDP parsing
>> >  (2) non-SFDP flashes with static configuration only
>> >  (3) legacy implementation, where the magic flags decide whether we
>> >      use SFDP
>>
>> Actually, in the code we have two variants of 2.
>>
>> (2a) non-SFDP flashes with SPI_NOR_SKIP_SFDP set
>> (2b) non-SFDP flashes without SPI_NOR_SKIP_SFDP and with none of the
>>      DUAL/QUAD/OCTAL read bits set
>
> Isn't (2b) my case (3)? The SPI_NOR_SKIP_SFDP flag was intended to
> be for flashes we know for a fact, there are no SFDP tables.
>
> I'm looking at spi_nor_init_params(). Maybe I'm missing something?

Probably not. I might just be confusing things here.

Your case (3) is conditional. Based on the magic flags checking in
spi_nor_init_params_deprecated(), it is either doing static
configuration only (this is what I tried to redefine as case (2b)) or
parsing SFDP with fallback to static configuration.

The issue I am getting at is that while the 2 different ways to end up
doing static configuration only is almost identical, there is a slight
difference.

But I will be addressing this in a v3 patch of this series.

Coming up shortly, and looking forward to discuss it.

/Esben

>> These almost handled the same way. But
>> spi_nor_manufacturer_init_params() is only called for 2b, and not for
>> 2a.
>>
>> Is this desired behavior, or something that we want to align?
>>
>> > Which case is eventually used depends on the ID of the flash -
>> > assuming there will only be IDs which either fall into (1) *or* (2).
>> > That assumption is clearly wrong :)
>> >
>> > I'd propose a new case in spi_nor_init_params()
>> >  (4) try SFDP with a fallback to the static flags from the
>> >      flash_info db.
>>
>> /Esben

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
