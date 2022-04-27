Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3FC7C433F5
	for <linux-mtd@archiver.kernel.org>; Wed, 27 Apr 2022 17:32:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Kul98Hu4J0kGXijzidBtTTjwz7qURUM9RryZH6zCVOk=; b=ZGGUhCAwVy8/Kl
	eq99jeeyA5oN4aGcmVL6kqHfbfo4ybqFxlpgGW60hIHKJHBSc+KOHL+hgl3FPAaB74T0GMBw6W1Ug
	rbelSLEsAnOCbBbx6cje9IeTXR4ejFSfjCZxGmzOj0JIETbigkavezD/djJZ7M5FE64e1deze6VZY
	Ezwj+wV40K3540RZtmchD9301VozoEXjMi2FUCR1zvbUX/zuYo9CCjrlUpNFZgxrjiruCFjrIGyxe
	yrQcQpKqBPxpDlp0aTbFXSjmZS0cYr7mr92sCJz/8Kmw5FqcpWx+p+wAsiVJi0aqyVjvKa/FBz4sM
	JWFTHH2TDEMszUR4UEUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1njlWE-002ggX-Nm; Wed, 27 Apr 2022 17:32:03 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1njlMt-002d4u-60
 for linux-mtd@lists.infradead.org; Wed, 27 Apr 2022 17:22:27 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B590161E29;
 Wed, 27 Apr 2022 17:22:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 21038C385A9;
 Wed, 27 Apr 2022 17:22:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1651080141;
 bh=C17umZ80pqXyiS0BNYvHMaWCnzCctB6Ewy43lndyjHk=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=BIxihUk5AmTF3yOpHk3hEC2BRKRdETtmLUJDSWWuAO4Qljx02yuSurPpsTiPBb3rW
 Pan1xF/8JgB2bTQm6MjEDnEBhJudY3UPpqUONc2uWli3idQtU+g4EPL0nZf9WTPkbf
 E0lOE/py+Z/k9gfSx92g0qJIOjpeRKXbDc2KNRGgDxPJmdOwxsNkXZAdhqgFwOBQjZ
 69jn4IzVUPeMGGWjSnE+rXkaf2TF+MLnRIV9Dzm++EsU9Gxg1FWECNsM1loBAWuoWu
 +fH7glqMxRaTm7NHrLTgNwn0ylD417dpKgCs8hhHC5D7PInvOK0fCpeNwu7ZuYcHiH
 LLv+Ct9tq2pEw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 0B41BE8DD67; Wed, 27 Apr 2022 17:22:21 +0000 (UTC)
Subject: Re: [GIT PULL] mtd: Fixes for 5.18-rc5
From: pr-tracker-bot@kernel.org
In-Reply-To: <20220427114222.75209cb3@xps13>
References: <20220427114222.75209cb3@xps13>
X-PR-Tracked-List-Id: Linux MTD discussion mailing list
 <linux-mtd.lists.infradead.org>
X-PR-Tracked-Message-Id: <20220427114222.75209cb3@xps13>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git
 tags/mtd/fixes-for-5.18-rc5
X-PR-Tracked-Commit-Id: ba7542eb2dd5dfc75c457198b88986642e602065
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 03498b7131b874166724ca016178932d0b5781aa
Message-Id: <165108014103.26868.7126308954756150435.pr-tracker-bot@kernel.org>
Date: Wed, 27 Apr 2022 17:22:21 +0000
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 linux-mtd@lists.infradead.org, Richard Weinberger <richard@nod.at>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Michael Walle <michael@walle.cc>, Pratyush Yadav <p.yadav@ti.com>,
 linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220427_102223_320900_46A213BF 
X-CRM114-Status: UNSURE (   5.92  )
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

The pull request you sent on Wed, 27 Apr 2022 11:42:22 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git tags/mtd/fixes-for-5.18-rc5

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/03498b7131b874166724ca016178932d0b5781aa

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
