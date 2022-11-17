Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BC0DC433FE
	for <linux-mtd@archiver.kernel.org>; Thu, 17 Nov 2022 21:15:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=R8OOfWwJ4HB76+DdpjgEwQTXWqugF3LKV6fFj/1jWIU=; b=vZjOC+mCcRnJ6f
	b/k8fO0rlsinTBemQcRR01E28nf0++7kph/11+XZy8TeePE7f3Sq0DVrBtbgo96SnbipQ4Npt1lyN
	8VvNNSUQZSdnhV51Bl5K/1rwgv+volRifZkZ5AUTqpgeBk96qbsF8UmcNbuqcQTANlL2wpAH3Giro
	LXJf48SLh/d2D7KgcpKkOltA2IZG2JQAWc12yEnMzgFcY4utM0zKC7zkY+eArWfebh+6kxN4SyN+V
	PFt459YG0tTqQ1bX2IrXjyuaumCHwaktFDZ4EvBxCG13OnvYqtV5kZIa/2drUzPB1uCchjWo2GAOp
	ZsYlvhEvRMWlbqtvHp9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovmEQ-00HYGU-EL; Thu, 17 Nov 2022 21:15:34 +0000
Received: from relay9-d.mail.gandi.net ([2001:4b98:dc4:8::229])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovmEJ-00HY9y-Sv
	for linux-mtd@lists.infradead.org; Thu, 17 Nov 2022 21:15:30 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 0EC73FF806;
	Thu, 17 Nov 2022 21:15:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1668719726;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VPHr+qDv2jvZw7yfWQ6ulK/MdmRbx+t8bsjqHho0yiI=;
	b=nAqlDnzrdHSTZf2HpQHlucabZ2Db2wD4jHANBXRfgnWXSBvnESeXgKR7CmU5laZgOkb2Zn
	x2PXiUTX5gWJHyHncuSAIsHG2E+KWx52GGAPeyhGPThHVChcF5YJsCTnZyxkqlrAKKeU1A
	f0KeVHrbfevi692vyE+VQeJY1AHc6omkO36/dliNuZjxXP/3agfSqJsOySg8iAJZucjwfq
	mzLoTUVZiV/fXeQiq+IjdxyfFagZa8mWBpSVrL0zRPfiFj8dH9gYaWDEShSW6QqHrook21
	cDKKh9ys7KSGG4li5LwQ96E9Hou7g8HRkOei8RY7DGITGBSSnOGvTh1SbM58Gw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	devicetree@vger.kernel.org
Cc: Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tudor Ambarus <Tudor.Ambarus@microchip.com>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <michael@walle.cc>,
	linux-mtd@lists.infradead.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 13/17] dt-bindings: mtd: nvmem-cells: Drop range property from example
Date: Thu, 17 Nov 2022 22:15:23 +0100
Message-Id: <20221117211523.1273320-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221114090315.848208-14-miquel.raynal@bootlin.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'c0fc45f7d305688f727fb44a66554233b1624ab9'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221117_131528_127070_4229D91E 
X-CRM114-Status: GOOD (  10.40  )
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

On Mon, 2022-11-14 at 09:03:11 UTC, Miquel Raynal wrote:
> Memory mapped devices such as parallel NOR flash could make use of the
> 'ranges' property to translate a nvmem 'reg' cell address to a CPU
> address but in practice there is no upstream user nor any declaration of
> this property being valid in this case yet, leading to a warning when
> constraining a bit more the schema:
> 
> 	.../mtd/partitions/nvmem-cells.example.dtb: calibration@f00000:
> 	Unevaluated properties are not allowed ('ranges' was unexpected)
> 
> So let's drop the property from the example, knowing that someone might
> actually properly define it some day.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> Reviewed-by: Rob Herring <robh@kernel.org>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/next.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
