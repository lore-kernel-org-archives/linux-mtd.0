Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 529C5C43334
	for <linux-mtd@archiver.kernel.org>; Tue,  5 Jul 2022 07:37:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xn2D1gewkCLUDFXLCMotGin7XUEhdM+jteU6UCcAg9w=; b=RMBnsvAC7jYYud
	q0hs6d9vw8PhtI4n4m/OoZ5tH4Uj8H+etzgDpjV1fPCdShxUgHFn/qZdFzMwXjXIBOp1zXBBUoYrw
	Y1+T3iQvKRELgboQkWKfI3cIPkPD8hVTNrMs18Bmqa7H6a2q0LRvDDRHDtcfZF5arg6Z+m0dqA0VG
	lLZTeBrt6QGshLgdRmzm/qhgg33TkxMHMQseJem54g6HxA4DWBsznm6ZSJ4kMKwJMp//0ubWiovVf
	dxwwQdUMN4AxEN2MEhaSk4PVrXqi7xusVtQu+wPVWWXtSjtezCcd7WzrrFsgh7K0FMtFPHJfP4Vyu
	uQ+gzQsi+Ci7ETafu0WA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8d7M-00FcjK-Ah; Tue, 05 Jul 2022 07:37:08 +0000
Received: from lelv0142.ext.ti.com ([198.47.23.249])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8d7I-00FcfA-3F
	for linux-mtd@lists.infradead.org; Tue, 05 Jul 2022 07:37:05 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 2657aqwN119874;
	Tue, 5 Jul 2022 02:36:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1657006612;
	bh=4whOtB/S0ILNMbX+0um0zD3t1iUWtD6ih1XmksfUH+Y=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=VL6S3d3YDHoI94lYFZB+cJEAfq8yNum0v7XUAJct3tqr8wKW/l/igPPYGXJTfAcrT
	 1ffRH1PdRfjzJcY2Esf9uci+kyXX83DX2Al3BG44x3MN0xxXrP3kLnU2db5Jjt+k/g
	 c0O3B2Y0kSVU9/wGwEMTKdiTRvBCdgKCGHDxIKEQ=
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 2657aqv6018114
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 5 Jul 2022 02:36:52 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Tue, 5
 Jul 2022 02:36:51 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Tue, 5 Jul 2022 02:36:51 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 2657apmD118579;
	Tue, 5 Jul 2022 02:36:51 -0500
Date: Tue, 5 Jul 2022 13:06:50 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: <patrice.chotard@foss.st.com>
CC: Tudor Ambarus <tudor.ambarus@microchip.com>,
        Miquel Raynal
	<miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>,
        Vignesh
 Raghavendra <vigneshr@ti.com>,
        <linux-mtd@lists.infradead.org>, <inux-kernel@vger.kernel.org>,
        <christophe.kerello@foss.st.com>
Subject: Re: mtd: spi-nor: fix spi_nor_spimem_setup_op() call in
 spi_nor_erase_{sector,chip}()
Message-ID: <20220705073650.zpopzg3somwae5xm@ti.com>
References: <20220629133013.3382393-1-patrice.chotard@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220629133013.3382393-1-patrice.chotard@foss.st.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220705_003704_294427_1F621F04 
X-CRM114-Status: GOOD (  10.79  )
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

On 29/06/22 03:30PM, patrice.chotard@foss.st.com wrote:
> From: Patrice Chotard <patrice.chotard@foss.st.com>
> 
> For erase operations, reg_proto must be used as indicated in
> struct spi_nor description in spi-nor.h.
> 
> This issue was found when DT property spi-tx-bus-width is set to 4.
> In this case the spi_mem_op->addr.buswidth is set to 4 for erase command
> which is not correct.
> 
> Tested on stm32mp157c-ev1 board with mx66l51235f spi-nor.
> 
> Fixes: 0e30f47232ab ("mtd: spi-nor: add support for DTR protocol")
> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>

Reviewed-by: Pratyush Yadav <p.yadav@ti.com>

-- 
Regards,
Pratyush Yadav
Texas Instruments Inc.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
