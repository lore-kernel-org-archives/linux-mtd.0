Return-Path: <SRS0=N2Dg=QU=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD05BC282C2
	for <linux-mtd@archiver.kernel.org>; Wed, 13 Feb 2019 13:36:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 795CF217F5
	for <linux-mtd@archiver.kernel.org>; Wed, 13 Feb 2019 13:36:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="T+83gNER"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 795CF217F5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zagj0h65obyZnPugVpF0A1nRVFLWiXStIIVAwJEkE9o=; b=T+83gNERp1ijN7
	ZVKignlNcnDtxaVbYDezhDUuFbceKIJsB08/Q8bvGDYQ4Vgtuhn/4SUIz87bJy3KcwPZiIphXJXoE
	rmmDeM/+Ki2BH8pntC6ZxS034EAgzMl7a206dsoYfdpAFQSUWf+b/6zCQSRLRa5Bnzz3sPyJBFZIK
	M3hiSWb02o9xlTdpPlM6Mxbaaf57r9E8l7GG/hDA6TVZHACZHxMrgkM1NllqOZBW8h5QFL82/c9bl
	hmKcLrtaLkVizI42HBYtRHQDhX4aMm4b/sW/BvsAqAXbOcenU4DLhHOEONq0Prmg49aLR/5LHfPUY
	ZknV8FekxCL7y8v4zTPQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gtuib-0002xp-S9; Wed, 13 Feb 2019 13:36:53 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gtuiY-0002xR-KN
 for linux-mtd@lists.infradead.org; Wed, 13 Feb 2019 13:36:52 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id E5AEE26CF14;
 Wed, 13 Feb 2019 13:36:47 +0000 (GMT)
Date: Wed, 13 Feb 2019 14:36:43 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 0/3] AFS move and OF support
Message-ID: <20190213143627.51b8b2cc@gmail.com>
In-Reply-To: <20190123122910.19024-1-linus.walleij@linaro.org>
References: <20190123122910.19024-1-linus.walleij@linaro.org>
Organization: Collabora
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190213_053650_795825_7D5D1DAE 
X-CRM114-Status: GOOD (  18.23  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>, Marek Vasut <marek.vasut@gmail.com>,
 linux-mtd@lists.infradead.org, Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Wed, 23 Jan 2019 13:29:07 +0100
Linus Walleij <linus.walleij@linaro.org> wrote:

> As a starting point to fixing up the AFS support on ARM
> reference designs, let's move the implementation down to
> the "parsers" subdirectory and add OF probing support.
> 
> More refactorings will be done on top of this change.
> 
> Linus Walleij (3):
>   mtd: afs: Move AFS partition parser to parsers subdir
>   mtd: partitions: Add AFS partitions DT bindings
>   mtd: partitions: Add OF support to AFS partitions

Let's try to use a consistent prefix for patches touching partition
parsers code, like "mtd: partitions: <format>: ". Same applies to the
other patch series. Other than that, patches look good to me.

> 
>  .../mtd/partitions/arm,arm-firmware-suite.txt   | 17 +++++++++++++++++
>  drivers/mtd/Kconfig                             | 16 ----------------
>  drivers/mtd/Makefile                            |  1 -
>  drivers/mtd/parsers/Kconfig                     | 16 ++++++++++++++++
>  drivers/mtd/parsers/Makefile                    |  1 +
>  drivers/mtd/{ => parsers}/afs.c                 |  7 +++++++
>  6 files changed, 41 insertions(+), 17 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/mtd/partitions/arm,arm-firmware-suite.txt
>  rename drivers/mtd/{ => parsers}/afs.c (96%)
> 


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
