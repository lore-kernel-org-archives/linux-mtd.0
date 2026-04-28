Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35401FF885D
	for <linux-mtd@archiver.kernel.org>; Tue, 28 Apr 2026 12:44:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=H06ummVhdtQ4WUKySPfujPJ4wEqoNYNY2ewRb8y6LjY=; b=mao5Wys4SGBsPD
	Ijr7fxB06MQgxdKmEaPfhpu8Xg0m/0CwPQ+z7oHJ9ixCgz6pQHCjFY6+lEemKmfnkJI/h2Q/5w5CQ
	TzUkzGoAwQmUnXu24BVBe2TveeZqq9Ef/bS/BHYBDtPKyyBB3o3QPJEzN3kZ6wIwjQwM7zfCbgBEA
	RRIfbqzf21eiCH4QlWaSrfPxgyaTmXYiEFWhzrO6w8qUsAQyUhFJsZbvr+h6QRrWFhpciadiFp3Oc
	doInqpH5fGdarEI/SaN9cM3clVcrAyqBPTjQvTJQbU2Nhov3cm0qZVV0ZGNlOVATRWAGZrgA/6brD
	SJb8QHMIsqsE+7igEghQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHhnD-00000001SIh-18pq;
	Tue, 28 Apr 2026 12:43:59 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHhnA-00000001SHS-2bBJ
	for linux-mtd@lists.infradead.org;
	Tue, 28 Apr 2026 12:43:58 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id E9A0BC5EF07;
	Tue, 28 Apr 2026 12:44:35 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 19D0D601D0;
	Tue, 28 Apr 2026 12:43:52 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A698910728B18;
	Tue, 28 Apr 2026 14:43:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1777380231; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=TdR1HYk3d/Fr+1mCeaDpInPFnpJNLODZo+R0m3widHg=;
	b=exG6GYdk3/cy3kCb6B3lmo4CF3dXcrWlCMw8gHZHazw1ytHpRBa5r4Z0690iVPlge42aMQ
	OW1IHRsEzTpFQXjdsjswhxr2hR8S3nLuMDUp4riTrvHeye2b9OXps+X6QhSstKQptWe0fm
	52kHJjj/Tb9wkcE0M1oW2xbHZltoKKUrAHaQkG2SvOeUj7x9P9jLYK89YWtB2qUSEs4DLa
	4idVExCaMLeDekf3T+X5uA1RZVr4FRcgeJsVLl8++eRG8o/P4AC4Sot9Hk8N2W+SdX0GSE
	Lbieqk2rY+0sGPwyK5+I3pE6wkyKd4SJfpgle7XwYb7Xr7++fQ8+f+Elc7/RcQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Mark Brown <broonie@kernel.org>
Cc: Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  Michael Walle <mwalle@kernel.org>,  Pratyush Yadav
 <pratyush@kernel.org>,  Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
  Steam Lin <STLin2@winbond.com>,  Santhosh Kumar K <s-k6@ti.com>,
  linux-spi@vger.kernel.org,  linux-kernel@vger.kernel.org,
  linux-mtd@lists.infradead.org
Subject: Re: [PATCH v2 00/11] mtd: spinand: Winbond continuous read support
In-Reply-To: <20260326-winbond-v6-18-rc1-cont-read-v2-0-643de97a68a3@bootlin.com>
	(Miquel Raynal's message of "Thu, 26 Mar 2026 17:25:47 +0100")
References: <20260326-winbond-v6-18-rc1-cont-read-v2-0-643de97a68a3@bootlin.com>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Tue, 28 Apr 2026 14:43:48 +0200
Message-ID: <87ecjzdzln.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_054356_799496_71171C40 
X-CRM114-Status: GOOD (  15.99  )
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

On 26/03/2026 at 17:25:47 +01, Miquel Raynal <miquel.raynal@bootlin.com> wrote:

> Hello,
>
> SPI NAND continuous read support has already been added a few releases
> ago, but only Macronix chips were benefiting from this support. Winbond
> chips also have a continuous read feature, which is slightly more
> complex to use in the scope of the Linux kernel, because they these
> chips expect a different read from cache operation once in continuous
> mode.
>
> In order to be more flexible, this series changes the logic behind
> dirmaps. Direct mappings used to be very static, not flexible. I am
> proposing to change this and turn them in to slightly more dynamic
> interfaces, where for instance we can:
> - Enable/disable the correction (was previously handled by creating yet
>   another pair of direct mappings per target).
> - Select one or another variant for the cache operations.
>
> I propose to name the variants available in a direct mapping "primary"
> and "secondary", and let the upper layer (SPI NOR or SPI NAND) point to
> the one that needs to be used for the operation. Controller drivers
> should not really care about this change, expect the fact that they
> should not keep a static representation of the template on their
> side. Because of that, I am creating a capability boolean to flag
> drivers that support this capability (the flag is ignored in the
> nodirmap case).
>

Applied to nand/next.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
