Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DE67CCA476
	for <linux-mtd@archiver.kernel.org>; Tue,  7 Oct 2025 14:20:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YFOf93mqw6aarnPvdcgRT0xEfF4MeyLIfY03itDSCCY=; b=F9iPbH4v0OYY2y
	lG69+chH+N9s61S21eZSujgtwopb5G3McAEKaFRvvqniEE9u0sLjHJj0ij05SmzxvIWN1h4YgcbiF
	R6v8ioZiqSBRZfFGId9+AwAvSi0+zKw50VY47UgYe5qyO01ojHt2N0B75X9Dvr+g7kLfL6yKQt5Ag
	TVZT5BxuErovKdq1UZl4IZxgMSO/11uXj/SiQ4jrTADGcHhnYRjPuUm51NAY+fU2RO4TZpEfDK3lB
	KlBmg04mlmiTEVnzCSWQFO5qBBNHapqSnE0nQ+W1eUMuPGSv6RrOyXQRIvXMYElQvNLtd1f30FfNo
	Ve3Vy7zz8iItxh7vaIxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v68Y0-00000002ALG-0LYD;
	Tue, 07 Oct 2025 14:20:12 +0000
Received: from out-189.mta0.migadu.com ([2001:41d0:1004:224b::bd])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v68Xx-00000002AJO-3cfr
	for linux-mtd@lists.infradead.org;
	Tue, 07 Oct 2025 14:20:11 +0000
Message-ID: <4888cefa-e8be-4f0d-9d4a-c82f9ff6cda0@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1759846806;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ngYQpH36569K++7CCAQsgIJKCzPaP0ImpmBI/4BGpek=;
	b=HYz0w0ocj3aTEHZBOXPy4bsjjc6WbH9bd6NEk2nD/pGsK3BaVcHhRV7ggaCHI0sXHAp3gm
	bIY2bUbzY8r4VuoZrfWcOpOsn2lEujFF7DoeqEOrbmbjMI3W8a7IltVhjgR/K3Hu+j3yp/
	EKKvz/jrdSgaLy2uUnQgZ+j6QHlEn9Q=
Date: Tue, 7 Oct 2025 10:20:01 -0400
MIME-Version: 1.0
Subject: Re: [PATCH] mtd: spi-nor: Enable locking for n25q00a
To: Pratyush Yadav <pratyush@kernel.org>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>,
 Michael Walle <mwalle@kernel.org>, linux-mtd@lists.infradead.org,
 Richard Weinberger <richard@nod.at>, linux-kernel@vger.kernel.org,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Vignesh Raghavendra <vigneshr@ti.com>
References: <20251006223409.3475001-1-sean.anderson@linux.dev>
 <mafs0ecreontu.fsf@kernel.org>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Sean Anderson <sean.anderson@linux.dev>
In-Reply-To: <mafs0ecreontu.fsf@kernel.org>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251007_072010_055975_99B2B42B 
X-CRM114-Status: GOOD (  24.61  )
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

On 10/7/25 09:15, Pratyush Yadav wrote:
> On Mon, Oct 06 2025, Sean Anderson wrote:
> 
>> The datasheet for n25q00a shows that the status register has the same
>> layout as for n25q00, so use the same flags to enable locking support.
>> These flags should have been added back in commit 150ccc181588 ("mtd:
>> spi-nor: Enable locking for n25q128a11"), but they were removed by the
>> maintainer...
> 
> This makes it sound like the maintainer did something wrong, which is
> not true. Tudor had a good reason for removing them.

I disagree. The maintainer used his position of authority to make the
submitter second-guess their correct patch.

These flashes have capacity of greater than the 8 MiB that can be
protected using 3 BP bits. Micron (and ST before them?) addressed this
by adding a fourth BP bit. This is consistent across every flash in this
series, and is clearly documented in every datasheet. Defaulting to 3
bits is buggy behavior: we should assume flashes behave per their
datasheets until proven otherwise, especially for less-popular features
that the original submitter may not have tested.

The original patch was entirely correct, and the maintainer's
justification for removing the second hunk is flawed.

> Jungseung did not
> have the flash at hand and Tudor didn't want to apply patches that
> weren't tested. Both were in agreement for removing the n25q00a changes.
> 
> If you are going to mention that commit, then mention the full context,
> and then also mention what has changed since that makes it possible to
> add those changes back in. Having tested them on the real hardware for
> example.
> 
>>
>> Signed-off-by: Sean Anderson <sean.anderson@linux.dev>
>> ---
>> Tested with a mt25qu01gbbb, which shares the same flash ID.
> 
> Ughh, is this another case of flash ID reuse? Do mt25qu and n25q00a
> flashes behave exactly the same and only have two names? If not, then
> how do you know if n25q00a will also work with these changes?

I examined the datasheet for the n25q00a and determined that it has the
same status register layout.

In fact, every n25q and mt25q flash has the same status register layout,
which (as noted above) is necessary to support capacities greater than 8
MiB (and all flashes in this series have such capacity).

--Sea

>>
>>  drivers/mtd/spi-nor/micron-st.c | 2 ++
>>  1 file changed, 2 insertions(+)
>>
>> diff --git a/drivers/mtd/spi-nor/micron-st.c b/drivers/mtd/spi-nor/micron-st.c
>> index 187239ccd549..17c7d6322508 100644
>> --- a/drivers/mtd/spi-nor/micron-st.c
>> +++ b/drivers/mtd/spi-nor/micron-st.c
>> @@ -486,6 +486,8 @@ static const struct flash_info st_nor_parts[] = {
>>  		.id = SNOR_ID(0x20, 0xbb, 0x21),
>>  		.name = "n25q00a",
>>  		.size = SZ_128M,
>> +		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_4BIT_BP |
>> +			 SPI_NOR_BP3_SR_BIT6,
>>  		.no_sfdp_flags = SECT_4K | SPI_NOR_QUAD_READ,
>>  		.mfr_flags = USE_FSR,
>>  		.fixups = &n25q00_fixups,
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
