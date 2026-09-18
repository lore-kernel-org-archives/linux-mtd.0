Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D1A4C982DA
	for <linux-mtd@archiver.kernel.org>; Fri, 18 Sep 2026 11:31:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VKKDjJtPPDFzwj1PZIXsna9M7chys7sB65TWzE27Kr0=; b=0APiSV63/1lYaN
	2xfDs9284f+Tbg2/nMI7M6x8VhhBZeWzBclWYeEGGKHD4VSJTTN8uOgN8jYJrvg/6FBKX9q7Dy0Q8
	65qoCxImoY7M2x4CZDL+UoBuMA5NilSO/GRdP5gelW7YN70rWJAe1jKp6LVnx1nWJkoFJA1fgZ7yf
	sDxpJkmdhASrGv9Ttaq5tN1tCZj8sn4u0YPXwGwRJSq7YUmbX29MfnU2/oOz0dtPWTu7TjVhzWCVR
	ql5bMI2W94hHeanKwldWI4tV+7BSDkR/e3qHhYy+1qxVwXtyEWov0G1p59OIWcqxnarYdQU/p1ybg
	ftqCTHPjP7+H+cguJfFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7WoN-0000000EEBV-3yPw;
	Fri, 18 Sep 2026 11:31:23 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7WoL-0000000EEAu-1ZIp
	for linux-mtd@lists.infradead.org;
	Fri, 18 Sep 2026 11:31:21 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 7C95260A82;
	Fri, 18 Sep 2026 11:31:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0E1F1F000FF;
	Fri, 18 Sep 2026 11:31:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789731080;
	bh=L/Zz516kYItSH8+rRy2r7gKYl9Ci+xbgs98Xewz48NY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=dlPxbCE2DqMeieWD3kl8zxJ+pHq1CqYhDNRW/3U+gel7QXiPaXEKuvpiWDdDRl4Jd
	 Emgi8BkcmpnOtG1QsgUBsbhZSewc0K8b7VOmRnPElaOwM4KXbwSWC3X6agJKKlVYUW
	 EKsjxnxwdEVA0u9yYfFaEdKxoql+bEhSFp7beP0W3TSr7rK6nrrzF3io9oCJsmRbm6
	 GEaoOlfkq5X5DrfEV3TJXuqkrezEK04PdSYFJsis/On0hV6oLSFtOfh1sMpaRgyVUo
	 PWd86F65AzSxMkchCgs6ejRtFrmQ5Kk+4OehEAAA4EonNRw1eROiaytXdO/PQC+Dww
	 WrIHGCvWAbsDA==
From: Michael Walle <mwalle@kernel.org>
To: Pratyush Yadav <pratyush@kernel.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Takahiro Kuwano <takahiro.kuwano@infineon.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260917-sfdp_size-v1-1-c1cdb1003f48@infineon.com>
References: <20260917-sfdp_size-v1-1-c1cdb1003f48@infineon.com>
Subject: Re: [PATCH] mtd: spi-nor: sfdp: Increase SFDP data size limit to
 16 KiB
Message-Id: <178973107865.3144177.17346333400133401427.b4-ty@b4>
Date: Fri, 18 Sep 2026 13:31:18 +0200
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


On Thu, 17 Sep 2026 14:02:15 +0900, Takahiro Kuwano wrote:
> The size of SFDP data read and cached is limited to avoid allocating
> too much memory. The current limit is PAGE_SIZE, but the Spansion S25FS256S
> has parameter tables at offsets beyond 4 KiB.
> 
> Increase the limit to 16 KiB to support such devices by introducing the
> SFDP_MAX_SIZE macro.
> 
> [...]

Applied, thanks!

[1/1] mtd: spi-nor: sfdp: Increase SFDP data size limit to 16 KiB
      commit: 935457a1ddc90921c3a3444f8bb7aaa97d2af55c

Best regards,
-- 
Michael Walle <mwalle@kernel.org>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
