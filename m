Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61C48C433EF
	for <linux-mtd@archiver.kernel.org>; Mon, 20 Dec 2021 18:40:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DD+2W/MKP4c91c4WROS4f+XCvEhZ3qI1JFy7xSGm1Ro=; b=0TMysWCNGvmuCs
	yRgN4cgyD9DN4phnktq8ORUzwvx7zykDPlUk9mpThKoqJwaSi2CvE8IUfV2CpDfyShemULKDiCtLW
	B8+LDrLwTNuuXDXmwNMj1DdazCs29yA96vo6QsLLbJHFN9KG+Bp/O8O1Gotxo9uIpK6ocpVeL53Bd
	RWwLG0siNeE5A0Z99Bju/5kchkH+1/RQHfcunqysJcsOQnvjuFo+RrtkoySNPFpTL5sewTc3H004+
	s33fjRINLshElU6+iHbqLywwKDOyBkB9l5XtmtKpPGbbqp2Jad8YakXLXhI6I9LKVze+ixXmI+S9M
	YEnFsz5c3yzfeJ9QrhUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mzNZM-003q4v-L7; Mon, 20 Dec 2021 18:39:32 +0000
Received: from fllv0016.ext.ti.com ([198.47.19.142])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mzNZJ-003q4O-NN
 for linux-mtd@lists.infradead.org; Mon, 20 Dec 2021 18:39:31 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 1BKIdL8P120848;
 Mon, 20 Dec 2021 12:39:21 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1640025561;
 bh=DhGSC8bEQr1M3DMsp0Ai0zt4i1WtjcERkbiYFOKSENo=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=MYFnfeziksMihSLS2Z7u8goP/fhQ937yFV4aURA27Fy4PP+8yvzl/bGDVnv4gWicv
 2vk8JOYsTxBdXi9sqKVzwMk+M8TvJHPMCmEnVZqa5nORlp+cXuaJGthXhcNBp41TVt
 3bz47er625znAnqZfvsio8Umz6ay9jbZ7xUvear0=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 1BKIdLnR126024
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 20 Dec 2021 12:39:21 -0600
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Mon, 20
 Dec 2021 12:39:21 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Mon, 20 Dec 2021 12:39:20 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 1BKIdKvA110518;
 Mon, 20 Dec 2021 12:39:20 -0600
Date: Tue, 21 Dec 2021 00:09:19 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
CC: Mark Brown <broonie@kernel.org>, <linux-spi@vger.kernel.org>, Richard
 Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Tudor
 Ambarus <Tudor.Ambarus@microchip.com>,
 Michael Walle <michael@walle.cc>, <linux-mtd@lists.infradead.org>,
 Julien Su <juliensu@mxic.com.tw>, Jaime Liao <jaimeliao@mxic.com.tw>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Boris Brezillon <boris.brezillon@collabora.com>
Subject: Re: [PATCH v7 01/14] spi: spi-mem: Fix a DTR related check in
 spi_mem_dtr_supports_op()
Message-ID: <20211220183917.m3mywavgxsgq7yar@ti.com>
References: <20211217161654.367782-1-miquel.raynal@bootlin.com>
 <20211217161654.367782-2-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211217161654.367782-2-miquel.raynal@bootlin.com>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211220_103929_876767_37EAC286 
X-CRM114-Status: GOOD (  12.10  )
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

On 17/12/21 05:16PM, Miquel Raynal wrote:
> It seems that the number of command bytes must be "2" only when the
> command itself is sent in DTR mode. The current logic checks if the
> number of command bytes is "2" when any of the cycles is a DTR cycle. It
> is likely that so far no device was actually mixing DTR/non-DTR cycles
> in the same operation, explaining why this was left undetected until
> now.

This was intentional. spi_mem_dtr_supports_op() must only be called when 
the operation is DTR in all phases so I did not add any sanity checks if 
someone was using it for non-DTR ops. In fact, I added on to this 
function in [0] to check nbytes for other phases as well. The patch fell 
off my radar unfortunately, and it didn't get merged.

I would like to keep this as it is since we have no user of mixed 
DTR/non-DTR modes yet. But if you really want to support it, please 
apply my patch first to make sure we check for every phase, not just 
command.

[0] https://lore.kernel.org/all/20210531181757.19458-5-p.yadav@ti.com/

-- 
Regards,
Pratyush Yadav
Texas Instruments Inc.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
