Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCB4CC433F5
	for <linux-mtd@archiver.kernel.org>; Fri, 25 Feb 2022 07:33:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gkG3ZfrA0Tlq4MO7Ma1hWQjnhwXMJyqdrQI0P04XyQk=; b=0OtrDmo2l8gfBT
	8D4OqTMQ5AqozQnRhiLuFb2SyTIRC4J5/Qx055djJy5/Jfr4l8vXpH7s/rAfECJqp70+877bWEXCB
	RhUMF0vu6MDfgnmaiUERDAcd0Whn/4E4+7Kp7nS7Wyom1U49nnJFv5/vbQALL5HCMKf0D+6wjjH5z
	1IrQr5WYqHf+K1zUEYxryM81uXWQ+r+WoA56Ofu33GUtvRPjbAuPkJGKoLxCkmaPIMrpJPdKBr0z8
	zJvPj2vZ3LocTV8XtEDNbgkZmipQSOwuNC7Ig3yc8kwsxDZV9XPkV/l12i1wk/EYBJ/f9qKprOP6I
	UDrHNs7vcyTBPZ7X02Ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nNV5k-003baq-Sr; Fri, 25 Feb 2022 07:32:41 +0000
Received: from fllv0015.ext.ti.com ([198.47.19.141])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nNV5X-003bYs-8t; Fri, 25 Feb 2022 07:32:28 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 21P7Vu6H114581;
 Fri, 25 Feb 2022 01:31:56 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1645774316;
 bh=1jhEkkUHjPfXmVDqozvs1ZMseyvKYmDv+DanJ2yLQfg=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=u4KS62z8fWz1UQ7srRh4oX1GPiPrzgXvR2Ys9m6s4t2UvOoUSvcPw1s4LOOt7ceX3
 Q9hn3ZnhQX+XsFX9fgCKWkUkoK6aMu5Ita6W9oPoSFyGqTIpCLHo2FdU+x1qb5PZ6r
 +eV6PlHxDi8vKVCizPZ9NOQhLP2o4tGwo/Bb5RKE=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 21P7VunC068247
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 25 Feb 2022 01:31:56 -0600
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Fri, 25
 Feb 2022 01:31:56 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Fri, 25 Feb 2022 01:31:56 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 21P7VtmG125179;
 Fri, 25 Feb 2022 01:31:56 -0600
Date: Fri, 25 Feb 2022 13:01:55 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>
CC: <linux-spi@vger.kernel.org>, <linux-mtd@lists.infradead.org>, Mark Brown
 <broonie@kernel.org>, Tudor Ambarus <tudor.ambarus@microchip.com>, Miquel
 Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>, <linux-aspeed@lists.ozlabs.org>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>,
 <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 01/10] mtd: spi-nor: aspeed: Rename Kconfig option
Message-ID: <20220225073155.f2cxfhm7surf34d4@ti.com>
References: <20220214094231.3753686-1-clg@kaod.org>
 <20220214094231.3753686-2-clg@kaod.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220214094231.3753686-2-clg@kaod.org>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220224_233227_379721_B35127C8 
X-CRM114-Status: GOOD (  10.61  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 14/02/22 10:42AM, C=E9dric Le Goater wrote:
> To prepare transition to the new Aspeed SMC SPI controller driver using
> the spi-mem interface, change the kernel CONFIG option of the current
> driver to reflect that the implementation uses the MTD SPI-NOR interface.
> Once the new driver is sufficiently exposed, we should remove the old one.

I don't quite understand the reasoning behind this. Why keep the old =

driver around? Why not directly replace it with the new one? Does the =

new one have any limitations that this one doesn't?

-- =

Regards,
Pratyush Yadav
Texas Instruments Inc.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
