Return-Path: <SRS0=B2Jc=KF=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_NONE,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 506BAC433B4
	for <linux-mtd@archiver.kernel.org>; Mon, 10 May 2021 11:21:57 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CA83360D07
	for <linux-mtd@archiver.kernel.org>; Mon, 10 May 2021 11:21:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CA83360D07
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=CuIwNVRPNVncw9bQbM4zZfeMlCSwAcICOCBgjXRI2rE=; b=NRcp3KQo8fCN5duKVSDkGW/oA
	V9pYIhvi+b1QAi8AEmsxG4V0bKOhdnzBEkEdp+0uAcstCAIVVkSYpfsv46GO5AiouKUeDK/v3MZKB
	oobD9bpA/PW0c6G75UQ21BxYpPmJAPx65ZVa0PaJYqhCW2QB+FAlMp713bQeTkcj/82snPakgAr0L
	SsoiOM5ory1Ay1i3G5qCH1htoCBIiwr9IY3hKOj0Ryrzb2IbOcMinbXPFFmMGytdxKTDihaV5moTt
	GsmOEo3VtO0cdTTAiWMCMBBwtRBfEbO7F+S4rAB9ApVVF8cn+2UsNJHWA/O0E/E+JmD5ZSarYu4wV
	0U5XyI/4g==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lg3x2-00E3rQ-1q; Mon, 10 May 2021 11:19:52 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lg3WB-00E0TX-Bp
 for linux-mtd@desiato.infradead.org; Mon, 10 May 2021 10:52:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=lTohL0XrR9eHawwJY/U5yesduqLJcf8kaKdWNFHH+Lc=; b=xwxtIwy7q41tz2JD/m6f/bNEJg
 fcyVy9oCdNK08Pf1VMnIWhgDXIyZObQhNpnUXJ7GzmHPXe1IbCw/BDR22SpvF1MUTUqVDJWLDkfxL
 Go827r6ad272f+8Z7CFXCfaA3eauXhpGnlv+vf2THCJteAdYZ9C5wKMfE7wPwNkU7UO0p+/F5dPnT
 asd5fEqtUnyIzf7jEMpdeRB15OtxzZ1EGHBR2XAJnQKvxz0pIznvB4qwiTQ5VYZCl1oQmsNSOrgfG
 mF0Kt8S1n/JspPhMr2IEAF/2IzjlhnYpzXhds0+kDyymiPQPJKMdXeNcEKAjGLyxvf9OF2ClwxbmD
 9NV+IjwQ==;
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lg3W8-008ZcJ-Ht
 for linux-mtd@lists.infradead.org; Mon, 10 May 2021 10:52:06 +0000
X-Originating-IP: 90.89.138.59
Received: from xps13.home (lfbn-tou-1-1325-59.w90-89.abo.wanadoo.fr
 [90.89.138.59]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 14FB71C000D;
 Mon, 10 May 2021 10:52:01 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Yoshio Furuyama <ytc-mb-yfuruyama7@kioxia.com>, miquel.raynal@bootlin.com,
 richard@nod.at, vigneshr@ti.com
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] Fix corner case in bad block table handling.
Date: Mon, 10 May 2021 12:52:01 +0200
Message-Id: <20210510105201.12226-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <774a92693f311e7de01e5935e720a179fb1b2468.1616635406.git.ytc-mb-yfuruyama7@kioxia.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'612a421079a7fa3042fd713eb62b455aac1a0e88'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210510_035204_745752_163AAF85 
X-CRM114-Status: UNSURE (   7.42  )
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

On Tue, 2021-04-06 at 01:47:08 UTC, Yoshio Furuyama wrote:
> From: "Doyle, Patrick" <pdoyle@irobot.com>
> 
> In the unlikely event that both blocks 10 and 11 are marked as bad (on a
> 32 bit machine), then the process of marking block 10 as bad stomps on
> cached entry for block 11.  There are (of course) other examples.
> 
> Signed-off-by: Patrick Doyle <pdoyle@irobot.com>
> Reviewed-by: Richard Weinberger <richard@nod.at>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
