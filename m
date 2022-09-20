Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FB89ECAAD8
	for <linux-mtd@archiver.kernel.org>; Tue, 20 Sep 2022 08:42:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=t/t/ZUgGUaO9qyVGhDYL4QxacxzC7XsbijvRmfi4RP8=; b=MmecoP+aHNsYD4
	JP6Ho+6kJ5v13u3A3jy21oZxV3VZaXaPEkdDHfkt+ueco553rj+m7m6ziDSoozbHTUlFCs0O8bK7r
	99Gbrl6tioONe26ebJ90fHIj0BieJtKFaR+OXB6Ff1IY6VPVGGkmsbD7l8MvVsTeHwRQa6tuiZEOn
	6tc3qthWpoWRVYDVFHwMsuLhP4HufYgtihl63BHTtTaoQDDiQStwQcvLp5Iok5ZMbL30JW5R55uf0
	Yw6eRDDKj5VSatfI9+eXv083wGwn4cd80YdbItpO6b/3w4tUn1cbSm8MPA3LtGgYhBCvk+T6yJbw3
	s74xhHLrbNIPWBaVH1dQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaYpJ-001y07-Vm; Tue, 20 Sep 2022 08:41:58 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaYoM-001xL0-BU
	for linux-mtd@lists.infradead.org; Tue, 20 Sep 2022 08:41:00 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 96B6720015;
	Tue, 20 Sep 2022 08:40:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1663663256;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NtNJCvV3XRUp7DLnv6sKp5OMSzm47xcbNcA0aDhjMJo=;
	b=e3CB2fJqNRSpS4fX3Ivz69Tre5esojl++H8gLqM34UgRvWFhZbLAlaCw+OHcXsz87zNUU/
	jQ+M8fsTgx3fg/ZBkjV5dMPgsLaJ1V3U4UjW2JPKBILMtlba743wuF4lkgVB6oQgJ7oey9
	UjedLZGidb1m7jMWLgstJzXzr9gpMuOBTeLU6c8P6Hn4xrf8F2egM/6kpW2NkSr+GjRKSG
	qONqu2Ubx6VRvg8p8EPNcqpAquvsnqJnbBEynscmJrDKQnbfh74HcgVsLmqYbF/YFXTmcf
	CBbbHe9emoiJJYVBltYqjnaf3J37sLC4z1Kp/j0C7+Eml3LNI8G8fx4VpIqulA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: wangjianli <wangjianli@cdjrlc.com>,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drivers/mtd: fix repeated words in comments
Date: Tue, 20 Sep 2022 10:40:53 +0200
Message-Id: <20220920084053.602329-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220908122229.10814-1-wangjianli@cdjrlc.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'9ee67182309290aee8135b2b464d0240afe63a28'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220920_014058_602004_5F437E12 
X-CRM114-Status: UNSURE (   5.43  )
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

On Thu, 2022-09-08 at 12:22:29 UTC, wangjianli wrote:
> Delete the redundant word 'in'.
> 
> Signed-off-by: wangjianli <wangjianli@cdjrlc.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
