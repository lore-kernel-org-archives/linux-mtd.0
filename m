Return-Path: <SRS0=IhQK=BN=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 811E7C433E0
	for <linux-mtd@archiver.kernel.org>; Mon,  3 Aug 2020 17:55:47 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 75F1A22B4E
	for <linux-mtd@archiver.kernel.org>; Mon,  3 Aug 2020 17:55:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="WK+jahf3";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="TLwaIfx0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 75F1A22B4E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Date:Message-Id:References:In-Reply-To:From:
	Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Xpd5BsIyDwcT4Fi2ML5iexkdmr5DYdWFAWQMr/8ra9s=; b=WK+jahf34HFLGDgN6++uXAiJN7
	54NtaXqC8hSvseJqDi9vVofVvK6NeHR4NtsBF+lX2ruU6KszlK0rCe6fSwF+0HC3JzlOBZAZ1QH+h
	PziobTzBt417K2vCPL+pAiTWARiESzT4mdjs6rBtiH38w34duP/EUWNlBZluux5WRwU0gkyDGzagK
	vj7+R5IniC+/bfBH1dwDRFTHlMjl18C/6Nxev5G8W7Vn8hLTfHS/o1ZTWFTGYQLGmpu0EJpbVGyPN
	XbnLC5NS0eOPnUNi4kXWHP8IS9I8KHHtul62TbPqn6kaDRbOtAEv34G505wPOHUIkhYaDemTq3SF8
	FZHBrb+g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k2efy-0004Y7-S3; Mon, 03 Aug 2020 17:55:06 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k2efw-0004Wz-A9
 for linux-mtd@lists.infradead.org; Mon, 03 Aug 2020 17:55:05 +0000
Subject: Re: [GIT PULL] fscrypt updates for 5.9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1596477301;
 bh=zoMh0nl23+pSyDpQtAkLlOsvsO3R3HRl5QxOs9dNUU4=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=TLwaIfx0FGEcrWa8IyQvq9a7sCFcL5Hs9++NjdORSBd7cBQh+tigrF0hl0ngo8WQv
 vViE81VquM5FAC4FsrHj6uUDYR347M8nqGW1qLlkaix7hcIlIieNBfM4t7Ert75B2h
 X9nZpi7wEgte2Q41n4BAtsH35GnoWdJy86VK6eFI=
From: pr-tracker-bot@kernel.org
In-Reply-To: <20200803070547.GA24480@sol.localdomain>
References: <20200803070547.GA24480@sol.localdomain>
X-PR-Tracked-List-Id: <linux-fsdevel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20200803070547.GA24480@sol.localdomain>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/fs/fscrypt/fscrypt.git
 tags/fscrypt-for-linus
X-PR-Tracked-Commit-Id: 55e32c54bbd5741cad462c9ee00c453c72fa74b9
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 690b25675f5c9c082cb1b902e6d21dd956754e7e
Message-Id: <159647730140.19506.4501237993165044273.pr-tracker-bot@kernel.org>
Date: Mon, 03 Aug 2020 17:55:01 +0000
To: Eric Biggers <ebiggers@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200803_135504_501230_AC8BAB93 
X-CRM114-Status: UNSURE (   3.39  )
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
Cc: Satya Tangirala <satyat@google.com>, Theodore Ts'o <tytso@mit.edu>,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-fscrypt@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-fsdevel@vger.kernel.org, Jaegeuk Kim <jaegeuk@kernel.org>,
 linux-ext4@vger.kernel.org, Linus Torvalds <torvalds@linux-foundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

The pull request you sent on Mon, 3 Aug 2020 00:05:47 -0700:

> https://git.kernel.org/pub/scm/fs/fscrypt/fscrypt.git tags/fscrypt-for-linus

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/690b25675f5c9c082cb1b902e6d21dd956754e7e

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
