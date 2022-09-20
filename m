Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39111C54EE9
	for <linux-mtd@archiver.kernel.org>; Tue, 20 Sep 2022 08:16:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6n6+NxMZaVtt54r/Yvp9bwp9NuvnuK0GA2m5qk4UiVk=; b=q2Hf8dZBxgsW2L
	wWC5jxPfn3gWUolw0N8/WDknSrNfgUOX13Ssv5Q7ugOvHbPaXGJ173ga/KK+nP0UdeOaEA17F0FA+
	XY87+dzHXGBfTCwbjx+soZEljdrTUk8ddjSSFXyg9nGAdpSe2UVcRpFVzOJSbGuOWqktnLNXVzabI
	v2WOehKUgfJJfVxyv3LFxMQ1gk/+2eCW1ahjohKwiz5sOGkI0oOp866y/2rrkg2O/yasaST+aF+Nj
	XHlX8ayildkYGEqVj/O5D6QQkNPHnh6VzFYpPTmFEIROITzxYxaDzDL/LojhbbeWJRYsbtY1cwGpT
	NMa5x0DJkV3aN3UR1M1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaYQV-001h3f-Qh; Tue, 20 Sep 2022 08:16:20 +0000
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaYQK-001gtd-Jq
	for linux-mtd@lists.infradead.org; Tue, 20 Sep 2022 08:16:10 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 4490B1C0008;
	Tue, 20 Sep 2022 08:16:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1663661767;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=434CYzGHoeQ4qHxNxhE6pXALGn7X7EKGl1rtwJm3bK4=;
	b=ZPGjlAit17atuof15FaXUrBLyKVdGNftJ8FLQs+COWDU0y/lgWv/ibmq6nm0TeASzV0aXM
	Q3KVv1J+pOW+UYdDkb2LwQwiJVPm3i3XqLame+6ZyS7iq85pAd71y0e/H7u+gK2tTQVGFw
	T/4Ksu4zdPtYTMxkPxWzbI6rPrJwzdS7IYyRW+MTvdNnAL3jCWs6WQkEudwL94kMeNkscA
	9mdl0JwkoJY4oj1muVJGI8LLSaL44FcmqIYtdMXJjHp8bV/aGJXvqyGVtoAqtA8KTXmCd6
	stK/3Kmt+6JZSIy6ZJb9xFL9IdyuEFbmFQiqnJ0jxBW6Dzyo4K6LH827kyBg3A==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	linux-kernel@vger.kernel.org,
	tlanger@maxlinear.com,
	rtanwar@maxlinear.com,
	richard@nod.at,
	vigneshr@ti.com
Subject: Re: [PATCH v3 5/8] mtd: rawnand: intel: Don't re-define NAND_DATA_IFACE_CHECK_ONLY
Date: Tue, 20 Sep 2022 10:16:04 +0200
Message-Id: <20220920081605.598208-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220702231227.1579176-6-martin.blumenstingl@googlemail.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'ebe0cd60fcffd499f8020fde9b3b74acba9c22af'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220920_011608_876918_B44CE665 
X-CRM114-Status: UNSURE (   6.42  )
X-CRM114-Notice: Please train this message.
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

On Sat, 2022-07-02 at 23:12:24 UTC, Martin Blumenstingl wrote:
> NAND_DATA_IFACE_CHECK_ONLY is already defined in
> include/linux/mtd/rawnand.h which is also included by the driver. Drop
> the re-definition from the intel-nand-controller driver.
> 
> Fixes: 0b1039f016e8a3 ("mtd: rawnand: Add NAND controller support on Intel LGM SoC")
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
