Return-Path: <SRS0=LhK/=CQ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A482C433E2
	for <linux-mtd@archiver.kernel.org>; Mon,  7 Sep 2020 07:36:15 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C2ABF207C3
	for <linux-mtd@archiver.kernel.org>; Mon,  7 Sep 2020 07:36:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ZQPiYeLp"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C2ABF207C3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Ryxrfafu8pBrS9cKjLaJIf9b6hR7eAZMgZTKtm1+QQ8=; b=ZQPiYeLprxWiaMBAsfgdJnRMV
	FaPkQrBtQ53OJV0omnUBDhR+sT4As6FWgUIUJQxO9zaE/IqnSv33C20wt9u230GZ1orH/9tMM7uNX
	jutqzIURKIpZ5Nyyn+AKyDXPpZhJSexrBSxXV8uOtW2kBzPM8CMSU+QvHrEP3u0XwCHcCl5K/tts+
	7wpkHRaLdvZjprbtD0NcDh5YRoB8Fxw3HC8rTZQ8sEPU1D3WIV/Vbo5YdV+Z7yt8xWESionLRAOtr
	QOMnHsoUT0/wU3MqmotkIrS5yIQyY6jwgt7p7TJniV3jP1QLYjdzKZN2fWMdFRd+szvJG1n28+2dx
	KhC898qYQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kFBgZ-0001fl-DG; Mon, 07 Sep 2020 07:35:31 +0000
Received: from relay11.mail.gandi.net ([217.70.178.231])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kFBfM-00012G-MZ
 for linux-mtd@lists.infradead.org; Mon, 07 Sep 2020 07:34:18 +0000
Received: from localhost.localdomain (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay11.mail.gandi.net (Postfix) with ESMTPSA id 8B79F100003;
 Mon,  7 Sep 2020 07:34:13 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Arnd Bergmann <arnd@arndb.de>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Vincenzo Aliberti <vincenzo.aliberti@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH] mtd: lpddr: fix excessive stack usage with clang
Date: Mon,  7 Sep 2020 09:34:12 +0200
Message-Id: <20200907073412.27402-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200505140136.263461-1-arnd@arndb.de>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: 3e1b6469f8324bee5927b063e2aca30d3e56b907
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200907_033416_877215_C23D22A0 
X-CRM114-Status: GOOD (  14.59  )
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
Cc: Richard Fontana <rfontana@redhat.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, clang-built-linux@googlegroups.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Tue, 2020-05-05 at 14:01:16 UTC, Arnd Bergmann wrote:
> Building lpddr2_nvm with clang can result in a giant stack usage
> in one function:
> 
> drivers/mtd/lpddr/lpddr2_nvm.c:399:12: error: stack frame size of 1144 bytes in function 'lpddr2_nvm_probe' [-Werror,-Wframe-larger-than=]
> 
> The problem is that clang decides to build a copy of the mtd_info
> structure on the stack and then do a memcpy() into the actual version. It
> shouldn't really do it that way, but it's not strictly a bug either.
> 
> As a workaround, use a static const version of the structure to assign
> most of the members upfront and then only set the few members that
> require runtime knowledge at probe time.
> 
> Fixes: 96ba9dd65788 ("mtd: lpddr: add driver for LPDDR2-NVM PCM memories")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> Reviewed-by: Nathan Chancellor <natechancellor@gmail.com>
> Acked-by: Miquel Raynal <miquel.raynal@bootlin.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
