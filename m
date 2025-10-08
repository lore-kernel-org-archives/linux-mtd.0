Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D889CAC5BB
	for <linux-mtd@archiver.kernel.org>; Wed,  8 Oct 2025 12:30:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7VJoEcUwdwtdt7b9J7UoROW594ryXINNSO5/nBOdHHY=; b=1aca/863TGyEFu
	zHKgBm12FgO0ydIZSGYQZwahMdgL/rGB7iglv1kqg9FqZCAG8wQr/Cs4tirO8ZkuWfRXa5kw952zI
	GRXHh4HBbT1LXCNdpmgSCaOVcGAd0R61kd8kOPxBVBqYZmV6NiFL5Cq5ppJz74hA2R7IAmFAdhXa+
	PZzW3q9TyVA4BZUvFRtN9TmGe24ZheUy0pNZTdRdCfXORlxompwh9NQt2e+PNfHAG3ceDB5FO/Vpq
	1+jhTJR2Jt0fJwm0kySV0Zk3AbLHyjX3rzmCYYdmWUvKBNdfxj/IofzW61j2oQ0EiK/4ZbNvhBUM8
	s5ymwlZ4o5Q3MbHpbcyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6TJL-00000003ou3-1LdP;
	Wed, 08 Oct 2025 12:30:27 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6TJI-00000003oss-0hB6
	for linux-mtd@lists.infradead.org;
	Wed, 08 Oct 2025 12:30:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 298D84888E;
	Wed,  8 Oct 2025 12:30:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93EA6C116B1;
	Wed,  8 Oct 2025 12:30:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759926623;
	bh=99UtFVSraJXTbEQj4nZPs6lfnYTFkqMP7nINYiynHic=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=mJ+MRx7NyfUJIIbAlwWI8IHTlq14/GShbflZBSlEJrGfgI3C+JGoj8a5KU6O0oPGU
	 I1fOTUvmT0Jj++wu0ntmp+T06T+VsjnaOEEwNESZ1YzZ68hJnXuOa1itRLpHNqP/TL
	 L3D//epe0M7hB4M/h8K5QCf5TdXZ88f3O60/d1hJBHQgpYXIRr3pQ0t6uwi4c4ejXy
	 fEMjlnmLji1c6ReRa9kty3sIOQf0HmHDvP6luF7G+39MR2Mjh3855aZwTSWiCIWcqD
	 EAE8knbjOEPBn3Uy1l2qadno145TBcncp829MB/Dz9M18YswlSSPVkdEdXwLaxuRVM
	 OP/o2HLYQOv8A==
From: Pratyush Yadav <pratyush@kernel.org>
To: Sean Anderson <sean.anderson@linux.dev>
Cc: Pratyush Yadav <pratyush@kernel.org>,  Tudor Ambarus
 <tudor.ambarus@linaro.org>,  Michael Walle <mwalle@kernel.org>,
  linux-mtd@lists.infradead.org,  Richard Weinberger <richard@nod.at>,
  linux-kernel@vger.kernel.org,  Miquel Raynal <miquel.raynal@bootlin.com>,
  Vignesh Raghavendra <vigneshr@ti.com>
Subject: Re: [PATCH] mtd: spi-nor: Enable locking for n25q00a
In-Reply-To: <4888cefa-e8be-4f0d-9d4a-c82f9ff6cda0@linux.dev> (Sean Anderson's
	message of "Tue, 7 Oct 2025 10:20:01 -0400")
References: <20251006223409.3475001-1-sean.anderson@linux.dev>
	<mafs0ecreontu.fsf@kernel.org>
	<4888cefa-e8be-4f0d-9d4a-c82f9ff6cda0@linux.dev>
Date: Wed, 08 Oct 2025 14:30:20 +0200
Message-ID: <mafs05xcpo9sz.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251008_053024_242464_9E2BD739 
X-CRM114-Status: GOOD (  32.74  )
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

On Tue, Oct 07 2025, Sean Anderson wrote:

> On 10/7/25 09:15, Pratyush Yadav wrote:
>> On Mon, Oct 06 2025, Sean Anderson wrote:
>> 
>>> The datasheet for n25q00a shows that the status register has the same
>>> layout as for n25q00, so use the same flags to enable locking support.
>>> These flags should have been added back in commit 150ccc181588 ("mtd:
>>> spi-nor: Enable locking for n25q128a11"), but they were removed by the
>>> maintainer...
>> 
>> This makes it sound like the maintainer did something wrong, which is
>> not true. Tudor had a good reason for removing them.
>
> I disagree. The maintainer used his position of authority to make the
> submitter second-guess their correct patch.

Sean, you are being very combative over such a small issue. You must
test your changes. This is one of the most basic principles in software
engineering. It was perfectly reasonable from Tudor to push back on
untested changes.

There is no abuse of "position of authority" here. When things break, we
get to do the work of putting the pieces back together. So of course, we
are reluctant to take things that increase this burden for us. Having
contributors test their changes is the simplest of things we ask for to
keep the quality bar.

Beyond that, I'd say that a little politeness goes a long way in life.
Especially towards the people maintaining the software for free that you
(or your employer) use. We are both wasting our energy on this debate.
Please stop. Take a step back and think from the other side's
perspective. And try to work _with_ people, not against them.

>
> These flashes have capacity of greater than the 8 MiB that can be
> protected using 3 BP bits. Micron (and ST before them?) addressed this
> by adding a fourth BP bit. This is consistent across every flash in this
> series, and is clearly documented in every datasheet. Defaulting to 3
> bits is buggy behavior: we should assume flashes behave per their
> datasheets until proven otherwise, especially for less-popular features

If I had a euro every time I found a bug in a datasheet, well, I would
have enough money to at least buy a nice dinner. My point is, datasheets
are not perfect. Only running on real hardware gets you the true
picture.

> that the original submitter may not have tested.
>
> The original patch was entirely correct, and the maintainer's
> justification for removing the second hunk is flawed.
>
>> Jungseung did not
>> have the flash at hand and Tudor didn't want to apply patches that
>> weren't tested. Both were in agreement for removing the n25q00a changes.
>> 
>> If you are going to mention that commit, then mention the full context,
>> and then also mention what has changed since that makes it possible to
>> add those changes back in. Having tested them on the real hardware for
>> example.
>> 
>>>
>>> Signed-off-by: Sean Anderson <sean.anderson@linux.dev>
>>> ---
>>> Tested with a mt25qu01gbbb, which shares the same flash ID.
>> 
>> Ughh, is this another case of flash ID reuse? Do mt25qu and n25q00a
>> flashes behave exactly the same and only have two names? If not, then
>> how do you know if n25q00a will also work with these changes?
>
> I examined the datasheet for the n25q00a and determined that it has the
> same status register layout.

Can you share the links to the datasheets?

Also, test logs would be nice to have.

>
> In fact, every n25q and mt25q flash has the same status register layout,
> which (as noted above) is necessary to support capacities greater than 8
> MiB (and all flashes in this series have such capacity).

Do they behave the same? If not, do you know how they differ? If they
behave differently, we might need to have some code that detects which
one is running. Not necessarily as part of this patch though.

>
> --Sea
>
>>>
>>>  drivers/mtd/spi-nor/micron-st.c | 2 ++
>>>  1 file changed, 2 insertions(+)
>>>
>>> diff --git a/drivers/mtd/spi-nor/micron-st.c b/drivers/mtd/spi-nor/micron-st.c
>>> index 187239ccd549..17c7d6322508 100644
>>> --- a/drivers/mtd/spi-nor/micron-st.c
>>> +++ b/drivers/mtd/spi-nor/micron-st.c
>>> @@ -486,6 +486,8 @@ static const struct flash_info st_nor_parts[] = {
>>>  		.id = SNOR_ID(0x20, 0xbb, 0x21),
>>>  		.name = "n25q00a",
>>>  		.size = SZ_128M,
>>> +		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_4BIT_BP |
>>> +			 SPI_NOR_BP3_SR_BIT6,
>>>  		.no_sfdp_flags = SECT_4K | SPI_NOR_QUAD_READ,
>>>  		.mfr_flags = USE_FSR,
>>>  		.fixups = &n25q00_fixups,
>> 

-- 
Regards,
Pratyush Yadav

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
