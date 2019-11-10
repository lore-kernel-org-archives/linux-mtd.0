Return-Path: <SRS0=dr70=ZC=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39D72C17442
	for <linux-mtd@archiver.kernel.org>; Sun, 10 Nov 2019 14:45:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 076E92085B
	for <linux-mtd@archiver.kernel.org>; Sun, 10 Nov 2019 14:45:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Z9tg3EfF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 076E92085B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sigma-star.at
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=hkzGYCsyHAnm/PN8hgHyk2vCknFscQupK+WNeR5RfYo=; b=Z9tg3EfFPIMjAU
	K6tV6pBFruvl4jkk1m9E5Q3HJO4sFbVY9fFn8LmvlL/QbxCSwpOcX5NdsJ/pDT0F+EJ6zzepY6jO7
	i1rJG6dUZDOLIlCkMlAw7tcmxPHqSZR8FKvTuAy+Hdsl5IlH+EWGihErFvKvdjRf2xix6cPSYLdMk
	/ptDTEWIQqSrN2CJmxvqHEtOzanAD3ThLYvl5rL+3EbSbEc+KbfgTN2n7Q4bIr0PogGi/0M/N7PN2
	2ph6XWduBkMx7D8oHuaiHxf1d475RYi8KwMycxqrsBLYa4UCowr6l8z9zAFg2KVM8ULWoDebtU1s3
	lOa1XQOo/9M8xaqgM0aQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iToT6-0006db-PG; Sun, 10 Nov 2019 14:45:32 +0000
Received: from lilium.sigma-star.at ([109.75.188.150])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iToT3-0006cL-7G
 for linux-mtd@lists.infradead.org; Sun, 10 Nov 2019 14:45:30 +0000
Received: from localhost (localhost [127.0.0.1])
 by lilium.sigma-star.at (Postfix) with ESMTP id 0DAEC181099F9;
 Sun, 10 Nov 2019 15:45:24 +0100 (CET)
Received: from lilium.sigma-star.at ([127.0.0.1])
 by localhost (lilium.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id O83eBrRzcwK4; Sun, 10 Nov 2019 15:45:23 +0100 (CET)
Received: from lilium.sigma-star.at ([127.0.0.1])
 by localhost (lilium.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id BvPE1z0nlmgn; Sun, 10 Nov 2019 15:45:23 +0100 (CET)
From: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 0/2] mkfs.ubifs: some error handling fixes
Date: Sun, 10 Nov 2019 15:44:40 +0100
Message-Id: <20191110144442.26680-1-david.oberhollenzer@sigma-star.at>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191110_064529_410687_8BB5E7D1 
X-CRM114-Status: UNSURE (   7.00  )
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

Hi,

poking around the mkfs.ubifs source, I discovered two cases of what I
suspect to be error cases that got ignored instead of propperly handled.

The first is probably the more delicate one where the return value of
gen_essiv_salt is never checked in the fscrypt code.

The second one concerns pre-populating the ubifs image, where a readdir
loop is aborted if readdir fails, but the error status is never reported
back and the code simply marches on.

Please tell me if my fixes break something elsewhere or my assumptions
about the intended behaviour are flawed. Otherwise I will merge this some
time next week.

Thanks,

David


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
