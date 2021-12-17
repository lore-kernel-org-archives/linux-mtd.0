Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FA9DC433EF
	for <linux-mtd@archiver.kernel.org>; Fri, 17 Dec 2021 10:44:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=v3LcwRPfbAVHxC7G97G9HxhnUbuEim5PSPBZUvHMcGA=; b=dU5DdVhcr5Alzn
	wY1tq4nDn6mcC8bgdzXawEhxC4PBuWHdLYYm8vC0KiaSZee1kdXTd7j1fR5ZIZnTBiX91feyqyvG9
	ick6kNT5pWMHVdkvP7pZjGZxLY9u2gAACxiLMJ2wSnGMClZDvHRxWL/wKNRiayGv0veXj5QItFqUR
	MG7F324RURTeby+MUe5Uz5uSyXYDZXSjYOnXohCyzDp4EbenH8IkirXNR0VF02Wy766/1Y8gKjtqk
	DxfVKJoIOfpFNpKZSyLuRGDYnl71r3VKRsUBS2N/ynhaUPeoVOP1VR8GTnT9fYxnbyu9jPVsjEBuG
	FZL47jK8UWoqBDV0hT9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1myAiD-009ZdN-AA; Fri, 17 Dec 2021 10:43:41 +0000
Received: from lelv0143.ext.ti.com ([198.47.23.248])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1myAc6-009Xsm-1L
 for linux-mtd@lists.infradead.org; Fri, 17 Dec 2021 10:37:24 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 1BHAbFQl103265;
 Fri, 17 Dec 2021 04:37:15 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1639737435;
 bh=+nXhcjKNNROdKntOJztmSKywAUuemvkNHfzpB9oXqY0=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=Wn2HMULsh4Ek3bx430KH0iZt2ggBb19Ef5zzPQFh/mksTKmTKMqcpgocVO7uExFDn
 OmuEMkjvSkFVzIm5yVNSVLtJoKKFPyw9VeVEt9X0kmiO1nhMJk3abNcfD+jPYUgKjT
 3ZfCUyyewp0GaQDgtb3pjisRNOZGS48hNyxEz4yc=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 1BHAbEXx055352
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 17 Dec 2021 04:37:15 -0600
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Fri, 17
 Dec 2021 04:37:14 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Fri, 17 Dec 2021 04:37:14 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 1BHAbDjX018824;
 Fri, 17 Dec 2021 04:37:14 -0600
Date: Fri, 17 Dec 2021 16:07:13 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
CC: Tudor Ambarus <tudor.ambarus@microchip.com>, Michael Walle
 <michael@walle.cc>, Miquel Raynal <miquel.raynal@bootlin.com>, Richard
 Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 1/2] mtd: spi-nor: micron-st: make mt25ql02g/mt25qu02g
 match more specific, add 4B opcodes
Message-ID: <20211217103711.vrwx45spgzl73emp@ti.com>
References: <a69181ccf225424a8bd11349aad0df7face9715e.1633607826.git.matthias.schiffer@ew.tq-group.com>
 <20211216185254.pt3quvb4wkzou6wh@ti.com>
 <fd52c394b8c5f727b04166ca29e893baa940e2a5.camel@ew.tq-group.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <fd52c394b8c5f727b04166ca29e893baa940e2a5.camel@ew.tq-group.com>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211217_023722_239933_A6A664CC 
X-CRM114-Status: GOOD (  19.82  )
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

On 17/12/21 11:07AM, Matthias Schiffer wrote:
> On Fri, 2021-12-17 at 00:22 +0530, Pratyush Yadav wrote:
> > Hi Matthias,
> > 
> > On 07/10/21 02:08PM, Matthias Schiffer wrote:
> > > Change the mt25ql02g/mt25qu02g entries to include
> > > SPI_NOR_4B_OPCODES. In
> > > addition, the SPI_NOR_DUAL_READ flag is added to mt25ql02g; this
> > > seems
> > > to have been an accidental omission, as mt25ql02g and mt25qu02g
> > > should
> > > support the same features.
> > 
> > The way flags are specified are changed a bit. See [0]. Please re-
> > roll 
> > your patch to use the new flag types. If this flash supports SFDP
> > you 
> > should ideally just need to set the sfdp flag to true and the core 
> > should take care of the rest. Test reports with the new changes would
> > be 
> > much appreciated :-)
> 
> Will do. Is there an easy way to check which features the kernel
> detected from the SFDP with the new code?

Hm, I don't think so. I think you would have to add debug prints in the 
driver to know which flags were discovered by SFDP.

-- 
Regards,
Pratyush Yadav
Texas Instruments Inc.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
