Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83303C87FCF
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Aug 2025 15:31:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qcFE86oLlfwD+zIRfXMCQY0zIvwxrR9hLAKl0KxI4vk=; b=Etc98kp15eBrYR
	yrXl6andN84cZTMDyAIJS5sefCMWoY7BF+llBpzVbH8rXROnw56L5zUj+qiNccVYa+jRtEA2Ha5gU
	LULcVMHwiWQD8MtX5WJXDoA4Xh//OElwCgSUM8BxHrIoW45z0fi63lnpr3EyypUbBcedQKA4q2DwE
	7n9yOZJkO8cP2YXSw6+TEMe+NVGqVCZvk3bYzU37BXFmRnE2pFsQPvpRNYRohj32RKbYiXursf4TK
	/n3v6OubFjei7I2QEQiZX8w3DDQGrJVC8EyInZBYHKCtqyHW2AhWHw8kwg6TYBIobG7TeyQ+gPtRH
	qJ6zf8WYzMyPAEffOe6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uix9u-0000000Ao69-3EV0;
	Mon, 04 Aug 2025 15:31:30 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiwMj-0000000AhFf-0Y4D
	for linux-mtd@lists.infradead.org;
	Mon, 04 Aug 2025 14:40:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id D756DA559D1;
	Mon,  4 Aug 2025 14:40:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3BF9DC4CEE7;
	Mon,  4 Aug 2025 14:40:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754318439;
	bh=D47Cvf8LQDIxdg2TBLpzdbYikxttDjS0/v2fs4Fj3oE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=OgGW6JSaVtHdITRn8tuMFP2KAJvjqrc+lnT6BuHodaKHqEAOFMiN6JxHiMc7HN62u
	 BEUjXYKeEbfKL+xtItRlf4yUgys66wXQ65WL84uvrnnaNgU5sfxl1Mthp4bWQmt5Vt
	 LAUawd3jNSwBWPQG0W1sspcQnuPsW3JgxRLbIJt1yIY2eJ1D0TfzYVarluSSKbpuqL
	 PKAkV7KZMnV4t7tbZJ3xmfsGfj0xSEx/hELjnHzSt3+Z1xDLC+M5Dxw10tGbKPrRE7
	 oppS9EtI3NGGl9wA3OG10sIclOQ4FranRMCBeRSjC3acU4Xzp/OxbYkoLEtk/48hpI
	 IaiiHLxDSjUTA==
From: Pratyush Yadav <pratyush@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Pratyush Yadav <pratyush@kernel.org>,  Linus Torvalds
 <torvalds@linux-foundation.org>,  Richard Weinberger <richard@nod.at>,
  Tudor Ambarus <Tudor.Ambarus@linaro.org>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  Frieder Schrempf <frieder.schrempf@kontron.de>,
  Michael Walle <michael@walle.cc>,  linux-mtd@lists.infradead.org
Subject: Re: [GIT PULL] mtd: Changes for 6.17
In-Reply-To: <87cy9f5bmj.fsf@bootlin.com>
References: <87o6t08fen.fsf@bootlin.com> <mafs0v7n7cd5a.fsf@kernel.org>
	<87cy9f5bmj.fsf@bootlin.com>
Date: Mon, 04 Aug 2025 16:40:37 +0200
Message-ID: <mafs0qzxrcfq2.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250804_074041_234089_AA6EFAD2 
X-CRM114-Status: GOOD (  15.19  )
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

On Fri, Aug 01 2025, Miquel Raynal wrote:

> Hello Pratyush,
>
>>> * SPI NOR changes:
>>>
>>> A notable changes is the fix for exiting 4-byte addressing on Infineon
>>> SEMPER flashes. These flashes do not support the standard EX4B
>>> opcode (E9h), and use a vendor-specific opcode (B8h) instead.
>>>
>>> There is also a fix for unlocking flashes that are write-protected at
>>> power-on. This was caused by using an uninitialized mtd_info in
>>> spi_nor_try_unlock_all().
>>
>> I personally think bullet points are a bit easier to read for changelogs
>> compared to paragraphs since there is less filler text needed. For
>> example, my original merge message didn't the "there is also a fix for".
>> It just said "Fix unlocking of...".
>>
>> Anyway, if you still prefer paragraphs then do let me know and I'll use
>> those next time around and save you some editing.
>
> Some time ago Linus asked me to change the content of the PR description
> (I was mostly listing the patches) and pointed to examples which were
> mostly plain English, not bullet points. So I changed both the content
> (hinting what are the major changes and roughly describing the small
> ones) and the form (no bullet points). I've kept splitting the
> subsystems with '*' though, as the changes in each subsystem are
> mostly unrelated.
>
> I'm fine either ways, but I assumed until now that the preferred form
> was plain text descriptions.

Okay, fair enough. I can do plain text next time around.

-- 
Regards,
Pratyush Yadav

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
