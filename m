Return-Path: <SRS0=CeWw=7D=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93353C433E0
	for <linux-mtd@archiver.kernel.org>; Thu, 21 May 2020 18:05:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5254720738
	for <linux-mtd@archiver.kernel.org>; Thu, 21 May 2020 18:05:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="tnxEcWUi";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ti.com header.i=@ti.com header.b="FLO65yzD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5254720738
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ytrY6FqVCUPW85UVIOrO7wBEO/8Q440vN/3F2ivVpl0=; b=tnxEcWUiSf8GtJ
	um/RgqsQjj+MXUOpwCpehhoF8Hr8NQchubedjWdgjWnZqSMtBNU9Bx4WDh4DAH5jcoqXrzi7i9HvF
	wqsQn81D7MoDdt7uhSAy9v9yRvg275UGbxf4+W5YsVfneUtpoeIHf1HIANu5cxd5wQT9yBSLPeczA
	6t0NTE+kbi9H0K30qkLhGGfrkIh+EASZzPoYHlSzCbejkvM7FIU7eWae0kErCY8BDZsXq33X4QbqG
	ZM86QRW4Qc3Q7ipxxG8Dxwu4a4HyegYNVchKBx2QEBQFwGXJxGXWcYWDsqswmLHlI19GpMRac5SEw
	qd8lcRXE/ioFiRAag0zQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jbpZX-0007GU-Ee; Thu, 21 May 2020 18:05:35 +0000
Received: from lelv0143.ext.ti.com ([198.47.23.248])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jbpZJ-000746-AW; Thu, 21 May 2020 18:05:22 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 04LI5DJV011706;
 Thu, 21 May 2020 13:05:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1590084313;
 bh=cBsuSs5XQOpsuV0CecqCZ/lRLSi2so73QLU1KFL+2mY=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=FLO65yzDuTlgGUCUQ7nHNXlT4uLcDc+hgAhVu0jeL9+geY1C0p7coynxs+WK7Yu4L
 5vfHTjmN/KIWEdxbxN9I7BNVIGKnhOE79nr2G2S12qpCrHDKkJmUrUQpU3E5ZdUUkT
 lQJX9Q/39W1YZJQEGY1SkXFUnmB9PZtZVZzCicMU=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 04LI5DiY012172;
 Thu, 21 May 2020 13:05:13 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 21
 May 2020 13:05:12 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 21 May 2020 13:05:12 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 04LI5CJE066205;
 Thu, 21 May 2020 13:05:12 -0500
Date: Thu, 21 May 2020 23:35:11 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v6 00/19] mtd: spi-nor: add xSPI Octal DTR support
Message-ID: <20200521180511.4axjf46g6b25mp3k@ti.com>
References: <20200520163053.24357-1-p.yadav@ti.com>
 <20200521163957.GG4770@sirena.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200521163957.GG4770@sirena.org.uk>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200521_110521_441870_763CA2DB 
X-CRM114-Status: GOOD (  12.80  )
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
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Mason Yang <masonccyang@mxic.com.tw>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <tudor.ambarus@microchip.com>,
 Richard Weinberger <richard@nod.at>, Sekhar Nori <nsekhar@ti.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>, linux-kernel@vger.kernel.org,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Boris Brezillon <boris.brezillon@collabora.com>, linux-mtd@lists.infradead.org,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org,
 linux-spi@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Mark,

On 21/05/20 05:39PM, Mark Brown wrote:
> On Wed, May 20, 2020 at 10:00:34PM +0530, Pratyush Yadav wrote:
> > Hi,
> > 
> > This series adds support for octal DTR flashes in the spi-nor framework,
> > and then adds hooks for the Cypress Semper and Mircom Xcella flashes to
> > allow running them in octal DTR mode. This series assumes that the flash
> > is handed to the kernel in Legacy SPI mode.
> 
> Are people happy with the SPI bits of this from a MTD point of view?  I
> don't have any concerns and could apply them on a branch even if more
> revisions are needed for the MTD side.

There were a couple small changes suggested for spi-mem. Will send a 
re-roll in a few minutes.

-- 
Regards,
Pratyush Yadav
Texas Instruments India

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
