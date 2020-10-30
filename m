Return-Path: <SRS0=OfxJ=EF=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16EBBC00A89
	for <linux-mtd@archiver.kernel.org>; Fri, 30 Oct 2020 17:28:10 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8070F20756
	for <linux-mtd@archiver.kernel.org>; Fri, 30 Oct 2020 17:28:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="2PY437Qi"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8070F20756
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:To:From:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8M1E6mnbWTeEpwYJMbdhev2iLns/iV1hBChM7RE9beI=; b=2PY437Qi5TpM74ebzKl2DVUQoD
	UzmdtGBOTb1aNL80MPKJj63uh+IAI92sWkPvnX82/iJIqo8VOpdIna0+A3Hr5OEULmr/Jx+Rs8sdg
	sg4i7CNp+cdSBjTYVF5l6Tpss4x59a2t0oAYNDpRks7tXWeYUnplB9XsmWCo/BpHUwDr/bCWSPDB0
	AsyN2Y9SE/BzWnZD+IRwVeKNA99QvyjoE+1tH8dDo/pSwx3uEm4praWnrpzUTuarijdSX4mq8a7nB
	xPS8XI/nA0dT0ei9ZdQZuyU97/xpB7shmj/EnuPlDhv9fIsjpJTPFGCNup6Hi046PGV8lbim4ww8E
	lfOMvDRw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kYYBb-0004vj-I2; Fri, 30 Oct 2020 17:27:36 +0000
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kYYBX-0004tz-9Y
 for linux-mtd@lists.infradead.org; Fri, 30 Oct 2020 17:27:32 +0000
X-Originating-IP: 91.224.148.103
Received: from localhost.localdomain (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id B3F111BF208;
 Fri, 30 Oct 2020 17:27:26 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Kathiravan T <kathirav@codeaurora.org>, agross@kernel.org,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 robh+dt@kernel.org, sivaprak@codeaurora.org, peter.ujfalusi@ti.com,
 boris.brezillon@collabora.com, linux-arm-msm@vger.kernel.org,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] mtd: rawnand: qcom: Support for IPQ6018 QPIC NAND
 controller
Date: Fri, 30 Oct 2020 18:27:25 +0100
Message-Id: <20201030172725.29166-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <1602566124-13456-3-git-send-email-kathirav@codeaurora.org>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: 0704639af3af3599712d2a2ef8772116d6b75b98
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201030_132731_605894_334D2A39 
X-CRM114-Status: UNSURE (   7.72  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Tue, 2020-10-13 at 05:15:23 UTC, Kathiravan T wrote:
> Add the compatible string for IPQ6018 QPIC NAND controller
> version 1.5.0. It's properties are same as IPQ8074, so reuse
> the same.
> 
> Signed-off-by: Kathiravan T <kathirav@codeaurora.org>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
