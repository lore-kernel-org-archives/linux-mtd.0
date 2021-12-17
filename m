Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A6E1C433F5
	for <linux-mtd@archiver.kernel.org>; Fri, 17 Dec 2021 15:55:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=U2Fh3FuuTXnaap7yj9CuIuyR6sWCtRpLlTwDmLOhhl8=; b=0L3euZj0e6k9PV
	BsudlcEqiiJ5E0LjGqWOs/6gPIJ91ir1RVoJvK0S1cmN/6Jho9ywKrUtLSJidep4JIeGPU4JBy6PH
	NBMi0a8DoSYFzEY25OZwhpjEg5oe+NAYcovLuWDPD2h+tdM+oysJjcJJA/2HsjX5uGyT6eioToYrL
	zdbzGdUmXVx6xWNudQowNLC9kb91P5//1zWG8jrue4xNmKqJ61VWHu7+tInzoJuL+XW90DlAddzy8
	7JrWM4E4M1c8dZR465OQpIuR66m0tCvyFEmY7gDP5GRt75ZPUUDDzzts5UB615q2qspSItZdbucvs
	w0Pu/DAJ1n7zmgQ60UYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1myFYt-00B0zZ-Mz; Fri, 17 Dec 2021 15:54:23 +0000
Received: from relay4-d.mail.gandi.net ([217.70.183.196])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1myFXX-00B0Kj-0H
 for linux-mtd@lists.infradead.org; Fri, 17 Dec 2021 15:53:00 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id 37446E0011;
 Fri, 17 Dec 2021 15:52:55 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, Mark Brown <broonie@kernel.org>,
 linux-spi@vger.kernel.org, Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Pratyush Yadav <p.yadav@ti.com>, Michael Walle <michael@walle.cc>,
 linux-mtd@lists.infradead.org, Rob Herring <robh+dt@kernel.org>,
 devicetree@vger.kernel.org
Cc: Julien Su <juliensu@mxic.com.tw>, Jaime Liao <jaimeliao@mxic.com.tw>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v6 15/28] mtd: nand: ecc: Provide a helper to retrieve a
 pilelined engine device
Date: Fri, 17 Dec 2021 16:52:53 +0100
Message-Id: <20211217155253.366111-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20211216111654.238086-16-miquel.raynal@bootlin.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'ba7e581890fc1482eda19ac7b02b7846ba0a7c2e'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211217_075259_223273_9A19D29C 
X-CRM114-Status: UNSURE (   9.68  )
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

On Thu, 2021-12-16 at 11:16:41 UTC, Miquel Raynal wrote:
> In a pipelined engine situation, we might either have the host which
> internally has support for error correction, or have it using an
> external hardware block for this purpose. In the former case, the host
> is also the ECC engine. In the latter case, it is not. In order to get
> the right pointers on the right devices (for example: in order to devm_*
> allocate variables), let's introduce this helper which can safely be
> called by pipelined ECC engines in order to retrieve the right device
> structure.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git spi-mem-ecc.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
