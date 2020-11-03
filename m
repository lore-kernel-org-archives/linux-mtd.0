Return-Path: <SRS0=zrsi=EJ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBDAEC388F2
	for <linux-mtd@archiver.kernel.org>; Tue,  3 Nov 2020 10:03:18 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2D19021D91
	for <linux-mtd@archiver.kernel.org>; Tue,  3 Nov 2020 10:03:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="CJPNZ00z";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="pt2TkrYF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2D19021D91
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4td25xwJSf8WYJQVBnF6XVvGrr4bL/TAYLkVnSKDHW8=; b=CJPNZ00z7bT7X+8ZQSipB6WTsf
	vOMxeYmUFM7nLYlG9Kc2znby+h66OKFUKju8twwmp2tRV4mzMnqPZDr8+XiUQqju3qgnkAm6s9p+G
	UnbBUjj0353xeSMYTj2ObG5foYNtVWvZyZLoN7RR7xvFhIKRHbmSCRvszrrcTCKThWKjGiomZrZLC
	rGHtR1wSthygB052LTEPv0F+IO09ufipRMwb/Cwq+VQeyNPG5sIlPLVDzEEDAwFgs8m+npQbmUG8Z
	x/6ezFlch0J2OZJHTZ13gJlLGb821a5pN85bDH1UzqbdHAXnZZ8Jkr6aN09aVV2zzLPZlvNGAStoq
	qDEFzG2Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kZt99-0003Vq-EC; Tue, 03 Nov 2020 10:02:35 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kZt95-0003Va-HA
 for linux-mtd@merlin.infradead.org; Tue, 03 Nov 2020 10:02:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:In-Reply-To:References;
 bh=S/Jxk7MFf2zbVP/damMG5Y193FQbU20LLKNaS6lR0JA=; b=pt2TkrYFBvf569C8qUtEMmCObo
 S6uiERBt8/clyVA7CszFdSsP5FrpXEE+LecQyWkyAqOCoRq3m5neRKOw5CpcmoO8AmlaHhC09YzC2
 ZZvFYYl64sy59qEDwR7KC/xXWTnw92UFtcFLK6lQL3RBYaCoPZzaj6xjrDVbofVRG2owy09SUgiYX
 iw9Xg28CmpxtMtjxsafQU4w0iCAJFNkD9Cnhy4iUHJeFzcUaVJFdyTFCFsFOLPhZi6ByO73fignEr
 +ZPF6HUj7JxMoLgURZG78H5TJw/R3rShZU8/iHg4zo4MOKX8CiEVEAxw8Znfl1GPw9bJV6NF7Vum0
 2tEivDNA==;
Received: from 089144208145.atnat0017.highway.a1.net ([89.144.208.145]
 helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kZt92-0008U5-OU; Tue, 03 Nov 2020 10:02:29 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Subject: block ioctl cleanups v2
Date: Tue,  3 Nov 2020 11:00:08 +0100
Message-Id: <20201103100018.683694-1-hch@lst.de>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
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
 Richard Weinberger <richard@nod.at>, linux-block@vger.kernel.org,
 Song Liu <song@kernel.org>, linux-bcache@vger.kernel.org,
 linux-mtd@lists.infradead.org, Stefan Haberland <sth@linux.ibm.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Ilya Dryomov <idryomov@gmail.com>,
 ceph-devel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Jens,

this series has a bunch of cleanups for the block layer ioctl code.

Changes since v1:
 - drop the patch to return the correct error for unknown ioctls in mtip
 - add back an empty line in rbd
 - various spelling fixes

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
