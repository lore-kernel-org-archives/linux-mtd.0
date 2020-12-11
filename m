Return-Path: <SRS0=argm=FP=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BFD5C4361B
	for <linux-mtd@archiver.kernel.org>; Fri, 11 Dec 2020 22:36:16 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A538023E20
	for <linux-mtd@archiver.kernel.org>; Fri, 11 Dec 2020 22:36:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A538023E20
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Date:Message-Id:References:In-Reply-To:From:
	Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sZY7oG3wSP3Sr1/WfZhbzh6vkkYECc7uOiJph4if6ms=; b=VnQH4g3XvC40bmRHsLWm5AtReZ
	7JKV+gEbUqzkUGTUdgrMOC4bvlEezIJGKSNIsnJdOxwct3oCydgv8VotEQznOJnLJnrswJHNef5P6
	t4uoerOXs1jPqUrulXbb7N4PrSMOV0tB3nNr0wO9Y7joyV1KNE4DBmnR7V+omeef4UgMSgLSa/5qO
	ZIhEj7xJ1T0lNhSTO5z8ridQi2R6AFR8R8JfwGCh9xDASbbx8WGssR3LuySeQBXrPOp1vL9DfUAvj
	MR1HYOxCNZFymLcX5lWK6ZhCz1328b7cLTtiBPHY24p/z/nY1DTLXaqvfhYxwkO9iePdNoDFptSPa
	X+J0ZEuw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1knr0T-0003g5-UZ; Fri, 11 Dec 2020 22:35:21 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1knr0O-0003fi-0m
 for linux-mtd@lists.infradead.org; Fri, 11 Dec 2020 22:35:16 +0000
Subject: Re: [GIT PULL] mtd: Changes for 5.10 final
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1607726114;
 bh=5mQx4kuCD393D6xaTGljqcDcepxu79OzrjUZlOH6PyQ=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=SucQX2u+VNOwsj5lp04Kyoj/Tsay0WGE/rqDAxl24WVwfUo+CCMKSJdJtYFbiW8Dg
 e22V8VcU9ZswO/l6hcrvC1jL0QhFY+/ETs5E6lDJS4ETABt+XnhgFRPfKUcWI+hAoJ
 EjIZOqOV5III4XJ00cGLU9w+8f2XAPgJ/gmyxJX1pNxHfBdXsSmpeL+Tj4iJXQUYip
 yO/IAOVXogY6UNEjoo/DSs8onu7K+g0FyTbr0PpUTQENdoEx9JATUC8zfUWNSWLbyn
 2vRb8eHNNkuA2WiH42jUsqfzzKxyJh70MpHmc0TtAku36Eo6fuNbQbv2ddu3Ixj2Ds
 uxTGeu8QCiJLg==
From: pr-tracker-bot@kernel.org
In-Reply-To: <20201211201356.62c54b3f@xps13>
References: <20201211201356.62c54b3f@xps13>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20201211201356.62c54b3f@xps13>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git
 tags/mtd/fixes-for-5.10-rc8
X-PR-Tracked-Commit-Id: 33d974e76e21e9da8a36b14d2dce6394c36c3e30
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 7f376f1917d7461e05b648983e8d2aea9d0712b2
Message-Id: <160772611424.9549.3478486283482241544.pr-tracker-bot@kernel.org>
Date: Fri, 11 Dec 2020 22:35:14 +0000
To: Miquel Raynal <miquel.raynal@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201211_173516_130438_3ACA1785 
X-CRM114-Status: UNSURE (   3.60  )
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

The pull request you sent on Fri, 11 Dec 2020 20:13:56 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git tags/mtd/fixes-for-5.10-rc8

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/7f376f1917d7461e05b648983e8d2aea9d0712b2

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
