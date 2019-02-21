Return-Path: <SRS0=HEdT=Q4=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B261C43381
	for <linux-mtd@archiver.kernel.org>; Thu, 21 Feb 2019 09:30:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4B6B720880
	for <linux-mtd@archiver.kernel.org>; Thu, 21 Feb 2019 09:30:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NMsURWn7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4B6B720880
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mH6ZUXfDT9T9S50XsjsBeMhdkt9XS3xrj3NHM4maw5I=; b=NMsURWn7RzeMVn
	cRyRHryugmkfH9s/dhp3+KmEQsj04j9EqdnlqEcO3c37J4SVVgdd2u8HPFeH0TGnt6jENdmn46G9X
	gnBwvrlwy/PXAvQOAjbon154PevYYE0Bc71YJksfYKYFdSnUw8cUO/UZxJRcyBvrGfk8rLQMmU0Ji
	+gDzATCcg8z3yK8w15/y8Y8N0Jzr+PiywEwZOxfQ69yLNyhUXtJI6ZXqCz+1I9Wh0W4t0hux8ilXV
	03q8lVcoDQ1wB3tST3pJXBIudBOuPjyINUSPtctIEjRmCnR3VjVnEocdCpSitzomjc1wtaAnZU9oC
	7XNCxJrdKIvSS/89mqFw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gwkg5-0006ph-1b; Thu, 21 Feb 2019 09:30:01 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gwkei-00050U-Cs
 for linux-mtd@lists.infradead.org; Thu, 21 Feb 2019 09:29:08 +0000
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id 78B056083265;
 Thu, 21 Feb 2019 10:28:31 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id zNyng7HnJ60e; Thu, 21 Feb 2019 10:28:31 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id 3807E6083268;
 Thu, 21 Feb 2019 10:28:31 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id e2-1Wj5VeF7K; Thu, 21 Feb 2019 10:28:31 +0100 (CET)
Received: from blindfold.localnet (unknown [82.150.214.1])
 by lithops.sigma-star.at (Postfix) with ESMTPSA id D033F6083265;
 Thu, 21 Feb 2019 10:28:30 +0100 (CET)
From: Richard Weinberger <richard@nod.at>
To: Sascha Hauer <s.hauer@pengutronix.de>
Subject: Re: Prevent Nand page writes on Power failure
Date: Thu, 21 Feb 2019 10:28:30 +0100
Message-ID: <1827693.m7yXcEqR8t@blindfold>
In-Reply-To: <20190221083914.dq4kzyx4t4fgoo46@pengutronix.de>
References: <20190220135820.b2ku2unaxxdqflut@pengutronix.de>
 <CAFLxGvxJ=sRRKMVJHCh6S--NtEjJ7eUXD=VK3a5DXkWqi4Y1fQ@mail.gmail.com>
 <20190221083914.dq4kzyx4t4fgoo46@pengutronix.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190221_012836_889970_928D74D2 
X-CRM114-Status: GOOD (  10.24  )
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
Cc: Richard Weinberger <richard.weinberger@gmail.com>,
 Boris Brezillon <boris.brezillon@collabora.com>, linux-mtd@lists.infradead.org,
 kernel@pengutronix.de, Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Am Donnerstag, 21. Februar 2019, 09:39:14 CET schrieb Sascha Hauer:
> > Regarding important data, users that care need to use fsync() anyway, so
> > there is no need to trigger whatever writeback upon power failure.
> > Or what else important data do you have in mind?
> 
> What you want to do on a power failure probably depends on the time
> you have left. When you have a second left then you get other ideas than
> when you have just a few milliseconds. If you have enough time then you
> maybe even want to do an ordered shutdown which would include writing to
> the nand.

Well, these are two distinct use cases. Both are sane but have different goals.
If you have a signal that tells "I'm out of power supply and have plenty of time"
you can notify/wake userspace and it is no big deal if the userspace action takes too
long and the board browns out.

But for the NAND stuff you need something that tells you "I'm out of of power
and you need to take action immediately".
Here the action needs to happen in any case because the hardware requires so.

Thanks,
//richard




______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
