Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9D18C47422
	for <linux-mtd@archiver.kernel.org>; Mon, 29 Jan 2024 13:34:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qp4tTVOx712A5WKdnKeZgqF5gX+6pPHa65rCQOG/7wg=; b=dW1Cm6ZsvLLAJm
	S3Fp6jrJ5FY4lO5yqQQlyIlXujFlPfkHT/z0JebfCISs0Mjq0PV3qIEp/WfGYFE3wWgDSi6ojvH/b
	rRj4A24ViZyLWQ7+QJsjwp9hLHOvjcXppYmPdF2Bfl5/lJIfJjx80h7VUCLv1E6QVMlbnPwAQjYcy
	J6WVrDkG6UlICNmNA2NeGiL9oqElyCNvVxbpFEgG/sBJ+VifTy1uDtCbxBX0vJ9bT1oKZagiB2i5o
	WHMrRP+mQlnn90mkSb1gFGcx2U7zdwTOZ/Hnz9rIrl8mIVEE0eoYaV2AZ54dzbysx7SrURFeeYB0A
	OkWPCD4ZWdFDZ1ptWw6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rURmP-0000000CtQ0-4BG4;
	Mon, 29 Jan 2024 13:34:29 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rURmM-0000000CtP8-4BHz
	for linux-mtd@lists.infradead.org;
	Mon, 29 Jan 2024 13:34:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D52EA621B8;
	Mon, 29 Jan 2024 13:34:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58B50C433F1;
	Mon, 29 Jan 2024 13:34:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706535262;
	bh=Y32Ro5hXWgmbKAtIr0bWdglhv9oAGAt86HXcokVaqoo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=tFGCjtsqpCEdO0JDTVGrqvdHwzKxH7Y9iuq0p9pfWkGybaBpGSKQMDua/IPS4l4qq
	 cWvRe1qQ50t/XO2y4GlrTjsO9fPe3QfwGQ55yRLs+idMjYao08vvU6pnriLb23QpgA
	 SNZCaRtJ6nYnOjMdG6hGcK2PdGP06ISk2KzdzcZBy2RjePiMOAIuKTkJi1+H6djk9g
	 EQeY3K1rQvPUrtRmV8cjcAhKLIBnE42RqtS+vYH28qQi3NV8+zGvvG9E5rOAFGrvoI
	 lAVtgE7OwVaQ0p55xvlxGlLYmotph51SKpToeLtJguEkGC5MoNEEw8sbnfiCj90/N7
	 FGEQN6gRKdz1A==
From: Pratyush Yadav <pratyush@kernel.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Pratyush Yadav <pratyush@kernel.org>,  michael@walle.cc,
  miquel.raynal@bootlin.com,  richard@nod.at,  jaimeliao@mxic.com.tw,
  linux-mtd@lists.infradead.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/4] mtd: spi-nor: drop superfluous debug prints
In-Reply-To: <99babcb3-770d-487c-a297-beea2f6f8e9e@linaro.org> (Tudor
	Ambarus's message of "Mon, 29 Jan 2024 13:27:50 +0000")
References: <20231215082138.16063-1-tudor.ambarus@linaro.org>
	<20231215082138.16063-5-tudor.ambarus@linaro.org>
	<120bf090-0c07-4971-a18a-a1b326f1b139@linaro.org>
	<mafs0v87cs238.fsf@kernel.org>
	<99babcb3-770d-487c-a297-beea2f6f8e9e@linaro.org>
Date: Mon, 29 Jan 2024 14:34:20 +0100
Message-ID: <mafs0r0i0s1pf.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240129_053427_123302_336ED2CD 
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Mon, Jan 29 2024, Tudor Ambarus wrote:

> On 1/29/24 13:26, Pratyush Yadav wrote:
>> On Fri, Dec 15 2023, Tudor Ambarus wrote:
>> 
>>> I missed to drop some unused variables. Will drop them if everything
>>> else is fine.
>>>
>>> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
>>> index a708c3448809..92c992eb73d5 100644
>>> --- a/drivers/mtd/spi-nor/core.c
>>> +++ b/drivers/mtd/spi-nor/core.c
>>> @@ -3492,9 +3492,7 @@ int spi_nor_scan(struct spi_nor *nor, const char
>>> *name,
>>>  {
>>>         const struct flash_info *info;
>>>         struct device *dev = nor->dev;
>>> -       struct mtd_info *mtd = &nor->mtd;
>>>         int ret;
>>> -       int i;
>>>
>>>         ret = spi_nor_check(nor);
>>>         if (ret)
>> 
>> 
>> With these, 
>> 
>> Reviewed-by: Pratyush Yadav <pratyush@kernel.org>
>> 
> Hi, Pratyush,
>
> All in these series were already applied, as I specified in a reply.
> Please check patchwork for patches that are not yet handled.

Ah sorry, I didn't see that. I was browsing through my email backlog and
these patches just caught my eye.

Will look at the newer ones.

-- 
Regards,
Pratyush Yadav

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
