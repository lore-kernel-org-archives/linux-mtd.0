Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCDB4C7EE23
	for <linux-mtd@archiver.kernel.org>; Tue, 23 May 2023 13:43:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OWdjV33uqc/E6vH/slGDdxh3e4zWrPYx/LyQI6eTDq0=; b=ccw9Rv1Xr3+KvG
	/tS0zfeLgpIguhlwTtmn5BWHLd7LAdLEVAmhLE7m/1lEqQg779h1U8I75v/m374MA9vS2z4I0mAL8
	dp/vqq89KjzJJg6NQB76oS4dhRRtMW44XHjmv5DhKMxMpYh6k2axUWLC8j0k3v2C3GDsjB3uCw/dl
	MLfKCaBlggSZ2KfbsKQNPwQuC7RbArPCAvkEgyP/+6IiSrvWjITnChHJzMC4adxxN4+uBF6tnzzdc
	oR4SOoazYjyrL4RHQ7lbo4/Q6/YOYywOlRIsvhhr+Fw/J51Dm7t3a+Tdd1xyNljL+uLZhIMVVIRhG
	pwLxw71hkfJxw1SCeheg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q1SIU-00AOqX-1J;
	Tue, 23 May 2023 13:43:30 +0000
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q1SIR-00AOp6-1x
	for linux-mtd@lists.infradead.org;
	Tue, 23 May 2023 13:43:29 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 002DA1BF203;
	Tue, 23 May 2023 13:43:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1684849402;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/2LQ6U7bjWKvWknnaoUpccfU/te8/XY9Jc2ToqZSvqw=;
	b=mDOdn4Hjb+Gl3VrHcG+zat4FkwgxrDaqJF6XmMdf38Q6nUurZl9MUZGFJ5kTuX64EjIvoX
	xK6LxJFdIw9UPQQMVH96OIFXO2+u5DaaHW/6a+FVa18gBdpfTlhXKjc6Z/0hyMgdwII24v
	S6dd1crJstW6m3bWlrjiiWenLyCuNkkTXfOOjEgbRUg6dVI4RdorZR90jpFcpSXxJnXsRk
	Oqx9stbX9Lh8knzKmdsU3CyHvXqCQPFbc14QL2Y/gkeGCmeOpQTTkEEA5DK4dzUHaGmrHv
	kd7VgJwCMsW658+XKn7k7Cg6mxEFBp3rR3ZiMuR/lSRq+I3v4OTQl4C42zOFyA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Arnd Bergmann <arnd@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	=?utf-8?b?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>
Cc: Arnd Bergmann <arnd@arndb.de>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtdchar: mark bits of ioctl handler noinline
Date: Tue, 23 May 2023 15:43:19 +0200
Message-Id: <20230523134319.319149-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230417205654.1982368-1-arnd@kernel.org>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'637ae8f2560b3c524788c491a81ded4d021d3f39'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230523_064327_914644_8691473A 
X-CRM114-Status: GOOD (  11.24  )
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

On Mon, 2023-04-17 at 20:56:50 UTC, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> The addition of the mtdchar_read_ioctl() function caused the stack usage
> of mtdchar_ioctl() to grow beyond the warning limit on 32-bit architectures
> with gcc-13:
> 
> drivers/mtd/mtdchar.c: In function 'mtdchar_ioctl':
> drivers/mtd/mtdchar.c:1229:1: error: the frame size of 1488 bytes is larger than 1024 bytes [-Werror=frame-larger-than=]
> 
> Mark both the read and write portions as noinline_for_stack to ensure
> they don't get inlined and use separate stack slots to reduce the
> maximum usage, both in the mtdchar_ioctl() and combined with any
> of its callees.
> 
> Fixes: 095bb6e44eb1 ("mtdchar: add MEMREAD ioctl")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> Reviewed-by: Richard Weinberger <richard@nod.at>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/fixes, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
