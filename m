Return-Path: <SRS0=Vrwx=JK=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6AF9AC433ED
	for <linux-mtd@archiver.kernel.org>; Tue, 13 Apr 2021 21:05:03 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 31971613C0
	for <linux-mtd@archiver.kernel.org>; Tue, 13 Apr 2021 21:05:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 31971613C0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:References:In-Reply-To:From:
	Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZnXe9BSxiqkdfODxpz9FB0IOOYJd4d2U090Jcug/hCk=; b=fq6MnUtRl2UIcp77PZjgIUsarF
	ttD/AWPGe9bfFxsf/NRfeP/ciXWufrKyn5RJMB7sJGlSlXzvBTvP81/FMGj2zvuKpvW9x0zvyBO7r
	1HQHykl+RseS3ZmbzUVA+Z7UHPh9+OQYp0IGgAOG5bSs4PXDc3FZxa7vqOpQa8EOu/ogdwcSbaMz+
	QTcsh3lFTY2rLJptk0Nu9lU7SEFqIuRk9lK1YX5YG5ZnO7JqpON6TpZSZCoFsA1J2Qt+fbPLSwhPW
	k3LHM0VrNKOIaJay9E4incNmbYhEJ5XBAyFCth6BfxcdV58K9sgoPYjg4CXfHxeBVzVgjMd8hqaS2
	H7yVR7Ew==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lWQCW-00ATHW-9O; Tue, 13 Apr 2021 21:04:00 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWQCO-00ATFW-8v
 for linux-mtd@desiato.infradead.org; Tue, 13 Apr 2021 21:03:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Cc:To:Date:Message-Id:References:
 In-Reply-To:From:Subject:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=f5rnh4O5qKDDdi8AU2b/iAUu8gpGqnwGjHPR+t4tpRA=; b=RnIxE7R7TVqb3y7MBYQmpDiJlc
 fhOcYzbWREKaenr036uO8zd1D73Pa0sG/07r7flqs7cEpPIghZHUT9vVML41Yg1ZyL3DAiuKWZH2l
 e7dWp6swbDFoYMMyzIcH6pvgZSVbdntR+khIiz1r5m/BLns04qPRNjxhB5cp5U7k5ryzWHU82yKjj
 ebkqD3ozJw+YOslaOuj4DpxAfnsGHOAUmMH2bEzpZ6Vz3fIDsOSCNbAiq/CUWnqAtBk9jsPFbPfOW
 5hFkrIsKJL7NIyKsfzQw93f0FKiDKIfV1XFpi/DRqR69A3Ql6ky++/e6M8+faZeYDho1ZxeBhtbG3
 dnQeyamQ==;
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWQCL-007K7a-PX
 for linux-mtd@lists.infradead.org; Tue, 13 Apr 2021 21:03:51 +0000
Received: by mail.kernel.org (Postfix) with ESMTPS id 064DD61158;
 Tue, 13 Apr 2021 21:03:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1618347829;
 bh=4Rr2C5kh/nxc96K2E4OerlxnH1QR3cu7vm7JPrvZeVg=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=lPRIJK2fVVaTv3g+MzU+vMGCR7GFVaC7q1IFKvy+4iQUAJ54MfYsnYkDm9UF+KktJ
 kbv4AAO1dtlPmOSI2ek0SVRAumNhoCkRyR8ozCO8B6GOvCZWtozJbXtZlMDY2czCcq
 CyidvUsvqTxRPuU+pzTqWz6sQm/Mtj+F7Uc3UBYM1xatHGnvyZ2u12M07OUbkiP9qU
 eWF5Ay7LrV6su5HZE+BmSQ5vxq1Fsf6zK6O4rn9BF/efnpXN4Y1Wg27F9RPmMVPfNA
 Yekxzp4TrPiwuAbPcdiWakstDLDZK57p+2G4FZLNmgZBReC0sHRnQyaXKzQoo33XBN
 6hMOFqN2kE7dw==
Subject: Re: [GIT PULL] MTD fixes for 5.12-rc7
From: pr-tracker-bot@kernel.org
In-Reply-To: <1678691098.178869.1618344341740.JavaMail.zimbra@nod.at>
References: <1678691098.178869.1618344341740.JavaMail.zimbra@nod.at>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <1678691098.178869.1618344341740.JavaMail.zimbra@nod.at>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git
 tags/fixes-for-5.12-rc7
X-PR-Tracked-Commit-Id: 2fb164f0ce95e504e2688b4f984893c29ebd19ab
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: eebe426d32e1a10ac7c35f8ffab5f818c32a2454
Message-Id: <161834782890.2646.811422618503116662.pr-tracker-bot@kernel.org>
Date: Tue, 13 Apr 2021 21:03:48 +0000
To: Richard Weinberger <richard@nod.at>
Cc: torvalds <torvalds@linux-foundation.org>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, miquel.raynal@bootlin.com,
 vigneshr@ti.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210413_140349_886878_8D940728 
X-CRM114-Status: UNSURE (   3.24  )
X-CRM114-Notice: Please train this message.
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

The pull request you sent on Tue, 13 Apr 2021 22:05:41 +0200 (CEST):

> git://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git tags/fixes-for-5.12-rc7

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/eebe426d32e1a10ac7c35f8ffab5f818c32a2454

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
