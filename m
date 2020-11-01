Return-Path: <SRS0=Psr0=EH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D6FCC2D0A3
	for <linux-mtd@archiver.kernel.org>; Sun,  1 Nov 2020 10:30:09 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0265A20709
	for <linux-mtd@archiver.kernel.org>; Sun,  1 Nov 2020 10:30:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="HWdJ+b7X"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0265A20709
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=+oCPLGTU9nR6jczankhqeZGs+Muidel6gFQ6Ptpu5ck=; b=HWdJ+b7XWD+okFgJ+/vPyFu7r
	4PIUiG+4LDFd7U/cX0b+w0DKKtjXZVaTF1EdJDC6XjrmSTBogLysj/zxd49stMf6qPidAR3nTrV8F
	/Uv7t7WCbRBPceQNNQ7u+oX9y6GlN92C+BNl+Cdnz2toiEMtWxEIf+Z5zi2+Qb28bWQNfzpptvX2D
	sNOLnjyli3KuMnqUJoUNR7Vj8JG0GZF/gUXoGpKy425K2cJ9jed8pxCFeUkXMVi5VsKpEdOwYauot
	ByED/cFU/HpTKyDLPjUiar/SKk0VRedH9Q7tEaxIwAYbyBBSUK4CRoYvG6nTuXMA2UW6gwtKun20f
	OLHSikkrQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kZAaU-0002eh-NT; Sun, 01 Nov 2020 10:27:50 +0000
Received: from verein.lst.de ([213.95.11.211])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kZAaN-0002e5-P7
 for linux-mtd@lists.infradead.org; Sun, 01 Nov 2020 10:27:49 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
 id 56FF56736F; Sun,  1 Nov 2020 11:27:36 +0100 (CET)
Date: Sun, 1 Nov 2020 11:27:35 +0100
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Subject: Re: [PATCH 02/11] mtip32xx: return -ENOTTY for all unhanled ioctls
Message-ID: <20201101102735.GA26447@lst.de>
References: <20201031085810.450489-1-hch@lst.de>
 <20201031085810.450489-3-hch@lst.de>
 <f128e8bb-7ce4-b8f4-80cb-1afab503887c@kernel.dk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f128e8bb-7ce4-b8f4-80cb-1afab503887c@kernel.dk>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201101_052743_947131_10E5690B 
X-CRM114-Status: GOOD (  10.99  )
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
Cc: linux-raid@vger.kernel.org, Jan Hoeppner <hoeppner@linux.ibm.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, linux-s390@vger.kernel.org,
 Richard Weinberger <richard@nod.at>, ceph-devel@vger.kernel.org,
 linux-block@vger.kernel.org, Song Liu <song@kernel.org>,
 linux-bcache@vger.kernel.org, linux-mtd@lists.infradead.org,
 Stefan Haberland <sth@linux.ibm.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Ilya Dryomov <idryomov@gmail.com>,
 Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Sat, Oct 31, 2020 at 08:58:52AM -0600, Jens Axboe wrote:
> On 10/31/20 2:58 AM, Christoph Hellwig wrote:
> > -ENOTTY is the convention for "driver does not support this ioctl".
> > Use it properly in mtip32xx instead of the bogys -EINVAL.
> 
> While that's certainly true, there is a risk in making a change like this
> years after the fact. Not that I expect there are any mtip32xx users
> left at this point, but...

-ENOTTY is what most drivers return.  That being said we can keep the
old behavior, so if you prepfer that I can respin to do that.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
