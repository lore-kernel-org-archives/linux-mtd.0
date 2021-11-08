Return-Path: <SRS0=0QAq=P3=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26282C433EF
	for <linux-mtd@archiver.kernel.org>; Mon,  8 Nov 2021 20:28:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C7444619F7
	for <linux-mtd@archiver.kernel.org>; Mon,  8 Nov 2021 20:28:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C7444619F7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PUOXfQYjgXwOt00frTNK8+k2vLoK+eaucNvEr/zYtRM=; b=iilgp3fzXpRllK
	6IwpuBADAlWrPxDucHKJ6o9Xyx6WNz2YBvZdd5h1wDQoZ7O+ZDgS6eybWCjYKxcmrDEuHcPdPlJKe
	LkqvVqP/0UpxG2EUssDGewBcW6A8RnNVOW/sF8QO4MVZ/T/qDOJoGriOBnC0QDOvdZB+EOF2TuGts
	/7envAZt2LZea7c00Gta/UTAUTpsnOcTe7szG8LzAhlk3QvLfIA0GMy+MuOTf5ZwJg8ewoGwhU7GU
	ZPJ39au56/9qOXTN1o+gzpRK1vEKdwt91qAOYjttxVbJ5xTQhqGH6W5dQcD6w38JExQZrnU1jnK+L
	dpm+uudC9eXsZ22m8LZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mkBEn-00HOcX-O3; Mon, 08 Nov 2021 20:27:29 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mkBEl-00HOcB-2n
 for linux-mtd@lists.infradead.org; Mon, 08 Nov 2021 20:27:28 +0000
Received: by mail.kernel.org (Postfix) with ESMTPS id A362B6105A;
 Mon,  8 Nov 2021 20:27:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1636403246;
 bh=uPNWUM+URW9zcvHvHAIYdAfuwwvSLrAVtDzplGUPQcM=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=pIfIV3mXsKra33o018op71CMq5kFgoS0NUNMVLIxJcmeLRzYtZlC8C45x2Vz2relH
 I9Azle11LXo7hd7o0goLqOPlXLwHs0xNeLcHSAxX5rDqvDRyQBpWbzj2Et3vKufOp4
 nWKJFfpGlWa2Ge6gNhoYcylihNrzjhb633b72/zXexbkPh1bMkVTp7SpkorinI/sIv
 W2dJrVCLpGJdzy1BipFNgQFwuSbB1gctbMw4fVAnVXyDOl303GVuh+hpAGCiUdv029
 RHc1kQ8hgPU/vGphm0N/KFa0xZgolE/duMVYi1TxwfVmwpMj/2h+LQ2yy0Fqd524uo
 2RYA0Ml4hOLGw==
Subject: Re: [GIT PULL] mtd: Changes for 5.16
From: pr-tracker-bot@kernel.org
In-Reply-To: <20211107174555.2d1a5eec@xps13>
References: <20211107174555.2d1a5eec@xps13>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20211107174555.2d1a5eec@xps13>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/next
X-PR-Tracked-Commit-Id: e269d7caf9e0dbd95fac9991991298f74930c2c0
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 206825f50f908771934e1fba2bfc2e1f1138b36a
Message-Id: <163640324662.16718.15799257448358750653.pr-tracker-bot@kernel.org>
Date: Mon, 08 Nov 2021 20:27:26 +0000
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 linux-mtd@lists.infradead.org, Richard Weinberger <richard@nod.at>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211108_122727_161621_9F46469C 
X-CRM114-Status: UNSURE (   3.96  )
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

The pull request you sent on Sun, 7 Nov 2021 17:45:55 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/next

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/206825f50f908771934e1fba2bfc2e1f1138b36a

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
