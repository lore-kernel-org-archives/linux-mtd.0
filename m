Return-Path: <SRS0=F8YS=QN=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1EC45C169C4
	for <linux-mtd@archiver.kernel.org>; Wed,  6 Feb 2019 08:37:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DF7FB2075B
	for <linux-mtd@archiver.kernel.org>; Wed,  6 Feb 2019 08:37:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ZZoPHQAM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DF7FB2075B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8SCOD1Z86xucXcT86c2GTRXVmX05YJwhR5zZYKa+HOc=; b=ZZoPHQAMuMbhof
	d62InKC5QC8LSCAHr7axDJi6d2s15A3xLlgE9RXkmgGvo+dQJuYRo6ofO0IynYTnzlOwmr9Dvk9sk
	AcOl2H4ZgBEi7CffLvGaWQcx+Fb8QFaZ8E1XEExX1Plqsbkd52RpHsuazXYcLDUfqzYjnXusRWtm+
	ZYSLkg0VJ4ssrVJG/betvb3hnVrljmkS5IMc76q1GJdFwA1PkadzvLjUgqS/Jua+HqqoRZjx5cJsk
	j7+GTd2t/sKY4Bkuq4lhzbjOIGRylCPk4EYkl/GQ7hPPYm2V7gpXBhWKtc7GDSSPWtZajm/yZuwv+
	b6BmzWNOJW9Y+qPvZDAQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1grIho-0002RB-JX; Wed, 06 Feb 2019 08:37:16 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1grIhi-0002Qk-H7
 for linux-mtd@lists.infradead.org; Wed, 06 Feb 2019 08:37:12 +0000
Received: from localhost.localdomain (unknown
 [IPv6:2a01:e0a:2c:6930:b93f:9fae:b276:a89a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id F326D27D9F6;
 Wed,  6 Feb 2019 08:37:08 +0000 (GMT)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Boris Brezillon <bbrezillon@kernel.org>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-mtd@lists.infradead.org
Subject: Re: mtd: Make sure mtd->erasesize is valid even if the partition is
 of size 0
Date: Wed,  6 Feb 2019 09:37:06 +0100
Message-Id: <20190206083706.14171-1-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190130115552.9610-1-bbrezillon@kernel.org>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: ad4635153034c20c6f6e211e2ed3fd38b658649a
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190206_003710_697597_B1925AD8 
X-CRM114-Status: GOOD (  12.25  )
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
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
 Your Name <patch-notifications@your-domain.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: Your Name <patch-notifications@your-domain.com>

On Wed, 2019-01-30 at 11:55:52 UTC, Boris Brezillon wrote:
> Commit 33f45c44d68b ("mtd: Do not allow MTD devices with inconsistent
> erase properties") introduced a check to make sure ->erasesize and
> ->_erase values are consistent with the MTD_NO_ERASE flag.
> This patch did not take the 0 bytes partition case into account which
> can happen when the defined partition is outside the flash device memory
> range. Fix that by setting the partition erasesize to the parent
> erasesize.
> 
> Fixes: 33f45c44d68b ("mtd: Do not allow MTD devices with inconsistent erase properties")
> Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
> Cc: <stable@vger.kernel.org>
> Cc: Geert Uytterhoeven <geert@linux-m68k.org>
> Signed-off-by: Boris Brezillon <bbrezillon@kernel.org>
> Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>

Applied to http://git.infradead.org/linux-mtd.git mtd/fixes, thanks.

y'all come back now!

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
