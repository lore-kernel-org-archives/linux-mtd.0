Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8917CDB47F
	for <linux-mtd@archiver.kernel.org>; Wed, 24 Jun 2026 08:57:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tu5zgx/Gtda5tDxwK3u9zd5nbviU0l+K+mhcL6K7bCY=; b=KI+Ai3nBtEMHxZ
	nt+VgrwgHMnNdc8/nosXJTMEQ6D7FnhxxoYHkgMy/tUdNNd16rDkqAeQ3mG9Gv0rBtGocHBubXxP+
	1Eu4e+SHAHbOycUBKFLEUCvr/+nTwKDNRUQGj9r/M5B+N2F6HAj62vwVOAZdaYo9UDBj/riOdP7hf
	JIgL7o9H2Xt3a4UNEoQD1pXTo7zn4mGnxwRIR8imoQFpaQ/qAsx2qS41mu/UJWYntJvsgXBXSUYfT
	+iYYL7vdd85HBZZXHoMxuTQwg1hnj4oAAOdkIcO06D2eNUQSEE6UoyJpdIk3fzSyLF568agjCcRn7
	Qj0+Ddhm8x/d84COwF5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcJQU-00000007RsE-3LEH;
	Wed, 24 Jun 2026 08:57:42 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcJQT-00000007Rrk-1siT
	for linux-mtd@lists.infradead.org;
	Wed, 24 Jun 2026 08:57:41 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 9BE7660138;
	Wed, 24 Jun 2026 08:57:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27A5C1F000E9;
	Wed, 24 Jun 2026 08:57:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782291460;
	bh=i0rLogUPK+FL3n+8ThKvfT00jXw9VysT4YwRofQtGXU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=XnlCZYXL0t2B5aXdw6s+Rmnro13bXOWIW4Z+QZ3LhXBosHBreL2DE/RvNBFAqa3wN
	 GFYxGys0UhTl2qOiwii8UXHdO1+hAFLkUpcnISiKPfkGRoQ7L19VziTsXSQv00UlN6
	 AjofUgTaaXCUTcgsTMpqjxU3w/S3nUVxaZeUpzlB9/gs8eM+AFALfLq0/A1AU3E4UR
	 puB+XO/dJazH/3HXCsCQesKkHa19LZDCg1h6omQIDRMDAaimTETgEJhvOCJmoMjpbC
	 C10um8mFEtcPQkVDhex/67D2st5BJgl9dVlhpKdxev+vnJ4vhBb4kbe51gZ10suUUv
	 lp/Zd1D5iMY6g==
From: Pratyush Yadav <pratyush@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  Pratyush Yadav <pratyush@kernel.org>,  Michael Walle
 <mwalle@kernel.org>,  Takahiro Kuwano <takahiro.kuwano@infineon.com>,
  linux-mtd@lists.infradead.org
Subject: Re: Sashiko to track linux-mtd
In-Reply-To: <875x38mlk7.fsf@bootlin.com> (Miquel Raynal's message of "Wed, 24
	Jun 2026 09:42:16 +0200")
References: <875x38mlk7.fsf@bootlin.com>
Date: Wed, 24 Jun 2026 10:57:37 +0200
Message-ID: <2vxz4iismi2m.fsf@kernel.org>
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

On Wed, Jun 24 2026, Miquel Raynal wrote:

> Hello MTD folks,
>
> I mentioned it rapidly on IRC but I believe a formal e-mail is more
> appropriate. I consider asking the Sashiko team to track linux-mtd to
> help us with reviews:
>
> * sashiko@lists.linux.dev
> * Roman Gushchin <roman.gushchin@linux.dev>
>
> I believe Sashiko will be a useful tool given that our time is
> limited. We were already monitoring the output of Sashiko when other
> (Sashiko enabled) mailing lists were copied, so I propose to officially
> add linux-mtd to the list.

I have been using Sashiko a lot and I think it is quite useful. It helps
catch bugs that are very hard for humans to see.

It doesn't do so well at design and high level patch review, so we
aren't out of a job just yet ;-)

>
> Richard said he was fine with the idea as long as it remained a tool. I
> agree with this approach, Sashiko is not the Alpha & Omega, but I
> believe it proved itself useful just by the amount of corner cases it
> managed to catch already. Not all recommendations should be followed and
> we are not looking for an empty Sashiko response for merging.
>
> There is apparently the possibility to tune the prompt per subsystem. At
> this stage I haven't thought very deeply about it and considered not
> adding any subsystem specific rules. Maybe the SPI NOR team wants to
> come up with some guidelines, such as the need for a record (using the
> script in the documentation) for new chips additions. I would propose to
> not delay the addition of our mailing list for that. This does not need
> to be done from day 1, as we can make PRs to their GH repository with
> these extra requirements whenever we are ready, see below.

I think we should not do subsystem prompts unless we see it keeps
tripping up on something it can't infer from looking at the source code.
That is normally things like "this is a problem but we don't support
this".

Other than that, you want it to run free and look at the source code as
the source of truth, and not the prompts, which can go out of date.

Also, I think the prompts were more useful for older models which
weren't as capable. Today's models are very good at looking at code, and
generally don't need that much hand holding.

>
> Link: https://github.com/sashiko-dev/sashiko/blob/main/MAINTAINERS_GUIDE.md

-- 
Regards,
Pratyush Yadav

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
