Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EA15C54ED1
	for <linux-mtd@archiver.kernel.org>; Tue, 27 May 2025 16:48:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=S4QCOZP5qbxy1rXoEESMZON0FB7VhzvaA+B4LROsxzo=; b=nrVsoYcs/8mzTf
	6dhOeN/3sYd94ag6rJecDQhznLESmjR9iq84/Sp4uWTCJSavay2amobUWkC+Im9o4PJiTcCJQGaHH
	IvSVJCNUf5o6OLKz0J9x2kpNC0WRs5/zkwEYAFiub1W0SlviqPtChyncF4x59pOMTHg1wVTYWWy1/
	dJ1K10s16zpwgCutQRfaNBWfo2GbnzjfJbaikE3Lpesf3C9I6Xha6MqcOmNvb4r7pvReijha4pOG+
	x45ROeTe5K2nxQ3svt+4cAXFj9X6Ov/EFEXFqMHozl0lmAPD0jevgJeQW0FiuBxSIq6sAd1p3MPan
	zt1xt5So44SZLzJfHgPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJxTR-0000000BCTX-07kC;
	Tue, 27 May 2025 16:48:21 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJxTQ-0000000BCTR-1DMF
	for linux-mtd@lists.infradead.org;
	Tue, 27 May 2025 16:48:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 967AF614BF;
	Tue, 27 May 2025 16:48:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24639C4CEEB;
	Tue, 27 May 2025 16:48:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748364499;
	bh=Tf19WzV5Y4mNKaO/9L9esYEvRB3gAhQbNCseBCi5NOI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=h/SyanKxIKk8cT+4M+fWrq8+Uk9RrxNNVVK36Kfubn40L54eWfnjhqpGvWBBT1XfI
	 qAd0dJg9X+B7AO+euLCUnXoDe/T74vLn8i2k059fy1WGh6I8O9OpLeM7F5OFzKYmVC
	 1M9AQbOsU14uc6VX1jYOgH1GLycPj06Q9o3fAx71ix2TRw/7kPFkQQxfsoELAn4II+
	 y09KJZIMuRlHAra0UDOuUGTalWdVhDrE+gUkt24fia8qcMkEVItvEeu4pqwiaYzR0F
	 xhiznIXpXKWQC402YpCH/RMq6zh53JsSyxLxj5x9e2khynlG/4ej6JWyq+Yfa0sk28
	 voTEd5uc6iS8Q==
From: Pratyush Yadav <pratyush@kernel.org>
To: "William A. Kennington III" <william@wkennington.com>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>,  Pratyush Yadav
 <pratyush@kernel.org>,  Michael Walle <mwalle@kernel.org>,
  linux-mtd@lists.infradead.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC] mtd: spi-nor: Sleep between ready checks
In-Reply-To: <20250523001412.878560-1-william@wkennington.com>
References: <20250523001412.878560-1-william@wkennington.com>
Date: Tue, 27 May 2025 18:48:17 +0200
Message-ID: <mafs0a56yrodq.fsf@kernel.org>
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

Hi William,

On Thu, May 22 2025, William A. Kennington III wrote:

> We have SPI NOR devices that respond very slowly (200ms+) to some
> commands. This causes our CPU to stall while repeatedly polling the NOR
> with no cooldown in between attempts. In order to reduce overhead, this
> patch introduces an exponential backoff in SPI readiness polling, that
> self tunes the polling interval to match the speed of most transactions.
>
> Signed-off-by: William A. Kennington III <william@wkennington.com>

I didn't read the code too deeply, but it seems full of magic values and
I am honestly not a big fan of how it reads. At the very least the logic
should be less black-magic. But since I didn't spend too much time
understanding the code, I don't have specific feedback for you.

BTW, you say it causes CPU stalls. The loop has a cond_resched() after
every iteration which I think gives the scheduler a chance to run other
tasks. Does that not work for some reason?

[...]

-- 
Regards,
Pratyush Yadav

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
