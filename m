Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41A73C54EAA
	for <linux-mtd@archiver.kernel.org>; Mon, 30 Jan 2023 16:18:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TVkpTAr5QAV5Z90jJu9I1bkTL3whoXJc7KJTg7yu3Fw=; b=4EmQjxMolnrwIP
	V6HYrzv4LwTB1Y6RysvGOtYay5XDpD7jOawlep2svcznPu4gTq03ft7syN3Jsx9FbqGqLCofj/kNg
	uxjk2VJeKwWVCudXT0oqZluL2JrgRlyKplwAuzkzcBc8DYHUAwLKlnhyDCZtlpfPnjfF56Sg3G+fq
	tdy/TEx1rnRdAp2sPBdfSlA/14Or71DFufOxxlISbawOPGMfk1UBez7PjGj9e9kaVOupLNDg6V7oO
	I3s44JmV8iTkQ0O2zpQ2zEtOwS9FkE3MoNXWNF3Gfzc+V4NdTN2tCCOvmpowmECnVVED/b1aFWGTE
	DFi8f3psAoQU6af4mYdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMWqb-004CRY-Gt; Mon, 30 Jan 2023 16:17:33 +0000
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMWpt-004COs-ER
	for linux-mtd@lists.infradead.org; Mon, 30 Jan 2023 16:16:51 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id A61321BF20A;
	Mon, 30 Jan 2023 16:16:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1675095405;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yU0KalkkaSGmohCctzUkrKh2rmd30gHYRT0RM8SE8wI=;
	b=aFTVU11xEZYgQpiEvdymYr6VldjZGj38DXwF8Eltfyy8toENh+L4uJDngb4e3QNF3G/QlG
	0iPEJeQY8BtLIoplQyWo3Lo9I9sGQbkFmf5WHnQNJlhp04cNbQ5eBCCNxrN8tSKHjkJ+1Z
	h71yWlcFq2NaU0yhKUlR8X9ca0rxbG4tBxSvzKkMUoU35Pp9O6KE1oy2saqqEW9ujYpIj1
	kcS07e/ie5Tp6tsDNg6bJ8Dz2ohg5tulqLV6DHLK1iRGaLswRp2oI+y0UTSf2w/uTnhZD2
	9ChsrlzPUl/6gpiLZcFZ/G4NyIg+LKHdd/Fj/GUq7CujsmpTpGHhM1Qs+FuNIg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Mario Kicherer <dev@kicherer.org>,
	linux-mtd@lists.infradead.org
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	richard@nod.at,
	vigneshr@ti.com,
	Dhruva Gole <d-gole@ti.com>
Subject: Re: [PATCH v4] mtd: spinand: Add support for AllianceMemory AS5F34G04SND
Date: Mon, 30 Jan 2023 17:16:43 +0100
Message-Id: <20230130161643.117898-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230126144050.2656358-1-dev@kicherer.org>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'724ef01569519d1e7a95231688b6a5f8eaba29f2'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230130_081649_656627_611367C5 
X-CRM114-Status: UNSURE (   6.20  )
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

On Thu, 2023-01-26 at 14:40:50 UTC, Mario Kicherer wrote:
> Add support for AllianceMemory AS5F34G04SND SPI NAND flash
> 
> Datasheet:
> - https://www.alliancememory.com/wp-content/uploads/pdf/flash/AllianceMemory_SPI_NAND_Flash_July2020_Rev1.0.pdf
> 
> Signed-off-by: Mario Kicherer <dev@kicherer.org>
> Reviewed-by: Dhruva Gole <d-gole@ti.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
