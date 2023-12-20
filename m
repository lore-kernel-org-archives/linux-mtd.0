Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38939C3DA6E
	for <linux-mtd@archiver.kernel.org>; Wed, 20 Dec 2023 08:50:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XklkMRVJxNat+ZokxN/vG0v8VnBYPOLFXMnknXwLsiY=; b=FUFA8jvFvfEnyO3oasRLb7olsz
	IT83LCrvohTu+weFRkeDqDI5arL2M0mAbDzZqJM38ApA9Kk4HbFPE6wrBU0/c3XgLeNU1EYzgcbcb
	bLtZghleTf2FWNOE4fXeU2oQBIbZSU1QHQcB8yRVVHfV7suAxA522SJ7hIhnSI3z6GrmgPZhXW//x
	Qv2jjbiC7HNtvfYtjNucKUMwv3Tn37G77vy92ahMPqtoP9hPL0UYgYpnDWfy6v4tTefUhpmDRqtVI
	2LbIfp3khNH7vcLLxbyppUzrFbuFlTEPoGu7IaV/yGq4K1TryWTjdOn5XmOgAdBilT4aO657UexEB
	89jHuGdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rFsHw-00Ge2j-0f;
	Wed, 20 Dec 2023 08:50:48 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rFsHs-00Ge2P-32
	for linux-mtd@lists.infradead.org;
	Wed, 20 Dec 2023 08:50:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 6E696B81C21;
	Wed, 20 Dec 2023 08:50:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 176CBC433C9;
	Wed, 20 Dec 2023 08:50:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703062242;
	bh=4xcNzALSNFiLc1ry35wpkMxeDfDdsGo/uw8ell2hdIM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=t8+/0fquGZdv0Wd+/t4iilIAjowf9WDTI6Ca5Ieg48Pc0ZKqa7vQUy/o61cL53dmq
	 3DwrDr/0QU33ppv83GGoEBEhu1xFqKSlgE+dGZUq2bOuvfoIwHxRNbkPKCMJtCxu/Y
	 fmo/gJwRvFdlHwTae6sK1rcQEtt27fGdZrvxiDsoYQsS3JfOVjhn1ljuKyLARfSygL
	 pT6Z6ukHRQW54LbTjxqEavH6jpeFURvBXClHT86RDonpnJdI6Mpw7y1PZ1jX5ajZlh
	 8oYVwF9eGxVOD7ZFgIm9tL6LMTuTI0OXdQT/cVbQXVSbiymvFgzX5SUyDIKqA+LeYm
	 kBC9aPgSlzvnQ==
MIME-Version: 1.0
Date: Wed, 20 Dec 2023 09:50:38 +0100
From: Michael Walle <mwalle@kernel.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Jaime Liao <jaimeliao.tw@gmail.com>, linux-mtd@lists.infradead.org,
 pratyush@kernel.org, miquel.raynal@bootlin.com, leoyu@mxic.com.tw,
 jaimeliao@mxic.com.tw
Subject: Re: [PATCH v2] mtd: spi-nor: core: Discard HW capabilities if no
 enable function
In-Reply-To: <43eac7ba-1648-4e99-80b8-3132523189c7@linaro.org>
References: <20231219102103.92738-1-jaimeliao.tw@gmail.com>
 <43eac7ba-1648-4e99-80b8-3132523189c7@linaro.org>
Message-ID: <0b3aa661e5151aba8e32633e709fdbdc@kernel.org>
X-Sender: mwalle@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231220_005045_251390_47236CF5 
X-CRM114-Status: GOOD (  17.90  )
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

Am 2023-12-20 09:20, schrieb Tudor Ambarus:
> On 19.12.2023 12:21, Jaime Liao wrote:
>> From: JaimeLiao <jaimeliao@mxic.com.tw>
>> 
>> Discard corresponding HW capabilities to prevent carrying the
>> wrong protocol if no QUAD/Octal DTR enable function hooked.
>> 
>> Signed-off-by: JaimeLiao <jaimeliao@mxic.com.tw>
>> ---
>> changes in v2
>>  - Add SNOR_HWCAPS_8_8_8_DTR
>>  - Restore the enable function judgement in spi_nor_set_octal_dtr()
>>  - Restore the enable function judgement in spi_nor_quad_enable()
>> ---
>>  drivers/mtd/spi-nor/core.c  | 7 +++++++
>>  include/linux/mtd/spi-nor.h | 6 ++++++
>>  2 files changed, 13 insertions(+)
>> 
>> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
>> index 1c443fe568cf..14359101c6cf 100644
>> --- a/drivers/mtd/spi-nor/core.c
>> +++ b/drivers/mtd/spi-nor/core.c
>> @@ -2621,6 +2621,13 @@ static int spi_nor_default_setup(struct spi_nor 
>> *nor,
>>  	 */
>>  	shared_mask = hwcaps->mask & params->hwcaps.mask;
>> 
>> +	/* Mask out Octal DTR if no enable function */
>> +	if (!params->set_octal_dtr)
>> +		shared_mask &= ~SNOR_HWCAPS_8_8_8_DTR;
>> +
>> +	if (!params->quad_enable)
>> +		shared_mask &= ~SNOR_HWCAPS_4_4_4;
> 
> and these should have been in the late init hook, and instead discard
> them from the params->hwcaps.mask.

Maybe there is a better place to mask these bits. But IMHO the core
should do it on itself and we shouldn't need to provide an extra
hook function for every driver ourselves. The core knows that there
is no .octal_enable op and thus it shouldn't even try to enable
this mode.

> And why is this extra check needed in the first place? For octal I
> assume it's needed by macronix, where the flash is octal capable, but
> there's no octal enable method defined yet.

Because it is the generic spi nor flash driver, which doesn't provide
any of these enable x-mode helpers.

> What about the quad mode? Is
> there any flash that has no quad enable method defined but still caries
> quad mode in its hwcaps?

No it is for completeness and correctness. At the moment we are always
setting a (random) default quad enable op, due to legacy reasons.

-michael

>> +
>>  	if (nor->spimem) {
>>  		/*
>>  		 * When called from spi_nor_probe(), all caps are set and we
>> diff --git a/include/linux/mtd/spi-nor.h b/include/linux/mtd/spi-nor.h
>> index cdcfe0fd2e7d..78a119192ee0 100644
>> --- a/include/linux/mtd/spi-nor.h
>> +++ b/include/linux/mtd/spi-nor.h
>> @@ -266,6 +266,12 @@ struct spi_nor_hwcaps {
>>  #define SNOR_HWCAPS_PP_8_8_8		BIT(22)
>>  #define SNOR_HWCAPS_PP_8_8_8_DTR	BIT(23)
>> 
>> +#define SNOR_HWCAPS_4_4_4	(SNOR_HWCAPS_READ_4_4_4 |	\
>> +				 SNOR_HWCAPS_PP_4_4_4)
>> +
>> +#define SNOR_HWCAPS_8_8_8_DTR	(SNOR_HWCAPS_READ_8_8_8_DTR |	\
>> +				 SNOR_HWCAPS_PP_8_8_8_DTR)
>> +
>>  #define SNOR_HWCAPS_X_X_X	(SNOR_HWCAPS_READ_2_2_2 |	\
>>  				 SNOR_HWCAPS_READ_4_4_4 |	\
>>  				 SNOR_HWCAPS_READ_8_8_8 |	\

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
