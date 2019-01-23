Return-Path: <SRS0=6Wn1=P7=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18A5EC282C0
	for <linux-mtd@archiver.kernel.org>; Wed, 23 Jan 2019 10:47:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DA3F720861
	for <linux-mtd@archiver.kernel.org>; Wed, 23 Jan 2019 10:47:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="JPAbrvxA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DA3F720861
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lBF6+eFuSQCx4Wd3QaP3Vwy8xHuyPjmqp6JEkreFV5k=; b=JPAbrvxAIkn3+/
	qqyB3HT6tpQrZ2IojNgUl6N391olgQkSl9t8e6OmA8Ybc394rDXbm5Ioyzdj9PCIVAmvcvaEDzg0p
	2hw2IVbx+viIT65qF3oONe6v7sVmlHTbPYd8Q7kxDn3fKkVoc8JzsFdpO/vlEvhRxD3mQeeWwkH+7
	iZMcoybtFJrM6DJ3jhV6WypoU0CVQDQCxlY5SQ3eBNIvAjIWXuIAiI1YuF5Z2UPVUI88UDCb1PzGU
	Z/bP/wsCq+HQvAiUdpn6g89gn1YemEJAdvTjeP706dScJOPGFKcRamyhV1171LWA+eCLW2nmZ0vN5
	i9krNb3na2uyaTZtvQ7A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gmG4X-0000IQ-63; Wed, 23 Jan 2019 10:47:53 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gmG4T-0000HZ-KQ
 for linux-mtd@lists.infradead.org; Wed, 23 Jan 2019 10:47:51 +0000
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id 1AE38608A380;
 Wed, 23 Jan 2019 11:47:47 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id 8qlaZFEaaxiu; Wed, 23 Jan 2019 11:47:46 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id BA7D9608A398;
 Wed, 23 Jan 2019 11:47:46 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id jiGaM0Ya-Vi6; Wed, 23 Jan 2019 11:47:46 +0100 (CET)
Received: from blindfold.localnet (unknown [82.150.214.1])
 by lithops.sigma-star.at (Postfix) with ESMTPSA id 597B8608A380;
 Wed, 23 Jan 2019 11:47:46 +0100 (CET)
From: Richard Weinberger <richard@nod.at>
To: Sascha Hauer <s.hauer@pengutronix.de>
Subject: Re: UBIFS quota support
Date: Wed, 23 Jan 2019 11:47:45 +0100
Message-ID: <1822599.pa7TLGMi6j@blindfold>
In-Reply-To: <20190123095535.itwduropd2moqs3n@pengutronix.de>
References: <20190110114448.vcx6w76ibmxwvlh3@pengutronix.de>
 <3682938.yUD6jHpT9R@blindfold>
 <20190123095535.itwduropd2moqs3n@pengutronix.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190123_024749_818100_08A39553 
X-CRM114-Status: GOOD (  11.81  )
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
Cc: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>, Jan Kara <jack@suse.cz>,
 Richard Weinberger <richard.weinberger@gmail.com>,
 Christoph Hellwig <hch@infradead.org>, linux-mtd@lists.infradead.org,
 kernel@pengutronix.de, linux-fsdevel <linux-fsdevel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Sascha,

Am Mittwoch, 23. Januar 2019, 10:55:35 CET schrieb Sascha Hauer:
> > > S_SYNC won't help us. We need to make sure that a change of an inode and
> > > the corresponding update to the quota file is done atomically. Otherwise
> > > it may happen that we only change the size of an inode, but miss the
> > > corresponding quota updates, or depending on the implementation, maybe
> > > the other way round.
> > 
> > This is why I said yesterday you need to touch the UBIFS journal replay code too.
> > So, S_SYNC is not to keep the quota file consistent with UBIFS' state, it is
> > to make sure we don't lose quota updates.
> 
> But how we handle a power cut between the update to the quota file and
> the actual inode change then? During replay we'll find quota updates and
> inode updates, but we do not have any information which quota update
> belongs to which inode change.

In worst case we need to store more info in the journal to get this infos.
That's why I asked Jan for more info. I don't know what exactly quota expects
from the filesystem in terms of consistency. Maybe there are already some helpers, etc...

Thanks,
//richard



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
