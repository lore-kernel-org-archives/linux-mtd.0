Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5A24CF8575
	for <linux-mtd@archiver.kernel.org>; Thu, 20 Nov 2025 09:27:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JYC+xBuuVs03FERo7rpApv372SusqRFM1tNi5r1vHls=; b=hHaGHtiVZkFMiA
	twZVVVU1NEvtdom5nvjfBt+az0JX6nC1Ndb74/HyCkzoC8gr1iSAa5jB7xKoyFZqp3Inysu/dc6Xm
	ojpqiOOykJChd0JyYrwW5bgcfaW7jLz2hHUVv12/N1i+nxqPqW7mm8AvdSzhqFY+rLyHBGOH+Picy
	HOvahiFtKWcxVupQbJ+5JlEAeOsuOc1CCslhti7sAdaiYzOAGMob5ClemJA3E6ilFzVGmKN4FceUF
	PrrloRi30AkGcc0qHx3q9XF2l7irkYybmtjWMKj2BlU26NLDAmehtTZFI6iJDFrCw6hRcGszuOnVG
	elXx06Jmo+3pay9NA44Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM0wW-00000006Q59-2qqz;
	Thu, 20 Nov 2025 09:27:08 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM0wU-00000006Q52-2dws
	for linux-mtd@lists.infradead.org;
	Thu, 20 Nov 2025 09:27:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 5987F6014E;
	Thu, 20 Nov 2025 09:27:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A700C4CEF1;
	Thu, 20 Nov 2025 09:27:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763630825;
	bh=CTONTXlpIBOdxpIZBCXGsNld855TC4euuS5HGWFE5zA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=KF/c9Fn3Zv/uihzuTZGrdFwHThuDVRPtwuBCWPGLXoCU8ZpDmJUiIK3KDT3pfaayV
	 0+DH1Zi7XYe87iHPCc92j405P1PBx9+nf8g1kvJMfZur4yJt01yU+jmu2GlWYY0fwy
	 ZjDZIUD/iwgQTsXZJl7Xho3nJIJLAcZjjAvAwlbtqmZdB5JboyUVXg/myFk5GKhe2r
	 NAGqCgY5wY9IKI2lILvtzlj6j7CL9dynuxcbdZQmS1ZewyMkb1gJ+hrZ0EJf0qrn22
	 khhLMag9uzFqyKyHQfw+F1dWET0Ysf37Cn6r7B4oUO+qkt8zKd/XKYrSA7qslbp063
	 edHBen3xoU7BA==
From: Pratyush Yadav <pratyush@kernel.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: Pratyush Yadav <pratyush@kernel.org>,  Jakub Czapiga
 <czapiga@google.com>,  Tudor Ambarus <tudor.ambarus@linaro.org>,  Michael
 Walle <mwalle@kernel.org>,  Miquel Raynal <miquel.raynal@bootlin.com>,
  Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  linux-mtd@lists.infradead.org,
  linux-kernel@vger.kernel.org,  Konrad Adamczyk <konrada@google.com>,
  Adeel Arshad <adeel.arshad@intel.com>,  Mika Westerberg
 <mika.westerberg@linux.intel.com>,  Kornel Duleba <korneld@google.com>
Subject: Re: [PATCH v2] mtd: spi-nor: core: Check read CR support
In-Reply-To: <20251118-stereotyped-quizzical-dolphin-9a7bb4@lemur> (Konstantin
	Ryabitsev's message of "Tue, 18 Nov 2025 09:20:48 -0500")
References: <20250919181547.2172319-1-czapiga@google.com>
	<mafs0v7j74iz0.fsf@kernel.org>
	<20251118-stereotyped-quizzical-dolphin-9a7bb4@lemur>
Date: Thu, 20 Nov 2025 10:27:02 +0100
Message-ID: <mafs0ecpt2gwp.fsf@kernel.org>
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

On Tue, Nov 18 2025, Konstantin Ryabitsev wrote:

> On Tue, Nov 18, 2025 at 01:34:59PM +0100, Pratyush Yadav wrote:
>> BTW, b4 complains that DKIM fails on your email. Please check.
>
> This is due to Google's policy of setting very short expiration dates in their
> DKIM headers:
>
>     t=1758305794; x=1758910594;
>
> It's set to invalidate after 1 week:
>
>     $ date -d '@1758305794'
>     Fri 19 Sep 2025 02:16:34 PM EDT
>     $ date -d '@1758910594'
>     Fri 26 Sep 2025 02:16:34 PM EDT

I see. Thanks for explaining!

-- 
Regards,
Pratyush Yadav

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
