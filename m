Return-Path: <SRS0=ONRD=TU=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E52CC072A4
	for <linux-mtd@archiver.kernel.org>; Mon, 20 May 2019 05:58:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 44A0220815
	for <linux-mtd@archiver.kernel.org>; Mon, 20 May 2019 05:58:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="eFhtzf9q"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 44A0220815
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=dDZhEViunbagdGnoHZwSl3f0n8X896q1VwQ3rd5A8IM=; b=eFhtzf9q+GhDBB
	E6EfDwbDkONJ56hGM7KwlToox78eipZhSSEcX/M9t0/fxrJinYvS0llwZk5Pg520vqLt5UoQoPfFC
	z1LJhbvqa/5S9sNCZtYJ/zO8nn8CUTdZAd00glo08hP3LEPNCuc8430tJiTgNiz1ShIDzNwDJ9G12
	ptktsq17N2XCsHCw7bHWfnVK/YdcfjNqvma2aoWdD/UjM8TMNhSjV1j9Caq2ZMumbuzfMM+jqq+OK
	3dOLZqhwe5mDv4IOiTtAiaLvgg3sgG/jgCmUGvx8dtNLfy6KBIr8f2lyXMwKlvr/RXiESh9rwwX71
	2srirJIH7EfV+I56RlkQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hSbJc-0006Es-NV; Mon, 20 May 2019 05:58:28 +0000
Received: from 089144206147.atnat0015.highway.bob.at ([89.144.206.147]
 helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hSbJY-0006DS-7G; Mon, 20 May 2019 05:58:24 +0000
From: Christoph Hellwig <hch@lst.de>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: fix filler_t callback type mismatches v2
Date: Mon, 20 May 2019 07:57:27 +0200
Message-Id: <20190520055731.24538-1-hch@lst.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
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
Cc: linux-nfs@vger.kernel.org, Kees Cook <keescook@chromium.org>,
 Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, linux-mtd@lists.infradead.org,
 Sami Tolvanen <samitolvanen@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Casting mapping->a_ops->readpage to filler_t causes an indirect call
type mismatch with Control-Flow Integrity checking. This change fixes
the mismatch in read_cache_page_gfp and read_mapping_page by adding
using a NULL filler argument as an indication to call ->readpage
directly, and by passing the right parameter callbacks in nfs and jffs2.

Changes since v1:
 - add the 9p patch to the series
 - drop the nfs patch that has been merged

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
