Return-Path: <SRS0=OH0o=DZ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9681EC433DF
	for <linux-mtd@archiver.kernel.org>; Sun, 18 Oct 2020 20:34:28 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A9DEB22277
	for <linux-mtd@archiver.kernel.org>; Sun, 18 Oct 2020 20:34:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="YzuqFQbX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A9DEB22277
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sigma-star.at
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:Subject:
	From:References:To:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=EqmwNjNJqK8IaJTdCUZ0qjwgNJVjkvCANMoIq2ZqE58=; b=YzuqFQbXPBoqROuvcxVyLJbVg
	pdpYlRyqGUUd4qK7a+hhWt4tqjrpsOYTPgRR/DgUE3IEV0IiN0jzluXL3oKGCMXkprb71PjHKzAw2
	cckt/XLZDV4qYVB3uDEO16lsT9sUWJtCYVaVKmWeX8fOpfHqtO0xfMw19c2QWnl1/0/C+237SWVn9
	mfoR8Df0Xt3H7yvvKJ/hcvIfIhBNVLG6/2t66QT5z4BAoCHx3FwqfVnlpHgZrFYyURlMr1b/RsKC5
	t1Hhmec9Rp68Aw5pc9/gR3YM4WQsbB7M+k/uYynlFK6MiR1RGsHhNdlmPqBViMGWa5uXYjRKtPdUV
	hPcOKplhQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kUFMW-0001rK-JD; Sun, 18 Oct 2020 20:33:04 +0000
Received: from lilium.sigma-star.at ([109.75.188.150])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kUFMT-0001qm-Qm
 for linux-mtd@lists.infradead.org; Sun, 18 Oct 2020 20:33:02 +0000
Received: from localhost (localhost [127.0.0.1])
 by lilium.sigma-star.at (Postfix) with ESMTP id 8F6981816C70F;
 Sun, 18 Oct 2020 22:32:58 +0200 (CEST)
Received: from lilium.sigma-star.at ([127.0.0.1])
 by localhost (lilium.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id fDDfhAgVs4-1; Sun, 18 Oct 2020 22:32:58 +0200 (CEST)
Received: from lilium.sigma-star.at ([127.0.0.1])
 by localhost (lilium.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id SWcxyaqFEYx9; Sun, 18 Oct 2020 22:32:58 +0200 (CEST)
To: Miquel Raynal <miquel.raynal@bootlin.com>, linux-mtd@lists.infradead.org
References: <20200424163209.26359-1-miquel.raynal@bootlin.com>
From: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
Organization: sigma star gmbh
Subject: Re: [PATCH] mtd-utils: Add nandflipbits tool
Message-ID: <69a77fd7-4eb2-5b88-acee-d74e9248b602@sigma-star.at>
Date: Sun, 18 Oct 2020 22:32:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <20200424163209.26359-1-miquel.raynal@bootlin.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201018_163301_965464_79BBF5F9 
X-CRM114-Status: UNSURE (   7.80  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi,

sorry for the delay. I must have missed this one on the ML but stumbled
over it today when going through the patchwork backlog.

Aplied to mtd-utils.git master.

Thanks,

David

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
