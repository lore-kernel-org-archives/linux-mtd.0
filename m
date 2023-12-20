Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1954CC3DA6E
	for <linux-mtd@archiver.kernel.org>; Wed, 20 Dec 2023 08:43:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T8uUg+DtdrEwvCloi8PPIMEZimGOaPFu1HoxHIeh/ik=; b=ngXRyqMlG0aMzReXTLiKHdAHdg
	vmaF2bv5Hd9ERPngNQYYiZ+fyqs75B5aQ6QiYFHfTbb5m7If9wGp2jp7RDYfFntpIW0fZgTjIvZCn
	nweQMK5p0SdKTP0FH5d7ScKJgJeLiEosRL29tqQ1JcAD0XK5/CQZ3hEgf7Xu61S1ifRZr5MXYrSnX
	ikjQyRnh+QpK/x9cFcHlRo5bDTszZRANA5knPrEZ4fey5rmPV+l0+OIeK1lQn6TnbXJIZxplm99sV
	M29tx3iGIFGkqiRqPYqKywqle6JZrG1Ev6+gsVzB0O+lxakGybKjSLAMfCRneambl7nf/ovsHaegu
	47T5uviw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rFsAp-00Gc9V-0V;
	Wed, 20 Dec 2023 08:43:27 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rFsAm-00Gc8K-1u
	for linux-mtd@lists.infradead.org;
	Wed, 20 Dec 2023 08:43:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 1AC72CE1C14;
	Wed, 20 Dec 2023 08:43:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC673C433C7;
	Wed, 20 Dec 2023 08:43:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703061801;
	bh=xSc+t7D36iBQKF/1TqvRmJQLPiOJdUfd5Yuwsu1fayE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=QQVQV93Ou+n0ewhkrx0qBRGvO/m9gJYUL7I4NPUmhV0+muaqeFLdP+Ief1fK2ufBl
	 ePbqVciBfLZ0gQXBiKWBXm88ijVCPv4YZ/DIaH+Wcf4zLD2SarAgdzwPW2eFp7Eqdt
	 Sgca0eIwggYlwhWTD3A2jH2HIwpj6TOmt3Q5tR7N+orsjcZ54d2306NY15uUU3NM5B
	 bmQNzz3wgnBnsIG26uY1qr2AbIHi9t54udd+suwcr/3clxbiet8BW+xTLdgdwv5IKy
	 xNF2molsNPM+WA5DK9U6bANdfOLyfnzuhg6vTH0ddQJ7XF+MQ8LDt3WIvV0Uxzm1z5
	 rBLC9Orq18pFw==
MIME-Version: 1.0
Date: Wed, 20 Dec 2023 09:43:16 +0100
From: Michael Walle <mwalle@kernel.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Jaime Liao <jaimeliao.tw@gmail.com>, linux-mtd@lists.infradead.org,
 pratyush@kernel.org, miquel.raynal@bootlin.com, leoyu@mxic.com.tw,
 jaimeliao@mxic.com.tw
Subject: Re: [PATCH v2] mtd: spi-nor: core: Discard HW capabilities if no
 enable function
In-Reply-To: <b33b7841-d68e-4576-b8e5-72eab04fce2d@linaro.org>
References: <20231219102103.92738-1-jaimeliao.tw@gmail.com>
 <b33b7841-d68e-4576-b8e5-72eab04fce2d@linaro.org>
Message-ID: <aa887159f4d80d575a25a5ae0bc86a19@kernel.org>
X-Sender: mwalle@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231220_004324_866611_E3B9CD19 
X-CRM114-Status: GOOD (  12.02  )
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

Am 2023-12-20 09:07, schrieb Tudor Ambarus:
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
> 
> quad enable applies for 1-1-4 and 1-4-4 as well. How about changing 
> this to:

Of course. You are right. I'm not even sure 4_4_4 falls into the
category for our quad_enable, because there's a special mode,
sometimes called qpi, for opcodes transferred in quad mode.

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
