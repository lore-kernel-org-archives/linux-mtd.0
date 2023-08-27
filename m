Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80012C83F11
	for <linux-mtd@archiver.kernel.org>; Sun, 27 Aug 2023 20:52:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BG97fTlbOplZf+KlfSJEpLizLjorF01iW/NhpJSIiwA=; b=B/UTYo7iWmMxme
	fIR/0XoW7RUiHqywN4kKyyXmMIchSUAoWbzAP3j0x3n5QzMUAWExe4lzvTco0sqDP3T142qTM9dbV
	HKdHrkeriMcY4FlTPAtp6vewnkKACh1NVsumOe2GnmcHr2Y4Q4Vawf56bEnYVc02vrnEyZfHWKx2j
	4Bs4TyqfN8LDJEDgCXZiDwTFTmWvQfJcHvSpaJD6ZHKan7Nwp3M4qXZUgIt2O8cDwXbefW/h5Tggq
	MHHjBCY8HJD9xNXPMSWx1Naw8us9N9zNC55tXZK/s40NdtmNe6VnMLTHg3gVnRYTbreaGHxSNKVNu
	ZfGdB6OghLOXa3//5TMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qaMjz-008SFQ-10;
	Sun, 27 Aug 2023 20:52:11 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qaMjx-008SFG-2X
	for linux-mtd@bombadil.infradead.org;
	Sun, 27 Aug 2023 20:52:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=64WGA8VV9Ar6eu59jwKakipB5IQeiUdKnhF4bZRyjJg=; b=f4Amt/s2VPJBfpbA4kwhdXTdVg
	/pn5N3WZwWFuLeNUpjeDraYY4nQbaO2UYvFIaQahuWJpv6yWj9SJhm3438dxwJSqQjroyoc9F0SYv
	XAWPI0/B2+Jwn7WLlLOC7qTdz3pp+yI4mEjVaLz0qln0W2Hlp6Bqseo3n3BK6S7q8PWF2QR7jDDR5
	5QOB+otXNut9VVTlFGgE9OB8fNY4Zqee0Fvn6lAYSC0XLvrtBqaDQzjA8XPvUV/U40DN9P1BUUcT+
	KJAEsVOCJlXQA4wp82KhD9XmJfIxAUdOp4MXoPkTY5GoW5ML77D0bFxP371EeaBKUbiVosNZkp33g
	ozZ78lYw==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
	id 1qaMjj-00DkxQ-7a; Sun, 27 Aug 2023 20:51:55 +0000
Date: Sun, 27 Aug 2023 21:51:55 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Hao Xu <hao.xu@linux.dev>
Cc: io-uring@vger.kernel.org, Jens Axboe <axboe@kernel.dk>,
	Dominique Martinet <asmadeus@codewreck.org>,
	Pavel Begunkov <asml.silence@gmail.com>,
	Christian Brauner <brauner@kernel.org>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Stefan Roesch <shr@fb.com>, Clay Harris <bugs@claycon.org>,
	Dave Chinner <david@fromorbit.com>,
	"Darrick J . Wong" <djwong@kernel.org>,
	linux-fsdevel@vger.kernel.org, linux-xfs@vger.kernel.org,
	linux-ext4@vger.kernel.org, linux-cachefs@redhat.com,
	ecryptfs@vger.kernel.org, linux-nfs@vger.kernel.org,
	linux-unionfs@vger.kernel.org, bpf@vger.kernel.org,
	netdev@vger.kernel.org, linux-s390@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-block@vger.kernel.org,
	linux-btrfs@vger.kernel.org, codalist@coda.cs.cmu.edu,
	linux-f2fs-devel@lists.sourceforge.net, cluster-devel@redhat.com,
	linux-mm@kvack.org, linux-nilfs@vger.kernel.org,
	devel@lists.orangefs.org, linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org, linux-mtd@lists.infradead.org,
	Wanpeng Li <wanpengli@tencent.com>
Subject: Re: [PATCH 09/11] vfs: error out -EAGAIN if atime needs to be updated
Message-ID: <ZOu3a/24YJrtpIy1@casper.infradead.org>
References: <20230827132835.1373581-1-hao.xu@linux.dev>
 <20230827132835.1373581-10-hao.xu@linux.dev>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230827132835.1373581-10-hao.xu@linux.dev>
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

On Sun, Aug 27, 2023 at 09:28:33PM +0800, Hao Xu wrote:
> From: Hao Xu <howeyxu@tencent.com>
> 
> To enforce nowait semantics, error out -EAGAIN if atime needs to be
> updated.

Squash this into patch 6.  Otherwise patch 6 makes no sense.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
