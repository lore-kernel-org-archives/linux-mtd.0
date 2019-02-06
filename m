Return-Path: <SRS0=F8YS=QN=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 902C0C169C4
	for <linux-mtd@archiver.kernel.org>; Wed,  6 Feb 2019 08:38:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 61A8B2075B
	for <linux-mtd@archiver.kernel.org>; Wed,  6 Feb 2019 08:38:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="T89rkJdy"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 61A8B2075B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hJZp+0NlZZ3NHhUZlLoNPO4XJ14oiyNnTawKsQn/q+U=; b=T89rkJdyNhijMz
	QlvPf4TwI7PUWGDvyFmiYMd8yYPzSTbIv33mZoxp809uKmAAv0O9ppp1cKS+5b6/hO+k42xQ24yul
	CLH97gAd2qZp3VydtUUy8+miMeK59gpNp+0Mz6B+4PwETxwKgrTStx1XQCC/B+Y+flAJV0PodABAv
	zvN3Msv4XDyPzpqJzEuhtMi6jhyHjN/Y+aUo2CIhqsAPkeKxmv09/PoslHdWWl1TMhW58M7NGs2sW
	NBCZ0weVfA26KQ5hjcfxrnmL7j5CWNn0fQBbN1SZYv5QaKS5oMFya2jkWg+kKAgsJk6mI6cmyFWOT
	Wju66SFjtziBU3Ln6rSA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1grIie-0002gd-MC; Wed, 06 Feb 2019 08:38:08 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1grIiY-0002gJ-LN
 for linux-mtd@lists.infradead.org; Wed, 06 Feb 2019 08:38:04 +0000
Received: from localhost.localdomain (unknown
 [IPv6:2a01:e0a:2c:6930:b93f:9fae:b276:a89a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 4782F27DA03;
 Wed,  6 Feb 2019 08:38:01 +0000 (GMT)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Boris Brezillon <bbrezillon@kernel.org>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-mtd@lists.infradead.org
Subject: Re: mtd: Remove a debug trace in mtdpart.c
Date: Wed,  6 Feb 2019 09:37:58 +0100
Message-Id: <20190206083758.14232-1-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190130084700.6290-1-bbrezillon@kernel.org>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: bda2ab56356b9acdfab150f31c4bac9846253092
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190206_003802_823482_EBE64F9F 
X-CRM114-Status: UNSURE (   9.23  )
X-CRM114-Notice: Please train this message.
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
Cc: Your Name <patch-notifications@your-domain.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: Your Name <patch-notifications@your-domain.com>

On Wed, 2019-01-30 at 08:47:00 UTC, Boris Brezillon wrote:
> Commit 2b6f0090a333 ("mtd: Check add_mtd_device() ret code") contained
> a leftover of the debug session that led to this bug fix. Remove this
> pr_info().
> 
> Fixes: 2b6f0090a333 ("mtd: Check add_mtd_device() ret code")
> Signed-off-by: Boris Brezillon <bbrezillon@kernel.org>

Applied to http://git.infradead.org/linux-mtd.git mtd/fixes, thanks.

y'all come back now!

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
