Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1422DC02182
	for <linux-mtd@archiver.kernel.org>; Mon, 20 Jan 2025 14:22:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oxTtGcSqfuF2Y4zQ0VMdRkknV78j8Q/jnPY36jFff3g=; b=GPz7JuddyUrNj/
	8sILNS1cOIhqJCUcbY9e+OTm0CgrtX8yi7YCAWyw6PoWmJzFJ46IgQVX7koeCPo0QmL73sfbFlghK
	xJf4luq3wHE3gAWaCKLAen1zBaaHbHwYwajGuJStVWRGDy7YdaR8KiHB+cdNfld1/z7WUVgkNN3kr
	qbhBF3wMcEbmJIsBj57OcyiZCc4dMdoewpYaD9odKtE42iAsZjzmaxCoFQETJFIQ/rYhDG6otXTTj
	BGfSVHPvwQ6iGfi3u20aEpGt2s7eDuHGI0n76PCBl2VZi1Jz80XeP+SBnqHeHS4++gT6mDabPenCP
	NqMy3k0sbxuHww4UvjxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tZsf3-00000005mNC-0iFL;
	Mon, 20 Jan 2025 14:21:53 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tZsf0-00000005mMi-2Bz8
	for linux-mtd@lists.infradead.org;
	Mon, 20 Jan 2025 14:21:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A990E5C5B26;
	Mon, 20 Jan 2025 14:21:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35605C4CEDD;
	Mon, 20 Jan 2025 14:21:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737382908;
	bh=Az6SynehWb3YHdMOWDBRx9rT4GMdrci9soACShJwNiY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=NXZkxySZjb3P+/EZFz6uK87vE5uYtFuosXx0Kphr/PvfCIAm0r/zJVgUb6GjV13U6
	 m8LPF3cSeFen8krcDvzhzt9y63pgy1aMEIeRAZ9TX3YpWkE+NROCIhGe/v8hj9ThS7
	 SXhpfAPoIl+yJ2Oxlie0LfR8kM2+hnXw1uiXgRHt1L3XoJ4yw6ZxQfF73tjUpQVCmV
	 3A8FqfUoUrQyrozDHZ1F0/vgTWNVVqijoG0G84IkNfnyv2V1wSQ7cF3acLv9jmXRMj
	 G+uB9nelFuIseLIr+3FX0mrBt6hRy8NmroJDlh0jdc49vU2Bs0dgfYzHEt0TV2G2/l
	 Qn7pbyYJMmcvQ==
From: Pratyush Yadav <pratyush@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Pratyush Yadav <pratyush@kernel.org>,  Tudor Ambarus
 <tudor.ambarus@linaro.org>,  Michael Walle <mwalle@kernel.org>,  Richard
 Weinberger <richard@nod.at>,  Vignesh Raghavendra <vigneshr@ti.com>,
  Thomas Petazzoni <thomas.petazzoni@bootlin.com>,  Steam Lin
 <STLin2@winbond.com>,  linux-mtd@lists.infradead.org,
  linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] mtd: spi-nor: winbond: Add support for w25q01jv
In-Reply-To: <87jzapsldj.fsf@bootlin.com> (Miquel Raynal's message of "Mon, 20
	Jan 2025 13:47:04 +0100")
References: <20241224-winbond-6-12-rc1-nor-volatile-bit-v1-0-f7c4dff66182@bootlin.com>
	<20241224-winbond-6-12-rc1-nor-volatile-bit-v1-1-f7c4dff66182@bootlin.com>
	<mafs0zfkk7pfm.fsf@kernel.org> <871pxp798c.fsf@bootlin.com>
	<mafs0ldve7qms.fsf@kernel.org> <87a5btslfl.fsf@bootlin.com>
	<mafs08qrc5g44.fsf@kernel.org> <87jzapsldj.fsf@bootlin.com>
Date: Mon, 20 Jan 2025 14:21:46 +0000
Message-ID: <mafs0o7014lc5.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250120_062150_687165_A081E4B0 
X-CRM114-Status: GOOD (  24.21  )
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

On Mon, Jan 20 2025, Miquel Raynal wrote:

> Hi Pratyush,
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
> Sorry for the confusion, I got myself confused as well. I double checked
> with Winbond and I think I have the correct explanation now:
>
> The WEL bit is volatile, there is no delay when setting it (well, about
> 10ns, but no specific deviation).
>
> On most chips, WEL enables all write operations:
>   * (single/dual/quad) page programs
>   * (sector/block/chip) erases
>   * status register write
>   * erase/program of other internal registers (like security registers)
>
> On Winbond, the above applies, but with the usual "Write Enable command
> (06h)", the status register bits are non-volatile, ie. they are stored
> in non-volatile cells (which takes time to program and are subject
> to deviations across dies). Hence, they added another command, called
> "Write Enable for Volatile Status Register (50h)" which is an addition
> to the usual "Write Enable command (06h)" which causes:
> - enabling writes on the status register only (if the WEL bit is not yet
>   set)
> - using volatile writes for the status register bits (ie. they are using
>   some kind of local cache which update almost immediately).
>
> So basically, if you do the following:
> - status register write
> - check the status bit with the standard helper
> - (and quickly after) do anything else on the idle die
> In this case you could experience a race, but that is not related to the
> Write Enable command.
>
> In general I believe enabling volatile status register writes would not
> be useful as long as we have the "read the status from all dies"
> workaround.
>
> Let me know if something is still unclear.

Ah, okay. That all makes sense now. With this explanation, your patches
should be doing the right thing. I will do a round of review on the v3
soon, but they looked mostly good when I last took a brief look.

-- 
Regards,
Pratyush Yadav

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
