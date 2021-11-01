Return-Path: <SRS0=1Z3h=PU=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4930EC433F5
	for <linux-mtd@archiver.kernel.org>; Mon,  1 Nov 2021 20:05:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 10B1E61053
	for <linux-mtd@archiver.kernel.org>; Mon,  1 Nov 2021 20:05:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 10B1E61053
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XnlC/wg6hdbrytgtBIdYEr6CMi7YxlQKP7tLxdFWO74=; b=ogBlEkxqLsEPKz
	dZjRWdg2zn6rWMLwoUiTDXciZbD1pd40biJHCxDDjQ0zPPX2RC0nu5ZE3LIRIrA26wtg/Cz9/lJn2
	whF1XIPHi/W8T+vgpTX2eMdeG92UuIZuZhevgQCxZMbEVfAbqRfpRKq/Ds06SorA19j3/1c3WwLkI
	ufumbSMF0/xE+p1nyCs/xYzhCzF2ob3SEyDoxUqtQ2PX22b9JT8LRhZNWc6FzVhpNTHuQi0S1gum1
	+2vCnpKEiuflqjjajcssq23Q64/zBMMg3t2rjhClXiLHuiwzAe5MdUYdd6tD6VL/40GSwWzXCxO2+
	I8RIDLQpZY65ErZ4qkZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mhdY1-00HDGY-ME; Mon, 01 Nov 2021 20:04:49 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mhdXz-00HDFz-JA
 for linux-mtd@lists.infradead.org; Mon, 01 Nov 2021 20:04:48 +0000
Received: by mail.kernel.org (Postfix) with ESMTPS id 2364660E52;
 Mon,  1 Nov 2021 20:04:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1635797087;
 bh=DsJjDkX8TRbN+hOtR000e0+OFA+4mRj8nd5JbJ7Ja9s=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=TBfrZXUf8OEFlAQrR19+evjH39yVDJt/f6pVOf0Q6c//5CWp6W8j0/dJw0OJnpQ6u
 lPc6kzLPoqXCx3fd93HC1pr+7rIJhvbiWmeuzGz3Z8+PGtR+3tMaOvZjKJKA3Ojrij
 GRgoUAFJhD/de3UKM5Ej0SK74si3GT4n648Akl9EAQ2o7PO/suyHGnAjng3N6d72K6
 tdLJvTff70l1NHCM0C+i8Xdh8EswObMcDLJhkKdp6Q1tpp0r8TpMYGyv608Ql+W6Bz
 FYsD/zDY0IcBFb3kQ+qajhIm34AdI6zj1UCEAlIN6Vzx34mZs9Vk6/IfiU/N1kkPJg
 z4VI58+LfytnQ==
Subject: Re: [GIT PULL] fscrypt updates for 5.16
From: pr-tracker-bot@kernel.org
In-Reply-To: <YX8jdp73zUDwlB5E@sol.localdomain>
References: <YX8jdp73zUDwlB5E@sol.localdomain>
X-PR-Tracked-List-Id: <linux-ext4.vger.kernel.org>
X-PR-Tracked-Message-Id: <YX8jdp73zUDwlB5E@sol.localdomain>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/fs/fscrypt/fscrypt.git
 tags/fscrypt-for-linus
X-PR-Tracked-Commit-Id: b7e072f9b77f4c516df96e0c22ec09f8b2e76ba1
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: cd3e8ea847eea97095aa01de3d12674d35fd0199
Message-Id: <163579708701.1875.9945029262289027407.pr-tracker-bot@kernel.org>
Date: Mon, 01 Nov 2021 20:04:47 +0000
To: Eric Biggers <ebiggers@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 linux-fscrypt@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-mtd@lists.infradead.org,
 linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
 Theodore Ts'o <tytso@mit.edu>, Jaegeuk Kim <jaegeuk@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211101_130447_673715_5DD83DAE 
X-CRM114-Status: UNSURE (   3.87  )
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

The pull request you sent on Sun, 31 Oct 2021 16:15:02 -0700:

> https://git.kernel.org/pub/scm/fs/fscrypt/fscrypt.git tags/fscrypt-for-linus

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/cd3e8ea847eea97095aa01de3d12674d35fd0199

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
