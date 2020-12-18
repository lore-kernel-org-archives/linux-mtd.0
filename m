Return-Path: <SRS0=ujMC=FW=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8CA3C4361B
	for <linux-mtd@archiver.kernel.org>; Fri, 18 Dec 2020 02:12:46 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 76C3A23B7B
	for <linux-mtd@archiver.kernel.org>; Fri, 18 Dec 2020 02:12:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 76C3A23B7B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Date:Message-Id:References:In-Reply-To:From:
	Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9eUuYju1xx+ef/LVfQ5pdn+YdFBtCHCOVhOze36mgY4=; b=qYNSP+xfx8X4n3vS7G7yZZqk60
	xagwWjZcLpEInnV6ynGOmNCnuPkijP5zREzA0XDObDjNcO/2RewSSMEWTZhWlZp5DlCw7Kgu71QKW
	6z1dkjafBh16H9GRuTVz3G0VZG7KMRZRtzFwj7DbLV/LkFAA4CWzpnbRYNd9d282na3VyFXJkS+Q8
	EtpWSk/ySH5hXt2lAHhNb2G1Pt3X264lYEN5XLy/Un3DiKejnmtkHN94eaAnLSaYOzipKbvciZIUa
	gri5H2KxmoNDd7QtLSgUMpQKbrvvMcEE24tNvcN1Hj4UHVKywBIJSA/FCKt8drbeCEojsMmi658Au
	AOuCSWDA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kq5F3-0006W3-JG; Fri, 18 Dec 2020 02:11:37 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kq5F0-0006Vc-8w
 for linux-mtd@lists.infradead.org; Fri, 18 Dec 2020 02:11:35 +0000
Subject: Re: [GIT PULL] JFFS2, UBI and UBIFS updates for 5.11-rc1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1608257492;
 bh=fw8CwVpgt0SmsOPzGYM9kYpW3UPnT7Hx6sUGTYL+7aY=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=KKTSDA0fFVpf8fBmyg03Qyzj/vCktFFfqeOzdJnkRqTuNf7rnaZPdJAs/Oouvvoz6
 sRp1zGkT1oHnhZeiNf+KVeGKgbj/9Dhx7l9iujiPQfh0i38WDfCk0aWtXzla+EdEgE
 wOh+VjZgY7y7e+tqV2o5I0o8mcr22jKvDaEXK9FyyxQXZ48opLd6Hl2wZeAyeEmrWo
 0eIdG3gMG1EebKuvfDg9WHmBzkkVjYSOi/MesuCu09zs7GnjFb5MjgkFoVoXMSNiy7
 39BcgR3njrIpvjuzIjAlAP8KDHAvzszqlbrLw20jCzDoZNVSq6QJ5PP73rsw3GXILk
 UoeCmRYtRXJNg==
From: pr-tracker-bot@kernel.org
In-Reply-To: <2026739641.140019.1608241461469.JavaMail.zimbra@nod.at>
References: <2026739641.140019.1608241461469.JavaMail.zimbra@nod.at>
X-PR-Tracked-List-Id: Linux MTD discussion mailing list
 <linux-mtd.lists.infradead.org>
X-PR-Tracked-Message-Id: <2026739641.140019.1608241461469.JavaMail.zimbra@nod.at>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/rw/ubifs.git
 tags/for-linus-5.11-rc1
X-PR-Tracked-Commit-Id: b80a974b8c58164ed57b0f025a47b8f003198d9e
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 787fec8ac15cc693b9a7bc1b4a338b92483d993c
Message-Id: <160825749249.20122.13883608308717904000.pr-tracker-bot@kernel.org>
Date: Fri, 18 Dec 2020 02:11:32 +0000
To: Richard Weinberger <richard@nod.at>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201217_211134_416765_94AB0A0C 
X-CRM114-Status: UNSURE (   4.58  )
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

The pull request you sent on Thu, 17 Dec 2020 22:44:21 +0100 (CET):

> git://git.kernel.org/pub/scm/linux/kernel/git/rw/ubifs.git tags/for-linus-5.11-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/787fec8ac15cc693b9a7bc1b4a338b92483d993c

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
