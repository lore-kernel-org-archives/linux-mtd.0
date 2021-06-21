Return-Path: <SRS0=qKgU=LP=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7189AC48BE5
	for <linux-mtd@archiver.kernel.org>; Mon, 21 Jun 2021 06:20:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3A65560FEE
	for <linux-mtd@archiver.kernel.org>; Mon, 21 Jun 2021 06:20:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3A65560FEE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GbwrYKKrHQQCbo9IztInjV4pDq3Qp1FeQC2Byg5cotc=; b=R3fgzEZ0VVP8QX
	mPlVxG7E9w/KtcBQHs5rkjqrGcYmnUnJG1SrKcNQo+g28by0qoQTXUcCbRHYj1USdNI06d9RJ/DYW
	+6nDlggNzRnoWWJ2JKflBaDWnc7RIX///c1+oqFj7DmlKcJEs0TSKggN5X3IG8XppZUmHbRS769VY
	z9AIlmn2Sphl3wLtofP7j593wjFLHWcDSkIHaULarPzAXW7VbUFoqxSDSUacsYSUS8BmlE55PzFu6
	Eb6jcalo/6zWjJe0olpFOr3YLiiu2PwlO9FDhsetsaQuld4i9LsX1OVG/VnB6Cj99SbwFhd3U860k
	N+6wrx6W0sS54wEPGoug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lvDHZ-002Iaj-4M; Mon, 21 Jun 2021 06:19:41 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lvDHV-002IZm-1j
 for linux-mtd@bombadil.infradead.org; Mon, 21 Jun 2021 06:19:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=uNPhX10VS4Wsxa/3lttySqU/Lgh5QfKb1rKtABFNOog=; b=tmomkpjoveAIKFsL8pIBCHEUwD
 H14nWK8xQ4Kney+2ABTK3OjwIGIEcJdPFbCe9+CDvys+GTxzgPjt+ekmhwpgquzErPv7VY7Yy8Zu/
 FI96nEO8MHf1RDnSNtF3qRGf5kJBhG5qV/TRZyEzmEGkoahawJsQh4lDZvvzTUshUTgY4jpVZcsLu
 Sy7vlLqjMrXb+szCktDbdxBje6RAvqLQ0QaUKNA9cFnt8m7rEauUwjtPW5l5rivVHWUiKoGiJMJxC
 hjkfWXGJeGg8qIARfV/4zoI2wnGpzH9Qqz/mkyOXFt3gl5jVAjdrJR31WHFhBCzB/B6c07/bIVMFr
 qrPfJ+Cw==;
Received: from hch by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat
 Linux)) id 1lvDGi-00CmTX-Eo; Mon, 21 Jun 2021 06:18:59 +0000
Date: Mon, 21 Jun 2021 07:18:48 +0100
From: Christoph Hellwig <hch@infradead.org>
To: Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
Cc: hch@infradead.org, axboe@kernel.dk, desmondcheongzx@gmail.com,
 gregkh@linuxfoundation.org, linux-block@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 miquel.raynal@bootlin.com, richard@nod.at,
 Shuah Khan <skhan@linuxfoundation.org>,
 syzbot+6a8a0d93c91e8fbf2e80@syzkaller.appspotmail.com, vigneshr@ti.com
Subject: Re: [PATCH v2] block: genhd: don't call probe function with
 major_names_lock held
Message-ID: <YNAvSJHMuveUp1o/@infradead.org>
References: <f790f8fb-5758-ea4e-a527-0ee4af82dd44@i-love.sakura.ne.jp>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f790f8fb-5758-ea4e-a527-0ee4af82dd44@i-love.sakura.ne.jp>
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

The obvious fix is to not call unregister_blkdev under loop_ctl_mutex.
Which is pretty pointless anyway - I have a series to fix that but it
might need some reordering to move this to the front.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
