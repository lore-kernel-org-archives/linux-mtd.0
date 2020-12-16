Return-Path: <SRS0=y4VE=FU=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DB2DC4361B
	for <linux-mtd@archiver.kernel.org>; Wed, 16 Dec 2020 23:12:08 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C752223A74
	for <linux-mtd@archiver.kernel.org>; Wed, 16 Dec 2020 23:12:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C752223A74
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Date:Message-Id:References:In-Reply-To:From:
	Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dsNe4sT7KGeeLoBYLfp8fuHGiggLtg+apYGghDPRdtw=; b=QBFb5czOkGnFA0UP2yYZ0dyqkS
	6nyuy7OsqXlGhMjp4cc2BPL/YNTPmswo2hxSAZlTBMAfd6cKIEPzhFGKspySybivdUAQQ9+3JRs06
	IxItRQlL1+v7zzT5Alch/B/A+oiNnqUuc7mqWg+OUzd6VBFnYxi+JyS5cwupmEG0nQJEIyxQBxbll
	yTi/k310bV277s3mzO+OCgn2jRLbKyLNKxUKMgwnIlAKjo3cZjYrbZz83qcki/o7qiarM2GTB7eb/
	ZV9dvTG4WskMZmGmmLNMX50QP+bT5hQO2MQ5H61HcAZKFZPfOusqK8tSERPqy+8s8Ff58F9RDSIl4
	xr8tIefw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kpfwg-0004Bv-Mg; Wed, 16 Dec 2020 23:10:58 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kpfwd-0004BH-KJ
 for linux-mtd@lists.infradead.org; Wed, 16 Dec 2020 23:10:57 +0000
Subject: Re: [GIT PULL] mtd: Changes for v5.11-rc1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1608160253;
 bh=YNbhYgWJ+qCcoPEcCGZrMOHTDaE7/UP4QbyuLS9mxdc=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=P0MC31iWhl/L6bkwam9IBAKTJolFawwAc4oek8TePgJlupv+B70QpEDp0M0y9sA5f
 nOBjWqMqqJuQDBa8nPMFsIuxi7tTPOslBY1sQiVZL6rUi+/PMG+3bRb+4cS63aysK1
 8O6Dk63LBvzrXTll4uyBRSeCoz6Awt532kW8QqLf5d4SDj/cRXIfhTjbsb77ijUjZw
 +NEDkL8jCq11NEqYpfTYoGHPhv08wjK+rBDuIwvpVmVAVE3YQYXTjTD5s1YEES3Uib
 3OiCwpuqjCtvrMlPyt4cOUlF3olMmTt31UcNrUijRvTpCL9bIUvt4cRH2/u7xj9Ewl
 vGQjSh4Y9+cbA==
From: pr-tracker-bot@kernel.org
In-Reply-To: <20201216190417.6b7dede2@xps13>
References: <20201216190417.6b7dede2@xps13>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20201216190417.6b7dede2@xps13>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git tags/mtd/for-5.11
X-PR-Tracked-Commit-Id: 4c9e94dff65ca75b917ff0b5de2e44881062a8e8
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: a701262c02cec71dc29b10fe910ba3c2298f5ba3
Message-Id: <160816025367.24445.12709776192529643414.pr-tracker-bot@kernel.org>
Date: Wed, 16 Dec 2020 23:10:53 +0000
To: Miquel Raynal <miquel.raynal@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201216_181056_222879_01BC1C82 
X-CRM114-Status: UNSURE (   3.47  )
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
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Richard Weinberger <richard@nod.at>, linux-kernel@vger.kernel.org,
 Frieder Schrempf <frieder.schrempf@kontron.de>, linux-mtd@lists.infradead.org,
 Linus Torvalds <torvalds@linux-foundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

The pull request you sent on Wed, 16 Dec 2020 19:04:17 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git tags/mtd/for-5.11

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/a701262c02cec71dc29b10fe910ba3c2298f5ba3

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
