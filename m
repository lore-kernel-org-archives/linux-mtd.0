Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C022CD5BB1
	for <linux-mtd@archiver.kernel.org>; Tue, 26 May 2026 15:35:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=I5l92htV+gdPvU3GwkbUTBpC1vXoJrOOjTXqtaM5KG8=; b=vSvhIUpttFU8vK
	STCGw9VOO38j8GI2b8MtgnaMi2SBggkxEXuXUGzWv70REFdB0vkWq81L8bsaD5QVxkl8yJGaBIUMs
	LQAlxYYj2lxaEf54Q9Okw91EBV1Hg0GVVfetNPAvwHLTZTZwltrdwSqTpBWjcwO1G42QAzeoMJsAv
	PIS6bkYY6J8iJ+4xalmL+zhxT5lQ76NpA9HVhq2UfLm5ZvYYm5yk8lBtKEIaIbATszVKiminpuU9z
	102FaiC/bUen0uy6i1g9b53bo/tGhr+vrW90XR6wcTKh4yVhiJ+6hJSmIbZWTc8PiMAQYlh6CBbQo
	dNKLaY0EfC8YvRoMdYyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRtoX-00000002OLJ-2Ja8;
	Tue, 26 May 2026 15:35:29 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRtoW-00000002OL4-0qcv
	for linux-mtd@lists.infradead.org;
	Tue, 26 May 2026 15:35:28 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id A4E8C60018;
	Tue, 26 May 2026 15:35:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6E2F1F000E9;
	Tue, 26 May 2026 15:35:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779809727;
	bh=idMbG6Muree+cvLwC3HEjKGEVbk/jCLWFu0evZJQ3Ig=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=CZo4exUQ2oXd7kuFQy8VkDB82ZOWnadorXWtHXCVIm88pFgxiAKvx1RAI09eyQy7l
	 0HM3twUxFtVgIgG0G34YVmSPaBqlQnUiKlsNeL6+BtjaR6in7dJ8IBRtUB0NvE2cim
	 Sl4ZBQUCHOx2ogeVpW6pniOYryqnfzYZIIupJc1IP/krGbGhkSJx8MTT07jtinEjeI
	 Egu2kcUoZMx1jCx3EjC3mHbY9zImTdS4f4sQYMH2k3swblnNRr8aQlBrR/4ldNDe6r
	 YeYVg2UyYq47go1wzR7+SrgvWAVSLAs6AFptom5GmwBELQmLzqpmcYq5ouY4HDj6Gm
	 kSekovzGLJ8XA==
From: Pratyush Yadav <pratyush@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Pratyush Yadav <pratyush@kernel.org>,  Michael Walle
 <mwalle@kernel.org>,  Takahiro Kuwano <takahiro.kuwano@infineon.com>,
  Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  Jonathan Corbet <corbet@lwn.net>,  Tudor Ambarus
 <tudor.ambarus@linaro.org>,  Shuah Khan <skhan@linuxfoundation.org>,  Sean
 Anderson <sean.anderson@linux.dev>,  Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>,  Steam Lin <STLin2@winbond.com>,
  linux-mtd@lists.infradead.org,  linux-kernel@vger.kernel.org,
  linux-doc@vger.kernel.org,  stable@kernel.org
Subject: Re: [PATCH v6 00/28] mtd: spi-nor: Enhance software protection
In-Reply-To: <20260526-winbond-v6-18-rc1-spi-nor-swp-v6-0-4092f1419f8f@bootlin.com>
	(Miquel Raynal's message of "Tue, 26 May 2026 16:56:24 +0200")
References: <20260526-winbond-v6-18-rc1-spi-nor-swp-v6-0-4092f1419f8f@bootlin.com>
Date: Tue, 26 May 2026 17:35:23 +0200
Message-ID: <2vxz8q964210.fsf@kernel.org>
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

On Tue, May 26 2026, Miquel Raynal wrote:

> Hello,
>
> Back in October 2025, the "locking" support in SPI NOR was discussed on
> the mailing list (link below). The conclusion was that this support
> could benefit from some enhancements. As I myself had to dig into it,
> here is a proposal.
>
> First issue that I see, the MEMLOCK ioctl is not behaving correctly
> in some cases, as addressed in:
>
>     mtd: spi-nor: swp: Improve locking user experience
>
> Then there is no clear explanation of the shortcuts taken by the kernel
> in terms of uAPI, so there is an attempt to list them in:
>
>     mtd: spi-nor: swp: Explain the MEMLOCK ioctl implementation behaviour
>
> Plus, Tudor also asked if we could cover locking in the testing
> procedure, which is done in:
>
>     mtd: spi-nor: Add steps for testing locking support
>
> In order to simplify this procedure, and because it got very helpful
> during my testing/development, I want to propose additions to the
> debugfs output:
>
>     mtd: spi-nor: debugfs: Add locking support TODO: make the captures again
>
> Finally, I am providing an implementation for the complement (CMP)
> feature in order to allow finer control of the regions locked. This
> feature is for instance available on Winbond chips:
>
>     [core] mtd: spi-nor: swp: Add support for the complement feature
>     [doc]  mtd: spi-nor: Add steps for testing locking with CMP
>     [use]  mtd: spi-nor: winbond: Add CMP locking support
>
> Disclaimer: it was much less straightforward than I initially thought to
> get the CMP feature working correctly. I tested it with as much focus as
> I could, and I am improving the test coverage for the new cases, I am
> also providing extra test cases in the metadata of the commit (which do
> not make sense to test for chip additions, but may be sensible show when
> making core additions like this one), but honestly there are so many
> possibilities, I may still be missing corner cases. I hope this will
> anyway be helpful to others!
>
> All the other patches are misc improvements or style fixes which I faced
> and fixed during my development.
>
> Link: https://lore.kernel.org/linux-mtd/92e99a96-5582-48a5-a4f9-e9b33fcff171@linux.dev/
>
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>

Applied to spi-nor/next. This should give us around 3 weeks to soak in
linux next. Expect the SPI NOR PR a little bit later than usual, around
the start of the merge window so we can maximize the exposure of these
patches.

Apologies once again for the crappy contributor experience, I tried to
get to this sooner, but wasn't much successful at it :-/

[...]

-- 
Regards,
Pratyush Yadav

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
