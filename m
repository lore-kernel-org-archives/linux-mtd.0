Return-Path: <SRS0=P3/5=NW=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3056DC432BE
	for <linux-mtd@archiver.kernel.org>; Tue, 31 Aug 2021 18:20:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E36CA61051
	for <linux-mtd@archiver.kernel.org>; Tue, 31 Aug 2021 18:20:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E36CA61051
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cJpwi5muzgpKSmyuOnBeWTfjCYn9vYzDwFZSnX61Dg4=; b=44mC20hM0wEFDs
	ux7gdjRV3PY21VlB64G/dyNpePgdhbuYRC7pr3Ye+80TE5hKC8BtweZP6oqfqNZtUeIRNzK7H3VCY
	/HDafOL0Owi1FfH0aoEkCJmjtECYmN1p7LSZtvGDUX+LlAabPcOiSUiAoUUkVln7dhwcmNXJNcUn2
	PJodnv0zek65JkNmFxK9Me4hBxOlqkb0/Nwy4gFPqHqb7tA/JQxUrRK0wYBkrS8DVIeEp1O1jwAgV
	yb2gMZpo+a1yvnVibb3aAiXEhzm1O0E1rie+sVFg6VCfyMYOlbxqiyawa0F1i6U+/JKtGlv/lLUne
	qd7CwcoJVClLxV9NKlQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mL8MA-002u5E-VH; Tue, 31 Aug 2021 18:19:35 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mL8M8-002u4o-3o
 for linux-mtd@lists.infradead.org; Tue, 31 Aug 2021 18:19:33 +0000
Received: by mail.kernel.org (Postfix) with ESMTPS id ADE2061051;
 Tue, 31 Aug 2021 18:19:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1630433971;
 bh=PgM+rDs46+2K+qL4znNPoYRobm/RKsxxaeXjArovSN8=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=SWOFg1QAapkZgOnNA55lnZXl0M1sBb7SznJoScFIfq/GCb5UzGord2w7FpFz+0Iqo
 ErI9bpFhNW8BgCu1y21b9GDjnMI/oG0+gR4ICZ2vsW45Tn8V37mqWYeQsQi9HOo9GH
 +w8voK2ZTzcJco29BILtsx70Sofl/0SQgDm35+vmlA+0o2PYmkYg828wmGqMXIY7TA
 TJ0KWEjWx+TOdnyLRCfQb0yDSfu7N8BWPSlTo/eazDxoxocI6iST60/uxhwuShS1xt
 O4qt69qcDdH/pLAtNrx0qRd30oFL4aZ0zPWL6FNWLmvimhauUEZDQsAi5sRT9iA0ea
 aT1ruYletuzSQ==
Subject: Re: [GIT PULL] fscrypt updates for 5.15
From: pr-tracker-bot@kernel.org
In-Reply-To: <YS0LlXIhvZc4r5Vt@sol.localdomain>
References: <YS0LlXIhvZc4r5Vt@sol.localdomain>
X-PR-Tracked-List-Id: <linux-fsdevel.vger.kernel.org>
X-PR-Tracked-Message-Id: <YS0LlXIhvZc4r5Vt@sol.localdomain>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/fs/fscrypt/fscrypt.git
 tags/fscrypt-for-linus
X-PR-Tracked-Commit-Id: 38ef66b05cfa3560323344a0b3e09e583f1eb974
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: cd358208d703fca446b52f3cf8f23c18f9e7705e
Message-Id: <163043397158.24672.5271221655251796062.pr-tracker-bot@kernel.org>
Date: Tue, 31 Aug 2021 18:19:31 +0000
To: Eric Biggers <ebiggers@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 linux-fscrypt@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-mtd@lists.infradead.org,
 linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
 Theodore Ts'o <tytso@mit.edu>, Jaegeuk Kim <jaegeuk@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210831_111932_212940_E4649574 
X-CRM114-Status: UNSURE (   3.69  )
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

The pull request you sent on Mon, 30 Aug 2021 09:47:17 -0700:

> https://git.kernel.org/pub/scm/fs/fscrypt/fscrypt.git tags/fscrypt-for-linus

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/cd358208d703fca446b52f3cf8f23c18f9e7705e

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
