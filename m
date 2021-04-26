Return-Path: <SRS0=STJJ=JX=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9F49C433ED
	for <linux-mtd@archiver.kernel.org>; Mon, 26 Apr 2021 23:37:36 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 659556044F
	for <linux-mtd@archiver.kernel.org>; Mon, 26 Apr 2021 23:37:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 659556044F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:References:In-Reply-To:From:
	Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Rh219fZhHaVvcik2k6Ecnf7ZVJq4QyYwnNpFWmYor8w=; b=D6/gZ7+hK7wsd3ceAgrRguRVwF
	FQgBR/qk+vVCymeHjwaEOkMBOrZFHS0qfpbvg2VCSOEy5s6SL0QIK+/1Jv4SFcihcG2yJag46Spd8
	VBta0roi3AMven5jkahIbNhIhRk/nwI5wEtuiaSgPsUkNmWgLxI8SJAVuSb7EcTytzRKyouNbXGzd
	ww1Fgf8KLQYjR8Dz8f91VyY6v1wqE+l0lHCfLuwCr8Ft945ftcyz0tGle5Bo1OuEgSdmvL2/ghJER
	fr6z4kWn1OZqaFPoukwJXUhU/AmKKscKDChakV4Ybu/eUjFmnmzSr76RoWFCNmiLHjL6EfMsYVu9Y
	LsWRf7tg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lbAmQ-000DPp-6a; Mon, 26 Apr 2021 23:36:42 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lbAmK-000DPK-O2
 for linux-mtd@desiato.infradead.org; Mon, 26 Apr 2021 23:36:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Cc:To:Date:Message-Id:References:
 In-Reply-To:From:Subject:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=kIrKG+MaxhW2T8V0zwMH/+EYIa4XPKtwsjVugYZe9Xg=; b=ww6HyYtDVGLIoKRO5uc0jiovNP
 NQeRQMNvdg0oEmL/UEE7rGRYNeVMkdexExtD+w+nT/TvZLT219FnkLL5DYmgPW+ldS4WSd2rkSkWO
 Cq05q1QulKg3zqUkLlMqI6URMIgPB3DstTzV4dZ7wNbSd+2oWgi/7u9XAcZ40mbfRZbzpqZfV1J4A
 RuaPCa2dV98Ebd844hTSX79kTw7Dc+pfZ2vVwHp+IbalXSi7HRtNZwegBWF7x/xzqQhiTub4QE4o/
 uMftpHkTdZPhNpERPsKU3f0owtCe/BrXB7/VbNjcuneVHuV3w8k26pXDbjfYXZ76exNDVs8SmRXYh
 AMW4RAyg==;
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lbAmI-00GJOv-8N
 for linux-mtd@lists.infradead.org; Mon, 26 Apr 2021 23:36:35 +0000
Received: by mail.kernel.org (Postfix) with ESMTPS id A6BB161178;
 Mon, 26 Apr 2021 23:36:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1619480193;
 bh=97uBwar4GVjgpXwPL1lpYqz0PZOQSdYeCcQN4bNW2TU=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=ZWC/mAERwRHpQSMWvQ9sm7n8jKbonhO+uMR4yobmiWaWpgaBnVkt447uZknhdGQNG
 RbP3IgNGm1JMKDYogNwdJQ2i3pEGwgT9g2nWz6rEeO+E3tq2bxc6zwsiczdeqL4ius
 16z2EVquaI5YlaXlXBleBVi/FfqXz8JGZaLule/ZvD3QpuiK0eQSCuQHP7VkIonabA
 nMbcgnLsqgnYnVmmaHDtRNmEetTRrCsqTO6XdJ61ExsDBhD/2UE2AqlmTNwqZSKRLv
 8m/WNCmCodUD6jthJbBIXgufeZtfWVck1Z3LAN2GvbCuaoH7WAf9zFVIE0+93DC3zt
 IKUlSFeng1juw==
Subject: Re: [GIT PULL] mtd: Changes for 5.13
From: pr-tracker-bot@kernel.org
In-Reply-To: <20210426152647.5522f59c@xps13>
References: <20210426152647.5522f59c@xps13>
X-PR-Tracked-List-Id: Linux MTD discussion mailing list
 <linux-mtd.lists.infradead.org>
X-PR-Tracked-Message-Id: <20210426152647.5522f59c@xps13>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git tags/mtd/for-5.13
X-PR-Tracked-Commit-Id: a881537dfaf281bfcb94313d69dcf9ef8fc89afe
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 070a7252d21b8e8900ee8540f82f0f1a348f8816
Message-Id: <161948019357.27003.14199252693076955726.pr-tracker-bot@kernel.org>
Date: Mon, 26 Apr 2021 23:36:33 +0000
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 linux-mtd@lists.infradead.org, Richard Weinberger <richard@nod.at>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210426_163634_347003_BDEE93AC 
X-CRM114-Status: UNSURE (   4.31  )
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

The pull request you sent on Mon, 26 Apr 2021 15:26:47 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git tags/mtd/for-5.13

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/070a7252d21b8e8900ee8540f82f0f1a348f8816

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
