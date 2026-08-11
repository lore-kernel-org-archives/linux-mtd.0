Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EB40C5B56A
	for <linux-mtd@archiver.kernel.org>; Tue, 11 Aug 2026 16:14:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=1irOfN15/knlUUWcgNTQLZfGVTUxz7c124LEw1mRNiw=; b=ApgFYHSgoVpaEb
	UhlbFXf8SEFBeh0ZV947+J5Ssyv4O8zkNThyMYhbzNKOdn6dpbPywkBC/UZyfSnJm6LX2BPGys+FM
	HYe3eUqd5EA7F0hmU+MQ1CphoKZtmRMW3/Mmtl0pKim6xu9Bo+pNeJ+nNQP3izETfmaGn06FfF/Ux
	bxUeLK9fa7OhiIXDnGNDvi39F/4+XhwvPFyxy3557pvSKemlUuA+wBS70ipioWGLEJx0k6Ohg7V74
	5CV7MC0G75evsMXxBc0mhYGwezmoKkdoUVgj3MtGaIc0hgpmVCXjnbT4deFP66NSoiLNnKy42Haah
	VJz8btHo0s6qVMNMAt/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtp76-0000000ESN9-1XmV;
	Tue, 11 Aug 2026 16:14:04 +0000
Received: from mail.fris.de ([116.203.77.234])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtp72-0000000ESIj-0dTf
	for linux-mtd@lists.infradead.org;
	Tue, 11 Aug 2026 16:14:02 +0000
From: Frieder Schrempf <frieder@fris.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fris.de; s=mail;
	t=1786464833;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=jmf1SJruZQUuZ/Dccv6+duhLwslNSx4256rGf8s5+3o=;
	b=WRyuk2l6PDg6L0PyCxPWp1G3BRPQbVklwyf1wfRc+43bTvWu5r1lHkomqU9wutlHh//Qpl
	7DpQMVjM+CGAm2oH+gzs5oGdlUl9sjKQ22v/NPJt7/sRXTqW4uEQEA/CJYpkUMU9Pu39h8
	pFOhDJ5Vy3HUt5EgG8fv6zZ+RggHtM6Y61IekVcHWQ7CdE+leNZziH+CtLR9upJHCOeJIq
	nIqa/jl7+hpx3HR/mRThI8rL9a5H3pDwRVTNTz2NfruZp0Wmjl3LDXy/tSj6RuZrDyMWIe
	y87YdmgoELKRXV41AR0wFLziMsmcZnb0wmS0DtK9b6ZXXAuO0qgzCXpDxomqEg==
To: linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: Frieder Schrempf <frieder.schrempf@kontron.de>,
	stable@vger.kernel.org,
	Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>,
	David LaPorte <dalaport@amazon.com>,
	Gabor Juhos <j4g8y7@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Sasha Levin <sashal@kernel.org>
Subject: [PATCH 6.12.y 0/3] Backport fixes for SPI NAND on i.MX6UL
Date: Tue, 11 Aug 2026 18:13:35 +0200
Message-ID: <20260811161342.533280-1-frieder@fris.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260811_091400_340353_0AFB211B 
X-CRM114-Status: UNSURE (   5.86  )
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

From: Frieder Schrempf <frieder.schrempf@kontron.de>

There are failures with our Kontron i.MX6UL boards using Macronix SPI NAND
chips on i.MX6UL that originate in the introduction of the continuous read
feature in 6.12 (631cfdd0520d19b7f4fc13b834fd9c8b46c6dbac) and the absence
of later fixes introduced in 6.18 that were never backported.

This series contains these fixes picked from mainline, applying to stable 6.12
cleanly.

Cc: stable@vger.kernel.org
Cc: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: linux-mtd@lists.infradead.org

Mikhail Kshevetskiy (3):
  mtd: spinand: fix direct mapping creation sizes
  mtd: spinand: try a regular dirmap if creating a dirmap for continuous
    reading fails
  mtd: spinand: repeat reading in regular mode if continuous reading
    fails

 drivers/mtd/nand/spi/core.c | 74 +++++++++++++++++++++++++++++--------
 1 file changed, 59 insertions(+), 15 deletions(-)

-- 
2.55.0

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
