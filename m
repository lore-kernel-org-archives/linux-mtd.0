Return-Path: <SRS0=6x0o=6L=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 782A0C4CECC
	for <linux-mtd@archiver.kernel.org>; Mon, 27 Apr 2020 19:45:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4F3A2206B8
	for <linux-mtd@archiver.kernel.org>; Mon, 27 Apr 2020 19:45:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Hll3q2UP";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=embeddedor.com header.i=@embeddedor.com header.b="mckb55iH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4F3A2206B8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=embeddedor.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:To:From
	:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=tdTEBpmMCNIw+VbL2TelSBixoYK9nkY8MaevfaVdONE=; b=Hll3q2UPqNZ5F2
	GqHIGIe+fcUfc5IA+YXr2d0S1ctC9HGCnb7ubDcf4dVO8BbPnYFpT8ELbfk5517S57erNmuzTes9j
	wOlO6nLWEWG3hv4D7bE3RVp4yZp5y7EJovCKOhz5POnl9b1lhIoIx06Xr7gX61p5zXZN0wWgI3xLD
	FTXQOhsjViuk38iMn17qyLAqWGVzc94cXwFG732gs3uoOO7ZNVef53zGI7L0GC3J0mMCqp9PFPRb8
	aQXr5RhK/qxMkc3PwRlu1crxWjQ9nb9BbjGSM+n6IwFj8LsJzM7sjE8Y6VjxeMgUKqJJ7UmlQ9Mr2
	+0Bbg7Q8TPuTbzYptTlg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jT9gt-0007Vf-Ir; Mon, 27 Apr 2020 19:45:19 +0000
Received: from gateway22.websitewelcome.com ([192.185.47.100])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jT9gI-0004lY-28
 for linux-mtd@lists.infradead.org; Mon, 27 Apr 2020 19:44:44 +0000
Received: from cm17.websitewelcome.com (cm17.websitewelcome.com [100.42.49.20])
 by gateway22.websitewelcome.com (Postfix) with ESMTP id 47FF91C092
 for <linux-mtd@lists.infradead.org>; Mon, 27 Apr 2020 14:44:40 -0500 (CDT)
Received: from gator4166.hostgator.com ([108.167.133.22]) by cmsmtp with SMTP
 id T9gGjfR24AGTXT9gGjyGpk; Mon, 27 Apr 2020 14:44:40 -0500
X-Authority-Reason: nr=8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=embeddedor.com; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
 Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=VRUZQhEnPk469+Qwnk58nua2haaBvdA4SRE7j9QA81c=; b=mckb55iH5NRVNCVctN5DRl+9Mf
 CN8qAKs3P777km2hJ8XBPpntvs4o7qMdb23jU+h41krAYNBeSqo7xby8FemDIYARfRZSAeZkXhDrI
 Srm1G2IeOAbTRkGrNvXlMLwlqgRhwGrEeimiOtw1b8FpG3DqoB6I1iTVtiTSnWMavlVzv0PxaJcSE
 K+z0EH+DP1PWgzMOqv28B/xsgi8UtOvUhAWHG1LpP4+wukMfG8/SCdR5/Mk+Tgcp7AglvA81omr2v
 zrDN1aYCXwzK9wNkV5WdFTFXfCWx0pmUgOVPB5pqsKAxz5dz6Hr09iqlRVWeqfD4+YRSco8YzpK9J
 vGPma7nQ==;
Received: from [201.162.241.110] (port=19065 helo=embeddedor)
 by gator4166.hostgator.com with esmtpa (Exim 4.92)
 (envelope-from <gustavo@embeddedor.com>)
 id 1jT9gF-000xYF-SV; Mon, 27 Apr 2020 14:44:39 -0500
Date: Mon, 27 Apr 2020 14:48:58 -0500
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/3] mtd: lpddr: Fix bad logic bug in print_drs_error
Message-ID: <cover.1588016644.git.gustavo@embeddedor.com>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator4166.hostgator.com
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - embeddedor.com
X-BWhitelist: no
X-Source-IP: 201.162.241.110
X-Source-L: No
X-Exim-ID: 1jT9gF-000xYF-SV
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: (embeddedor) [201.162.241.110]:19065
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 23
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200427_124442_161897_F764C716 
X-CRM114-Status: UNSURE (   5.35  )
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>,
 "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
 Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 Miquel Raynal <miquel.raynal@bootlin.com>, Joe Perches <joe@perches.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi,

This series aims to fix a bad logic bug in print_drs_error, which is
tagged for -stable.  The series also include some formatting fixups.

Thanks

Changes in v2:
 - Coalesce formats in Patch 2.
 - Remove inline from print_drs_error in Patch 3.
 - Update changelog texts according to the last
   changes.

Gustavo A. R. Silva (3):
  mtd: lpddr: Fix bad logic in print_drs_error
  mtd: lpddr: Replace printk with pr_notice
  mtd: lpddr: Move function print_drs_error to lpddr_cmds.c

 drivers/mtd/lpddr/lpddr_cmds.c | 28 ++++++++++++++++++++++++++++
 include/linux/mtd/pfow.h       | 33 ---------------------------------
 2 files changed, 28 insertions(+), 33 deletions(-)

-- 
2.26.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
