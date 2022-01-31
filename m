Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58370C433EF
	for <linux-mtd@archiver.kernel.org>; Mon, 31 Jan 2022 16:24:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hFhBJ4IRUoiEgVXTvmuubnC4z5zSPUUBlYDDal9FO50=; b=4gzcVfOFtfHRUK
	TR84Dy55g4d+XfbJ68B7c7zcEUP4+Y0irLPDHWYOsKb8YUAY8PfwGCecO9G45SXu2VLtgg0YkqG+3
	5rdcu56q+I9Gn+zJZVx1k147QAcD3hX/JysuBC/kV2lYw5yuQEhD6qNatSIf/29LAf6Co1AoVQ8rd
	nhb8YKix60djjFoeZLzsLqW3VF1uXxAD8aLyTfmFXeuBRB/RBHl1ewUDCD4xsl7svvyQhPSQ9hAWL
	+WGv6MxEtm0XCjUwrnV+fZtOOEFUvulcWrkqArvOIHSoIVT76UK7Jm/Vy2m1qvEgaUiIfvJXos7Zf
	3DqoZbh0iSS455G7UL0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nEZSp-009qId-7i; Mon, 31 Jan 2022 16:23:35 +0000
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nEZRJ-009pkj-4P
 for linux-mtd@lists.infradead.org; Mon, 31 Jan 2022 16:22:03 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 68A316000A;
 Mon, 31 Jan 2022 16:21:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1643646118;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uc1Eq7dd+bPu9eTgNj2Aq3Z1Xxr+klUm263jpDGtk68=;
 b=Gg0TeOXQJ6VmQk0tHOxoqArgGS4C6JTDt44ReRAzEnUMhJbeKYo1KACDUKhgVpikqO5d5r
 FWkVu0Sc2YaxXTYv1n8CpME0mWUvT38sqGBPw9BQF1ZZtQ+BTBQdRYxNDTq8yLkGPLRDT8
 NJaD0i2HVlGNbHVf03waHkQWHfC4g2Rifzz461voOkdBGON+6/YgISg7GcjIpOEImvZ3TC
 BYmDuixNUuS6YgFxYrl46mZngGyUDQJXS9i7OygnvI6iZn0yf2si3EZmdSSuGmXvln5Yo/
 EKMt1XEWHfSWIBQmWJWpGDNJN6LXmhX0KyvwGa/OzqRacjuIolQbHsrkI+XltA==
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
Subject: Re: [PATCH v10 11/13] spi: mxic: Create a helper to ease the start of
 an operation
Date: Mon, 31 Jan 2022 17:21:54 +0100
Message-Id: <20220131162154.23715-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220127091808.1043392-12-miquel.raynal@bootlin.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'b8043fa4e3ee9cfecf25e32d58e676762b9b0a75'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220131_082201_336410_E767A912 
X-CRM114-Status: UNSURE (   6.95  )
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

On Thu, 2022-01-27 at 09:18:06 UTC, Miquel Raynal wrote:
> Create the mxic_spi_mem_prep_op_cfg() helper to provide the content to
> write to the register controlling the next IO command. This helper will
> soon be used by the dirmap implementation and having this code
> factorized out earlier will clarify this addition.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> Reviewed-by: Mark Brown <broonie@kernel.org>
> Link: https://lore.kernel.org/linux-mtd/20220104083631.40776-12-miquel.raynal@bootlin.com

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git spi-mem-ecc.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
