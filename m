Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B73FC7EE23
	for <linux-mtd@archiver.kernel.org>; Mon,  5 Jun 2023 16:50:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=qF65exNzeXlI2+s8AexURFlFIc7lwJuX31tkzsnVlK4=; b=M+eh7ZEmnEmgo8
	/Q+gFGzpgjcKo1mydqBnbF2CM+50LBHMw4SXrXCL24prrUemQQUa3874cbWJpgmpenMQsfKTW2SP7
	IOYk7xrrfa6e8iF6Nyk164Tu42nRZWwuIzMHdlZhMlA3HZQZueeMF1sGtcIDqt2XeL2B6B0yM7b/K
	mxjscpav3bxWSQWf1dKCIOWfcNssmCHFVPfxMg+qV2vISDj7DDHcmrjWz7in1Pn7Zj/8nJTwOHHb0
	qdSrDIgdipru70n9HLLcBlz0q7+AkIvrsnFuh/nlSswZo9guVO1/+zVnNYoL1XcrvTWFrX1LDj2uR
	hMQF6sAjJJ4WZMRTqeqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6DPj-00GBp2-0i;
	Mon, 05 Jun 2023 16:50:39 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6DPh-00GBoZ-31
	for linux-mtd@bombadil.infradead.org;
	Mon, 05 Jun 2023 16:50:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=dDFNBT6dk3Yum/aueh1v8IKbB6wtwNZVtVYiiNiWPFo=; b=ajYCn9CXjbYAeVcbDOwXA7qBdc
	u7Vt9kAmaC0s5vU6oO6ODdAtVwn3vugYMT4iYKUWTl8mk41ygxR5VBHR44ShG28XZj+rKWcGeqw8c
	i0hIO74RYJ5QLO4BM7E3PbFK9FTcGHF45a68XKb/vKj9IAOVsuS65zbKGXDuZc/k7xE5KPIyYkDLE
	yuc/0wT+gGwcQX1ofDGeQRJfZxHcf/jq4UwLgzw6jYiHEPLoBAFSLAPf9Gnhf3qo3CaCIWOtcZ7rf
	8NV6QffFWsMpS2hmd3ffOrULv3sr30E13M77sTNDIZvrQo5tn2yrbj+Q729PR7frVU7nsJ+r/hm5b
	84o6itKQ==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
	id 1q6DPa-00CCap-DP; Mon, 05 Jun 2023 16:50:30 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: Richard Weinberger <richard@nod.at>
Cc: "Matthew Wilcox (Oracle)" <willy@infradead.org>,
	linux-mtd@lists.infradead.org,
	linux-fsdevel@vger.kernel.org
Subject: [PATCH 0/4] ubifs: Convert writeback to use folios
Date: Mon,  5 Jun 2023 17:50:25 +0100
Message-Id: <20230605165029.2908304-1-willy@infradead.org>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
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

There are a few transitions going on in the VFS right now.  One is that
we're deprecating and removing ->writepage; all filesystems need to be
converted to ->writepages.  The other is that we're switching filesystems
from using pages to folios so they can support large folios and we can
shrink the size of memmap.

This completely untested series updates ubifs to the current APIs.
You might be able to improve things; for example, it's common for
filesystems to batch up the results of the writepage call and submit
them at the end of the writepages method.  But that would be suitable
for a later patchset.

Matthew Wilcox (Oracle) (4):
  ubifs: Convert from writepage to writepages
  ubifs: Convert ubifs_writepage to use a folio
  ubifs: Use a folio in do_truncation()
  ubifs: Convert do_writepage() to take a folio

 fs/ubifs/file.c | 120 ++++++++++++++++++++++++++----------------------
 1 file changed, 64 insertions(+), 56 deletions(-)

-- 
2.39.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
