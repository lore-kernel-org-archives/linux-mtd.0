Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D87F5C02183
	for <linux-mtd@archiver.kernel.org>; Tue, 14 Jan 2025 19:17:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jhLbh+Eph9rAfCUv4I6TXe0+BPZaRE+xw5nIUMnldE8=; b=DT9l+Jhd/ZlL8r
	nWHDUDJEWdvN3hFNyBMf33GJP3LU50Zd2EBT4AHf/X8V+pbk+scmP5nOaqebMFu+VhV82inWCtOiB
	FSFpRYWUy7ZOGuE50z7n1SlfbZtpaNqWPBrriZAWPRjVTlXtJ3JTcPaDzHqiPm3SpwmY/8JSom9PF
	lrJIxKkVJ4nNU3Szr5M76tc7LB7T1luowVP29tSO8zHw3wxZFmeCnS72nSpZAfeNu5esBbpyDFH/a
	ZZFGWLYKIuoeJVxMp59uXxglt8rlRL4xqHHxd0G13mYA5wiIA53mgjEGYISRUQ/To9HTt0XxZAx57
	eZ3Q1/S6U8WpE88QaeyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXmPq-00000009Vfv-2pe3;
	Tue, 14 Jan 2025 19:17:30 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXlGv-00000009KQO-14Kz
	for linux-mtd@bombadil.infradead.org;
	Tue, 14 Jan 2025 18:04:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:Message-ID:
	Date:References:In-Reply-To:Subject:Cc:To:From:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=U1f+f2+lHWEuS5Y/VAs/gLoM4ZW6lP8Uy19m7HzfeQA=; b=IIh/v6Z8W2tPgy5OiB3teQHCt4
	NvpQYCLwhyOFKkpJQefzNfDEKOP48OqrOOP0APlBKW6wdRV43vMjGqPxKCKHuKj/dtOrchyZklFKu
	L1N28e6zl/R0lIxhE3EDXZmGqFczcIXqY6CiG/iAH+Q5rRtZg5EtXuthAsoq9wj98VriNXJGrdL0u
	IlZSoNbDAYzqBl+sN12hQWPg72GJzkakbWYW+10jOBaQBBhkPg623Ca5jKBOj5i9tYoUbto2xZdue
	QSdhzJarXpcWzHQrwlXFm4vL9OYCFH2zs4bxuI/OvTsejh8a2je9VYSoZTjpCQNIvE5T4aVZiZF0h
	IFS/erBg==;
Received: from nyc.source.kernel.org ([147.75.193.91])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXlGs-0000000AWB8-1vCv
	for linux-mtd@lists.infradead.org;
	Tue, 14 Jan 2025 18:04:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 4812EA41A74;
	Tue, 14 Jan 2025 18:02:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A98FC4CEDD;
	Tue, 14 Jan 2025 18:04:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736877847;
	bh=//WPnkeUMFLdD66obt4Oa+dfDwiQLbntnbgZQ7a/8BQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=h7IsANANpcRvLJ9tMi9aBc9jX6qxstFDBawbQzRm1dRIZ6BIM6YDBOn+EaVOWRPd1
	 dOnxlqnGKVoNmWQ1kPxuKEhFctICyMl8+/rWKfnbCSui9jXKmoguvAW/FM/NsMK/EJ
	 T4hJHBH+bsEEt3C6Hb26VIOvBALcugsuSg0GPzcqYBXAqGy6x4EMnZXyvpeGjdrt+J
	 hAWKg6ktYmQTvn+FRgjGdTC8zi4ztXqCLgKGA9srqjUaJdUujCcpEDUFyJI7WE1Mu2
	 UEUmb60c5hT+5Lk88mR08xl6lcyrrbRrQrsWhwaYGnFiZtZSlHTtr8Znn0VAL3thmC
	 L/dCrb0ZTHcCg==
From: Pratyush Yadav <pratyush@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Pratyush Yadav <pratyush@kernel.org>,  Alexander Stein
 <alexander.stein@ew.tq-group.com>,  tudor.ambarus@linaro.org,
  mwalle@kernel.org,  richard@nod.at,  vigneshr@ti.com,
  linux-mtd@lists.infradead.org,  linux-kernel@vger.kernel.org,
  alvinzhou@mxic.com.tw,  leoyu@mxic.com.tw,  Cheng Ming Lin
 <chengminglin@mxic.com.tw>,  stable@vger.kernel.org,  Cheng Ming Lin
 <linchengming884@gmail.com>
Subject: Re: [PATCH v2 1/1] mtd: spi-nor: core: replace dummy buswidth from
 addr to data
In-Reply-To: <87wmexp9lh.fsf@bootlin.com> (Miquel Raynal's message of "Tue, 14
	Jan 2025 18:51:38 +0100")
References: <20241112075242.174010-1-linchengming884@gmail.com>
	<20241112075242.174010-2-linchengming884@gmail.com>
	<3342163.44csPzL39Z@steina-w> <mafs0zfjt5q3n.fsf@kernel.org>
	<87wmexp9lh.fsf@bootlin.com>
Date: Tue, 14 Jan 2025 18:04:03 +0000
Message-ID: <mafs0ldvd5l2k.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250114_180410_783364_26F3E532 
X-CRM114-Status: GOOD (  28.86  )
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

On Tue, Jan 14 2025, Miquel Raynal wrote:

> Hello Pratyush,
>
> On 14/01/2025 at 16:15:24 GMT, Pratyush Yadav <pratyush@kernel.org> wrote:
>
>>>> --- a/drivers/mtd/spi-nor/core.c
>>>> +++ b/drivers/mtd/spi-nor/core.c
>>>> @@ -89,7 +89,7 @@ void spi_nor_spimem_setup_op(const struct spi_nor *nor,
>>>>  		op->addr.buswidth = spi_nor_get_protocol_addr_nbits(proto);
>>>>  
>>>>  	if (op->dummy.nbytes)
>>>> -		op->dummy.buswidth = spi_nor_get_protocol_addr_nbits(proto);
>>>> +		op->dummy.buswidth = spi_nor_get_protocol_data_nbits(proto);
>
> Facing recently a similar issue myself in the SPI NAND world, I believe
> we should get rid of the notion of bits when it comes to the dummy
> phase. I would appreciate a clarification like "dummy.cycles" which
> would typically not require any bus width implications.

I agree. All peripheral drivers convert cycles to bytes, and controller
drivers convert them back to cycles. This whole thing should be avoided,
especially since it contains some traps with division truncation.

>
> ...
>
>> Most controller's supports_op hook call spi_mem_default_supports_op(),
>> including nxp_fspi_supports_op(). In spi_mem_default_supports_op(),
>> spi_mem_check_buswidth() is called to check if the buswidths for the op
>> can actually be supported by the board's wiring. This wiring information
>> comes from (among other things) the spi-{tx,rx}-bus-width DT properties.
>> Based on these properties, SPI_TX_* or SPI_RX_* flags are set by
>> of_spi_parse_dt(). spi_mem_check_buswidth() then uses these flags to
>> make the decision whether an op can be supported by the board's wiring
>> (in a way, indirectly checking against spi-{rx,tx}-bus-width).
>
> Thanks for the whole explanation, it's pretty clear.
>
>> In arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql.dtsi we have:
>>
>> 	flash0: flash@0 {
>> 		reg = <0>;
>> 		compatible = "jedec,spi-nor";
>> 		spi-max-frequency = <80000000>;
>> 		spi-tx-bus-width = <1>;
>> 		spi-rx-bus-width = <4>;
>>
>> Now the tricky bit here is we do the below in spi_mem_check_buswidth():
>>
>> 	if (op->dummy.nbytes &&
>> 	    spi_check_buswidth_req(mem, op->dummy.buswidth, true))
>> 		return false;
>
> May I challenge this entire section? Is there *any* reason to check
> anything against dummy cycles wrt the width? Maybe a "can handle x
> cycles" check would be interesting though, but I'd go for a different
> helper, that is specific to the dummy cycles.

I suppose you would want to sanity check that the cycles are at least
between 1, 2, 4, or 8 (or at the very least not 0).

>
>> The "true" parameter here means to "treat the op as TX". Since the
>> board only supports 1-bit TX, the 4-bit dummy TX is considered as
>> unsupported, and the op gets rejected. In reality, a dummy phase is
>> neither a RX nor a TX. We should ideally treat it differently, and
>> only check if it is one of 1, 2, 4, or 8, and not test it against the
>> board capabilities at all.
>
> ...
>
>> Since we are quite late in the cycle, and that changing
>> spi_mem_check_buswidth() might cause all sorts of breakages, I think the
>> best idea currently would be to revert this patch, and resend it with
>> the other changes later.
>>
>> Tudor, Michael, Miquel, what do you think about this? We are at rc7 but
>> I think we should send out a fixes PR with a revert. If you agree, I
>> will send out a patch and a PR.
>
> Either way I am fine. the -rc cycles are also available for us to
> settle. But it's true we can bikeshed a little bit, so feel free to
> revert this patch before sending the MR.

To be clear, since the patch was added in v6.13-rc1 I want to revert it
via a fixes pull request to Linus before he releases v6.13 this week. I
want to fix it in v6.13, not in v6.14.

-- 
Regards,
Pratyush Yadav

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
