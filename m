Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B013C4345F
	for <linux-mtd@archiver.kernel.org>; Wed, 17 Apr 2024 15:53:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QH8K66Jlu9FgHsRlTbGyHaaMBwMu0hDZcO2KTNq25LU=; b=NdIyRZ382VGD5C
	FJUKUAxhAsAWmNRxTwgx2ohjiMoKNNpz3vw5Soh9/EMZry25BjsRf8SZgyB54ZTBGUc+hW1PIrR+u
	K/InEZHZGtP/QhoPBbc/d7LpCMr8/kBsHv6kxsxhe4/W3IlVK8oywp/ZW+l4jwjpV7oIqHjvckZSR
	BWQ2aQemEu7fudwmPzEKPUEyo6CFaGtbmpXucqfpADLdaXmuDbOkiQ0nnVmv9+Uf9l/mGeeBtptWD
	pY8SYY7MmeXb6WZWiUY98ztSfNkG5Q2/E5HyfVFen/v8kgS5tr3useNH9Cc54OxakX2XqkmZvE1a2
	C7U6j1gBLkJDvLLwMa+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rx7ak-0000000GgxT-2MuG;
	Wed, 17 Apr 2024 15:52:58 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rx7ah-0000000GgvK-1t3g
	for linux-mtd@lists.infradead.org;
	Wed, 17 Apr 2024 15:52:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id A665DCE13D4;
	Wed, 17 Apr 2024 15:52:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD53DC072AA;
	Wed, 17 Apr 2024 15:52:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713369171;
	bh=PPbz4GQko4hF53ZUDpAq+ldibdDOErHuto8pYcPk6q4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=ciwVHW4n6USeccR2haG+D9uXoealdrd0Z+p3ZSgcrNU41N+kELim1UB/hvy0LvOcz
	 LeHPNW3ddo4z4H0/t2ZtSd24wleMkGWd7wAujY42CmqIxhNEdZPorzVjueE5CHtTpx
	 u6nDRs7PIkmzrg4ilIPlsYIOZ/0hP46tVzjVhGnw3BOMD62Tj1+Y2QDMniZpY7mXN5
	 5jr2vHcCOFF/mMMY+5WMXiltp2w1pPb22BZkUNwerGMrPhPDHAGWvduDGP4f2dJY/O
	 9dK5gZFCrBUPRtkigrvWm78FqcL2KeVulVIl+PnfOLcnt7uYy+oHH5iK9FZUYvS8Q4
	 8qSJKPs4YDNbw==
From: Pratyush Yadav <pratyush@kernel.org>
To: "Michael Walle" <mwalle@kernel.org>
Cc: "Pratyush Yadav" <pratyush@kernel.org>,  "Tudor Ambarus"
 <tudor.ambarus@linaro.org>,  "Miquel Raynal" <miquel.raynal@bootlin.com>,
  "Richard Weinberger" <richard@nod.at>,  "Vignesh Raghavendra"
 <vigneshr@ti.com>,  <linux-kernel@vger.kernel.org>,
  <linux-mtd@lists.infradead.org>
Subject: Re: [RFC PATCH v1 6/6] mtd: spi-nor: introduce support for
 displaying deprecation message
In-Reply-To: <D0MHEH8OOS44.2PPBZ3LFU4QG3@kernel.org> (Michael Walle's message
	of "Wed, 17 Apr 2024 16:52:42 +0200")
References: <20240412134405.381832-1-mwalle@kernel.org>
	<20240412134405.381832-7-mwalle@kernel.org>
	<mafs0jzkw6oq1.fsf@kernel.org> <D0MHEH8OOS44.2PPBZ3LFU4QG3@kernel.org>
Date: Wed, 17 Apr 2024 17:52:48 +0200
Message-ID: <mafs0bk686l67.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240417_085255_890665_95B86B9C 
X-CRM114-Status: GOOD (  43.04  )
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

On Wed, Apr 17 2024, Michael Walle wrote:

> Hi,
>
> On Wed Apr 17, 2024 at 4:36 PM CEST, Pratyush Yadav wrote:
>> On Fri, Apr 12 2024, Michael Walle wrote:
>>
>> > SPI-NOR will automatically detect the attached flash device most of the
>> > time. We cannot easily find out if boards are using a given flash.
>> > Therefore, introduce a (temporary) flag to display a message on boot if
>>
>> Why temporary? There will always be a need to deprecate one flash or
>> another. Might as well keep the flag around.
>
> Mh, yes I agree. That also means that this flag will not have any
> users (most) of the time (hopefully ;) ).
>
>> Also, this patch/series does not add any users of the deprecated flag.
>> If you have some flashes in mind, it would be good to add them to the
>> patch/series.
>
> This is just an RFC to see if whether you Tudor agree with me :) But
> I was about to add it to the evervision/cypress FRAMs.
>
>> I like the idea in general. Do you think we should also print a rough
>> date for the deprecation as well?
>
> Might make sense, any suggestions?

How about a simple string to flash_info?

/**
 * struct flash_info - SPI NOR flash_info entry.
 * @id:   pointer to struct spi_nor_id or NULL, which means "no ID" (mostly
 *        older chips).
 * @name: (obsolete) the name of the flash. Do not set it for new additions.
 * @size:           the size of the flash in bytes.
 * @deprecation_date: The date after which the support for this flash will be
 *                    removed.
 * [...]
 */
struct flash_info {
	char *name;
	const struct spi_nor_id *id;
	char *deprecation_date;
	[...]
}

And then in everspin.c for example,

	{
		.name = "mr25h128",
		.size = SZ_16K,
		.sector_size = SZ_16K,
		.addr_nbytes = 2,
		.flags = SPI_NOR_NO_ERASE | SPI_NOR_NO_FR,
		.deprecation_date = "2025-01-01",
	}, {

And in spi_nor_get_flash_info() (changed some wording of the message):

	info = jinfo ?: info;

	if (info->deprecation_date)
		pr_warn("Your board or device tree is using a SPI NOR flash (%s) with\n"
			"deprecated driver support. It can be removed in any kernel\n"
			"version after %s. If you feel this shouldn't be the case, please contact\n"
			"us at linux-mtd@lists.infradead.org\n", info->name,
			info->deprecation_date);

	return info;

This would also remove the need for SPI_NOR_DEPRECATED. But it would
make the flash_info 4 or 8 bytes larger.

What do you think?

>
>> > support for a given flash device is scheduled to be removed in the
>> > future.
>> >
>> > Signed-off-by: Michael Walle <mwalle@kernel.org>
>> > ---
>> >  drivers/mtd/spi-nor/core.c | 12 ++++++++++++
>> >  drivers/mtd/spi-nor/core.h |  1 +
>> >  2 files changed, 13 insertions(+)
>> >
>> > diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
>> > index 58d310427d35..a294eef2e34a 100644
>> > --- a/drivers/mtd/spi-nor/core.c
>> > +++ b/drivers/mtd/spi-nor/core.c
>> > @@ -3312,6 +3312,7 @@ static const struct flash_info *spi_nor_get_flash_info(struct spi_nor *nor,
>> >  						       const char *name)
>> >  {
>> >  	const struct flash_info *jinfo = NULL, *info = NULL;
>> > +	const char *deprecated = NULL;
>> >  
>> >  	if (name)
>> >  		info = spi_nor_match_name(nor, name);
>> > @@ -3326,6 +3327,17 @@ static const struct flash_info *spi_nor_get_flash_info(struct spi_nor *nor,
>> >  			return jinfo;
>> >  	}
>> >  
>> > +	if (info && (info->flags & SPI_NOR_DEPRECATED))
>> > +		deprecated = info->name;
>> > +	else if (jinfo && (jinfo->flags & SPI_NOR_DEPRECATED))
>> > +		deprecated = jinfo->name;
>> > +
>> > +	if (deprecated)
>> > +		pr_warn("Your board or device tree is using a SPI NOR flash (%s) with\n"
>> > +			"deprecated driver support. It will be removed in future kernel\n"
>>
>> Nit: "removed in a future kernel version"
>>
>> > +			"version. If you feel this shouldn't be the case, please contact\n"
>> > +			"us at linux-mtd@lists.infradead.org\n", deprecated);
>> > +
>>
>> Hmm, this isn't so nice. I'd suggest doing something like:
>>
>> 	/*
>>          * If caller has specified name of flash model that can normally be
>>          * ...
>>          */
>> 	info = jinfo ?: info;
>>
>> 	if (info->flags & SPI_NOR_DEPRECATED)
>>         	pr_warn(...);
>
> Actually, I had that, *but* I was thinking we might only check the
> detected flash and not the one specified in the device tree. But
> thinking about that again, I guess it makes sense because:
>  - that's the actually used flash driver
>  - having jinfo != info will print that other warning, thus this
>    case is hopefully very unlikely.
>
>>
>> 	return info;
>>
>> >  	/*
>> >  	 * If caller has specified name of flash model that can normally be
>> >  	 * detected using JEDEC, let's verify it.
>> > diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
>> > index 8552e31b1b07..0317d8e253f4 100644
>> > --- a/drivers/mtd/spi-nor/core.h
>> > +++ b/drivers/mtd/spi-nor/core.h
>> > @@ -524,6 +524,7 @@ struct flash_info {
>> >  #define SPI_NOR_NO_ERASE		BIT(6)
>> >  #define SPI_NOR_QUAD_PP			BIT(8)
>> >  #define SPI_NOR_RWW			BIT(9)
>> > +#define SPI_NOR_DEPRECATED		BIT(15)
>>
>> If you do agree with my suggestion of making it permanent, would it make
>> more sense to make it BIT(10) instead. Or BIT(9) once you move up the
>> others because we no longer have BIT(7).
>
> Or just BIT(7) and avoid any code churn :)

Yep, that works.

>
> -michael
>
>>
>> >  
>> >  	u8 no_sfdp_flags;
>> >  #define SPI_NOR_SKIP_SFDP		BIT(0)
>

-- 
Regards,
Pratyush Yadav

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
