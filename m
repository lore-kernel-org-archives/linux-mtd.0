Return-Path: <SRS0=FXe4=P2=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70512C43387
	for <linux-mtd@archiver.kernel.org>; Fri, 18 Jan 2019 11:44:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 349BB20823
	for <linux-mtd@archiver.kernel.org>; Fri, 18 Jan 2019 11:44:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="g5Qa+3xb";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="utmRBRHL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 349BB20823
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=xds2wbnYPCV/ea2pu+CHCMvt9l+nbibsrYWzNkI74RM=; b=g5Qa+3xbtRg0GH
	a+nrNL+ElR0UT+aPrGHAZ0rLsQ9YjL40nujOc3VhWbaFy1FwUpugSu8nJOh/ze6rLZ9feRMpsOg6t
	lnO/lz76Ct4ndmJWEPkBJP8ID+wumKmE5S/BqTA4oq+t5idMZPmAihPy3MkLsCAWjMwc21j2b0CIT
	ZBocyBTduOpOkh8l3DaAv7uHE/PtrCbuv6TOp5c1qXZyS36r0pWdxUU72ht5p8XeNCKqlpMHO/B7+
	Fn7I0syabk0FUtFc4YDCx8c0I8/H0U69gPTTBSlR7Wy1GJZeRV/vt6AJ2XclqE72EK4v9gidl3cKd
	NXtadA0EtimO5o8kM+WA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gkSZQ-0000Ri-6a; Fri, 18 Jan 2019 11:44:20 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gkSZF-0000Ik-2H
 for linux-mtd@lists.infradead.org; Fri, 18 Jan 2019 11:44:17 +0000
Received: from localhost.localdomain (91-160-177-164.subs.proxad.net
 [91.160.177.164])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E24E42087E;
 Fri, 18 Jan 2019 11:44:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1547811848;
 bh=jKfUmkdAizxDRAtooW6vVKZl36Cb7th2tkWfEWU3wWo=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=utmRBRHLmzfZwQkdeAwZ/63i5JCvH0e52ijW8mOudPRX3YMGCgfPpZi1fONBOn11Y
 QOKq9DVeZXZXExYjMS2EpPU9++Ymc9QRDLCO04oj+W2pc8EdBfcemLOJa+XMQTakEw
 7eomX1myvVjSZTJSbtcfif7o6VgzVsx82IkeZX/c=
From: Boris Brezillon <bbrezillon@kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <bbrezillon@kernel.org>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 linux-mtd@lists.infradead.org
Subject: Re: mtd: rawnand: fsmc: Keep bank enable bit set
Date: Fri, 18 Jan 2019 12:44:01 +0100
Message-Id: <20190118114401.22104-1-bbrezillon@kernel.org>
X-Mailer: git-send-email 2.17.1
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: 663ec3a2c2d02775bc723b20a1af33262f790f50
In-Reply-To: <20190109215144.15749-1-linus.walleij@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190118_034410_162845_7CA379EC 
X-CRM114-Status: GOOD (  15.51  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Wed, 2019-01-09 at 21:51:44 UTC, Linus Walleij wrote:
> Hammering the "bank enable" (PBKEN) bit on and off between
> every command crashes the Nomadik NHK15 with this message:
> 
> Scanning device for bad blocks
> Unhandled fault: external abort on non-linefetch (0x008) at 0xcc95e000
> pgd = (ptrval)
> [cc95e000] *pgd=0b808811, *pte=40000653, *ppte=40000552
> Internal error: : 8 [#1] PREEMPT ARM
> Modules linked in:
> CPU: 0 PID: 1 Comm: swapper Not tainted 4.20.0-rc2+ #72
> Hardware name: Nomadik STn8815
> PC is at fsmc_exec_op+0x194/0x204
> (...)
> 
> After a discussion we (me and Boris Brezillion) start to suspect
> that this bit does not immediately control the chip select line
> at all, it rather enables access to the bank and the hardware
> will drive the CS autonomously. If there is a NAND chip connected,
> we should keep this enabled.
> 
> As fsmc_nand_setup() sets this bit, we can simply remove the
> offending code.
> 
> Fixes: 550b9fc4e3af ("mtd: rawnand: fsmc: Stop implementing ->select_chip()")
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> Reviewed-by: Boris Brezillon <bbrezillon@kernel.org>
> Acked-by: Miquel Raynal <miquel.raynal@bootlin.com>

Applied to http://git.infradead.org/linux-mtd.git mtd/fixes, thanks.

Boris

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
