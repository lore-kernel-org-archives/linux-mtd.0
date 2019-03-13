Return-Path: <SRS0=ZvR1=RQ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CC94C43381
	for <linux-mtd@archiver.kernel.org>; Wed, 13 Mar 2019 16:50:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2DBBB2173C
	for <linux-mtd@archiver.kernel.org>; Wed, 13 Mar 2019 16:50:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dclVhHdd";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="BfoJkbJo"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2DBBB2173C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OCahgyePuM2JN1pJNwjD9KubZ6SAqYV//q1z+2B8mZg=; b=dclVhHddZ0Ope0
	vH3MrXerI/8Y4WVEpcFOMaQ5D/+Tn2Obcs0zSPkbbEU+/XFoWG18IP6zmFctQ3x6g7Mjb+IVhgbGo
	7WUisLROoe7T9xl9Nnn+pLfZiMh0Exm5OP5vfTcYVlhbgqnZp9TgX4QlaZ2qauLP8iMcmQdoRU6ck
	iwgh1PcXCi0OAXBfWir0p0B9CAOOacHex7F/Ivgggo5PRNRBRyvAgOblUvgHSOdgNB+V1SkHPSOv+
	dscJKZ5JK9rJIbcqp9shof/aUbddEWLw0aUxqBdvWEM2wBb0mhW1TJGPB0s3SzTxGXfS8w8jHbDyD
	Id0XYVls14JfOto8Br4A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h475C-0004ct-Lu; Wed, 13 Mar 2019 16:50:22 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h4757-0004c1-PK
 for linux-mtd@lists.infradead.org; Wed, 13 Mar 2019 16:50:19 +0000
Subject: Re: [GIT PULL] UBI/UBIFS updates for 5.1-rc1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1552495816;
 bh=CrD6Oq478unkohUCBUgUcBxHTip48qVCbzPPX76Jv7s=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=BfoJkbJoFNZJ3sD/KsgqdiE43DkINdaK8SrerDzN5Gq38q+PyK+QzM8703j19KzV1
 bEbYvpFRsfBaexwv4cPXFvs3k6cgd5+S21vDxQ3M14f6kBAY5SAEk9yhWqfDPY0hLs
 jXv0/7PC7YWOKYYgiG7wCNFicQDp7SxqBCoZEqdo=
From: pr-tracker-bot@kernel.org
In-Reply-To: <6283638.XALati16HY@blindfold>
References: <6283638.XALati16HY@blindfold>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <6283638.XALati16HY@blindfold>
X-PR-Tracked-Remote: git://git.infradead.org/linux-ubifs.git
 tags/upstream-5.1-rc1
X-PR-Tracked-Commit-Id: 5578e48e5c0bf4684e68ae08caa2293bfb3f5307
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: a840b56ba385059742c2b7f4fd665ec9afb8931e
Message-Id: <155249581630.9487.4809053847391506188.pr-tracker-bot@kernel.org>
Date: Wed, 13 Mar 2019 16:50:16 +0000
To: Richard Weinberger <richard@nod.at>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190313_095017_841659_F4890299 
X-CRM114-Status: UNSURE (   1.37  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: linux-mtd@lists.infradead.org, torvalds@linux-foundation.org,
 linux-kernel@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

The pull request you sent on Tue, 12 Mar 2019 16:13:53 +0100:

> git://git.infradead.org/linux-ubifs.git tags/upstream-5.1-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/a840b56ba385059742c2b7f4fd665ec9afb8931e

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
