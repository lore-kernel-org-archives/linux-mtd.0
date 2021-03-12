Return-Path: <SRS0=p7xI=IK=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 427C4C433E0
	for <linux-mtd@archiver.kernel.org>; Fri, 12 Mar 2021 17:01:34 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E31C76501C
	for <linux-mtd@archiver.kernel.org>; Fri, 12 Mar 2021 17:01:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E31C76501C
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=jzUSuy39py+5ixtoFAEwGIuhR24CqQtW5BnkVRkV/f4=; b=aeGAtu/nIKS0vNbS2NSs+5Dsu
	X+AqF9ouLzMqvq/xjd+ynMhObyeMY7l9SJB4oxU6efLOgtCOYEsTq7FFipy4L5j8y+ii+CY7xOS4A
	0FGO9XtYgRgQfuzuaX2bvr7Kdc5SCAFGcjAL/nAKLk1mVyotlqCQPaxOO+lWuEUH/rH1eNCwKLPZ5
	R4/nikqDmSm/OG0y1WMihjRNEhZGnnDjwpbzuzkZaTNdijEffg6otv0i0bsC56vqnEEHstSsFQd9b
	afr9/1OGIva+NP0cDVgpf+2NBFK5Pmhe+KEweCtTKN24v+hU8k6sJnAcMz/PUM1FXfWgnf4wRwiSD
	PP4xWCAXQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lKl9B-00C3F5-Es; Fri, 12 Mar 2021 17:00:21 +0000
Received: from fllv0015.ext.ti.com ([198.47.19.141])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lKl96-00C3E1-VC; Fri, 12 Mar 2021 17:00:19 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 12CH08kt121082;
 Fri, 12 Mar 2021 11:00:08 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1615568408;
 bh=zaa/mRSUMAXzQt5H0aezjgMFIyojIQMSj0VLcmmYG0Q=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=ZJYQk2vaku81q9JFcftwYrDwiWbZAGlKsxDCS7xolALzY4tOV4aVF0BWT02/gjsTp
 wiE2GWxclQRfYGBLI08wpZYK4vWqCWAfNIIbz7pXQZkZ1gu8Y/UYMWawOwyep9KYhn
 7OqlbC/XkucryFWnndJAdBy0aUZO5x7G+oqOfb3k=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 12CH07Vl049603
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 12 Mar 2021 11:00:08 -0600
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Fri, 12
 Mar 2021 11:00:07 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Fri, 12 Mar 2021 11:00:07 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 12CH06Rj086882;
 Fri, 12 Mar 2021 11:00:07 -0600
Date: Fri, 12 Mar 2021 22:30:02 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: Michael Walle <michael@walle.cc>
CC: Nishanth Menon <nm@ti.com>, Tero Kristo <kristo@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Tudor Ambarus <tudor.ambarus@microchip.com>, Miquel
 Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>, Mark Brown <broonie@kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-mtd@lists.infradead.org>,
 <linux-spi@vger.kernel.org>, Lokesh Vutla <lokeshvutla@ti.com>
Subject: Re: [RFC PATCH 0/6] spi: Add OSPI PHY calibration support for
 spi-cadence-quadspi
Message-ID: <20210312170000.szh55346o7sm6ase@ti.com>
References: <20210311191216.7363-1-p.yadav@ti.com>
 <b9450a151cce89cde47b4d6a76c74b32@walle.cc>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b9450a151cce89cde47b4d6a76c74b32@walle.cc>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210312_170017_601789_F147873E 
X-CRM114-Status: GOOD (  19.49  )
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

On 12/03/21 02:32PM, Michael Walle wrote:
> Am 2021-03-11 20:12, schrieb Pratyush Yadav:
> > The main problem here is telling the controller where to find the
> > pattern and how to read it. This RFC uses nvmem cells which point to a
> > fixed partition containing the data to do the reads. It depends on [0]
> > and [1].
> > 
> > The obvious problem with this is it won't work when the partitions are
> > defined via command line. I don't see any good way to add nvmem cells to
> > command line partitions. I would like some help or ideas here. We don't
> > necessarily have to use nvmem either. Any way that can cleanly and
> > consistently let the controller find out where the pattern is stored is
> > good.
> 
> The NXP LS1028A SoC has a similar calibration (although there its done
> in hardware it seems) and there the datasheet mentions there are flash
> devices which supports a preamble before a read function. The preamble
> is then some kind of learning pattern. Did you see a flash which actually
> supports that in the wild? I can't find any publicly available datasheets
> of 8bit I/O SPI NOR flashes.

I haven't seen any such flash but it looks like Tudor has.

> 
> -michael

-- 
Regards,
Pratyush Yadav
Texas Instruments Inc.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
