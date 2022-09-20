Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7300EC6FA82
	for <linux-mtd@archiver.kernel.org>; Tue, 20 Sep 2022 08:11:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zVUaGJRf1jkRtcsyxp48axBXt82lOviGApknY5gewzc=; b=gZMh5vtazNUrMs
	mFkmNZaUVy5FQrBokuLy9Lgrn4RgGK1g5B70Opx6CTTTnOrcbOWFxwyx+cwrRmbnZ3SYHCyX1OoDK
	Xx/ykK4JfoLlfULFf+/pzghytH2rp4WJghx5LWKsHN/ueChw9FMjmd7yfGpfWaA0kVc733gR1jNkG
	2GKgOgZBWp8e2qR/T4JXmgTXNX0sQdAJ3at7UHwvjxoloAKJQF9obHXJhLq3OxvoLoqR+O20pGAsm
	fAAFzhjN2733kj6HKCsLAvne2OGVCBMGkwykyWsusGYBXDa1JbX97CEbmdmCp+xIiCxjuxQHk/Pet
	0BH55A+epEZ5zUJ33GUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaYLk-001ddw-Fx; Tue, 20 Sep 2022 08:11:24 +0000
Received: from relay12.mail.gandi.net ([2001:4b98:dc4:8::232])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaYLY-001dUh-Ip
	for linux-mtd@lists.infradead.org; Tue, 20 Sep 2022 08:11:17 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 6037B20000C;
	Tue, 20 Sep 2022 08:11:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1663661466;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=C6HIvGTQ94NzYXeOw7DginZZyHpaS9ym0PLAPepQcbQ=;
	b=VA6kz+d5kqpPydi/8WrQ3OrEqTTrEXyqrumjXaNOfgZe8/uDXIpFUI/v7YvWtSNe8RvNRj
	lc5e2NCftFUp3GVSna/zmAbKGex3UjKgaJA4qLjhAQeDHsSY35YlZp3zOWPdklSs2y317e
	902l0V1roEqt2N1z3fdzKLE/JF/uWSq04TDfQfM/3eQDbl7FdZwpyNNPCPeMJewNm2bfjb
	83dm2VLi60ZZbYOnY8yLNwBisBmcxsb9x1uQURrnZObABJ7IOHLgCgjmN9q91HUy0wAv3J
	FR7VduKJVusiXnAnXRDLzGJaoEaBNuxwddIVRsF+gp/fUT5gwe5AGGR/nUonQw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: "GONG, Ruiqi" <gongruiqi1@huawei.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Naga Sureshkumar Relli <nagasure@xilinx.com>,
	Richard Weinberger <richard@nod.at>,
	"Vignesh Raghavendra" <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	"Wang Weiyang" <wangweiyang2@huawei.com>
Subject: Re: [PATCH] mtd: rawnand: arasan: stop using 0 as NULL pointer
Date: Tue, 20 Sep 2022 10:11:03 +0200
Message-Id: <20220920081103.597363-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220725112108.686347-1-gongruiqi1@huawei.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'dfa196253c57166b2182872e15dee75124066193'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220920_011115_455595_A00E39FA 
X-CRM114-Status: UNSURE (   5.82  )
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

On Mon, 2022-07-25 at 11:21:07 UTC, "GONG, Ruiqi" wrote:
> Fix the following sparse warnings:
> 
> drivers/mtd/nand/raw/arasan-nand-controller.c:918:70: warning: Using plain integer as NULL pointer
> drivers/mtd/nand/raw/arasan-nand-controller.c:918:73: warning: Using plain integer as NULL pointer
> 
> Signed-off-by: GONG, Ruiqi <gongruiqi1@huawei.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
