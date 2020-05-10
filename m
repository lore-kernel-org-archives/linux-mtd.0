Return-Path: <SRS0=JbbF=6Y=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50CBDC38A2A
	for <linux-mtd@archiver.kernel.org>; Sun, 10 May 2020 20:16:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2245B206F5
	for <linux-mtd@archiver.kernel.org>; Sun, 10 May 2020 20:16:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="KNDKsnMd"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2245B206F5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RXEzdFeUBW9hJm4CP5BrSsTeJyq8Rz9x/ToUQVJCDFc=; b=KNDKsnMda/agDg
	WYZ9DoTpqAkAshJFzwXupX40nFQUG24hsrrAWnm/LPjlWQ56XdKeWS/427tr5rUwq1ZRr+ZoAK3SD
	s2TMEOHNqEXT45GWD3WR7r34i3RBFBlCdfLY6wLfsqVd6KIXbl6bgi+E2IWOGH94mrpHTgoMsEigz
	N4tLekGbsZLNlGwjEQ2P1QMKhsZgSk5hdr4FujExDvq6ctPC2cAe23bJHwVQIUQmgsOHW70MVfxWj
	djuBINaDrT5sCESVS3eiWXVO6ClKk4Ap2sbBOsNvn6bZC9assgDTdhPEE2fMk5vyNS2gJvyeC91TK
	+ow4TV4TFWQp0CWYduPQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jXsMv-00079z-KX; Sun, 10 May 2020 20:16:13 +0000
Received: from relay10.mail.gandi.net ([217.70.178.230])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jXsE9-0002Xi-EC
 for linux-mtd@lists.infradead.org; Sun, 10 May 2020 20:07:13 +0000
Received: from localhost.localdomain (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay10.mail.gandi.net (Postfix) with ESMTPSA id 74CC4240002;
 Sun, 10 May 2020 20:07:05 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Fenghua Yu <fenghua.yu@intel.com>, "David Woodhouse" <dwmw2@infradead.org>,
 "Brian Norris" <computersforpeace@gmail.com>,
 "Boris Brezillon" <bbrezillon@kernel.org>,
 "linux-mtd" <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH] mtd: rawnand: fsmc: Change to non-atomic bit operations
Date: Sun, 10 May 2020 22:07:04 +0200
Message-Id: <20200510200704.3392-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <1576886755-9788-1-git-send-email-fenghua.yu@intel.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: 7c26e6ef96c95105d6b1dc828902067df9b0f076
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200510_130709_628634_8F48039E 
X-CRM114-Status: UNSURE (   7.02  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Ravi V Shankar <ravi.v.shankar@intel.com>, Tony Luck <tony.luck@intel.com>,
 Peter Zijlstra <peterz@infradead.org>, David Laight <David.Laight@ACULAB.COM>,
 Andy Lutomirski <luto@kernel.org>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Sat, 2019-12-21 at 00:05:55 UTC, Fenghua Yu wrote:
> No need to use expensive atomic change_bit() on dat[] and err_idx[]:
> 1. fsmc_bch8_correct_data() is called while mutex chip->lock is held
> 2. err_idx[] is a local variable.
> 
> To avoid big endian concern due to type cast to unsigned long, directly
> change the bit in the specified byte instead of using non-atomic
> __change_bit().
> 
> Suggested-by: Peter Zijlstra <peterz@infradead.org>
> Signed-off-by: Fenghua Yu <fenghua.yu@intel.com>
> Reviewed-by: Tony Luck <tony.luck@intel.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
