Return-Path: <SRS0=3nsT=QQ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85093C282C4
	for <linux-mtd@archiver.kernel.org>; Sat,  9 Feb 2019 20:45:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 527C921939
	for <linux-mtd@archiver.kernel.org>; Sat,  9 Feb 2019 20:45:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qzmLyjaI";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="W3CzS/3b"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 527C921939
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KclWreY/p6+2Y+so1+2PqjsDcZsaHzm3rmHOoFeHlGI=; b=qzmLyjaIvYms/N
	Fo+C8QmYjV10XUddxloOb0pvSDAS0AkmD4UpHDFjZtvPqiOe4/9POtYQWsHEFHm8TxaUgS2g3db5j
	Mz+FM6jzvY5oBORHpRkj0iAYRm3UHCDDPmtITIc+XyxEJ/0bUO6fzNSPHglat0/MuGZcf4+EjBYuh
	fzVizd0a0DC/btjpjmkrmJVOTZZXVX8yTIYmcf0EVlsYduOQv5XuPgHVgqdiEa3czrYixY1oNX3Xr
	iSvJIVbtFpV+DVjaCva0OTC6v+WLfKX2l5+IsgytAJcWAM2orBSzpwcYpku2Jk0JIEATbzIX/Ayz7
	n13/kEoPJ4yGyxcH6zyw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gsZUt-0004b4-Da; Sat, 09 Feb 2019 20:45:11 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gsZUq-0003bV-SY
 for linux-mtd@lists.infradead.org; Sat, 09 Feb 2019 20:45:10 +0000
Subject: Re: [GIT PULL] mtd: Fixes for 5.0-rc6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1549745104;
 bh=EVYCy6QS5YVZQv7jZl6zXGGo5jz2PnUNXUN8pSXSt0w=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=W3CzS/3bjRBoqOtKTj5LwJvYWgsePq68ehnJlTEvK77ySiJBXnW3hbyZyh1nvkEVn
 oEgpzxNHvH6mgPWp103ye+HUtus4p9uEQrv0DqjV2/Wo1MJ91DDa6d4KuE4pa/8CfA
 vdSKy6bxC3nwef5ziQ4p4MnW9ZFEuKxldUn6UYP4=
From: pr-tracker-bot@kernel.org
In-Reply-To: <20190209111454.21c8c23b@collabora.com>
References: <20190209111454.21c8c23b@collabora.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20190209111454.21c8c23b@collabora.com>
X-PR-Tracked-Remote: git://git.infradead.org/linux-mtd.git
 tags/mtd/fixes-for-5.0-rc6
X-PR-Tracked-Commit-Id: d5d27fd9826b59979b184ec288e4812abac0e988
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 5610789ad08dacfd96fd684b53d7acd9e628ca20
Message-Id: <154974510394.20101.11534030725064580087.pr-tracker-bot@kernel.org>
Date: Sat, 09 Feb 2019 20:45:03 +0000
To: Boris Brezillon <boris.brezillon@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190209_124508_949834_1F4C419E 
X-CRM114-Status: UNSURE (   2.17  )
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
Cc: Marek Vasut <marex@denx.de>, Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 David Woodhouse <dwmw2@infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Richard Weinberger <richard@nod.at>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Brian Norris <computersforpeace@gmail.com>,
 Linus Torvalds <torvalds@linux-foundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

The pull request you sent on Sat, 9 Feb 2019 11:14:54 +0100:

> git://git.infradead.org/linux-mtd.git tags/mtd/fixes-for-5.0-rc6

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/5610789ad08dacfd96fd684b53d7acd9e628ca20

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
