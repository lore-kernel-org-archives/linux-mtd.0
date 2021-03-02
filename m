Return-Path: <SRS0=zJhW=IB=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF09FC433DB
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Mar 2021 18:11:23 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AF97C64EC3
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Mar 2021 18:11:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AF97C64EC3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ff3U6YeOmVU7aHaMnK0StvGjHxE2R9wwB/0afFisdRU=; b=bM1VyITGxDkOkiQMlfHkU/p/E
	iYSH74Sj7ExRS7aeOr1ZL8jRwVR4/irvgCAOZtxaEy3WCxS+optlpvx7rblrP9Csp9OySQE/Tm6ae
	4N3h+ZvZhb9dv+PW/PpExQqZfU5FUrleV19UnB13JDk1TJYz+JEC70TQU90/bI3vHYNPAyz8GOyly
	SQBwPdy/4qBL/SBsULjWdSicZwPoWKpDD4ZghQeXkuRz30z1qjzJHjsfSDsDn0c1N21sfEAywrsCM
	t1DBqgZFnBWi0Ayokexr1k+mqVMrZAb91nSuj9DB6yYneUwNn0J4KULyul5TaMu66B0PPLxNHhKJN
	3Dkdud38Q==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lHVwY-005xUX-AR; Wed, 03 Mar 2021 18:09:54 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lHSyo-005GVg-G3
 for linux-mtd@desiato.infradead.org; Wed, 03 Mar 2021 15:00:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=URL8xFs6U9sBR7V8Qmh/KlFFxKXg5nRkComul9botDM=; b=pwFWI/2KOUpe84LFJasUpdm+O9
 zj4AqFItqhzigQJq148guP75foVi2iGmj4/rqRuy6Ty8xO991RhJsCej8WlS56OkGgR+zOW3pQ0l0
 Q9Hdy2irCHqbchf/oR6UconYCK2/I0T5Cc/jxVaYn9i0xKIrCA8aitznHuuk6sX2FdXBkITVYL0a0
 ZLaEmjRRmusW+A5ztoPhAApCnQeqIc8gAQMEkHfJ52hTc415WLLUII4ro4s4CDi/JaFL15yhOPDyM
 fNBCcDP/DXqr7/Tv99+4jmxooO5UfbYNSLfrLHPed3EGrmpJWXPxlozautdbIjiqDSr5cJwA2BxMh
 ewBm+bMA==;
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
 by casper.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lH7x9-00HSCj-DQ
 for linux-mtd@lists.infradead.org; Tue, 02 Mar 2021 16:32:57 +0000
X-Originating-IP: 86.206.8.148
Received: from xps13.stephanxp.local
 (lfbn-tou-1-491-148.w86-206.abo.wanadoo.fr [86.206.8.148])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 33B561BF20C;
 Tue,  2 Mar 2021 16:32:32 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Md Sadre Alam <mdalam@codeaurora.org>, miquel.raynal@bootlin.com,
 mani@kernel.org, boris.brezillon@collabora.com,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: sricharan@codeaurora.org
Subject: Re: [PATCH 2/5] mtd: rawnand: qcom: Add helper to check last code word
Date: Tue,  2 Mar 2021 17:32:31 +0100
Message-Id: <20210302163231.23269-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <1614109141-7531-2-git-send-email-mdalam@codeaurora.org>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: 3fb2eae8c2cfa3bdb45c388e56ce417145e8f7be
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210302_163257_716854_D977319E 
X-CRM114-Status: UNSURE (   5.18  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Tue, 2021-02-23 at 19:38:58 UTC, Md Sadre Alam wrote:
> Add the qcom_nandc_is_last_cw() helper which checks if
> the input cw index is the last one or not.
> 
> Signed-off-by: Md Sadre Alam <mdalam@codeaurora.org>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
