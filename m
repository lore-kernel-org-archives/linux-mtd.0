Return-Path: <SRS0=50Qk=S6=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D975DC43219
	for <linux-mtd@archiver.kernel.org>; Sun, 28 Apr 2019 12:20:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A6B432075D
	for <linux-mtd@archiver.kernel.org>; Sun, 28 Apr 2019 12:20:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="KNsQogsN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A6B432075D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=zonque.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SR2j/ogDYpVP6y+lStv8LXfDW8Gldiq1VyhZ4fm4KjA=; b=KNsQogsN1b37Dc
	dowTfF5wPlJ2YkBRQZ1rAo8ZEqJCm17Y+MOVrr+lX/QioffAINo6PBqw2XkBRItOLaqetKbEk6Gq0
	dQPHh4ot7phzPASvSnNgk1WSN8OVVlzch9cmRLslU80Nrb+8yJ+FWB8P9yY0JsZ+OxokzM6JLZxqr
	J2TNpmTQJT2fYYVlgRjZWYouIWPN3w7ar8FKzETRfvLJH0xM8AZFaiRH4qnSm1nNSSIfHCl5TiC1y
	MedYWWiKt1q3sq4v+XaPue+Bl/oEx/G3y3TTdy6KIiNPzjMB0ehk3m7/Fe10gwm22yRkWb8OAoHQD
	V9Pth9GIkFMebN1MyHAw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hKinh-00013r-LB; Sun, 28 Apr 2019 12:20:57 +0000
Received: from mail.bugwerft.de ([2a03:6000:1011::59])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hKine-00013K-D5
 for linux-mtd@lists.infradead.org; Sun, 28 Apr 2019 12:20:56 +0000
Received: from [192.168.178.170] (p57BC9E9A.dip0.t-ipconnect.de
 [87.188.158.154])
 by mail.bugwerft.de (Postfix) with ESMTPSA id 5437D2A9DBE;
 Sun, 28 Apr 2019 12:18:52 +0000 (UTC)
Subject: Re: [PATCH v2] mtd: rawnand: marvell: Clean the controller state
 before each operation
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
References: <20190408083145.13178-1-miquel.raynal@bootlin.com>
 <20190414105019.5bac65d3@collabora.com>
From: Daniel Mack <daniel@zonque.org>
Openpgp: preference=signencrypt
Autocrypt: addr=daniel@zonque.org; prefer-encrypt=mutual; keydata=
 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
Message-ID: <9a8a3963-1b8a-9f9b-8e54-200945518f99@zonque.org>
Date: Sun, 28 Apr 2019 14:20:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.0
MIME-Version: 1.0
In-Reply-To: <20190414105019.5bac65d3@collabora.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190428_052054_735358_E773B4F9 
X-CRM114-Status: GOOD (  16.64  )
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Richard Weinberger <richard@nod.at>, stable@vger.kernel.org,
 Marek Vasut <marek.vasut@gmail.com>, linux-mtd@lists.infradead.org,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 14/4/2019 10:50 AM, Boris Brezillon wrote:
> On Mon,  8 Apr 2019 10:31:45 +0200
> Miquel Raynal <miquel.raynal@bootlin.com> wrote:
> 
>> Since the migration of the driver to stop using the legacy
>> ->select_chip() hook, there is nothing deselecting the target anymore,  
>> thus the selection is not forced at the next access. Ensure the ND_RUN
>> bit and the interrupts are always in a clean state.
>>
>> Cc: Daniel Mack <daniel@zonque.org>
>> Cc: stable@vger.kernel.org
>> Fixes: b25251414f6e00 ("mtd: rawnand: marvell: Stop implementing ->select_chip()")
>> Suggested-by: Boris Brezillon <boris.brezillon@collabora.com>
>> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> 
> Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>

Has this one been queued in any tree yet?



Thanks,
Daniel




> 
>> ---
>>
>> Changes in v2:
>> * Also include the reset of the interrupts each time
>>   marvell_nfc_select_target() is called.
>>
>>  drivers/mtd/nand/raw/marvell_nand.c | 12 ++++++------
>>  1 file changed, 6 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/mtd/nand/raw/marvell_nand.c b/drivers/mtd/nand/raw/marvell_nand.c
>> index f38e5c1b87e4..d984538980e2 100644
>> --- a/drivers/mtd/nand/raw/marvell_nand.c
>> +++ b/drivers/mtd/nand/raw/marvell_nand.c
>> @@ -722,12 +722,6 @@ static void marvell_nfc_select_target(struct nand_chip *chip,
>>  	struct marvell_nfc *nfc = to_marvell_nfc(chip->controller);
>>  	u32 ndcr_generic;
>>  
>> -	if (chip == nfc->selected_chip && die_nr == marvell_nand->selected_die)
>> -		return;
>> -
>> -	writel_relaxed(marvell_nand->ndtr0, nfc->regs + NDTR0);
>> -	writel_relaxed(marvell_nand->ndtr1, nfc->regs + NDTR1);
>> -
>>  	/*
>>  	 * Reset the NDCR register to a clean state for this particular chip,
>>  	 * also clear ND_RUN bit.
>> @@ -739,6 +733,12 @@ static void marvell_nfc_select_target(struct nand_chip *chip,
>>  	/* Also reset the interrupt status register */
>>  	marvell_nfc_clear_int(nfc, NDCR_ALL_INT);
>>  
>> +	if (chip == nfc->selected_chip && die_nr == marvell_nand->selected_die)
>> +		return;
>> +
>> +	writel_relaxed(marvell_nand->ndtr0, nfc->regs + NDTR0);
>> +	writel_relaxed(marvell_nand->ndtr1, nfc->regs + NDTR1);
>> +
>>  	nfc->selected_chip = chip;
>>  	marvell_nand->selected_die = die_nr;
>>  }
> 


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
