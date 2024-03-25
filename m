Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AA38C54E64
	for <linux-mtd@archiver.kernel.org>; Mon, 25 Mar 2024 10:19:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8W/d2dWCJYGRCHefssqP8aZ/xwGaJrceG8Dx9U1MqwA=; b=acFt2zfYE0tK8n
	wDlUyp3LkoGHWyK3xb/7o/undVYkdH6VKLmt+gmzYxV/+7lQ/v9xL/UFJ3eig+BhwdoZzpBeMvuzH
	LWdIREaNI51fQiat9ou2ekv89Iexlz9fuylN/vFWenzQCAdvT/IFZqPxKeRdSxEjnJoly2UvBxrlY
	2QG2Hr39crZYRxMPiC9VOoD6/fy0a84Hjn2cS5P3O5Mcx3aPm+4Iglxw+FQERINFLOQ0xuGvAlWuC
	tbhJyeSyA+mGmif0mxdAZxE5yU5QGt+V2ijNDvTVixobdj4mGcTVgI4ouHJ2RqtCr3QibGaVlCJ+E
	VaCuCgU+FNcvl+jIR4/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rohQL-0000000Gho2-4483;
	Mon, 25 Mar 2024 10:19:26 +0000
Received: from relay5-d.mail.gandi.net ([2001:4b98:dc4:8::225])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rohQ7-0000000Gha4-3xyW
	for linux-mtd@lists.infradead.org;
	Mon, 25 Mar 2024 10:19:22 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 957731C000B;
	Mon, 25 Mar 2024 10:19:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1711361947;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YfyfSJVpatiwJ7IL85VnWJ1RNscN5N99xsF1+nRqgf0=;
	b=hRlXOVOx6NLWO4g27MFkDxgGUOInNR6JItdfvD98tGzNImHNO94aHnxs86XSPGYObcoxyX
	+E+aQV+u3FniTQh71nuVyJ2mzP3oh1sT9QhAqHWChVPPXFYWaCvfPfAtQttqF1K2R8eOAN
	QJfkbcgZ7u3Ao4r3B0bz2n4korQLQs/nJk2FTMVAUk/lRi8gl/a5WyI8sm7QD6QlaYfVQm
	hzA9HJxLJt8KU3UzWKpOaXUpGBWPzytFQCwirgcSCCFehAyjra16bkC3Pt8eibU65FFgkI
	z7zU0veQSYWpwgTxSlpDnCeKZ32NPlzUUY1XXHSSa0m5G65ly6u9/z/CN0xCvw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Bastien Curutchet <bastien.curutchet@bootlin.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	herver.codina@bootlin.com,
	christophercordahi@nanometrics.ca
Subject: Re: [PATCH 1/1] mtd: rawnand: davinci: Add dummy read after sending command
Date: Mon, 25 Mar 2024 11:19:03 +0100
Message-Id: <20240325101904.262591-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240308074609.9056-1-bastien.curutchet@bootlin.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'31e6bb6787e730ddedf5cc9b90863c5ff438ead7'
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240325_031912_455178_C045D9AD 
X-CRM114-Status: GOOD (  19.55  )
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

On Fri, 2024-03-08 at 07:46:09 UTC, Bastien Curutchet wrote:
> Sometimes, writes fail because the tWB_max is not correctly observed
> after sending PAGEPROG. It leads to the R/B pin to be read as in
> the "ready" state right after sending the command, thus preventing the
> normal tPROG delay to be actually observed. This happens because the
> ndelay() that waits for tWB_max starts before the command reaches the
> NAND chip.
> 
> Add a dummy read when a delay is requested at the end of the executed
> instruction to make sure that the sent command is received by the NAND
> before starting the short ndelay() (<1us but rounded up to 1us in
> practice). This read is done on the control register area because
> doing it on the Async Data area would change the NAND's RE pin state.
> This is not perfect as the two areas are behind two different
> devm_ioremap_resource() and could possibly be located on different
> interconnects (I did not find more details). This means either the
> additional latency due to the load operation is enough impacting, or it
> has the expected behavior of ensuring the write has been received.
> 
> This has been tested on two platforms designed off of the
> DAVINCI/OMAP-L138. The first uses a Toshiba NAND Flash (TC58NYG2S3EBAI5),
> the other a Macronix one (MX30UF4G18AC).
> 
> Signed-off-by: Bastien Curutchet <bastien.curutchet@bootlin.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
