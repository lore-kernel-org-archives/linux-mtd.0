Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA324C433EF
	for <linux-mtd@archiver.kernel.org>; Wed,  5 Jan 2022 05:52:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kU/ABpv+MEwffwFLBZvvztFo+ZoXIdp1idmTZbDnA1I=; b=rCTZ2yg/EVgNP3
	gzMMNNIDYv9EVdGHI/xuECgycnuAhxRLFdkcvBF2dQlOoz/H3dsOUR3TyENNvuuAfbLRg43J51SMS
	56BgToNwV+YxGwx3rOYPc+IRvLqTuoim1VggpM3ic8gUIIYbV+0dBaTU3IEhxSfbrYtpmsn4OPiJN
	eE7r1xn2w747VNNYFOfnvrZ3qJVlfUGAHEVhCo5NIK8S2aP0fclML5eKQm7/CMp8GzbhRNV5D0hA/
	C7w7T7RJ4yVIfaDPRyPATfo3Au40vLbIXjp1JGrajccNSMkdsGwBg6BrL9zO4rFyAAkvKvnHUiHwo
	0zeIfBTFgLP8GIl2EjfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n4zCe-00DbrQ-1c; Wed, 05 Jan 2022 05:51:16 +0000
Received: from fllv0015.ext.ti.com ([198.47.19.141])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n4zCb-00Dbqm-B4
 for linux-mtd@lists.infradead.org; Wed, 05 Jan 2022 05:51:14 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 2055ou07052391;
 Tue, 4 Jan 2022 23:50:56 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1641361856;
 bh=tdcTMhc1Ts5QhC1nBW9dbCgFpNUPFIMsN0Pbt3IRi1s=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=Vk924puR/YqGmHbKXpHpPLNRdA/9/2mRhi1rpyoaRbEQQvY6irvQoIN3kL/ZgERQO
 2LXTDfd9PLQMx4Y3USf91Q9hLDxoT4xL3jZZ7YlzrGkgOLWsDMlOcCrUU6uHjZBDgZ
 MxKpseCK/H9ZDQeAT9AtcLkqZ3ERIiL6P1MtNPL0=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 2055ouAj111411
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 4 Jan 2022 23:50:56 -0600
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Tue, 4
 Jan 2022 23:50:56 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Tue, 4 Jan 2022 23:50:56 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 2055otVr121132;
 Tue, 4 Jan 2022 23:50:56 -0600
Date: Wed, 5 Jan 2022 11:20:55 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
CC: Apurva Nandan <a-nandan@ti.com>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Mark Brown <broonie@kernel.org>, Patrice
 Chotard <patrice.chotard@foss.st.com>, Christophe Kerello
 <christophe.kerello@foss.st.com>,
 Daniel Palmer <daniel@0x0f.com>, Alexander Lobakin <alobakin@pm.me>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-spi@vger.kernel.org>
Subject: Re: [PATCH v3 01/17] spi: spi-mem: Add DTR templates for cmd,
 address, dummy and data phase
Message-ID: <20220105055053.s4yfnk7cjedwtgvn@ti.com>
References: <20220101074250.14443-1-a-nandan@ti.com>
 <20220101074250.14443-2-a-nandan@ti.com>
 <20220104163100.56850d0b@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220104163100.56850d0b@collabora.com>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220104_215113_521888_F69B2803 
X-CRM114-Status: UNSURE (   8.93  )
X-CRM114-Notice: Please train this message.
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

On 04/01/22 04:31PM, Boris Brezillon wrote:
> and you get to define a DTR op like that:
> 
> 	struct spi_mem_op op =
> 		SPI_MEM_OP(SPI_MEM_OP_EXT_CMD(2, 0x1234, 8, SPI_MEM_OP_DTR),
> 			   SPI_MEM_OP_ADDR(4, 0xdeadbeef, 8, SPI_MEM_OP_DTR),
> 			   SPI_MEM_OP_DATA_OUT(128, buf, 8, SPI_MEM_OP_DTR));
> 
> This also means we can extend the struct without having to define new macros.

I like this. It would also let us easily mix-and-match the ecc parameter 
that Miquel is adding.

-- 
Regards,
Pratyush Yadav
Texas Instruments Inc.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
