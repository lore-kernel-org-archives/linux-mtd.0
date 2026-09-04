Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60191C624D3
	for <linux-mtd@archiver.kernel.org>; Fri,  4 Sep 2026 13:40:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WhwifbiBcyRf6QMBl51xl94sowwPcdjfMaJMKuJQUSU=; b=SSUKf++Zv0YUrp
	lbfHFKKVpDUKMGS+KyJn1v9mX6F/bLqI0ewd8aZC4Z/q9ywjnkGKTE6OIoa/xzOHu8fvqmOkAqDgh
	7BzI2LYQ3DcWb/cxP99YDAs/5fxOAWO7FeDrh9CXISf9Vt9cxZ04GEuF7f0PaOPjPgJgsCpRYzQjU
	MZLG8Nqr0QKGc6dX443UGN89g8CxHK7ijwN/i65Z/v2Lyh1fQR+PB6foB50/6RQ+d+gW8FWv5njvh
	S4Q3ULdoPN0kCHXQdOAgLbAxcqMu0seO0gxzYRatCIRyoRcxp4s/w+wEBPxU8w/DtZde/1XV9xGOm
	x5wErJM5eOsV3ibREGug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2U9g-00000002Fq0-2sNN;
	Fri, 04 Sep 2026 13:40:32 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2U9e-00000002FpQ-2wq0
	for linux-mtd@lists.infradead.org;
	Fri, 04 Sep 2026 13:40:30 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 49DEC44226;
	Fri,  4 Sep 2026 13:40:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4EB3D1F00A3F;
	Fri,  4 Sep 2026 13:40:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788529230;
	bh=qwbmDm5q9Q/yndoU4VFw9AECGyBmUhTXqE1Q9msMsxQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=PWcFEbjpJ8FELEVxp6EL4RwQPYgCrt6TxldsgH0gvEoWY/fhStlBVu9QzriNg7esA
	 dLe6+d+rqhbxa6nZIVtYK8cX847JV2b1caNRW49iKa1Nwzw0+qlwQRp2TTHl0Y5LcQ
	 swpZwKSe2ecFrC1jvUaIjp0cY4UIn4QI64X67wBIFtgFXYaPlv/lk5bHyN7wi4VSzf
	 WHXsj834OQDf43Z1UUSezqwH6cAXOwXBcH2k+7hll/V5o385FXrVNRnBzR3m6tDBhr
	 fY72JSgBQ6p3qIC2w+aeZ61ib6pHxilgh6fGCnx0rZCvNZkcLDR1aUxGEwO7qAG/Xe
	 +2yifobuLVZwQ==
From: Michael Walle <mwalle@kernel.org>
To: Pratyush Yadav <pratyush@kernel.org>, 
 Takahiro Kuwano <takahiro.kuwano@infineon.com>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Cheng Ming Lin <linchengming884@gmail.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 alvinzhou@mxic.com.tw, Cheng Ming Lin <chengminglin@mxic.com.tw>
In-Reply-To: <20260410091039.389911-1-linchengming884@gmail.com>
References: <20260410091039.389911-1-linchengming884@gmail.com>
Subject: Re: [PATCH] mtd: spi-nor: macronix: Document support for
 additional flash aliases
Message-Id: <178852922805.3340372.1167723040867621466.b4-ty@b4>
Date: Fri, 04 Sep 2026 15:40:28 +0200
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


On Fri, 10 Apr 2026 17:10:39 +0800, Cheng Ming Lin wrote:
> Several Macronix SPI NOR flash devices share the same ID.
> For instance, the MX25L51245G and MX25L51273G share the same ID
> (0xc2201a) with the currently listed MX66L51235F.
> 
> Add these equivalent part numbers to the comments above their
> corresponding flash_info entries.
> 
> [...]

Applied, thanks!

[1/1] mtd: spi-nor: macronix: Document support for additional flash aliases
      commit: 85b6110155cab6b67c9072c19f21dcb620c2819d

Best regards,
-- 
Michael Walle <mwalle@kernel.org>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
