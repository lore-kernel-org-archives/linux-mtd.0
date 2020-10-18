Return-Path: <SRS0=OH0o=DZ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11618C433E7
	for <linux-mtd@archiver.kernel.org>; Sun, 18 Oct 2020 17:12:05 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B14C62222B
	for <linux-mtd@archiver.kernel.org>; Sun, 18 Oct 2020 17:12:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="cQM9RD9H";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q4M8eCaz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B14C62222B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Date:Message-Id:References:In-Reply-To:From:
	Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YV63tHSPlsr5iibf5ix98OsGx8Yz586sjnurGtCzNns=; b=cQM9RD9HU4+/nsuNuyZu0XNeEF
	XFaRE7yEYn8PiPKMPOE+A+99Aj5teeLFHaBMxlUdMzBzBBt96oW89olt4w2qVMs2aOOkVAPc9TG+T
	v1TTZsZPad65S7fIL0y2+8ZWNm6Q1Or8/ssLZMcZbEv0Xe1RYZPyL+NUM6aa+6uDeI3h326xfKdBA
	vA1v6rnqmjB4IBTHpJu0JMKWoSgEze54Dsae8gA3LB9jY7SIT5lFpZogvfV0xbcM2/8NBptGUY0a8
	xYJkWNBJ/rxdRvDEPFcTGhVJawFc1wiOaYfFWrBeI2TNZ+LwliWJ5ndAxAp6OCyHFAUvHJ21R6o30
	8ZGdbnHw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kUCCx-00055W-0v; Sun, 18 Oct 2020 17:10:59 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kUCCo-00053n-2n
 for linux-mtd@lists.infradead.org; Sun, 18 Oct 2020 17:10:51 +0000
Subject: Re: [GIT PULL] UBIFS updates for 5.10
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1603041048;
 bh=yRPZIdHPswrioBrLocqGoDeX5cdrcT1XUiz6sEsc/RU=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=Q4M8eCazVEb0Y6gPaz9DL0qA1IabKDvdW9R0oSXMLshIc/uRDGJ5DFNZcbSbhetmW
 GqWUuRk53KzBstJz6YAGZOqWzS8m8VWINjtTQ1vysfUDiu6y/cw0xJFlqQzvKc+Ru6
 cUVvTEcz51NgwYYeSFNyAvzUaXXniQciogsX6ops=
From: pr-tracker-bot@kernel.org
In-Reply-To: <725261806.204163.1602963460565.JavaMail.zimbra@nod.at>
References: <725261806.204163.1602963460565.JavaMail.zimbra@nod.at>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <725261806.204163.1602963460565.JavaMail.zimbra@nod.at>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/rw/ubifs.git
 tags/for-linus-5.10-rc1
X-PR-Tracked-Commit-Id: e2a05cc7f8229e150243cdae40f2af9021d67a4a
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: a96fd1cc3ff3f9dd6f06140fc0b8c91342859450
Message-Id: <160304104821.11245.7207058750403088041.pr-tracker-bot@kernel.org>
Date: Sun, 18 Oct 2020 17:10:48 +0000
To: Richard Weinberger <richard@nod.at>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201018_131050_217611_35B1FE34 
X-CRM114-Status: UNSURE (   3.97  )
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
Cc: linux-mtd <linux-mtd@lists.infradead.org>,
 torvalds <torvalds@linux-foundation.org>,
 linux-kernel <linux-kernel@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

The pull request you sent on Sat, 17 Oct 2020 21:37:40 +0200 (CEST):

> git://git.kernel.org/pub/scm/linux/kernel/git/rw/ubifs.git tags/for-linus-5.10-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/a96fd1cc3ff3f9dd6f06140fc0b8c91342859450

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
