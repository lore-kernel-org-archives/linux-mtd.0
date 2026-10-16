Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47FA6CCA46D
	for <linux-mtd@archiver.kernel.org>; Fri, 16 Oct 2026 06:41:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=or8fdoLZZ+J2qP6zHrrzaseI5IrdbDjhbVQc2CISnJM=; b=4gmJZDbJiDmpRu
	zKDO9CNhD/TwdyHBW1gJTB4F1vyG57yuKGu9gv9ALg2w1jxlvLukTY3XNswrOH+L0CcYDXpoSJUaH
	NFij5Kt51KGKJM7Kvzo6jgPL75HTGOJGCu50lI9eYVbnKzMfwZPVKjGdgdWxQ8e+NCDkww4yCG5xi
	9VXWilGdXYCseB68e0dvMb2lIoAF157GE4Y5SaQYU/gXK6LhFnIojYK532SPtJ5UDx8tKe22Lzp/C
	Ps8moHgCtF1Aw0ytJRrOVtT5qbASG72bEOBI8ltS/pEi9IJu6wuqrAzffC5hH4gxEYUCfCZFWWOdf
	wRcbybfXsBdUi8ac3bzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHbdG-000000028ou-3d9z;
	Fri, 16 Oct 2026 06:41:34 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHbdE-000000028o9-42hG
	for linux-mtd@lists.infradead.org;
	Fri, 16 Oct 2026 06:41:32 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 86CC142CBF;
	Fri, 16 Oct 2026 06:41:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9823A1F000C5;
	Fri, 16 Oct 2026 06:41:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792132892;
	bh=TuTQOSuTkKq45lRXM4loOoRWaAqprlIEgvLlkpt8on8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=PPRr3b0cSD5zqpgRVQHzjZwE5jejcP9MmWs7+bzNj/rbpCUnSgwHaRj/ZKul16wwb
	 tTjlfdcMGLlg5pC/m9KMGJrdkPMvcmi7QBUucRxsiW7jdRWVhVeFwZ4j5cc5HYwvpS
	 Lqi94ZmGDwwFckP63xCddrgoJLup0+FHfPKg5Ifb63FXzbyADJ3QM7rBk/TQYm54by
	 JOuvukrDjZI02TcIIYugcliG1McoNUnMALrdLliI2SX9+S00wwB0yLdIgnvkAWgH0u
	 K7uBwtnwmW0Wdaa5Rb/Y8J8EhVMW3M0O0+A/2sl+tZFkZSwAhvXbFKfLotFuIOdtd8
	 5C9PxQVQbCjjA==
From: Michael Walle <mwalle@kernel.org>
To: Pratyush Yadav <pratyush@kernel.org>, 
 Takahiro Kuwano <takahiro.kuwano@infineon.com>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Arnd Bergmann <arnd@arndb.de>, David Laight <david.laight.linux@gmail.com>, 
 Michael Walle <mwalle@kernel.org>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261015113209.975641-1-mwalle@kernel.org>
References: <20261015113209.975641-1-mwalle@kernel.org>
Subject: Re: [PATCH v2] mtd: spi-nor: sfdp: reduce stack usage in
 spi_nor_parse_sfdp()
Message-Id: <179213289035.1140554.7029307612793893706.b4-ty@b4>
Date: Fri, 16 Oct 2026 08:41:30 +0200
MIME-Version: 1.0
X-Mailer: b4 0.16.0
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


On Thu, 15 Oct 2026 13:31:52 +0200, Michael Walle wrote:
> Two large spi_nor_flash_parameter structures on a function stack
> are really too much, and this can exceed an otherwise reasonable
> frame limit:
> 
> drivers/mtd/spi-nor/sfdp.c: In function 'spi_nor_parse_sfdp':
> drivers/mtd/spi-nor/sfdp.c:1717:1: error: the frame size of 1600 bytes is larger than 1536 bytes [-Werror=frame-larger-than=]
> 
> [...]

Applied, thanks!

[1/1] mtd: spi-nor: sfdp: reduce stack usage in spi_nor_parse_sfdp()
      commit: d7040c620d8b22f839af7750860b96e39cc58b7c

Best regards,
-- 
Michael Walle <mwalle@kernel.org>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
