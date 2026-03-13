Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 633F3105F79A
	for <linux-mtd@archiver.kernel.org>; Fri, 13 Mar 2026 11:10:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=C1F2iOyrL/e1XAapUoh6dLkOXHr2Ipy1MZaB7uPkNyM=; b=NdBt9+UiQp6Y7m
	OTYL3cAkLLpSgzO1/ojtcv+e8E9yJLKx8sblUFK2qHzLRpGCeTkLPC0uPXeirXqGmmh+Idsv5dSg7
	xy7YVmVG2b7ec5e5UnI2UXHoAMhXPP4NsAoOwTWwF1U1OMWPyellBGEWmdBKoUNVGFGm7h15+xy8s
	xtJHDlHLQKRQO8SDUiM1fM0P/Ji7H7g8i/RQvdsgdjqLVprx2hULPRW/hccjG63dMnN0v+jU7lzs+
	dOgvZv6/K5pVfq+Tdrd+M8TMrfbOa88i3ZMK//dk3v68WhwoKHWii40n0nrpVK3k2FqjsSLT3Mvwf
	lyKAw3SGd6sGMyeIRE4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w10Pw-0000000HaQz-0anR;
	Fri, 13 Mar 2026 11:10:56 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w10Pv-0000000HaQp-0e27
	for linux-mtd@lists.infradead.org;
	Fri, 13 Mar 2026 11:10:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4D8D160138;
	Fri, 13 Mar 2026 11:10:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED157C19424;
	Fri, 13 Mar 2026 11:10:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773400254;
	bh=5fm+8ayCZTHyZH9HASL9sNm8UJfHAmahYNBfyHAHSVU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=qJrP71BsDCj4qYf5PxQiY3gWCpbpDVAwamgjQPUUGBUXvcmDV5k1rV3pj/oLkz3JG
	 iWfZEi5P7jV7esVcKFJ5DhimlNreLn9zsor8kzNklolgX31rWuybtLB48kdV1WOIjE
	 Dqio/on7s2Y+vvBVsEHjzIiM9KwB1eYogBVX3IwhzGVOJtPoFxYWvlUx4C4ipNa0JI
	 YzmHscWMFnPcSiQ2LF/l5ocH9Fb3dxl4Yr2a6kCb0M805CUUbCcQgQddz8wJb1ycP8
	 QaLpXeB7nC+UUXwNS9pv7ok2nYIadGiAAZzwJKPfDk4ZLRiwZBi87fXul64wsiPLld
	 IxGx5jGBDu5tg==
From: Pratyush Yadav <pratyush@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  Tudor Ambarus <tudor.ambarus@linaro.org>,  Pratyush
 Yadav <pratyush@kernel.org>,  Michael Walle <michael@walle.cc>,
  <linux-mtd@lists.infradead.org>,  Jakub Czapiga <czapiga@google.com>,
  Thomas Petazzoni <thomas.petazzoni@bootlin.com>,  Takahiro Kuwano
 <takahiro.kuwano@infineon.com>
Subject: Re: [PATCH 1/2] mtd: spi-nor: Fix RDCR controller capability core
 check
In-Reply-To: <873429oxwf.fsf@bootlin.com> (Miquel Raynal's message of "Mon, 09
	Mar 2026 15:55:28 +0100")
References: <20260108121430.1096844-1-miquel.raynal@bootlin.com>
	<873429oxwf.fsf@bootlin.com>
Date: Fri, 13 Mar 2026 11:10:50 +0000
Message-ID: <2vxz4imkf0hx.fsf@kernel.org>
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

On Mon, Mar 09 2026, Miquel Raynal wrote:

> Hello SPI NOR folks :-)
>
> + Takahiro
>
> On 08/01/2026 at 13:14:29 +01, Miquel Raynal <miquel.raynal@bootlin.com> wrote:
>
>> Commit 5008c3ec3f89 ("mtd: spi-nor: core: Check read CR support") adds a
>> controller check to make sure the core will not use CR reads on
>> controllers not supporting them. The approach is valid but the fix is
>> incorrect. Unfortunately, the author could not catch it, because the
>> expected behavior was met. The patch indeed drops the RDCR capability,
>> but it does it for all controllers!
>>
>> The issue comes from the use of spi_nor_spimem_check_op() which is an
>> internal helper dedicated to check page operations, ie. it is only used
>> for page reads and page programs (despite its generic name).
>>
>> This helper looks for the biggest number of address bytes that can be
>> used for a page operation and tries 4 then 3. It then calls the usual
>> spi-mem helpers to do the checks. These will always fail because there
>> is now an inconsistency: the address cycles are forced to 4 (then 3)
>> bytes, but the bus width during the address cycles rightfully remains 0:
>> impossible, the operation is invalid.
>>
>> The correct check in this case is to directly call spi_mem_supports_op()
>> which doesn't messes up with the operation content.
>>
>> Fixes: 5008c3ec3f89 ("mtd: spi-nor: core: Check read CR support")
>> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
>
> These two patches are fixes which need to get in, I'd like to pick them
> for the next fixes MTD PR that I am preparing, but I was expecting some
> kind of acknowledgement on it.

With Tudor's suggestions:

Reviewed-by: Pratyush Yadav <pratyush@kernel.org>

I am going through the SPI NOR patch backlog. Since you plan to take
these directly via mtd/fixes, I'll not queue these.

[...]

-- 
Regards,
Pratyush Yadav

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
