Return-Path: <SRS0=9jYX=DY=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30364C433E7
	for <linux-mtd@archiver.kernel.org>; Sat, 17 Oct 2020 18:23:47 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CB58C20791
	for <linux-mtd@archiver.kernel.org>; Sat, 17 Oct 2020 18:23:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="11RVoQhS";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="PO7DbMAm"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CB58C20791
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Date:Message-Id:References:In-Reply-To:From:
	Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ppJkEJfQaULW3HVFd4x1ZykHffmNkMCKNr8hYthsf0g=; b=11RVoQhSsRxL/mC4oNXA6JznRT
	ONm31qlFKwTzofLqybpXm9AlT+A49ULv8s3sfMmjIflrLmBfmD3saZyKnqI5ocYf1czovevptrZh4
	SN+9Wg9W+nNqNRkZURQQY2z6tfKcVXNhqV3AlWwaPqNcN3DP4F+Z7OqKCsdmoKu4EDCBgAPf47BMz
	hPyGsWuVt/Mw4WSN7r0wFwfFEdFamfGNJBDD9u9HmqOTea6cbbTHdTsHdKoF4X95xYIQFFVVRFqTz
	YJ75aB7L4TYE4J06z3oM8/SpZthDVG8bFmc2haYMYJ9bKV4NPFGm5d5vZAfY9dUrdBAbROlmkyzKc
	g0ZID9IA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kTqqs-0002c1-Dz; Sat, 17 Oct 2020 18:22:46 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kTqqp-0002az-IV
 for linux-mtd@lists.infradead.org; Sat, 17 Oct 2020 18:22:44 +0000
Subject: Re: [GIT PULL] MTD updates for 5.10
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1602958962;
 bh=5mFCa+Q8SYjVtOELXdSY8lMak5iq0+C1sI2bfK+9Wzo=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=PO7DbMAmMEZDZuHxMUh0/ZDsf5rklm4hO5HLB6lka3t1HEeoby7gkY6OFCfRDlSpz
 f1p2rwFEPLH/4qIq83L7cORgZycVXrJge7FZXocIhCx96NwXK8Mx/wku6WJy3gJhUG
 RTw9R2Ag2Ph89r6k48ZVXNw1PNk7PqtVP+ZKPjeg=
From: pr-tracker-bot@kernel.org
In-Reply-To: <1673234208.201792.1602850459001.JavaMail.zimbra@nod.at>
References: <1673234208.201792.1602850459001.JavaMail.zimbra@nod.at>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <1673234208.201792.1602850459001.JavaMail.zimbra@nod.at>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git tags/mtd/for-5.10
X-PR-Tracked-Commit-Id: 6402f4ce95811db7df72244ca84860332e4c2518
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 6f78b9acf04fbf9ede7f4265e7282f9fb39d2c8c
Message-Id: <160295896254.15185.8153069505913079449.pr-tracker-bot@kernel.org>
Date: Sat, 17 Oct 2020 18:22:42 +0000
To: Richard Weinberger <richard@nod.at>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201017_142243_705778_202E6046 
X-CRM114-Status: UNSURE (   3.76  )
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
 linux-kernel <linux-kernel@vger.kernel.org>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 torvalds <torvalds@linux-foundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

The pull request you sent on Fri, 16 Oct 2020 14:14:19 +0200 (CEST):

> git://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git tags/mtd/for-5.10

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/6f78b9acf04fbf9ede7f4265e7282f9fb39d2c8c

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
