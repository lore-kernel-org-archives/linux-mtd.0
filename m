Return-Path: <SRS0=h4jW=3R=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_DBL_ABUSE_MALW,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E758EC2D0DB
	for <linux-mtd@archiver.kernel.org>; Tue, 28 Jan 2020 17:27:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8CA1A214AF
	for <linux-mtd@archiver.kernel.org>; Tue, 28 Jan 2020 17:27:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="AKFhHjxE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8CA1A214AF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sigma-star.at
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=tPm8Cr8PjmPoevM90xQmbCMmlcp6q8DEmAImFAoiYKI=; b=AKFhHjxEmcQWEc
	si+NnJUM4tRgOI3h2DkoB1I5xwDnYOusgDvUZj3t/ii+m2DjcFBQm5nlJb+W4gRlYdmwm3pc5K0XQ
	efBSAGtHYuaeCjWZmMTk4TaDUFL4SFb6wae3RrRKR1Xu9d1VRoSgMr64tL6VUOQtBuwsjsmyy3l7l
	a6sH6H7uN1F0IxUHdchV4/Oa0Ku79HldSrThKQFNWh/2imxZjg94+pX5vyQV9JVhebC8Ul0c3lEG0
	+TxtapRma49nj5DazwQOG3NfZl2t+pMHNu//t/jmurhEMwx0t0JiiMcxWlr7M/NhMUitKmVAyt9Nt
	w2lW78dPVrdOOqDs5ajQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iwUeG-0000kS-2i; Tue, 28 Jan 2020 17:27:36 +0000
Received: from lilium.sigma-star.at ([109.75.188.150])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iwUeC-0000iP-BR
 for linux-mtd@lists.infradead.org; Tue, 28 Jan 2020 17:27:34 +0000
Received: from localhost (localhost [127.0.0.1])
 by lilium.sigma-star.at (Postfix) with ESMTP id 49E511815EA8A;
 Tue, 28 Jan 2020 18:27:28 +0100 (CET)
Received: from lilium.sigma-star.at ([127.0.0.1])
 by localhost (lilium.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id fy8zp47wa_0x; Tue, 28 Jan 2020 18:27:26 +0100 (CET)
Received: from lilium.sigma-star.at ([127.0.0.1])
 by localhost (lilium.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id UAM8etW_CGPl; Tue, 28 Jan 2020 18:27:26 +0100 (CET)
From: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 0/8] mtd-utils: fixes for various issues reported by static
 analysis
Date: Tue, 28 Jan 2020 18:27:07 +0100
Message-Id: <20200128172715.19545-1-david.oberhollenzer@sigma-star.at>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200128_092732_541819_864B516D 
X-CRM114-Status: UNSURE (   6.69  )
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
Cc: richard@nod.at
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

This is the next round of patches for mtd-utils that attempt to fix
some of the issues reported by Coverity Scan and gcc warnings.

For this round I mostly tried to getthe obvious stuff out ouf the way
before touching some code where it is less obvious what it is actually
supposed to do. Nevertheless, please tell me if my fixes break something
or my assumptions about the intended behaviour are flawed. Otherwise I
will merge this at the end of the week.

Thanks,

David



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
