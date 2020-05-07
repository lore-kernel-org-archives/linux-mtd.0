Return-Path: <SRS0=/Eax=6V=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE590C54E49
	for <linux-mtd@archiver.kernel.org>; Thu,  7 May 2020 11:50:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 91E432075E
	for <linux-mtd@archiver.kernel.org>; Thu,  7 May 2020 11:50:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ahZWMgnQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 91E432075E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fU8TqBIkcBPIEdbi0wIjTnkCOzhvpfHXrKg9ngMlI58=; b=ahZWMgnQoFwfwC
	x9eYG6NOVipESvZ9DTJ4jm5ufWdqPQLfGbNFNmc4ebSSTYpCh5odMKOh35HKngD850YtVlyv+xi/s
	Mjk5ZLozYrNeXkTTXKLtvw5V0T7LhQqFgbDVJtmu/qX9nyFinZH8uqP6stqpRL5PR3Yon7DwQUA5u
	y3RwqsMNRMp5WqyM8BcjyoQidy6Bp23wkaDOx3OERWNZHEjvnMtfM5zZfSGvNX4mec/nWmOwEnmiS
	Oh+K+1OsYfe5W7cKoUgr7aYwVm57TKtaOq2v1ztA5m8W9xljYinl+p5CA61p3zcOqBOw2wRikEmm5
	9CpiS/qeLG1QD13O+O7Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jWf3A-0008JM-2D; Thu, 07 May 2020 11:50:48 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jWf37-0008Ij-2j
 for linux-mtd@lists.infradead.org; Thu, 07 May 2020 11:50:46 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id AABF42A29AB;
 Thu,  7 May 2020 12:50:43 +0100 (BST)
Date: Thu, 7 May 2020 13:50:41 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH v3 5/8] MAINTAINERS: Add Arasan NAND controller and
 bindings
Message-ID: <20200507135041.7438ad63@collabora.com>
In-Reply-To: <20200507110034.14736-6-miquel.raynal@bootlin.com>
References: <20200507110034.14736-1-miquel.raynal@bootlin.com>
 <20200507110034.14736-6-miquel.raynal@bootlin.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200507_045045_259328_3C5C6F9D 
X-CRM114-Status: GOOD (  12.87  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Michal Simek <monstr@monstr.eu>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Richard Weinberger <richard@nod.at>, Rob Herring <robh+dt@kernel.org>,
 linux-mtd@lists.infradead.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Naga Sureshkumar Relli <nagasure@xilinx.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Thu,  7 May 2020 13:00:31 +0200
Miquel Raynal <miquel.raynal@bootlin.com> wrote:

Missing commit message here.

> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  MAINTAINERS | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index b816a453b10e..1f2c83ead00b 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1285,6 +1285,13 @@ S:	Supported
>  W:	http://www.aquantia.com
>  F:	drivers/net/ethernet/aquantia/atlantic/aq_ptp*
>  
> +ARASAN NAND CONTROLLER DRIVER
> +M:	Naga Sureshkumar Relli <nagasure@xilinx.com>
> +L:	linux-mtd@lists.infradead.org
> +S:	Maintained
> +F:	Documentation/devicetree/bindings/mtd/arasan,nand-controller.yaml
> +F:	drivers/mtd/nand/raw/arasan-nand-controller.c
> +
>  ARC FRAMEBUFFER DRIVER
>  M:	Jaya Kumar <jayalk@intworks.biz>
>  S:	Maintained


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
