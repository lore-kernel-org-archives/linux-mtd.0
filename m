Return-Path: <SRS0=SuWK=44=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A104FC2BAEE
	for <linux-mtd@archiver.kernel.org>; Wed, 11 Mar 2020 20:45:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A50C220737
	for <linux-mtd@archiver.kernel.org>; Wed, 11 Mar 2020 20:45:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Mscirjkv";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="Xs0c8KJM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A50C220737
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OkFrUFKsRlyrn95enDDbTOKpgp6TViA3di2e1jSPW6Y=; b=MscirjkvhD4oF1
	zuZqrI6s5F6JSCJesF2m0PCPvT1Vf2IY6p0lC64E3iBrqBlCavswv0d6Rp/2j4ntWcHVvM8+BonKF
	Gx7Gib9tbD9QTFWqi2v/IqNp+zQuZgKXVHK62Zj4JG/gKgr/HE1HMTesi+keK7+n5pP4L/emNPReZ
	kH6G88H7niEHBm6hjXa51GaUjSGmgqhlw+7S65MNeIJk0AXhO0G9AJ1OOnSTduh6IEQ0zD7W6Pvmb
	Wo3AU7AhPQcHWLrAHuwRWhA7BtbQ4lZbaqH7Xx53eCNfknS1T+NywcKXQOm7QLa/10vBC+UxJTXR9
	sSsx3Icuh2bRJ4EdOZ9w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jC8Dx-0001aK-CN; Wed, 11 Mar 2020 20:45:05 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jC8Du-00015z-Eu
 for linux-mtd@lists.infradead.org; Wed, 11 Mar 2020 20:45:03 +0000
Subject: Re: [GIT PULL] fscrypt fix for v5.6-rc6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1583959502;
 bh=BpqMPqVMEExHAmwE9Beff6FPwRMgQuXwVzkTYS3rtlU=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=Xs0c8KJMFvlIzYcA40MhFlGm1IOWy8yJpK+Fr+m+FqJo0T4F6QMhQO5I8brlBTQQ9
 uN96LInyTlX1axYS0S+hFluaPchZGwlMsSGXC1kNPWesIoYBt+wReS3ilar28gicxk
 whhVJL8+3q1awpkbNsNhFivAMtRZl/XbkoeJm9ig=
From: pr-tracker-bot@kernel.org
In-Reply-To: <20200311194839.GB41227@sol.localdomain>
References: <20200311194839.GB41227@sol.localdomain>
X-PR-Tracked-List-Id: <linux-fsdevel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20200311194839.GB41227@sol.localdomain>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/fs/fscrypt/fscrypt.git
 tags/fscrypt-for-linus
X-PR-Tracked-Commit-Id: 2b4eae95c7361e0a147b838715c8baa1380a428f
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: e6e6ec48dd0fa12e8a2d1ff6b55cd907401bd7fe
Message-Id: <158395950136.14877.831369511825672693.pr-tracker-bot@kernel.org>
Date: Wed, 11 Mar 2020 20:45:01 +0000
To: Eric Biggers <ebiggers@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200311_134502_527281_5AB5C3D1 
X-CRM114-Status: UNSURE (   1.26  )
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

The pull request you sent on Wed, 11 Mar 2020 12:48:39 -0700:

> https://git.kernel.org/pub/scm/fs/fscrypt/fscrypt.git tags/fscrypt-for-linus

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/e6e6ec48dd0fa12e8a2d1ff6b55cd907401bd7fe

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
