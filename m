Return-Path: <SRS0=jwHe=LL=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 817D1C2B9F4
	for <linux-mtd@archiver.kernel.org>; Thu, 17 Jun 2021 15:28:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E78126120A
	for <linux-mtd@archiver.kernel.org>; Thu, 17 Jun 2021 15:28:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E78126120A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qXpaO9kT+DkFvR/2X9pDbBYADpqwJx6x1Q7IwgtOWZI=; b=ybxTPo/0047dM6
	V89+7cRAjgdoVL3tsuSRZsf3aZxilZHsX/3Nnh0Ff4dGJJW/rNn7Zym3MSIM0T3ztFCAjaBIl/YD2
	m+3SVR/KVSTp+aYOOq6x/JBZC27ZWlsuJMkqT/qDXt5TMKH2ApOot70ewJ1Fx6ruqjXOPtB8Wehlk
	vr/Pz1kihrKPOgfb6TV88grvLIT6HQbM6+82guCADch2jz1TiBxIcdTeBu/KnkEPeT4pOh9TvznRO
	GIpy41dHG7GLf4it/YglpsouWE/yk98/5m4SfWmFnO6V5eQdX7QNuIKQtuCtGA5iZ+w6jUAQcmlBL
	mCGJ3bro7Q6pofQEw+nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lttw2-00AvGi-1n; Thu, 17 Jun 2021 15:28:02 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lttw0-00AvGX-VR
 for linux-mtd@bombadil.infradead.org; Thu, 17 Jun 2021 15:28:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=PbwGL8bUjpxYyR+0WdEYqqiUEuC45HxDaoltM49QXvE=; b=sLJ65hxSTVZnExEtD7X5O31nHy
 mSv3dwFtB4qX5QQAtpcN22wofXoNPi/gqbGN3t+/h27T56amfUa7c/Of8T/kqJZWy56GFoEk20nOC
 /GhdwR/qIZMwyIZ6YJQs5UPLUL/pBKR0UHbLxYzaYu7Lg4zvdJo28Crs1NvL66xYxv3LxcZaXaOS/
 qOY5oFzn4diY1r5wam6CQgd1mPxszPTx5vW7joIP55WfuM17haOFZ98mpEgCTXaEPW2rdV2WJTwI4
 xP900Iq2zL0r6wKNClUtISYRV3wiuDkzjqDBV1RV59URj0GJgjg/ZGUTvaL25yeH+U4nXEkNuAMEg
 iKNubhCg==;
Received: from hch by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat
 Linux)) id 1lttvr-009HTX-EK; Thu, 17 Jun 2021 15:27:52 +0000
Date: Thu, 17 Jun 2021 16:27:51 +0100
From: Christoph Hellwig <hch@infradead.org>
To: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
Cc: Christoph Hellwig <hch@infradead.org>, axboe@kernel.dk,
 linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
 skhan@linuxfoundation.org, gregkh@linuxfoundation.org,
 linux-kernel-mentees@lists.linuxfoundation.org,
 syzbot+6a8a0d93c91e8fbf2e80@syzkaller.appspotmail.com,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 linux-mtd@lists.infradead.org
Subject: Re: [PATCH] block: break circular locks in blk_request_module
Message-ID: <YMtp957WK8sO4hwL@infradead.org>
References: <20210617092016.522985-1-desmondcheongzx@gmail.com>
 <YMs3O/cg4V7ywlVq@infradead.org>
 <ce1567cf-bc94-790c-cfc0-e4e429e1a86a@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ce1567cf-bc94-790c-cfc0-e4e429e1a86a@gmail.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
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

On Thu, Jun 17, 2021 at 11:23:36PM +0800, Desmond Cheong Zhi Xi wrote:
> This fix passes the Syzkaller repro test on my local machine and on Syzbot.
> I can prepare a v2 patch for this. May I include you with the
> Co-developed-by: and Signed-off-by: tags? If another tag would be more
> appropriate, or if you want to submit the patch yourself, please let me
> know.

Sounds good to me, thanks!

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
