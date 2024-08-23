Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C287DC531DC
	for <linux-mtd@archiver.kernel.org>; Fri, 23 Aug 2024 16:02:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dxTUzeaYqL3vy49fA5/172EaW7lKHPNByuws1xsRD8k=; b=4H9X/Y/oxq3xfR
	UBpnYqUYvq2qNTfm+QQAvi4d30PudHxLXaC/mOxNiHuZNwzH0glQ+zpHq/Q7xVPA2LlG1lLmZ8u8/
	7xePkDT+Txpp73QjsJFlrBzvyNKX5KiK8uJFRuAy/D+Okr2dqAYb/WxEDXxsZ6xsRwMVGY4SB9OaC
	FUPoC1oZ7QU46c70zpckq7B9J58z6fgYP+XDnlylpy07/U7ryU6ys6fEdP0rPJ3r7wd6zywla07SD
	gGyoTR2b9rnsOpzbXhMKWOHTXtwAWy74yqyj0RtkN7wDK4rX3ZSKL6uLiA+3XGq4I7ROzW7mLQ2WL
	9ER4bd/Z13Pf7ucWm8ZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1shWkB-0000000HRd1-0DXl;
	Fri, 23 Aug 2024 16:02:31 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1shWi8-0000000HR5p-21Ql
	for linux-mtd@lists.infradead.org;
	Fri, 23 Aug 2024 16:00:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8499660AFB;
	Fri, 23 Aug 2024 16:00:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2306C4AF0F;
	Fri, 23 Aug 2024 16:00:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724428823;
	bh=ru7m6fafSWodJPcKQCrlG6ssAX5n5RbDlgVC49TC3sE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=cTjUNOpTu48evto1G1aJTeexiyGElrfpdAGZ3L/WtNHIcbzyeG03Ab4x7PIYpxb+U
	 IbSg8A0m41Sz3SZGJwkbLKTdldykUW/51yxMwXegJ05Xrs9nzKNX42DS1Nelcl4o6/
	 v0TX2M4cGwpkd/0H8eFs8BeaLfoWapTAvRMlI9BnX3b8SBv47OCc3yCz2NaA6V0n4y
	 KXCcSur3atSOO6MGJv2f9Yes0fnZOarrMRQUtH9HeXzBHYjMtgaIj/WxxrUHKIomTb
	 6E16Qpp7qS3WxJDMbivXAc5xkmh2eEP2M9rHABQDbu9pIo94h12a5ClXOOd5JnozkK
	 +Bsz6pizD9Dlw==
From: Pratyush Yadav <pratyush@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Pratyush Yadav <pratyush@kernel.org>,  Richard Weinberger
 <richard@nod.at>,  Vignesh Raghavendra <vigneshr@ti.com>,  Tudor Ambarus
 <tudor.ambarus@linaro.org>,  Michael Walle <michael@walle.cc>,
  <linux-mtd@lists.infradead.org>,  Julien Su <juliensu@mxic.com.tw>,
  Alvin Zhou <alvinzhou@mxic.com.tw>,  Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH 4/9] mtd: spi-nand: Add continuous read support
In-Reply-To: <20240823165155.6c80e43c@xps-13> (Miquel Raynal's message of
	"Fri, 23 Aug 2024 16:51:55 +0200")
References: <20240821162528.218292-1-miquel.raynal@bootlin.com>
	<20240821162528.218292-5-miquel.raynal@bootlin.com>
	<mafs04j7cznwh.fsf@kernel.org> <20240823165155.6c80e43c@xps-13>
Date: Fri, 23 Aug 2024 18:00:20 +0200
Message-ID: <mafs0seuvut4b.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240823_090024_654782_68B6D164 
X-CRM114-Status: GOOD (  31.98  )
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

On Fri, Aug 23 2024, Miquel Raynal wrote:

> Hi Pratyush,
>
>> > @@ -684,7 +830,11 @@ static int spinand_mtd_read(struct mtd_info *mtd, loff_t from,
>> >  
>> >  	old_stats = mtd->ecc_stats;
>> >  
>> > -	ret = spinand_mtd_regular_page_read(mtd, from, ops, &max_bitflips);
>> > +	if (static_branch_unlikely(&cont_read_supported) &&
>> > +	    spinand_use_cont_read(mtd, from, ops))  
>> 
>> This looks a bit odd. If your system has two NAND devices, one with
>> continuous read support and one without, you will enable this static
>> branch and then attempt to use continuous read for both, right? I think
>> spinand_use_cont_read() should have a check for spinand->set_cont_read,
>> otherwise you end up calling a NULL function pointer for the flash
>> without continuous read.
>
> Mmmh that's right, I wanted a slightly more optimal path but the static
> branch doesn't play well here if it's a global parameter.
>
>> This would reduce the cost of checking set_cont_read in the hot path if
>> there are no flashes with continuous read. When you do have at least
>> one, you would have to pay it every time. I suppose you can do some sort
>> of double branch where you take the respective static branch if _all_ or
>> _none_ of the flashes have continuous read, and then the heterogeneous
>> setups do the check at runtime. But is spinand_mtd_read() even hot
>> enough to warrant such optimizations?
>
> I believe using static branches here would have been relevant with a
> single chip use-case, but I don't think it is worth using if we have
> more than one flash. It is an almost tepid path, at most, so I'll just
> check ->set_cont_read presence.

Sounds good.

>
>> > +		ret = spinand_mtd_continuous_page_read(mtd, from, ops, &max_bitflips);
>> > +	else
>> > +		ret = spinand_mtd_regular_page_read(mtd, from, ops, &max_bitflips);
>> >  
>> >  	if (ops->stats) {
>> >  		ops->stats->uncorrectable_errors +=
>> > @@ -874,6 +1024,9 @@ static int spinand_create_dirmap(struct spinand_device *spinand,
>> >  	};
>> >  	struct spi_mem_dirmap_desc *desc;
>> >  
>> > +	if (static_branch_unlikely(&cont_read_supported))
>> > +		info.length = nanddev_eraseblock_size(nand);  
>> 
>> Same here. With a heterogeneous setup, you will set length to eraseblock
>> size even for the non-continuous-read flash. Though from a quick look
>> info.length doesn't seem to be used anywhere meaningful.
>
> It is a parameter for the spi controller driver. It may lead to an
> error if the size is too big for what the controller is capable of,
> which is not the case for any of the existing controllers which are
> all capable of mapping a block at least (source: me reading spi code).
>
> the info parameter being per-nand it's fine to tune it like that, but I
> agree the if() conditional is currently wrong in the case of dual
> devices.
>
>> In general, a static branch looks misused here. This isn't even a hot
>> path where you'd care about performance.
>
> TBH the read path might be considered hot, but not hot enough to
> justify too complex optimizations schemes, definitely.

To clarify, I meant this just for the usage in spinand_create_dirmap().
This function is called exactly once for each device at probe time. So
optimizations like static branches don't make much sense here.

For spinand_mtd_read() a case can plausibly be made for doing such
optimizations, though as you mentioned before the path likely isn't that
hot. If you fancy it, perhaps run some benchmarks to see what read
performance you get with static branches and without them to get some
real data.

-- 
Regards,
Pratyush Yadav

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
