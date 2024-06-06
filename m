Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09468C27C54
	for <linux-mtd@archiver.kernel.org>; Thu,  6 Jun 2024 17:20:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jdWQvY9sX4kGhsC+6CN26fcfw+7KtY9BCtp5S/avy3Q=; b=L3Y14+S9TCTPYo
	0wZ9zVgrAckDonFHOax0MmuaFHZ+fMyq3vVYk8sEmTCKAEDpgGps80o7K2PVmKST5HiwKMjTilxAU
	cH8zBxu39X72cDLAJ4k3U4/tXWpXvUlc3yzCY/VaJ+7AyW2azuOsvLKcKwJzWHYAWm9lVIy3z4o1D
	aiKXYo0aGj/Ty7u9ZJPx/pbBSobcbuQR9D5zM/Pl/HF6Qcqs+Lf5OvnZIo20pAjDS8VbkVhBkuzJz
	ZFAJ7MLyIwZWIA71yJYbOfuYKMxoUg1vMF/kqkLDF9zev5qPqPdCmMJFdt8+Ll156PiFFytSYZUFP
	drAcYbv8bSwwgBdeIUpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFGme-0000000Ah1Q-3fBY;
	Thu, 06 Jun 2024 17:20:16 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFGmd-0000000Ah0w-0n6p
	for linux-mtd@bombadil.infradead.org;
	Thu, 06 Jun 2024 17:20:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:MIME-Version:Message-ID:
	Date:References:In-Reply-To:Subject:Cc:To:From:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=PlE/RgkFbJeiOp5Rojavj8a4V784vhq4kLAdPvB7GYs=; b=k3LWwyWAIaZ7M1IqSeyRob+F2n
	Wx+DBlPQQcrbSXYUZki7iAQyVJ4PZUOomV31356Ve1yZvligZ+g4un2/1YfSK7wnQSBwM/4F2fx8P
	AI2itpqqnB8Fsavf1gJffQY2hZLsrzjLiwM7rcPdw3/HtTsfjXjg60xHLemJ9zod75PW9qF7dZGcX
	9TmyaiRiw1+Ll7t5hir0wytW+3YW9J5tTqpR2ZcyyiqNn/RaqTrbBqBzSQCk7vt7te8F1J3Gbbp4L
	g4WcRSg//iXzshIaziZxXFcuC7W1lEoXyEsjOCt7vYpJN2cVMyYcbWEjfSsphwWaPVUN9LWWmjqzw
	GJ8gYOxg==;
Received: from www530.your-server.de ([188.40.30.78])
	by casper.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFGma-00000001fcu-1J4p
	for linux-mtd@lists.infradead.org;
	Thu, 06 Jun 2024 17:20:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=geanix.com;
	s=default2211; h=Content-Type:MIME-Version:Message-ID:Date:References:
	In-Reply-To:Subject:Cc:To:From:Sender:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=PlE/RgkFbJeiOp5Rojavj8a4V784vhq4kLAdPvB7GYs=; b=cwVCBBwUAzHHbPMFAndj9DM2hC
	f8I6e+jCVQXMdVYG5ab7xKuEUDAythdOnH7SDn+pUwoD11by7Jq0S28kAk808TxrdQi3mVLpLZ2X0
	f8lBp55L/N2LIw0naDo1yYvvKLrkuJxPcQcbljytGtUUCYmqxK2qGQ5gITJ6+6GGMu6wM1qnCU8Vs
	xZRbeTUe7QbiIhjSQwHiowygxVydQhFYjslB4u07dSioqiMryD3tYwoUbGZ++ubSPNBY5Wcecdn4K
	JN4P+WfJLnzyLCj0ZnTgKMEcylj6qPji5owGdbGvR6qP4c6FwGKCu+blOcfLjbIonV/Vc4xkvQmKy
	zGBo6VMw==;
Received: from sslproxy07.your-server.de ([78.47.199.104])
	by www530.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <esben@geanix.com>)
	id 1sFGmV-0002V0-By; Thu, 06 Jun 2024 19:20:03 +0200
Received: from [80.62.117.184] (helo=localhost)
	by sslproxy07.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <esben@geanix.com>)
	id 1sFGmR-000OQr-1u;
	Thu, 06 Jun 2024 19:20:03 +0200
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
In-Reply-To: <D1T10API5U80.1OKB56YTFGMTN@kernel.org> (Michael Walle's message
	of "Thu, 06 Jun 2024 17:06:31 +0200")
References: <20240603-macronix-mx25l3205d-fixups-v2-0-ff98da26835c@geanix.com>
	<20240603-macronix-mx25l3205d-fixups-v2-1-ff98da26835c@geanix.com>
	<a379a411-2c9e-4d9d-aa8f-4c4f3463cc27@linaro.org>
	<D1SZKLZBDDBA.1Z7ZD4UEOX05F@kernel.org>
	<48719b0f-1a7f-47f9-948a-c981a0a29b41@linaro.org>
	<D1T10API5U80.1OKB56YTFGMTN@kernel.org>
Date: Thu, 06 Jun 2024 19:20:02 +0200
Message-ID: <874ja6aszh.fsf@geanix.com>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Authenticated-Sender: esben@geanix.com
X-Virus-Scanned: Clear (ClamAV 0.103.10/27298/Thu Jun  6 10:30:08 2024)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240606_182012_393661_D70316EF 
X-CRM114-Status: GOOD (  27.25  )
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

> On Thu Jun 6, 2024 at 4:52 PM CEST, Tudor Ambarus wrote:
>> On 6/6/24 14:59, Michael Walle wrote:
>> > On Thu Jun 6, 2024 at 3:31 PM CEST, Tudor Ambarus wrote:
>> >> On 6/3/24 14:09, Esben Haabendal wrote:
>> >>> A dedicated flag for triggering call to
>> >>> spi_nor_sfdp_init_params_deprecated() allows enabling optional SFDP read
>> >>> and parse, with fallback to legacy flash parameters, without having dual,
>> >>> quad or octal parameters set in the legacy flash parameters.
>> >>>
>> >>> With this, spi-nor flash parts without SFDP that is replaced with a
>> >>> different flash NOR flash part that does have SFDP, but shares the same
>> >>> manufacturer and device ID is easily handled.
>> >>>
>> >>> Signed-off-by: Esben Haabendal <esben@geanix.com>
>> >>> ---
>> >>>  drivers/mtd/spi-nor/core.c | 3 ++-
>> >>>  drivers/mtd/spi-nor/core.h | 1 +
>> >>>  2 files changed, 3 insertions(+), 1 deletion(-)
>> >>>
>> >>> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
>> >>> index 3e1f1913536b..1c4d66fc993b 100644
>> >>> --- a/drivers/mtd/spi-nor/core.c
>> >>> +++ b/drivers/mtd/spi-nor/core.c
>> >>> @@ -2933,7 +2933,8 @@ static void spi_nor_init_params_deprecated(struct spi_nor *nor)
>> >>>  
>> >>>  	spi_nor_manufacturer_init_params(nor);
>> >>>  
>> >>> -	if (nor->info->no_sfdp_flags & (SPI_NOR_DUAL_READ |
>> >>> +	if (nor->info->no_sfdp_flags & (SPI_NOR_TRY_SFDP |
>> >>
>> >> I don't like that we update deprecated methods. The solution though is
>> >> elegant.
>> > 
>> > I actually had the same concern. But currently there is no
>> > non-deprecated way to handle this case, right?
>> > 
>> > Right now we have the following cases:
>> >  (1) pure SFDP parsing
>> >  (2) non-SFDP flashes with static configuration only
>> >  (3) legacy implementation, where the magic flags decide whether we
>> >      use SFDP
>> > 
>> > Which case is eventually used depends on the ID of the flash -
>> > assuming there will only be IDs which either fall into (1) *or* (2).
>> > That assumption is clearly wrong :)
>> > 
>> > I'd propose a new case in spi_nor_init_params()
>> >  (4) try SFDP with a fallback to the static flags from the
>> >      flash_info db.
>> > 
>>
>> that's not that bad, but I would avoid doing it if it's not common. You
>> also have to update the core a bit, you can't use no_sfdp_flags &
>> TRY_SFDP, it's misleading. Does it worth it?
>
> IMHO no_sfdp_flags is the correct place (maybe TRY_SFDP is wrong,
> maybe SFDP_FALLBACK?)

TRY_SFDP might not be the best choice. But SFDP_FALLBACK sounds to me
like it is fallback _to_ SFDP, so rather counter-intuitive.

> because the flash is first treated like in
> case (2). Then SFDP is tried based on that flag.

It is first treated like in case (2), and then tried for case (1),
falling back to the result from case (2) if/when case (1) fails.

> Is it worth it? I
> don't know, Esben is doing the development here ;) So up to him.

I am not sure exactly how it should look like, but I do like the idea
proposed above, case (4). It is easier to describe and understand than
the current legacy implementation.

>> I won't oppose too much, but to me it feels that we're trying to keep
>> alive a dead man.
>
> Maybe, but we'd have a readily solution if we face a similar
> problem in the future. I'm really not sure, how many flashes there
> are, but I think these magic bits (which tells the legacy
> implementation to try SFDP) will mask quite a few of these.
> I.e. in an ideal world where we could finally drop case (3) and
> you'd need to split the flashes between case (1) or (2), I think
> there will be quite some in (4).

I like this. Judging by the way Macronix is handling this particular
chip, I strongly assume that there are several other examples of this
for other Macronix parts. Of-course, as long as the original part using
the particular flash id supported SFDP, and all later flashes using the
same id also does, none of this is needed.

/Esben

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
