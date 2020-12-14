Return-Path: <SRS0=YYID=FS=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D2CFC4361B
	for <linux-mtd@archiver.kernel.org>; Mon, 14 Dec 2020 20:57:40 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 061E3238A1
	for <linux-mtd@archiver.kernel.org>; Mon, 14 Dec 2020 20:57:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 061E3238A1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Date:Message-Id:References:In-Reply-To:From:
	Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RJhbeOXHHiMzaYFY7Jhe3E+Ex4QM7HbqweAJDWKNsYk=; b=haUxdoTR07NnGy6eoU9J23OGn5
	txS9a88pBbCAuMKolPuWWhlSSxGNjrvn12C6V07RBfcY4oNoiOx21cQlHGtBl4AVXE41HRHAJnFPe
	Be5yXKHr+ae2aog6jdlBlh6TEVepBflnokrWnGf82YmT4Bby+IMRkFOCruRQFFxNt69ozdvtrWXdQ
	5UzycYkMfxIaESZDsxSjLN0f2g7XP4u+Ry+quGpRrYpSqNNmvgDZuQnUg1zQWNbHnY96BKbQJ+uxG
	WD4kboCQsI7fMlAuRsA3x3s7ASlBbhVl6AeoG+/viRUKTlsidom/BNe8GMuZs24q/9tklj76YVFTI
	kg/PdCYA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1koutT-0006tQ-D9; Mon, 14 Dec 2020 20:56:31 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1koutR-0006t6-8B
 for linux-mtd@lists.infradead.org; Mon, 14 Dec 2020 20:56:30 +0000
Subject: Re: [GIT PULL] fscrypt updates for 5.11
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1607979388;
 bh=8TA3M2fJC6eWzRxFjGh7dv0C/qOTmpZPhaCxujp6Nhw=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=GtNRIf8R7iFQLnZ+asV6awJfdvY2iwacFvGd201A+KsaSGv5L+sPRSk+rckYd37BU
 dJsaBrFj+FkiM81+odFK3mOHmVSfJ+V3tTJqvnyyPJOXNiKzmWbBvzazJi5j8hoFeZ
 kGqi7m6jvq6RVjshfQ3tJ1GUoJYgTBZIycDDZXcoa3spz11vvqzIBCWdWhv32tp11n
 KtlE8PlVu2QNUB7EmUFyX3g9IbBzqa26oGodoKh2lc0ouwJ3nRdVEDrIqbXi/URI3t
 EGXoEL1d9kNZSkj6aJr9m7MrYDNdbEBDKvNsz1HmG2hm6Yh83empS9+JWe1XDDi7QB
 3KKEjibp7dU1g==
From: pr-tracker-bot@kernel.org
In-Reply-To: <X9b9G8p8AiRAzDwV@sol.localdomain>
References: <X9b9G8p8AiRAzDwV@sol.localdomain>
X-PR-Tracked-List-Id: Linux MTD discussion mailing list
 <linux-mtd.lists.infradead.org>
X-PR-Tracked-Message-Id: <X9b9G8p8AiRAzDwV@sol.localdomain>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/fs/fscrypt/fscrypt.git
 tags/fscrypt-for-linus
X-PR-Tracked-Commit-Id: a14d0b6764917b21ee6fdfd2a8a4c2920fbefcce
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 7c7fdaf6ad9fe868553c2e1fc8a920249820ac3e
Message-Id: <160797938816.26822.16942745095924482464.pr-tracker-bot@kernel.org>
Date: Mon, 14 Dec 2020 20:56:28 +0000
To: Eric Biggers <ebiggers@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201214_155629_516374_8B0A856D 
X-CRM114-Status: UNSURE (   4.17  )
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
Cc: Theodore Ts'o <tytso@mit.edu>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-fscrypt@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-fsdevel@vger.kernel.org,
 Jaegeuk Kim <jaegeuk@kernel.org>, linux-ext4@vger.kernel.org,
 Linus Torvalds <torvalds@linux-foundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

The pull request you sent on Sun, 13 Dec 2020 21:50:19 -0800:

> https://git.kernel.org/pub/scm/fs/fscrypt/fscrypt.git tags/fscrypt-for-linus

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/7c7fdaf6ad9fe868553c2e1fc8a920249820ac3e

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
