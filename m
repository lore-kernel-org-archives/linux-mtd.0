Return-Path: <SRS0=1rsk=FB=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 326D1C3E8C5
	for <linux-mtd@archiver.kernel.org>; Fri, 27 Nov 2020 20:07:21 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C800222228
	for <linux-mtd@archiver.kernel.org>; Fri, 27 Nov 2020 20:07:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="VaByZSDJ";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="l/iNAMhj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C800222228
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Date:Message-Id:References:In-Reply-To:From:
	Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Vqc08yH312gXvm7kjo3buBfbkoXLwSy4FQQiT19QDhY=; b=VaByZSDJNOs0y1+8MjbvoQ1e1W
	WIqbJdY3SUbMBpNJ/bGyiF0jyAjzT8TOgvzgiAfvAmqpHXyH9ztq+4q1fqM+UcOZNlwIoRMfYOeAR
	JJoGJoISX96M+N1zFukTJOdnKGFhvTthFpYhRS9ZBxL8XDYRZwvBc/gRXIc7ADJlg6x+G55zItWIz
	mjCKV29XuDW/6LqQcvW3ZJq2uIIZRF5d8v4BdDWyFmyHL1cFbWXoZ08Zv4iuu/wTaLTWBojl0NXlo
	UOAW6QC3hJyIePeqHD7HeIp+S8Fav4fRvhO40fx4Az0Cu9dcYdqyWvdDYcAtukzQ14cing+vL05s8
	X7i/K9OA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kik0I-0007d6-RB; Fri, 27 Nov 2020 20:06:02 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kik0E-0007bw-08
 for linux-mtd@lists.infradead.org; Fri, 27 Nov 2020 20:05:59 +0000
Subject: Re: [GIT PULL] mtd: Fixes for v5.10-rc6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1606507556;
 bh=bFteTb1DF2UZL9QmORZrOqJwlLF0qxVbEDwaLtyngfw=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=l/iNAMhjs5iua2ISZhnrrmCeQGSG//zIF3Zcux/BdEcwUcl+I1vvNo0gm7dfHYwq7
 kW0XY/2PfC6h4GWOMk2RcV6Nr1DCLM5KiR5FB6oJ8kjjAH4ucbJlD5//7rxDuqcO3q
 YlY3B8hf56T/7Edu184Kcr0BhFV0/mYqZyCQ5SgU=
From: pr-tracker-bot@kernel.org
In-Reply-To: <20201127193803.324e1f83@xps13>
References: <20201127193803.324e1f83@xps13>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20201127193803.324e1f83@xps13>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git
 tags/mtd/fixes-for-5.10-rc6
X-PR-Tracked-Commit-Id: b36bf0a0fe5d18561dd98eb774ef61dd396edc42
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 76dc2bfc2e1b40573cd33eb1c2027ef6cb7fed6c
Message-Id: <160650755678.29509.3445152395889388583.pr-tracker-bot@kernel.org>
Date: Fri, 27 Nov 2020 20:05:56 +0000
To: Miquel Raynal <miquel.raynal@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201127_150558_762146_D018897E 
X-CRM114-Status: UNSURE (   3.81  )
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Richard Weinberger <richard@nod.at>, linux-kernel@vger.kernel.org,
 Frieder Schrempf <frieder.schrempf@kontron.de>, linux-mtd@lists.infradead.org,
 Linus Torvalds <torvalds@linux-foundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

The pull request you sent on Fri, 27 Nov 2020 19:38:03 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git tags/mtd/fixes-for-5.10-rc6

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/76dc2bfc2e1b40573cd33eb1c2027ef6cb7fed6c

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
