Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A169C88E4D
	for <linux-mtd@archiver.kernel.org>; Fri, 11 Sep 2026 13:37:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aFUIqZepvFotstccqylCJvIs8Sx6Rt5AGqiobsIoj+M=; b=Wto1D26RAMSHaQ
	luIKiX1BUWmUCxJrbEtWTc//BOl0QmONU4JXWeTbJWNxWdF9qhHqfdzPO3104Uo9ogtgHbSnG9Zfn
	az7BgOhWCbGxvupGlNcyiBRtL2kxNxZ8mPp7QR+Ot99NFTkYjOAq+2sHk2pAUCJvhRHoS9VZVHfYm
	6y8xCQ2m2jBbS79Rm6/JarHZHarpJ/6Ctp70f8Pi5987oWuJyLwhl+5DSXqZ9JbFxpgJ7j0L7a/KQ
	00gdwLfOA+Y6eqEuOi6ISZ1x8ng9Rnjw/GSkgCbg8yCq6sGUGjLECL3WIG/guzIyDOcAUMwV8bgpb
	cyWaHqmAlD4mS7gsk9TA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x51Ri-0000000GlYC-3L8S;
	Fri, 11 Sep 2026 13:37:38 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x51Rc-0000000GlWm-3WZb
	for linux-mtd@lists.infradead.org;
	Fri, 11 Sep 2026 13:37:36 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 8A0924E401EF;
	Fri, 11 Sep 2026 13:37:29 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 4EC1A601DE;
	Fri, 11 Sep 2026 13:37:29 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6506811C7AFAD;
	Fri, 11 Sep 2026 15:37:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1789133844; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=39LJVNDGDY2GufpAI5tRNgImbkoEA9MqZ1Ju0GrUn+s=;
	b=zrMx+kWIGNWLQT18699SbweQ9yWbozy1MyJTwdqs+c6ybOekjGP3/0aqPi9MFgjxQbuo1g
	gLnF/B2VPC+T3qNmM194Dz+Jin86ooPyCTGo4kRxV+G6BuX+M6kfRMpBsoHhIufQBPC3bn
	Gmyfl2X75Qdi66QcPbwp7TfC7Sqwmr8vIOn/HopAqqiNmTOal6qowo9j+KqNDop97g2hf9
	b+vejFtYdxF/P+N9sFFL6oFWCXI4LEGXrYQieEIKfbkS4jTkD2PT9KdGvdL7l9XlYbM5vv
	6CQ4KTuPLl6MWpge+d4IcC0nCH1piTsclxaKNgz0NgAhIqRsq81vpk4WUTEwYA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: "Michael Walle" <mwalle@kernel.org>
Cc: <sashiko-bot@kernel.org>,  "Vignesh Raghavendra" <vigneshr@ti.com>,
  "Pratyush Yadav" <pratyush@kernel.org>,  "Takahiro Kuwano"
 <takahiro.kuwano@infineon.com>,  "Richard Weinberger" <richard@nod.at>,
  <sashiko-reviews@lists.linux.dev>,  "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>,  <linux-kernel@vger.kernel.org>,  "Steam
 Lin" <STLin2@winbond.com>,  <linux-mtd@lists.infradead.org>,  "Jon Hunter"
 <jonathanh@nvidia.com>
Subject: Re: [PATCH v2] mtd: spi-nor: Fix quad-enable for flashes with QER
 bit in SR1
In-Reply-To: <DLCIM0AHZ1B0.3ECV7Z6MDHQXH@kernel.org> (Michael Walle's message
	of "Fri, 11 Sep 2026 15:18:21 +0200")
References: <20260911-perso-fix-spi-nor-qe-mxic-v2-1-70c324e9f30e@bootlin.com>
	<20260911105245.408171F00893@smtp.kernel.org>
	<877bksq7mo.fsf@bootlin.com> <DLCIM0AHZ1B0.3ECV7Z6MDHQXH@kernel.org>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Fri, 11 Sep 2026 15:37:20 +0200
Message-ID: <871pazrjsf.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_063733_025792_4CCCA52F 
X-CRM114-Status: GOOD (  25.26  )
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

On 11/09/2026 at 15:18:21 +02, "Michael Walle" <mwalle@kernel.org> wrote:

> On Fri Sep 11, 2026 at 2:45 PM CEST, Miquel Raynal wrote:
>> Hello Michael,
>>
>> On 11/09/2026 at 10:52:44 GMT, sashiko-bot@kernel.org wrote:
>>
>>> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
>>> - [High] spi_nor_read_sr1_and_sr2() leaves sr[1] uninitialized when
>>> read_sr2 is unsupported, leading to uninitialized stack memory use in
>>> callers and spurious -EIO errors.
>>
>> The annoyingly right Sashiko robot is correct :-)
>
> I actually had the same feedback, but then discarded it, because of
> your comment in the function doc.
>
> Here's what I wrote:
>
>   But now we are lying to the user of spi_nor_read_sr1_and_sr2()
>   because we might actually not read sr2 at all and just return 0 -
>   or even worse any garbage the sr[1] was initialized with. And the
>   user cannot even know if sr2 was actually read or not.
>
> But can this actually happen somewhere? Except for the WIP bit,
> otp.c and swp.c I don't see where we actually check for a bit in
> the SRs. Everything else is for RMW and that shouldn't be writing
> garbage as the expectation is that there is no flash with !read_sr2
> && write_sr2. 
> I agree, that it might be uninitialized, but if that uninitialized
> value is actually used somewhere, we'd have a bigger problem, as
> that new value is now just made up by us.

It's just annoying for the comparisons we make in the _and_check()
helpers.

>> The best way I see to make sure this does not appear, is to just add
>> this fallback to make sure when we read both registers we just get zero
>> instead of random data in the buffer. Again, the idea is to make sure
>> callers do not need to be "QER aware".
>>
>> --- a/drivers/mtd/spi-nor/core.c
>> +++ b/drivers/mtd/spi-nor/core.c
>> @@ -867,6 +867,8 @@ int spi_nor_read_sr1_and_sr2(struct spi_nor *nor, u8 *sr)
>>  
>>         if (nor->params->opcodes.read_sr2)
>>                 ret = spi_nor_read_sr2(nor, &sr[1]);
>> +       else
>> +               sr[1] = 0;
>
> Almost back to the original one :) At this point, I'm fine with
> either.

This is in addition to this patch. Just to make sure the "_and_check"
comparisons are not broken because of stale stack variables.

The rest should be good.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
