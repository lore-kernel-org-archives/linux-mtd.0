Return-Path: <SRS0=zJhW=IB=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 157D8C433DB
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Mar 2021 19:48:41 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9200364EBA
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Mar 2021 19:48:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9200364EBA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=rQklIm9uT45R2BPiMqqdLQ/3hEUPSstp28l4aM3EOuk=; b=FZpbTAYx7aByfSKxpZ+rexDEr
	BurPcBiiNHeN6mLgAuiPBl3C6nm7U0kwqRAo3SsI7TUi/Egt9yGlWW0f6rgpsbcX34NysBwug0WZf
	zlxm8QBrL1P8H+JNtsAv5i0Us96AgpSnvUx7lfmi+vWERQE+TNmasltNBRj12OY+bxI2rL74AoaMi
	EwyGewNZRY+pApaOckkTJWrkri0nmL62bUJlbOHyFGu0ZHgMpn3l2yeR6ifvTC94NFztpD1KYhPx7
	ve1BEpcIQ0iBSP7sEQIR6VhZ4hQJePVoQlymeTYB8r07rR1mHr57V4StL7idujU5ViSBaMQwRosyp
	ZOHNPwZ1A==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lHXTK-006Hij-Ml; Wed, 03 Mar 2021 19:47:51 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lHT4N-005ILi-3f
 for linux-mtd@desiato.infradead.org; Wed, 03 Mar 2021 15:05:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=UEu5+BeFGLuO68bs/zS9e7uDBymDkxQwjIlgI/hqtIU=; b=Qryx+Cii8nUABC78UOTHOIzZV2
 z3SFa3PQHFb+9tsMw7JHcklwajrQ1KExBGKQEfiYGLK4FoQkNZR5xT9aW5AJFzya/ilhpf/0RQpAU
 SmoOcJrZkol1HahAE0YqWcNNpuLK/jGUpBdiSNgT1SgJYRxZwdJ6I1Fo1yPrySgjJnBTJYdcuXmwm
 amiR9NNSyXoWSxxl2rSnsljRO/5zlsL7UnrHgSCQ0GAiWRxpc7SlFqZVAJHgfKkEMDYQmL4bYFHMg
 QH/IW8u0fYWNFkV7MW9NlBMLGp7f5An3TN8xvSI7KMUYowUI44eAZ5f/VuSFigm4OdOoWCVQ5yuXU
 T/ZKpbxQ==;
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
 by casper.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lH8bD-00HW8Q-GE
 for linux-mtd@lists.infradead.org; Tue, 02 Mar 2021 17:14:24 +0000
X-Originating-IP: 86.206.8.148
Received: from xps13.stephanxp.local
 (lfbn-tou-1-491-148.w86-206.abo.wanadoo.fr [86.206.8.148])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id AA0B11BF206;
 Tue,  2 Mar 2021 17:13:55 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Alexander A Sverdlin <alexander.sverdlin@nokia.com>,
 linux-mtd@lists.infradead.org
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] mtd: char: Get rid of Big MTD Lock
Date: Tue,  2 Mar 2021 18:13:55 +0100
Message-Id: <20210302171355.1019-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210217211845.43364-2-alexander.sverdlin@nokia.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: 91b44238312bcba66e53eef10a279ebeff592dbf
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210302_171424_176991_F5F1E99E 
X-CRM114-Status: UNSURE (   6.32  )
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

On Wed, 2021-02-17 at 21:18:45 UTC, Alexander A Sverdlin wrote:
> From: Alexander Sverdlin <alexander.sverdlin@nokia.com>
> 
> Get rid of central chrdev MTD lock, which prevents simultaneous operations
> on completely independent physical MTD chips. Replace it with newly
> introduced per-master mutex.
> 
> Signed-off-by: Alexander Sverdlin <alexander.sverdlin@nokia.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
