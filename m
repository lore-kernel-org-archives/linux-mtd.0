Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78CD8C54EBE
	for <linux-mtd@archiver.kernel.org>; Fri, 13 Jan 2023 16:37:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qQSkCx0UpJsE+/h5F2YFC+k0bCIz+vnP8yhg6Cg3lOk=; b=i1uGgwD6RgMUYm
	GVMbSKegnz8e1b/9G7MSTGJ3PlYahKFVGYpKaObBpZPgRoWAwn0ScMTrhEfz1bUByQEqnZ0yVvhPJ
	DjXxM1OxmLWAsDj1L0ObdDs1vajCIE0t9etyngghTRpDIgdlCpUQogmzplLR1AA5vCUQM7mFfJRoE
	knMZP9SCLFMkKn/DleWlZUhjO1HqQqCU+8EcYTVgcFuV48wNRekaARjaQEJpVadyAEIDazvoxRBMb
	7uEvGNsbzHm/zT834HVWHMf1WKIyBJj9hRk8nwda5NuEZYX4OwUkI8z1MVwTmSJg3UFLA2r8kqEkM
	uEGcJrCvV7rX38d6ZuOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pGN36-003SPw-Hn; Fri, 13 Jan 2023 16:37:00 +0000
Received: from relay10.mail.gandi.net ([217.70.178.230])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pGN33-003SNi-Dp
	for linux-mtd@lists.infradead.org; Fri, 13 Jan 2023 16:36:58 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 10CAA24000A;
	Fri, 13 Jan 2023 16:36:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1673627809;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kxSZeKeBriIYACw5fqkc+RWacxKu1wFr7laq9sROnMY=;
	b=EeDLDPZj6etJ1tCHdG9UAZ1Ez6DRGKDwrHQZRHiJcpCP+uKsWl6JpAAve2+dkVkpkPmSA/
	H43+gLqEVFRkQ58WBPUj7jS2dlRvymV6MMPqzFlwjics9rk45coZwMuPczEoehwjWRUl8A
	hV3SrhpGtTN8AkuuDqPPklfroaoQORjY9CRfrw8QObg6TRiOIBT0NA1hEneFm38RuTloxu
	hfmozaaBSxC+v5cJJttxZ2vlOsaJm/kN6ABjShcTIC5Et+YE959p4HzzUW/eBLJuQ9lx8/
	FklJ/xKgEzxuFdCZMwhQsKazp3MPwtilzJps7qAphwxU87Ycbnr4Dw4xz+U7TQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Randy Dunlap <rdunlap@infradead.org>,
	linux-kernel@vger.kernel.org
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Stefan Agner <stefan@agner.ch>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-mtd@lists.infradead.org
Subject: Re: [PATCH] mtd: rawnand: vf610_nfc: use regular comments for functions
Date: Fri, 13 Jan 2023 17:36:47 +0100
Message-Id: <20230113163647.1295990-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230113064004.24391-1-rdunlap@infradead.org>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'a2cfa6a24c61bf2178048397f6512ebb15e1ebfe'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230113_083657_620001_D231BA51 
X-CRM114-Status: UNSURE (   7.82  )
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

On Fri, 2023-01-13 at 06:40:04 UTC, Randy Dunlap wrote:
> These comments are not quite in kernel-doc format and they don't need
> to be, so just use "/*" comment markers for them. This prevents these
> kernel-doc warnings:
> 
> drivers/mtd/nand/raw/vf610_nfc.c:210: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
>  * Read accessor for internal SRAM buffer
> drivers/mtd/nand/raw/vf610_nfc.c:245: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
>  * Write accessor for internal SRAM buffer
> 
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Stefan Agner <stefan@agner.ch>
> Cc: Miquel Raynal <miquel.raynal@bootlin.com>
> Cc: Richard Weinberger <richard@nod.at>
> Cc: Vignesh Raghavendra <vigneshr@ti.com>
> Cc: linux-mtd@lists.infradead.org

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
