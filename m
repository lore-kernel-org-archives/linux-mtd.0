Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63654C5B572
	for <linux-mtd@archiver.kernel.org>; Wed, 12 Aug 2026 16:27:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zKd2t/HNHreLH9ImgA8lb3yYWN8w0Uiv0/p3OL1OIyI=; b=roxFoZ0/rxEA32
	ETw+nBpePtDUJoGs2kCnu8r3EPLsbvs87NtnwGpkP/R6MhM8PUIzjNtBKeSVPhfcQZJFjD/vQ3J7Q
	TdD4iN/po6/oBCjAATTJtDFa1tvOaKgSqwBwwSmnF6yxd4trvbvvsC76ygnT1wKiWi+dxHn4SWfvL
	0IaNE3xk+NM+kkICk772DSHfvL08Vvz2hoC16j67oSabUdCAqDJD6Cm61kjC1iMPlMIALhkeKGYgU
	BtfbY7fOT/R6iQBCRDltPyLHORf4469pCJbTZ7oWFz6zKwarksn/Z1DNzljkmuKXDA5qZpjouAHL0
	IOJrthSMNgLwBmOeNK5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuBnA-0000000GaGG-3XhU;
	Wed, 12 Aug 2026 16:27:00 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuBn7-0000000GaFQ-3utP
	for linux-mtd@lists.infradead.org;
	Wed, 12 Aug 2026 16:26:59 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 8726B4188A;
	Wed, 12 Aug 2026 16:26:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B3B01F00AC4;
	Wed, 12 Aug 2026 16:26:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786552017;
	bh=mfet8GT5AVs7leGxOiMdksWpNvxSQ28g5VxJV0229fI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=hDgfZ6MHQpPtwu35pMU4B/qnxoxggfg+egjPy59H3/kjC92LumtK1/sWTrlCrGcCb
	 4l4/ddRgJbwFV8S20n/vNxtCNrG2z+vzeQoO/d6hQN8rXzsemYGznnEaVpvo5u8Vhh
	 dMH+SBhgcaBhq5O68F98xJqAUEXLF12NPSXwNbRSzIgpu4DLnHVvgmRUduujsnhsdT
	 xLLSEU0AkBVC+P0B3Fijd6v8hHTDzYbFlDQSn0FDh4za2BimL4KFZTPN9cNdximMd1
	 0ksXvrSGARK69+GLhteia8MIAcbxSrBdhZN80mVCyh8macpodQbOCf7Nwaxrm8/Gdx
	 cVSJKHb2QKOZw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: Sasha Levin <sashal@kernel.org>,
	Frieder Schrempf <frieder.schrempf@kontron.de>,
	stable@vger.kernel.org,
	Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>,
	David LaPorte <dalaport@amazon.com>,
	Gabor Juhos <j4g8y7@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Frieder Schrempf <frieder@fris.de>
Subject: Re: [PATCH 6.12.y 0/3] Backport fixes for SPI NAND on i.MX6UL
Date: Wed, 12 Aug 2026 12:26:43 -0400
Message-ID: <20260812161500.10006-1-sashal@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260811161342.533280-1-frieder@fris.de>
References: <20260811161342.533280-1-frieder@fris.de>
MIME-Version: 1.0
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

On Tue, Aug 11, 2026 at 06:13:35PM +0200, Frieder Schrempf wrote:
> This series contains these fixes picked from mainline, applying to stable 6.12
> cleanly.

Queued the series for 6.12, thanks.

-- 
Thanks,
Sasha

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
