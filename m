Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C770C25B48
	for <linux-mtd@archiver.kernel.org>; Fri, 27 Oct 2023 17:47:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7ek5/YiZ1IVEb0D76mJu9qxkv+3PEYRquqCGTNUW1GA=; b=yA//kw9TE+qdaz
	UrvI2NJ+X+8lJ4Cq7RV5BynxHsFycICNUonzAetc2GrKsIF77xYX14EGyLgM+v/3QqATLMSINMnq2
	fzwwkE8Aad/wHLuF4lW2lg7Y5xd6mEkA2LJ058Orhy7tj/HndQw1A6m/RthfSkBm8v/1BVcLSLaaW
	P9jl9AxOKMtt/uqtKE8I1AiKYlFhnfEFAQLKN38S7pZnAIpfmqNXwZ7de11XRjWnPYaYmPEQuiJGL
	gQ06L6xIR++p8s64RePvfpZZL+LkS5TONLdzyj6eN5foP0XiZ8BSv03gAMPMrRRDqn+ZYYZ1Q4pWf
	KEDiRKeAXXCF1ZCuCrHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qwQvR-00Gqxs-37;
	Fri, 27 Oct 2023 17:47:13 +0000
Received: from relay2-d.mail.gandi.net ([217.70.183.194])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qwQvO-00Gqvt-1o
	for linux-mtd@lists.infradead.org;
	Fri, 27 Oct 2023 17:47:11 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id BC63640006;
	Fri, 27 Oct 2023 17:47:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1698428828;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WR2D2RDvmSAWj8jXXY2dUJL/AUVsNPIfEe2Y4N53brM=;
	b=pxe00/zozNw9ebwfz7DJTNt/uV4g8WwgmKEoDbtwUfrc7z49Euh/ym+12njx95rdmy95sp
	6dijfn/aOyFZKOEPibKN0PFx2x7FyVc2TB3Iy68AuC/jEowZKWhdY/vylEiv5YL2KAcOcJ
	5Nd/p23j32mkMIDtk8qmdbDHlL4ZkGLN4IwKIlFHk1trAmKswPs2/jfsO2fdBMWcmZcjUa
	WGbcpm7XPE82uy3TrjAZIBPnfCWAJbSdMgZIQdfvDxoAEwBEFYugHLFV3XKIzCVFX4dNXS
	/y9xskkSsI1BCf1bhsrk4D79pqVwmPsP0cvXdjsdxOXxMjNxVjH191qgu0Zfkw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>,
	linux-mtd@lists.infradead.org
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	linux-kernel@vger.kernel.org,
	vigneshr@ti.com,
	joern@lazybastard.org,
	Christoph Hellwig <hch@lst.de>,
	stable@vger.kernel.org
Subject: Re: [PATCH] mtd: block2mtd: Add a valid holder to blkdev_put()
Date: Fri, 27 Oct 2023 19:47:07 +0200
Message-Id: <20231027174707.369918-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231021185832.25592-1-richard@nod.at>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'ff6abbe856342d4a7d5c28a0f7e33838f9f0a873'
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231027_104710_730810_8E267D97 
X-CRM114-Status: UNSURE (   8.23  )
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

On Sat, 2023-10-21 at 18:58:32 UTC, Richard Weinberger wrote:
> Since commit 2736e8eeb0ccd ("block: use the holder as indication for exclusive opens")
> blkdev_put() requires a valid holder argument.
> So, do so also in block2mtd to unbreak bdev->bd_holder refcounting.
> 
> Cc: Christoph Hellwig <hch@lst.de>
> Cc: stable@vger.kernel.org
> Fixes: 2736e8eeb0ccd ("block: use the holder as indication for exclusive opens")
> Signed-off-by: Richard Weinberger <richard@nod.at>
> Reviewed-by: Christoph Hellwig <hch@lst.de>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
