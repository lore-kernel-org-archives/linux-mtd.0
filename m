Return-Path: <SRS0=3akN=YV=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70B06CA9EA0
	for <linux-mtd@archiver.kernel.org>; Mon, 28 Oct 2019 07:13:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 40D54208C0
	for <linux-mtd@archiver.kernel.org>; Mon, 28 Oct 2019 07:13:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="YxbW6UVF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 40D54208C0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sigma-star.at
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kibbSIsSgPObItdlpy8jqXmZtVVFwm7rw1BTDuSRFVI=; b=YxbW6UVFYNOpUe
	bV96dHM4yZu4aRVd1zCPP6ke/zZ/SSUQyTT8orvlhX5IqGcgZsftCl/yhNgN2TSPrJukEf2z5NTlt
	nRpWbogBqAM9cRKmZ40j7z3uwpX09MNyzXpt7E+4O2Q2Q2YtBUmKR+O7RDSIyJkuf4HqUqL98gRV3
	0ZM6LnVCphYUoJ9zcBQP0+8zshBlJQOr1MZ2l0/rZ0SgS7V2nJ9Nu37RiNmu/lCk6SC3op68Y8i3U
	iVuGmAS4m03KXJYTblglHr5JHXcHynaIyuYBBkFaZBLzOFQ5j2f//W4jJaJ+IY+H6OjI+ejWPfags
	RRGzhKRBARkik0WkOeEQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iOzDV-0002oX-4X; Mon, 28 Oct 2019 07:13:29 +0000
Received: from lilium.sigma-star.at ([109.75.188.150])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iOzDS-0002nr-AI
 for linux-mtd@lists.infradead.org; Mon, 28 Oct 2019 07:13:27 +0000
Received: from localhost (localhost [127.0.0.1])
 by lilium.sigma-star.at (Postfix) with ESMTP id 7D78418108D36;
 Mon, 28 Oct 2019 08:13:21 +0100 (CET)
Received: from lilium.sigma-star.at ([127.0.0.1])
 by localhost (lilium.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id v3u8yAd5DhYi; Mon, 28 Oct 2019 08:13:21 +0100 (CET)
Received: from lilium.sigma-star.at ([127.0.0.1])
 by localhost (lilium.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id Opl0rXD-DWo2; Mon, 28 Oct 2019 08:13:20 +0100 (CET)
Received: from lilium.sigma-star.at (lilium.sigma-star.at [109.75.188.150])
 by lilium.sigma-star.at (Postfix) with ESMTP id 9D9E618108D36;
 Mon, 28 Oct 2019 08:13:20 +0100 (CET)
Date: Mon, 28 Oct 2019 08:13:19 +0100 (CET)
From: David Oberhollenzer <goliath@sigma-star.at>
To: drolevar@gmail.com
Message-ID: <695487279.383172.1572246799948.JavaMail.zimbra@sigma-star.at>
In-Reply-To: <20191021101037.96187-1-drolevar@gmail.com>
References: <20191021101037.96187-1-drolevar@gmail.com>
Subject: Re: [PATCH v2] flashcp: Add option -A/--erase-all
MIME-Version: 1.0
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF70 (Linux)/8.8.12_GA_3809)
Thread-Topic: flashcp: Add option -A/--erase-all
Thread-Index: eeVRkEqkWzLwwJ3Hf+lRJUHrYiLIiQ==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191028_001326_501840_D4502763 
X-CRM114-Status: UNSURE (   3.69  )
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
Cc: linux-mtd <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Applied to mtd-utils.git master.

Thanks,

David

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
