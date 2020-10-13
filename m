Return-Path: <SRS0=Emx/=DU=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 670F3C433E7
	for <linux-mtd@archiver.kernel.org>; Tue, 13 Oct 2020 16:24:37 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 139BA2529C
	for <linux-mtd@archiver.kernel.org>; Tue, 13 Oct 2020 16:24:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="buvdawSZ";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="mofhlG7E"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 139BA2529C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Date:Message-Id:References:In-Reply-To:From:
	Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QvQ855QjiQIXYJS3sxqao7XptchjPeTAhhTGpJ+WUPk=; b=buvdawSZVGyXlodLvXHVBOrLbe
	3rZ3hoEoUVLuiTGilfjh/9eu0gn7bcfZktXtVXcD1u4fCiAkfaTVMpd9ihR+rNn6xU80TvoEL0E8z
	R3ndhr9oT2l764krheOGYlELp7VpL0LtjeSlmw3GYmxeyMXfPMjodwAEaFbBUggXZdLQrzkd9dJxz
	ZxAI+uInzlHGp/SkWDIH7Oox4yI9TXPvnNmbmTIyw+3yF+1Y08w8euk1zIabExGivEj2fC6HOEhXC
	/hrX83qBZM4lzlnUAlAmXxvhSU/ZD7OqVVBANtjG3rS8T21XGb7nN2BTQjGNiA+gmpKeVelv3h5Mc
	Z1LAC5Xg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kSN5r-0003VD-TO; Tue, 13 Oct 2020 16:24:07 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kSN5p-0003UR-Lv
 for linux-mtd@lists.infradead.org; Tue, 13 Oct 2020 16:24:06 +0000
Subject: Re: [GIT PULL] fscrypt updates for 5.10
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1602606244;
 bh=0GDL0FDvlJWyLDYOyGXqNYN79mm0g6czXO6Y14y8hrk=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=mofhlG7EDLN4Wve2vrb/jiWtdjc82+lqb+c3kTbmI1iFf2xdVgtLjlQf0+l9/MtrC
 sE81COzKRt4L22V5GvwJKgzI+XyZCUsfnYqG3/HK4o0gRIglNXN8s9xuYDCF7C+Van
 fYZnaujwVqmKli37bmbx/DRw8xt2EHPDN/A1MYzs=
From: pr-tracker-bot@kernel.org
In-Reply-To: <20201012163543.GB858@sol.localdomain>
References: <20201012163543.GB858@sol.localdomain>
X-PR-Tracked-List-Id: <linux-ext4.vger.kernel.org>
X-PR-Tracked-Message-Id: <20201012163543.GB858@sol.localdomain>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/fs/fscrypt/fscrypt.git
 tags/fscrypt-for-linus
X-PR-Tracked-Commit-Id: 5b2a828b98ec1872799b1b4d82113c76a12d594f
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 6f5032a852f9bf3c449db58a9209ba267f11869a
Message-Id: <160260624476.24492.420695043633414876.pr-tracker-bot@kernel.org>
Date: Tue, 13 Oct 2020 16:24:04 +0000
To: Eric Biggers <ebiggers@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201013_122405_796025_0F541BC5 
X-CRM114-Status: UNSURE (   3.61  )
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
Cc: Theodore Ts'o <tytso@mit.edu>, Daniel Rosenberg <drosen@google.com>,
 Jeff Layton <jlayton@kernel.org>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-fscrypt@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-fsdevel@vger.kernel.org,
 Jaegeuk Kim <jaegeuk@kernel.org>, linux-ext4@vger.kernel.org,
 Linus Torvalds <torvalds@linux-foundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

The pull request you sent on Mon, 12 Oct 2020 09:35:43 -0700:

> https://git.kernel.org/pub/scm/fs/fscrypt/fscrypt.git tags/fscrypt-for-linus

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/6f5032a852f9bf3c449db58a9209ba267f11869a

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
