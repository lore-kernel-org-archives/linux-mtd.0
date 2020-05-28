Return-Path: <SRS0=EQmy=7K=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95EC6C433E1
	for <linux-mtd@archiver.kernel.org>; Thu, 28 May 2020 23:48:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4EE7C2075F
	for <linux-mtd@archiver.kernel.org>; Thu, 28 May 2020 23:48:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="D8uO2kzv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4EE7C2075F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aXwiKAK/eeiJykCpj0d5Ov2NbyVnCH5M823Z2qscYlw=; b=D8uO2kzvMJQXtO
	QvmA6ZcAs7Wu8bQ5YXsmdAlFzyCenWtZ5aPIEZM3081ZAaN3owARpIkYb4Fx8TGUk/v9+Anfi5Rtt
	wnBstzIIwDH8FsnIdOHgS6IZzIsU1f36qK48FzpKRlykNtqGUn6lHYFw1HIaR+RzJ+TvMPHcHXsWY
	DBHxsfHgjHfuBJR4GHgzJSQhh6rGVQ8yAPseHh8Zh2uTuMTezUn22ytTv9Oxoe9BoWsVAnEpVlaE8
	zaVpBsZ8sFK9cf9yKV1cqquUVyg/b0O2ioc0C99ZSA+8uZ6b8f5HUAou8tqaUyGQq0dE2/emm9dhZ
	/xBR1BEg3tTL6cT4y6JA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jeSGF-0006k7-7H; Thu, 28 May 2020 23:48:31 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jeSFy-0006YV-AG; Thu, 28 May 2020 23:48:15 +0000
X-Originating-IP: 91.224.148.103
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 8D460FF803;
 Thu, 28 May 2020 23:48:07 +0000 (UTC)
Date: Fri, 29 May 2020 01:48:06 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Subject: Re: [PATCH v6 16/18] mtd: nand: Convert generic NAND bits to use
 the ECC framework
Message-ID: <20200529014806.06770fa4@xps13>
In-Reply-To: <20200528180003.0f682e6f@collabora.com>
References: <20200528113113.9166-1-miquel.raynal@bootlin.com>
 <20200528113113.9166-17-miquel.raynal@bootlin.com>
 <20200528180003.0f682e6f@collabora.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200528_164814_488492_481B54FF 
X-CRM114-Status: GOOD (  11.71  )
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
 Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>, Julien Su <juliensu@mxic.com.tw>,
 Richard Weinberger <richard@nod.at>, Weijie Gao <weijie.gao@mediatek.com>,
 Paul Cercueil <paul@crapouillou.net>, Rob Herring <robh+dt@kernel.org>,
 linux-mtd@lists.infradead.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Mason Yang <masonccyang@mxic.com.tw>, Chuanhong Guo <gch981213@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


Boris Brezillon <boris.brezillon@collabora.com> wrote on Thu, 28 May
2020 18:00:03 +0200:

> On Thu, 28 May 2020 13:31:11 +0200
> Miquel Raynal <miquel.raynal@bootlin.com> wrote:
> 
> > Embed a generic NAND ECC high-level object in the nand_device
> > structure to carry all the ECC engine configuration/data. Adapt the
> > raw NAND and SPI-NAND cores to fit the change.  
> 
> I would also split that one:
> 
> 1/ s/nand_ecc_props/nand_ecc/ in the core + change the spi nand
>    framework accordingly
> 
> 2/ update rawnand to use the generic layer

This one I honestly don't understand how to split it. As long as I
change the NAND device object content, I have to update all
raw/spi-NAND devices in the same patch, or I would break the build. As
it there are already many many changes, I did not split this patch.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
