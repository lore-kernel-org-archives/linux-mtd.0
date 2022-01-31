Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 461B6C433EF
	for <linux-mtd@archiver.kernel.org>; Mon, 31 Jan 2022 16:34:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Rnob4hJaTWOImTI06xmLWiudQZ26GFYJbcm50sIORqw=; b=jWnBbXgj5Fa8OZ
	8TKktap0D2s0PqhjGmxUrD/A/dYLVwnge2xOjggar6HUgVBqeyRqkDwdvNMP7Lbk9KdYeVYvFbHEd
	dJns3yam/D9OP16DquIeyD4MJw8rnurpsFpFOSS6E5uSXiZwctta3maZvR8x+F34zRLqAGAGvGC8V
	YrT1xx64FtRFW/QsqNalvbMo+66X3DVzICJebk2w54Ai85VhFO1ApzsvoH5AxzBZwroDNI4zPGyUU
	xeWhSFHNnQwyYTELJx1vNLXBkCHttSiaGWzZf3NJvD97V4uVpqI+hQPaS0zsPmt2HPEDP3Wv5K7QG
	e5zicQoQb/265sHIUpSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nEZcS-009sdh-B8; Mon, 31 Jan 2022 16:33:32 +0000
Received: from relay12.mail.gandi.net ([217.70.178.232])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nEZRz-009pzJ-Lv
 for linux-mtd@lists.infradead.org; Mon, 31 Jan 2022 16:22:45 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id 930C320000D;
 Mon, 31 Jan 2022 16:22:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1643646162;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UewgNsUTa79blJ++wbDOmKq0qNSUJEnPr+Q2Dtcr9gM=;
 b=o4/PkSK8xlwr9ppeXgaWVwd1Xx4euBvPJGk8dy2OrlN9e6w9U3UfHDXKnRD6WmALsASMpx
 TFPjLJfddfCWSNsgZUbS/MmzEqJOYLRcIUoPifpN6Lwpnn1urTlB+cyy+VWPYEWauLwPqi
 SapXGvkhEsSs259pS6/M1P7wlpoSHdO1aVJgZ0bOPKbnl+WxMqrIe5uw6BrbK1olgiepY9
 VJRpaHBJpJuUwxmEEOduP9jsQDTlouDopc/D1mXsOmeez8FvjiMOZUR7WasasLxt7HYfiS
 jN4/4Svlg3GjY8FR1fNxrU3D3uwHR1aEp2MAL+21fKrAMuJUjoWvWHrISOjnVg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, Mark Brown <broonie@kernel.org>,
 linux-spi@vger.kernel.org
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Pratyush Yadav <p.yadav@ti.com>, Michael Walle <michael@walle.cc>,
 linux-mtd@lists.infradead.org,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Julien Su <juliensu@mxic.com.tw>, Jaime Liao <jaimeliao@mxic.com.tw>
Subject: Re: [PATCH v10 03/13] spi: cadence-quadspi: Provide a capability
 structure
Date: Mon, 31 Jan 2022 17:22:40 +0100
Message-Id: <20220131162240.24235-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220127091808.1043392-4-miquel.raynal@bootlin.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'd841578469634013248cc793a3d041342778d07e'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220131_082243_898469_68682BDA 
X-CRM114-Status: UNSURE (   8.51  )
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

On Thu, 2022-01-27 at 09:17:58 UTC, Miquel Raynal wrote:
> This controller has DTR support, so advertize it with a capability now
> that the spi-controller structure contains this new field. This will
> later be used by the core to discriminate whether an operation is
> supported or not, in a more generic way than having different helpers.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> Reviewed-by: Pratyush Yadav <p.yadav@ti.com>
> Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
> Link: https://lore.kernel.org/linux-mtd/20220104083631.40776-4-miquel.raynal@bootlin.com

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git spi-mem-ecc.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
