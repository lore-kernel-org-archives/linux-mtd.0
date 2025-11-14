Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FB93CE7B1B
	for <linux-mtd@archiver.kernel.org>; Fri, 14 Nov 2025 15:14:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wB2COiThamzQOUSzv/sfT052UBjtMKuXcOJ5RHrKL0I=; b=NIy6orgFSePXKh
	PueWjHN7uvujT4yYhEZq/Pq46ca4OkMNgrPLcFLpJYf95Bb0/nKyK0z1F4ujmvl/S9OTaPV4Ync8C
	ZzZ5KvUU90HMOIkx5RdYuj2iHjQnYTSNXQJqLA5e5tWIUz3LkfQnvKm2QFf3VHDio7sK971TfQzY+
	2jwybsTLYdw+5YgzeOZ0dd0hONTve0toTDfL/sAUsFZaMEZmyivW+ujE79xa6EfcPMZ7vC4oVj2/d
	gzU1SsMHa9Io6FXhP/kij3BLdSyUUXIWmFxVTYADuPn9MRdlRKqVoRGnxexCWI29HMYpOTct9yKsv
	CqnBvlvY8B7ahz/KnyVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJvVO-0000000CTyb-24bC;
	Fri, 14 Nov 2025 15:14:30 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJvVM-0000000CTxj-2aYR
	for linux-mtd@lists.infradead.org;
	Fri, 14 Nov 2025 15:14:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id BF54460121;
	Fri, 14 Nov 2025 15:14:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0DEDBC4CEFB;
	Fri, 14 Nov 2025 15:14:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763133267;
	bh=D8PBCWGceZcRoTf8sqvXnJ6wWhPoF7TXNW7mHGjQzcA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=sEeR7wayvKjx57rYbjEy+ERJ3r03RHxnkoH371bvHG0GROQSiZqZvhoucVG6/hgDL
	 BYkCg8dESvpI+NwsedTWunux/C/NzxUapma3Dh1HAllf/+QYpYaFdYdNG9407m37m7
	 nPoHNgQIullGExvYZqcoLxYvXTJvAXxcfTl9t9IDx8t55dG5fZo6ejpwsEJLBNT13S
	 7N4yoj2RCibkmG3+ZTy7NoRDTKtOxSxwp2zNrhr8jHuKxA0gYeQ2UbFA9bNv0rO2fv
	 BMEGaAIS2svp7k47/EBitqsNzwZKn+jiSX0nKx55LiQk8msewheYU71ELvW97VMy27
	 UoUl8GNUn5c7Q==
From: Pratyush Yadav <pratyush@kernel.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Pratyush Yadav <pratyush@kernel.org>,  Haibo Chen <haibo.chen@nxp.com>,
  Michael Walle <mwalle@kernel.org>,  Miquel Raynal
 <miquel.raynal@bootlin.com>,  Richard Weinberger <richard@nod.at>,
  Vignesh Raghavendra <vigneshr@ti.com>,  linux-mtd@lists.infradead.org,
  linux-kernel@vger.kernel.org,  imx@lists.linux.dev
Subject: Re: [PATCH v4 5/5] mtd: spi-nor: micron-st: add comment for
 mt35xu02gcba
In-Reply-To: <a7c3db5c-bad5-401a-ac97-d59f81950b92@linaro.org> (Tudor
	Ambarus's message of "Thu, 13 Nov 2025 17:42:06 +0200")
References: <20251112-nor-v4-0-e4637be82a0a@nxp.com>
	<20251112-nor-v4-5-e4637be82a0a@nxp.com> <mafs08qga9ehe.fsf@kernel.org>
	<a7c3db5c-bad5-401a-ac97-d59f81950b92@linaro.org>
Date: Fri, 14 Nov 2025 16:14:24 +0100
Message-ID: <mafs0wm3s8x4f.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
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

On Thu, Nov 13 2025, Tudor Ambarus wrote:

> On 11/13/25 4:47 PM, Pratyush Yadav wrote:
>
> Hi!
>
>> On Wed, Nov 12 2025, Haibo Chen wrote:
>> 
>>> The MT35XU02GCBA flash device does not support chip erase,
>>> according to its datasheet. It supports die erase, which
>>> means the current driver implementation will likely need
>>> to be converted to use die erase.
>>>
>>> Furthermore, similar to the MT35XU01GBBA, the
>>> SPI_NOR_IO_MODE_EN_VOLATILE flag probably needs to be enabled.
>>>
>>> Link: https://datasheet.octopart.com/MT35XU02GCBA1G12-0AAT-Micron-datasheet-138896808.pdf
>>> Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>
>>> Signed-off-by: Haibo Chen <haibo.chen@nxp.com>
>>> ---
>>>  drivers/mtd/spi-nor/micron-st.c | 10 ++++++++++
>>>  1 file changed, 10 insertions(+)
>>>
>>> diff --git a/drivers/mtd/spi-nor/micron-st.c b/drivers/mtd/spi-nor/micron-st.c
>>> index c89c06b1fc61a581fea2e18732be2501a15715f9..f94e9d2d17bf4aa7c36ba3aa37d34f767a9f93ac 100644
>>> --- a/drivers/mtd/spi-nor/micron-st.c
>>> +++ b/drivers/mtd/spi-nor/micron-st.c
>>> @@ -204,6 +204,16 @@ static const struct flash_info micron_nor_parts[] = {
>>>  		.fixup_flags = SPI_NOR_IO_MODE_EN_VOLATILE,
>>>  		.fixups = &mt35xu01gbba_fixups,
>>>  	}, {
>>> +		/*
>>> +		 * The MT35XU02GCBA flash device does not support
>>> +		 * chip erase, according to its datasheet.
>>> +		 * It supports die erase, which means the current
>>> +		 * driver implementation will likely need to be
>>> +		 * converted to use die erase.
>>> +		 * Furthermore, similar to the MT35XU01GBBA, the
>>> +		 * SPI_NOR_IO_MODE_EN_VOLATILE flag probably needs
>>> +		 * to be enabled.
>>> +		 */
>> 
>> Maybe I am missing some context from previous patches, but why are we
>> adding this comment here instead of fixing the support for this flash?
>> What does "the driver will likely need to be converted to use die erase"
>> mean? If it doesn't support chip erase, then it _does_ need to be fixed
>> by using die erase.
>> 
>> Also, why does the flash "probably" need SPI_NOR_IO_MODE_EN_VOLATILE?
>> Are you guessing based on datasheet and do not have the hardware at
>> hand?
>
> Yes, no hardware at hand. He can test with mt35xu01gbba which is a smaller
> flash that share the datasheet with this flash, so that's why the TODO
> and not a direct change.

Okay, fair enough. I think the wording of the comment and commit message
are kind of vague though. So I will do some massaging when applying.

[...]

-- 
Regards,
Pratyush Yadav

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
