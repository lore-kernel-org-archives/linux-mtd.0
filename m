Return-Path: <SRS0=EQmy=7K=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6D92C433DF
	for <linux-mtd@archiver.kernel.org>; Thu, 28 May 2020 14:53:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7BBEA2075F
	for <linux-mtd@archiver.kernel.org>; Thu, 28 May 2020 14:53:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="cEj9Ajxv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7BBEA2075F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6rbL0JcwIwvRTiep1UrR+bfgwfbulcJh50ktBrHxj9o=; b=cEj9AjxvO6FwYT
	9UAGplaopAQGv7N7qU7SRbtaJNUDqZZTurzt+iPl5iKA2V2gTdXhqzPeveF91g7qtssYEejFDcjOi
	LVIq0aMMTUEogV9kgSAUQzovs+sYEkyU/VncTBm4hNCxtNIs8An12FvlD/lFFqbERK7/5yB+1MgBz
	ieAHLtaMbCYgW9xx08y1++1A/XzC/j18sA9gEFj8D5H2rw4pQgKAGX6l9KQ+RFTjvMZ9o6MiADGf1
	/Ip00EkEDGRRqhXO4NnjyqyG7DN8E/9tu0QHurDKKmrGUWdRE4WEnYhjI05IcAb8ui9CXwqiFYp2f
	WC1N4WrFxEln+bKonNDw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jeJub-00077I-U5; Thu, 28 May 2020 14:53:37 +0000
Received: from relay12.mail.gandi.net ([217.70.178.232])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jeJuP-0006xU-GD; Thu, 28 May 2020 14:53:26 +0000
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id C190F20000C;
 Thu, 28 May 2020 14:53:17 +0000 (UTC)
Date: Thu, 28 May 2020 16:53:16 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Subject: Re: [PATCH v6 17/18] mtd: rawnand: Write a compatibility layer
Message-ID: <20200528165316.647f9cb0@xps13>
In-Reply-To: <20200528164217.4eec33ae@collabora.com>
References: <20200528113113.9166-1-miquel.raynal@bootlin.com>
 <20200528113113.9166-18-miquel.raynal@bootlin.com>
 <20200528164217.4eec33ae@collabora.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200528_075325_668462_AFCEA58C 
X-CRM114-Status: UNSURE (   9.52  )
X-CRM114-Notice: Please train this message.
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
2020 16:42:17 +0200:

> On Thu, 28 May 2020 13:31:12 +0200
> Miquel Raynal <miquel.raynal@bootlin.com> wrote:
> 
> > +static enum nand_ecc_engine_type
> > +of_get_rawnand_ecc_engine_type_legacy(struct device_node *np)
> > +{
> > +	enum nand_ecc_legacy_mode {
> > +		NAND_ECC_INVALID,
> > +		NAND_ECC_NONE,
> > +		NAND_ECC_SOFT,
> > +		NAND_ECC_SOFT_BCH,
> > +		NAND_ECC_HW,
> > +		NAND_ECC_HW_SYNDROME,
> > +		NAND_ECC_ON_DIE,
> > +	};  
> 
> You're redefining an enum, but I don't see the old enum/defines being
> removed, is that expected?

Oh yeah, my desire was to get rid of this public enumeration and mov it
to the single legacy function using it, but indeed I am removing it in
the next patch as part of the global move to nand/core.c. I will do it
in this patch.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
