Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89FDDC47DA9
	for <linux-mtd@archiver.kernel.org>; Mon, 29 Jan 2024 13:12:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iXw8LKCUn9ydNAuQD0qmoJWNF4Sd1Dk+4BP7bOloYuo=; b=qNjpyBNJcgq+/I
	Xs9oIM6/AscGCioRDc6R3kTsBuaKg/WUaJk3NlZZC1yeu1bWtpHtPmQgy2NQH8t1tkA5xl+g/rotF
	CGWAy1n9NdrhdJS0FFIvL7FKSdJDT5CaVNmwbkIPXKC/1ha48vlUWBSH6kSVJkjnSK3BhOl/wG70W
	LgDd96lPsF1cuVMpr30OJpstkdDhmpLj0e7/LUV3DLpfj+2YlAC4ibHwDIsGMVVGiLqXUXKH5J/RE
	VZzL2RAk7BWAbNbuNB+h09vLvBvwRnEJ0Kx8ji+96LyB8s8eKfnhHeF03G1vXctG8ppI8jGF8ViJs
	IywvsBD8rdtNL3shgjNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rURRT-0000000Co16-3uLe;
	Mon, 29 Jan 2024 13:12:51 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rURRQ-0000000CnzB-22zJ
	for linux-mtd@lists.infradead.org;
	Mon, 29 Jan 2024 13:12:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 4CD12CE1230;
	Mon, 29 Jan 2024 13:12:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 606EAC433C7;
	Mon, 29 Jan 2024 13:12:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706533965;
	bh=oakpWDsRl1gGwlgcieDaPaxmTDGAvNAsQ355A4wMePA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=krqBjcdpRG3sl9Ez/i+KC0XlVbKHyzasQI19z3NDb7siP+1SHqPxpvbQgxIX8FjtE
	 wn4idOIbFgzr7K53WcBawSKdAKJ7kXam45FPUUlMQzMWBJMqdOH7mzsoMu7dtUeUOe
	 0zbDiQ53xXEz93B7OOyaFTG3K1M6lhXcOjGtlrNOniDl3sdASvoEgfignpdDVQNPJk
	 QSHNr0DaVDLz6TCqrt+wb7uPYpQ+TS+7QCrMHyw0rCXBWncSqBQL7Zf9iIdMRV0B9B
	 yCYWxVk1TvjlQAvWVANf+DacbL8fOHUAwW891uH8MrgM+4wFll0WTOaCv0zjt+3wvb
	 +ePXRjWoBEnEg==
From: Pratyush Yadav <pratyush@kernel.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: pratyush@kernel.org,  michael@walle.cc,  miquel.raynal@bootlin.com,
  richard@nod.at,  jaimeliao@mxic.com.tw,  linux-mtd@lists.infradead.org,
  linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] mtd: spi-nor: print flash ID instead of name
In-Reply-To: <20231215082138.16063-2-tudor.ambarus@linaro.org> (Tudor
	Ambarus's message of "Fri, 15 Dec 2023 10:21:35 +0200")
References: <20231215082138.16063-1-tudor.ambarus@linaro.org>
	<20231215082138.16063-2-tudor.ambarus@linaro.org>
Date: Mon, 29 Jan 2024 14:12:43 +0100
Message-ID: <mafs0bk94th9w.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240129_051248_748692_1BA271E1 
X-CRM114-Status: GOOD (  10.87  )
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

On Fri, Dec 15 2023, Tudor Ambarus wrote:

> We saw flash ID collisions which make the flash name unreliable. Print
> the manufacgturer and device ID instead of the flash name.

Typo. s/manufacgturer/manufacturer/

>
> Lower the print to dev_dbg to stop polluting the kernel log.

FWIW, I find these prints to be somewhat useful. they serve to
"announce" that the kernel probed a device successfully. This can be
somewhat helpful when reading logs from customers trying to figure out
why something doesn't work.

I don't have any strong opinions of course since it is not such a big
deal but I wanted to point out that these prints _are_ somewhat useful.

Acked-by: Pratyush Yadav <pratyush@kernel.org>

> Suggested-by: Miquel Raynal <miquel.raynal@bootlin.com>
> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>

-- 
Regards,
Pratyush Yadav

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
