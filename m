Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35C4CC433F5
	for <linux-mtd@archiver.kernel.org>; Mon, 21 Mar 2022 12:27:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ByCrDp2KUGugPyVWHwO7bB+3YXmXDQjcRmDbSvKsx5g=; b=dgQdLyvQqnyVIv
	/xS/OmcIEN28NeZQ6X9IeeAW7LfsunbcAn8pgGxipLB/DNZ9N4GKyvvhP0HeOo+Y6FeSpD8mhBlnU
	IuVGaD2O9/mXj58Oy6Dw/RheO9Qca4m/AXST0BT1RbF12/ImVLzdGDkudXXLFLQ0I2sp5O+a+l9Gv
	ORkdTlV8PIJAwinEWaZ9Pk7h4nQy2C3DKwbJ89Bhn76W3xiSTx9Av/FQ6FEH+/5Hy1SDoqZbdC08T
	di38DuLXgJeyD/i08m/xvebb1BOU537srWAEm8kwaGL+T2QQMx2OXf2B/OrPdIZErCf8mseNLiQ4N
	uXD9O1iE88lhvRqGfxTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nWH8N-007hDi-Ts; Mon, 21 Mar 2022 12:27:39 +0000
Received: from lelv0142.ext.ti.com ([198.47.23.249])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nWH8K-007hD0-Nz
 for linux-mtd@lists.infradead.org; Mon, 21 Mar 2022 12:27:39 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 22LCRYil046641;
 Mon, 21 Mar 2022 07:27:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1647865654;
 bh=FAd5GKdyIw3ZiXx8nIs8f0v/D9Hi8ggK92xb4uS0ISM=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=uP+/4YmsFXWNPZp5R2KmFFevGstjg1SZIrNE3Qiajv6GB2Iir7Vj1/iD81A2tcoXA
 xhEvq4OmPdpk2hEvxh97aydsSByPEwlxQOQnuC715zb323G2ISWEFneJ6fXqQ/W/9i
 jCpx3ddRpjdMW9Fhw+2GNvCZKKBIwdElNoYuVQZ8=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 22LCRYod125824
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 21 Mar 2022 07:27:34 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Mon, 21
 Mar 2022 07:27:33 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Mon, 21 Mar 2022 07:27:33 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 22LCRW2s025738;
 Mon, 21 Mar 2022 07:27:32 -0500
Date: Mon, 21 Mar 2022 17:57:31 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: Tudor Ambarus <tudor.ambarus@microchip.com>
CC: <michael@walle.cc>, <miquel.raynal@bootlin.com>, <richard@nod.at>,
 <vigneshr@ti.com>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <nicolas.ferre@microchip.com>
Subject: Re: [PATCH v2 5/8] mtd: spi-nor: manufacturers: Use
 spi_nor_read_id() core method
Message-ID: <20220321122731.m6wp6weydczlyv7i@ti.com>
References: <20220228111712.111737-1-tudor.ambarus@microchip.com>
 <20220228111712.111737-6-tudor.ambarus@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220228111712.111737-6-tudor.ambarus@microchip.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220321_052736_887677_B3DE316A 
X-CRM114-Status: UNSURE (   7.93  )
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

On 28/02/22 01:17PM, Tudor Ambarus wrote:
> Use spi_nor_read_id() core method to avoid duplication of code. Now the ID
> is read on the full SPI_NOR_MAX_ID_LEN instead of
> round_up(nor->info->id_len, 2), but it doesn't harm to read more ID bytes,
> so the change comes with no secondary effects.
> 
> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>

Reviewed-by: Pratyush Yadav <p.yadav@ti.com>

-- 
Regards,
Pratyush Yadav
Texas Instruments Inc.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
