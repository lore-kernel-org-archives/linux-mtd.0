Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABF06C02180
	for <linux-mtd@archiver.kernel.org>; Mon, 13 Jan 2025 14:08:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dpJy4umRrF4tfhvbditfAtGbQaglFxPAXaw+iCi+Zls=; b=TWrncfgnm+og8Y
	LG7fqnXTeuBjZiRqKOyPy6d0TsoOXahBZcYyeBWMnjnrxEEtfC5ThGWSwvw9jhvlB7l1bbao8rwzH
	1CL62m7bGJw53mNun4zDQuuH9bA5p91WPdeMJW9sCpCBrhC/Eeauyr7P54G6FgUvSIIgl5JlBQD70
	sqHUT6QnzKCWeZ/QmwfJnerVaqNpnLnDa3xcQ+yRVLmRNoisahE+Lhg5RD34Ux7IWFu/hnW79kpVP
	WugFypJj+77AJQcCime5MO+xgAne/okoy2rMJasW/k6zWXf2mYgtCmZcOULdG+zehCgWokGTtCWBt
	8az65JirNY9xbpnefvXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXL7Z-00000005MJd-128Z;
	Mon, 13 Jan 2025 14:08:49 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXL7X-00000005MJF-0l34
	for linux-mtd@lists.infradead.org;
	Mon, 13 Jan 2025 14:08:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D579C5C53A5;
	Mon, 13 Jan 2025 14:08:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 011A2C4CED6;
	Mon, 13 Jan 2025 14:08:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736777326;
	bh=DFhJcOj4yvsA+mhOUAs7B5VqLEunr0m+ivU1XrbxDv4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=twNE3sFDJdNtBA//VFal6WrCvOYK61cnSc19xHIwOtmPNQBEYCDgvH+eLkNcyGKB0
	 Xmti9VdndfS/KEeA37U7clv1cXrFXHm4MqCeHQ1VBG0mRT3jxTL2Jxum5tJbymR0ZG
	 Imqe9C0nRCec7wllg20L3jBmyUtAgTeiRbCuKLPyTVFyA7pDEVKg4FQcYpf3t4VuI/
	 gfWupGHgfUmAg68qEzEdIQcCZfVu1jzn5GeWC0/5pXkJnTZrmu7B+/jOcezjTxyqSt
	 kT+wx+P002zv3WO9iI6zqeGf1NggDDeoU4KBDW2a7INfbFJJBHejQAtPH0Vpk4bS+/
	 LRfMijOzq/Kyw==
From: Pratyush Yadav <pratyush@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Pratyush Yadav <pratyush@kernel.org>,  Tudor Ambarus
 <tudor.ambarus@linaro.org>,  Michael Walle <mwalle@kernel.org>,  Richard
 Weinberger <richard@nod.at>,  Vignesh Raghavendra <vigneshr@ti.com>,
  Thomas Petazzoni <thomas.petazzoni@bootlin.com>,  Steam Lin
 <STLin2@winbond.com>,  linux-mtd@lists.infradead.org,
  linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] mtd: spi-nor: winbond: Add support for w25q01jv
In-Reply-To: <871pxp798c.fsf@bootlin.com> (Miquel Raynal's message of "Mon, 30
	Dec 2024 11:31:31 +0100")
References: <20241224-winbond-6-12-rc1-nor-volatile-bit-v1-0-f7c4dff66182@bootlin.com>
	<20241224-winbond-6-12-rc1-nor-volatile-bit-v1-1-f7c4dff66182@bootlin.com>
	<mafs0zfkk7pfm.fsf@kernel.org> <871pxp798c.fsf@bootlin.com>
Date: Mon, 13 Jan 2025 14:08:43 +0000
Message-ID: <mafs0ldve7qms.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_060847_302744_C9A16FFD 
X-CRM114-Status: GOOD (  34.60  )
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

On Mon, Dec 30 2024, Miquel Raynal wrote:

> Hello Pratyush,
>
> On 24/12/2024 at 21:15:41 GMT, Pratyush Yadav <pratyush@kernel.org> wrote:
>
>> On Tue, Dec 24 2024, Miquel Raynal wrote:
[...]
>>> As there are very few situations where this can actually happen, a
>>> status register write being the most likely one, another possibility
>>> might have been to use volatile writes instead of non-volatile writes,
>>> as most of the deviation comes from the action of writing the bit. But
>>> this would overlook other possible actions where both dies can be used
>>> at the same time like a chip erase (or any erase over the die boundary
>>> in general). This last approach would have the least impact but because
>>> it does not feel like it is totally safe to use and because the impact
>>> of the second solution presented above is also negligible, we keep this
>>> second approach for now (which can be further tuned later if it appears
>>> to be too impacting in the end).
>>
>> I am a bit confused by this paragraph. What do you mean by "this" in
>> the
>
> "this" = "the race condition"
>
>> first sentence? What do status register writes have to do with the ready
>> bit being racy?
>
> The bug that has been experienced followed this sequence:
> - send the write enable command (non-volatile)
> - wait for the ready/busy bit, ie. wait for the WEL bit to be set
>   because it is non-volatile write
> - active die is ready, (but idle die is not!)
> - enter 4-byte address mode, only the die that is ready processes the
>   command.
>
> We only observed the issue in this particular case which involves
> writing the status register, because it is one of the very few commands
> targeting all dies at the same time.
>
> I assume another sequence that might lead to a similar issue might be a
> chip erasure, as all dies are involved in parallel, but maybe there are
> other situations I did not think about which might be racy as well.


>
>> I would assume those would be nearly instant since
>> status registers are usually volatile. What do volatile writes mean in
>> this context?
>
> You are actually right. Status register bits can be volatile (in this
> case writing the bits themselves is almost instant) but currently when
> we allow this register to be writable by sending the write enable (06h)
> command, the non-volatile way is used, ie. the state of the bit itself
> is stored in non-volatile memory and write durations can vary from one
> die to another.

Okay, that is strange behaviour. Normally the status registers are
always volatile, and don't have a non-volatile counterpart.

>
> Winbond chips (maybe this is a shared capability?) accepts another
> command, "Write Enable for Volatile Status Register (50h)", which
> specifically change the status register bits to use the volatile method.
>
> Hence, if the only situation we want to solve is the status register
> access, then we may just enable this command (this is the third solution
> I tried to explain in the commit log), but if we think there are other
> racy situations, this approach is not complete and we must fallback to
> one of the approaches listed above.

I am not quite sure how you fix the write-enable-being-racy bug with
your patch. If you look at the code, spi_nor_write_enable() only calls
the write enable command (06h), and does not call
spi_nor_wait_till_ready() after that. After the write enable, it
immediately executes the program or erase operation. So you never
actually wait for all dies to be ready after a write enable.

You can see an example in spi_nor_write(). It does:

    spi_nor_write_enable() -> spi_nor_write_data() -> spi_nor_wait_till_ready()

Do you have a consistent reproducer for the race? If so, does the patch
actually somehow make the race go away? If so, I would be curious to
know why.

>
>>>
>>> However, the fixup, whatever which one we pick, must be applied on
>>> multi-die chips, which hence must be properly flagged. The SFDP tables
>>> implemented give a lot of information but the die details are part of an
>>> optional table that is not implemented, hence we use a post parsing
>>> fixup hook to set the params->n_dice value manually.
>>>
[...]

-- 
Regards,
Pratyush Yadav

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
