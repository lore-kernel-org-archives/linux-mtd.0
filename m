Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19B66C61DD3
	for <linux-mtd@archiver.kernel.org>; Thu,  3 Sep 2026 13:23:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Od3+kEhj3yHx6/Er3fOE1xCoKtks9ZOBx//LXBup/Qk=; b=nMcBw+x5B1tMqJ
	zP6DHhZcdu5aZiwo67Qrr+5blSuSoII20+5wh7rL9AozYatjf1ZNJwiqfPvokJ9CdlO8cb5SWOX6n
	93gqEndrrtZ0/kw5DWHIG7Th0Tw0Dof4ThX58T0js121iLbL6zzDr/yt7GX9VRdrBjVJpJbZkUjTL
	Y7Kg3zsQpVcQQ9LKFydB6sJcudB4pwiwykAvtvbeeISQIbeD3GWv1qs/1eYTDbkmrJpcNcO8GEYqy
	/ktHp2FU2baM0OR6U2yy1X0KxYMrXR+mERnBcSJhcc7CRknrLlMgcG9QWdSkhnnU2nd9k3eUwz4PD
	JWmEVdr3Hi+ICvPzDY8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x27Pc-0000000HOLq-0opP;
	Thu, 03 Sep 2026 13:23:28 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x27Pa-0000000HOLd-3MgC;
	Thu, 03 Sep 2026 13:23:26 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 28DF840573;
	Thu,  3 Sep 2026 13:23:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE4B11F00A3A;
	Thu,  3 Sep 2026 13:23:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788441806;
	bh=TeIGPEELjQkb4K/sFM/2VywtpNXFGio8s2rvK95p5A8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=H9y2YggpAR74FN+Xmm5fV0sTXoPrOQJ4+fgsfr2e1xQxcn9ZsSrkl92F8ZDiDQ03M
	 cN9uHGJRzlItWUo9tYJfmTRnDkknFyFnLKKBSyka6K0LhX93nwaufJjAcft3Rad6cq
	 sqyAEUZV60uNk/WFttm9gWlk1hd00l/5rGfbHJPM8P/lr83ur7Yk76nAd2y29ZWmkc
	 rr4usPLQcuIC9BO3M9H89p2U2hOVRw/EMWqHtKZs4VjEFU/ZFiNR0WhuorAvBdUhjE
	 Ax/tKheb1v94OW+7TubKxBxB1L22PG3shcQJH51s3m/efVUIax8dheQuHezS7rZpI/
	 KHS5Ihj87IT/Q==
Message-ID: <28de391b-59ed-4495-9b16-fde7b811d6fe@kernel.org>
Date: Thu, 3 Sep 2026 16:23:20 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] mtd: rawnand: lpc32xx: Remove platform data support
 from drivers
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org
References: <20260903112425.1904748-1-vz@kernel.org>
 <878q5i4iz9.fsf@bootlin.com>
From: Vladimir Zapolskiy <vz@kernel.org>
In-Reply-To: <878q5i4iz9.fsf@bootlin.com>
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

Hi Miquel,

On 9/3/26 15:28, Miquel Raynal wrote:
> Hello Vladimir,
> 
> On 03/09/2026 at 14:24:22 +03, Vladimir Zapolskiy <vz@kernel.org> wrote:
> 
>> Since NXP LPC32xx SoC support in the Linux kernel strictly depends on
>> device tree support, the unused platform data support can be removed
>> from the LPC32xx NAND MLC and SLC drivers.
>>
>> Vladimir Zapolskiy (2):
>>    mtd: rawnand: lpc32xx_slc: Remove platform data support
>>    mtd: rawnand: lpc32xx_mlc: Remove platform data support
>>
>>   drivers/mtd/nand/raw/lpc32xx_mlc.c | 21 ++-------------------
>>   drivers/mtd/nand/raw/lpc32xx_slc.c | 21 ++-------------------
>>   include/linux/mtd/lpc32xx_mlc.h    | 17 -----------------
>>   include/linux/mtd/lpc32xx_slc.h    | 17 -----------------
>>   4 files changed, 4 insertions(+), 72 deletions(-)
>>   delete mode 100644 include/linux/mtd/lpc32xx_mlc.h
>>   delete mode 100644 include/linux/mtd/lpc32xx_slc.h
> 
> Sashiko raises a build issue due to the cleanup missing one use of a
> header. Can you please check?
> 

sure, from its report [1] I see that Sashiko bot verifies the changes
against today's outdated v7.2, and therefore it produced a false positive
error, since v7.3-rc1 contains the commit d6ef4391897d ("ARM: lpc32xx:
remove a few manually populated OF devices").

There should be no build errors introduced by this series, thanks for review.

[1] https://sashiko.dev/#/patchset/20260903112425.1904748-1-vz%40kernel.org

-- 
Best wishes,
Vladimir

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
