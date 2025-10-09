Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DA54CCD183
	for <linux-mtd@archiver.kernel.org>; Thu,  9 Oct 2025 22:28:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Z4Rh3lv5kL+7hpLr7G2W54sG0AeLoI6cybMg1XfL+v8=; b=V6XGZa8miHShbO
	1OuB0IO9AA9WPt9Yodbnv0WMw+40c4HAa34y+LR6zQnqrc1bGXU3uPzC2V7Fez/N24diAWeQ4zw8S
	a6BVEjygwGN5QKYYo1o1GBAnMuos3uAzGYHLReL1TIvuPl286n/9XCzn8vgH8ZVtrbon9H/T+N90e
	N7HkwEmUBjv9L6SqO5rQn8mhtw3qtpRXjZep0jvF90vxItFxcgt6TCpPffuc3WqXFnA7gwSBUf06c
	BWk/XzgBJ64NNgDFgdjDWsK/bEdWo93e7P1lJdh62osXjLRfWpHv4XBfj9VHKPygHWa0mSclxMK7Q
	aWzLMn31xmd+69rk5KWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6z6y-00000007EKi-3Gad;
	Thu, 09 Oct 2025 22:27:48 +0000
Received: from out-174.mta1.migadu.com ([2001:41d0:203:375::ae])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6z6v-00000007EHx-2upb
	for linux-mtd@lists.infradead.org;
	Thu, 09 Oct 2025 22:27:47 +0000
Message-ID: <26a795ac-e6ff-4363-a8b9-38793a9be794@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1760048860;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0ujFrv0xh6X+AbyNTLbcjgj4G3ocHTzbMroNDhXWDY4=;
	b=sXezy6hBbRnMlWwgmqKMDgcmyxqSI26fRtHU4IgRPvFablQO0951tAceAetGkJUT0tb8Sq
	mg6RqTMGjiFZadjCi6KCpOgvqxxm+p3hSRrBWD0SRhl+dO34DZKMupA2MljOLW/FEenoR9
	gQPLEXfVhMm6gQsgF84glRMboH+ea/Q=
Date: Thu, 9 Oct 2025 18:27:35 -0400
MIME-Version: 1.0
Subject: Re: [PATCH] mtd: spi-nor: Enable locking for n25q00a
To: Pratyush Yadav <pratyush@kernel.org>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>,
 Michael Walle <mwalle@kernel.org>, linux-mtd@lists.infradead.org,
 Richard Weinberger <richard@nod.at>, linux-kernel@vger.kernel.org,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Vignesh Raghavendra <vigneshr@ti.com>
References: <20251006223409.3475001-1-sean.anderson@linux.dev>
 <mafs0ecreontu.fsf@kernel.org>
 <4888cefa-e8be-4f0d-9d4a-c82f9ff6cda0@linux.dev>
 <mafs05xcpo9sz.fsf@kernel.org>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Sean Anderson <sean.anderson@linux.dev>
In-Reply-To: <mafs05xcpo9sz.fsf@kernel.org>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251009_152745_962772_6D5FE28D 
X-CRM114-Status: GOOD (  20.66  )
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

On 10/8/25 08:30, Pratyush Yadav wrote:
> On Tue, Oct 07 2025, Sean Anderson wrote:
> 
>> On 10/7/25 09:15, Pratyush Yadav wrote:
>>> On Mon, Oct 06 2025, Sean Anderson wrote:
>>> 
>>>> The datasheet for n25q00a shows that the status register has the same
>>>> layout as for n25q00, so use the same flags to enable locking support.
>>>> These flags should have been added back in commit 150ccc181588 ("mtd:
>>>> spi-nor: Enable locking for n25q128a11"), but they were removed by the
>>>> maintainer...
>>> 
>>> This makes it sound like the maintainer did something wrong, which is
>>> not true. Tudor had a good reason for removing them.
>>
>> I disagree. The maintainer used his position of authority to make the
>> submitter second-guess their correct patch.
> 
> Sean, you are being very combative over such a small issue. You must
> test your changes. This is one of the most basic principles in software
> engineering. It was perfectly reasonable from Tudor to push back on
> untested changes.
> 
> There is no abuse of "position of authority" here. When things break, we
> get to do the work of putting the pieces back together. So of course, we
> are reluctant to take things that increase this burden for us. Having
> contributors test their changes is the simplest of things we ask for to
> keep the quality bar.
> 
> Beyond that, I'd say that a little politeness goes a long way in life.
> Especially towards the people maintaining the software for free that you
> (or your employer) use. We are both wasting our energy on this debate.
> Please stop. Take a step back and think from the other side's
> perspective. And try to work _with_ people, not against them.
> 
>>
>> These flashes have capacity of greater than the 8 MiB that can be
>> protected using 3 BP bits. Micron (and ST before them?) addressed this
>> by adding a fourth BP bit. This is consistent across every flash in this
>> series, and is clearly documented in every datasheet. Defaulting to 3
>> bits is buggy behavior: we should assume flashes behave per their
>> datasheets until proven otherwise, especially for less-popular features
> 
> If I had a euro every time I found a bug in a datasheet, well, I would
> have enough money to at least buy a nice dinner. My point is, datasheets
> are not perfect. Only running on real hardware gets you the true
> picture.

Well, it's even *more* buggy to pretend that the datasheet doesn't exist
and just do whatever you please. Might as well reverse-engineer every
chip that comes across your desk from first principles with that
attitude.

The locking doesn't work on any of these flashes without these flags. If
you don't believe me you can try it yourself. The people who submitted
the original patches certainly didn't test it.

--Sean

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
