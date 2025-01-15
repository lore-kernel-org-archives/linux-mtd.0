Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A2F7C02180
	for <linux-mtd@archiver.kernel.org>; Wed, 15 Jan 2025 20:05:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ej2O6+OG4SdH2vrYQshgwFu08lb17PX0PEayeSPf4UY=; b=UPfNOUpE35uLd7
	NiQQxGH6ZlZ6sBv5FtLVo72g23Y+Lyl0+8X1qoqpXlLQ3f9tdypzo2iNhnX118iT5CPSG6ELYYt8P
	QPgGPv/GouSzf+zqLkxgsjXe2JHe+jx97pqEa7JtfAxDeTTgLCOjvwIOI7ny8OAmlvS5tno6oMRGK
	ljixQMo5gvxYhdG/LsmC1Ml8iyE3zG2ZQcPowKJEZWifcEUvNTePf9DtWmajf8xrAw9/+ra9VnXnb
	H1ARtNHQhlt31eGyRwBxLuCwBGiTMjYuID5dcI9PYVgpPcY9Hk3B0NexvS0TpWpFLa7EJFnwRNeGS
	+/Z0qqXQx/LDC8ZxRrSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tY9dm-0000000CxhD-2Nxo;
	Wed, 15 Jan 2025 20:05:26 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tY9dj-0000000Cxgp-3fas
	for linux-mtd@lists.infradead.org;
	Wed, 15 Jan 2025 20:05:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 8A53FA4215B;
	Wed, 15 Jan 2025 20:03:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76A16C4CED1;
	Wed, 15 Jan 2025 20:05:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736971521;
	bh=qqfEuTjFBBI+9p04Q1SHZHZjZMbwfzV9BqTMfmjJkm4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=ol/KOJENApeGimw/wu9z0hfoesCdH82/8+b2I4Bhw/CyUC/23Nn2huskbx2KwfAgi
	 UoHXzXzxb87LhgK74Snf/xfGZqM1iWILT2R0lYs5q8ZRJVoGgU3zCQis23zqYZboSw
	 hpcYOjkbYrSaQoW0JgowcrAHBlLnfMGNRrZEH8chxDe/b9ipm3GJrcA8pnRP4ZNdlC
	 uN15OTYHwesL2V/GjCRtWlixN35XQisRGWdZWaY9Tui5oxmfzsBSabs+mFMLjYMt/P
	 LsIXPEZYG+5AUFdpr1QkJkT/wbZKx6rWaKRa8d51Sb4aUzjN2iistloqCbbnWy16f0
	 Zoi5oNfvNaglw==
From: Pratyush Yadav <pratyush@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Pratyush Yadav <pratyush@kernel.org>,  Tudor Ambarus
 <tudor.ambarus@linaro.org>,  Michael Walle <mwalle@kernel.org>,  Richard
 Weinberger <richard@nod.at>,  Vignesh Raghavendra <vigneshr@ti.com>,
  Thomas Petazzoni <thomas.petazzoni@bootlin.com>,  Steam Lin
 <STLin2@winbond.com>,  linux-mtd@lists.infradead.org,
  linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] mtd: spi-nor: winbond: Add support for w25q01jv
In-Reply-To: <87zfjrlwpc.fsf@bootlin.com> (Miquel Raynal's message of "Wed, 15
	Jan 2025 20:10:39 +0100")
References: <20241224-winbond-6-12-rc1-nor-volatile-bit-v1-0-f7c4dff66182@bootlin.com>
	<20241224-winbond-6-12-rc1-nor-volatile-bit-v1-1-f7c4dff66182@bootlin.com>
	<mafs0zfkk7pfm.fsf@kernel.org> <871pxp798c.fsf@bootlin.com>
	<mafs0ldve7qms.fsf@kernel.org> <87a5btslfl.fsf@bootlin.com>
	<mafs08qrc5g44.fsf@kernel.org> <87zfjrlwpc.fsf@bootlin.com>
Date: Wed, 15 Jan 2025 20:05:19 +0000
Message-ID: <mafs04j1z6dxc.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250115_120523_978897_22482D78 
X-CRM114-Status: GOOD (  16.38  )
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

On Wed, Jan 15 2025, Miquel Raynal wrote:

> Hello Pratyush,
>
>> Okay, I am confused because you said earlier that:
>>
>>> The bug that has been experienced followed this sequence:
>>> - send the write enable command (non-volatile)
>>> - wait for the ready/busy bit, ie. wait for the WEL bit to be set
>>>   because it is non-volatile write
>>> - active die is ready, (but idle die is not!)
>>> - enter 4-byte address mode, only the die that is ready processes the
>>>   command.
>>
>> Which says the WEL bit being set itself is racy. What I understand from
>> that is one die is ready to take writes and the other is not. Now when
>> you try to write the SR to enable 4B mode, it would only work on the die
>> that got the WEL set. The other one ignores it and stays in 3B mode. Do
>> I understand this correctly? To fix this you need to wait after the
>> write enable, before you initiate the write SR operation.
>
> Actually I think you're right. The thing is, Winbond WEL bit are
> non-volatile by default, whereas you were assuming it would be. Maybe
> the proper fix is to do both?
> - Using the volatile 'write enable'
> and
> - Making sure we wait after the (other) commands tampering with all dies.

Yeah. You can do that or you can do the wait after sending the write
enable. Either case would need you to implement a custom write enable
function for the chip so from the code perspective, it should be about
the same. Though I do think using the volatile write enable seems to be
faster and easier to reason about.

-- 
Regards,
Pratyush Yadav

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
