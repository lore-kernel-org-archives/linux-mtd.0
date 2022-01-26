Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA034C28CF5
	for <linux-mtd@archiver.kernel.org>; Wed, 26 Jan 2022 10:56:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ii8r/YAdqhLzr6vLvF35l+TiXU/ynkHM9na+PH0ry1I=; b=Bme9La31HRE/ox
	rX/fWlR6mD1SiH5KdjY2/Mo7pDud5qOjqJ/B5DHYMA4mv8XQwLX7z9iBUoHvEOfyOOkyurNlpQSPp
	SYNTRxnfa9ikIkecxpGrGzncZE28z5Joj6yDTW6CjYXT1K2m86kk/BR2aWTAmb7/Cehcre+9tJe3u
	/rtTOtCjKrDZVl8x/vmtPfyK4qcUVF6GpaOX43mOg2WjRwRqq/55R3dAmA/FwqUDShhZ3ZC5kpJFD
	nJCkv6geDcjfb0UT0FJJYWgvPaVh9VRdXHQz1aHh5Bs2Jx0nvIor6cEcATLor3ENmDmhzsgPVi7tr
	3NT7/d/yu+tuUGz2vIww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nCfxw-00BLq3-Vd; Wed, 26 Jan 2022 10:55:53 +0000
Received: from relay12.mail.gandi.net ([217.70.178.232])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nCfv9-00BKq9-B9
 for linux-mtd@lists.infradead.org; Wed, 26 Jan 2022 10:53:01 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id CCEEA200010;
 Wed, 26 Jan 2022 10:52:53 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Pratyush Yadav <p.yadav@ti.com>, Michael Walle <michael@walle.cc>,
 linux-mtd@lists.infradead.org, Mark Brown <broonie@kernel.org>,
 linux-spi@vger.kernel.org
Cc: Julien Su <juliensu@mxic.com.tw>, Jaime Liao <jaimeliao@mxic.com.tw>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Xiangsheng Hou <xiangsheng.hou@mediatek.com>
Subject: Re: [PATCH v9 08/13] mtd: spinand: Create direct mapping descriptors
 for ECC operations
Date: Wed, 26 Jan 2022 11:52:52 +0100
Message-Id: <20220126105252.882804-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220104083631.40776-9-miquel.raynal@bootlin.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'b32d4773f7aa60645ec0c7dfa74992e98facb0b7'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220126_025259_548325_B7ED6EFA 
X-CRM114-Status: GOOD (  12.87  )
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

On Tue, 2022-01-04 at 08:36:26 UTC, Miquel Raynal wrote:
> In order for pipelined ECC engines to be able to enable/disable the ECC
> engine only when needed and avoid races when future parallel-operations
> will be supported, we need to provide the information about the use of
> the ECC engine in the direct mapping hooks. As direct mapping
> configurations are meant to be static, it is best to create two new
> mappings: one for regular 'raw' accesses and one for accesses involving
> correction. It is up to the driver to use or not the new ECC enable
> boolean contained in the spi-mem operation.
> 
> As dirmaps are not free (they consume a few pages of MMIO address space)
> and because these extra entries are only meant to be used by pipelined
> engines, let's limit their use to this specific type of engine and save
> a bit of memory with all the other setups.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git spi-mem-ecc.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
