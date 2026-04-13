Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40ADFF34C4E
	for <linux-mtd@archiver.kernel.org>; Mon, 13 Apr 2026 13:45:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6OOLu1FGa5uONT1ak/ulHIhQCXPfo06aw4/oqalYUGI=; b=r2gHpu+hMQKaU/
	yg6s6KAXPXCEosn/rR3T9HgyXqCk2ZfUsOAGMMiwRynupk6unGARS+OSGCAsiN+ZWkzQH4hrmjHUN
	IuWtaOU09dMqRoGGLqo8poihw9JCNlk/6Vszr8wmGtQ6sVFISkvleXjS/73/9n5i07ed8breSHyzT
	hvblWQxs4Yp52RNQ9vhnI73n+HIth1rvaBTQm5Ahas6fmtywlaJMVU700+APFhlfwedRhKxuXvCBn
	XG+bxPSmZ2J9RagON5cDuYCgip1vJsBKL7TnC45Fm3efIV4p8w6e8fidWhNPOZM8MwF8WAxP5nTxF
	3e3fCGjKKP0tMrmIljyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCHbO-0000000Fltw-0Gdb;
	Mon, 13 Apr 2026 13:45:22 +0000
Received: from elvis.franken.de ([193.175.24.41])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCHbK-0000000Flsj-0zmq
	for linux-mtd@lists.infradead.org;
	Mon, 13 Apr 2026 13:45:20 +0000
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1wCHbE-0004aF-00; Mon, 13 Apr 2026 15:45:12 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 3E540C0256; Mon, 13 Apr 2026 15:43:01 +0200 (CEST)
Date: Mon, 13 Apr 2026 15:43:01 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Linus Walleij <linusw@kernel.org>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>, linux-mips@vger.kernel.org,
	linux-input@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-mtd@lists.infradead.org
Subject: Re: [PATCH 0/2] MIPS RB532 GPIO descriptor conversion
Message-ID: <adzy5WHWbZUZjQ8I@alpha.franken.de>
References: <20260328-mips-input-rb532-button-v1-0-98e201621501@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260328-mips-input-rb532-button-v1-0-98e201621501@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260413_064518_422152_59946EDD 
X-CRM114-Status: GOOD (  18.19  )
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

On Sat, Mar 28, 2026 at 04:55:46PM +0100, Linus Walleij wrote:
> This moves the MIPS Mikrotik RouterBoard RB532 over to using
> GPIO descriptors by augmenting the two remaining drivers using
> GPIOs to use software nodes and device properties.
> 
> This is part of the pull to get rid of the legacy GPIO API
> inside the kernel.
> 
> It would be nice if someone can test of this actually works,
> I've only compile-tested it.
> 
> If we can agree on this method to move forward with this machine
> it would be nice if the MIPS maintainer could merge the end
> result with ACKs from the input and MTD maintainers.
> 
> Signed-off-by: Linus Walleij <linusw@kernel.org>
> ---
> Linus Walleij (2):
>       MIPS/input: Move RB532 button to GPIO descriptors
>       MIPS/mtd: Handle READY GPIO in generic NAND platform data
> 
>  arch/mips/rb532/devices.c         | 83 ++++++++++++++++++++++++++++-----------
>  drivers/input/misc/rb532_button.c | 35 ++++++++++++++---
>  drivers/mtd/nand/raw/plat_nand.c  | 24 ++++++++++-
>  3 files changed, 113 insertions(+), 29 deletions(-)

series applied to mips-next

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
