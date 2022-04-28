Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 386A4C433F5
	for <linux-mtd@archiver.kernel.org>; Thu, 28 Apr 2022 08:19:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RMlcdLx9n7pPn2qSsgQ5JX3UwCeMmZbDIpoHvMLl04o=; b=OA3ojG6q6u78L5
	LRZE14J9Iq73iT2jtPZZ3TVWZrycZSax2k24/lpUQl3DzOlzV/0QJNclNRAICOj073q5gTGQIBkUs
	osqHxqMbeIEmWjjIY14zUwTG8hy7+nAV7XoxelvnNv+OstdKqDLztlFLWn+ci0tfWlawoKzaYNlLp
	YVM2ziJMlgLG4sMUANFAwynHOOz1SQVTmq1b1oo+BRngqPnH0suqebZiNSReOLEGCT8pwjlLIq7Ux
	BNCF8/cj4D3I7bDT1DXhJ80K07arKtyRmt8ntSryy43dwxMipVoALvYN6Zg7Unr4nYUw7QY6FPrUj
	Zm1+D5GDHe1oIS2GqQlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1njzMU-005Svn-7g; Thu, 28 Apr 2022 08:18:54 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1njzMC-005SnG-Jm
 for linux-mtd@lists.infradead.org; Thu, 28 Apr 2022 08:18:42 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 7FDDC2000A;
 Thu, 28 Apr 2022 08:18:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1651133913;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jIjBXRWj+Au1v9tHT04HTsuUjJPpOQTu1sG2khgjNwU=;
 b=GIILmCrQny6g5AHdDfhvoVOygB3GPIURSfOXt1jYTlExhd/v7aENN0dU5+Ksb+yvIHHCJs
 Wn1uhlS9bVYFOOgHesMlXpDFKzxi/EJLQhRCnNji2kEmeEl+mPj4m0kHdoPScg2R0uyaOc
 41M0kg+aJzmBcywcR3arBdXcLDwj4gLs8AtH4dGbeNtSlZjtDX34ol/5s9ILPQoTyS11Ug
 ryj8PdX4UnI/1jh7hsIwLlILXfgyoHlErUnU0DkznWrfY40UYKgTtXjlQrOzW1cXcEsE7+
 vIIbI6JdofUpcS1lOoHbhN2BFXUDOS3uNODMmB5RRzoJOaEVQrjPByESLuxJYQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Tokunori Ikegami <ikegami.t@gmail.com>,
	miquel.raynal@bootlin.com
Cc: richard@nod.at,
	vigneshr@ti.com,
	linux-mtd@lists.infradead.org
Subject: Re: [PATCH v7 4/4] mtd: cfi_cmdset_0002: Rename chip_ready variables
Date: Thu, 28 Apr 2022 10:18:32 +0200
Message-Id: <20220428081832.119944-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220323170458.5608-5-ikegami.t@gmail.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'43823c5c56f247cfc028bf90299f675dd29abf88'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220428_011836_851584_D0DC2719 
X-CRM114-Status: UNSURE (   3.06  )
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

On Wed, 2022-03-23 at 17:04:58 UTC, Tokunori Ikegami wrote:
> Signed-off-by: Tokunori Ikegami <ikegami.t@gmail.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
