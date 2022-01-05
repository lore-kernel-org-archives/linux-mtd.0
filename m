Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28A55C433EF
	for <linux-mtd@archiver.kernel.org>; Wed,  5 Jan 2022 05:54:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vFEIQVBwzVtTRo/g3wFwHemIoCAqqTQQXNXVMv2UOjo=; b=Ct+LEPhcAO9+qT
	b6FuMuyIrPvcJFtLR1shTVjLZlYWqLzHEaeiQ1LiDNfcVlUtQ2OOfyTiTVDdFY5l4yOJIBjUMoseT
	wGEM4NtkJwk1mKLQHOtiN/Qx0yu5UU4MfJfH+kzqd2paEz5pFXOtftWqiLcP7gITKjXnHmv8vK6pE
	HNDI8cDoMr7JdKHDCGJJ0tK/f3I25rhdNN99xm8jKx43bWjb+1scFOZ3IhtfW0FT4CFThPIdcf+vQ
	zJx+0PqzBQYJ8iq5JTYZWJyOO08d5A5PyilBUHItKFJvRFyFHjq+25shsQMVRjRCDbnrlgzV4HPxu
	AWtUPdOmu6xY7LN9baeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n4zFL-00DcDV-Jj; Wed, 05 Jan 2022 05:54:03 +0000
Received: from fllv0015.ext.ti.com ([198.47.19.141])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n4zFI-00DcCW-U7
 for linux-mtd@lists.infradead.org; Wed, 05 Jan 2022 05:54:02 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 2055rt6S053210;
 Tue, 4 Jan 2022 23:53:55 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1641362035;
 bh=M0KATbFqwN8Rpvxy7HPJvtHZ5aJs6LrewhNs1PEzVTA=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=siTc18Cbk6+9iPzqxUi7VrQo4wBbara8wnd40T4nTUtGvxKu45mtQIfNtNvyeTEcb
 XZr652a2ZnS3Ef9XoKsiz3uYoJjPswDaR4vw3fK76UsW1X2aJtC9FmJJ4ZKXLkZ66A
 yIiIVLA4/V2l5K2QvngVInNuOAsHjDZzewQSr/Kc=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 2055rtsl061846
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 4 Jan 2022 23:53:55 -0600
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Tue, 4
 Jan 2022 23:53:55 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Tue, 4 Jan 2022 23:53:55 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 2055rs6e012708;
 Tue, 4 Jan 2022 23:53:54 -0600
Date: Wed, 5 Jan 2022 11:23:54 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
CC: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>, Michael Walle
 <michael@walle.cc>, <linux-mtd@lists.infradead.org>, Mark Brown
 <broonie@kernel.org>, <linux-spi@vger.kernel.org>, Julien Su
 <juliensu@mxic.com.tw>, Jaime Liao <jaimeliao@mxic.com.tw>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Boris Brezillon
 <boris.brezillon@collabora.com>,
 Xiangsheng Hou <xiangsheng.hou@mediatek.com>
Subject: Re: [PATCH v9 02/13] spi: spi-mem: Check the controller extra
 capabilities
Message-ID: <20220105055351.47mpmwlko6apggcv@ti.com>
References: <20220104083631.40776-1-miquel.raynal@bootlin.com>
 <20220104083631.40776-3-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220104083631.40776-3-miquel.raynal@bootlin.com>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220104_215401_041216_2C37B51E 
X-CRM114-Status: UNSURE (   9.02  )
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

On 04/01/22 09:36AM, Miquel Raynal wrote:
> Controllers can now provide a spi-mem capabilities structure. Let's make
> use of it in spi_mem_controller_default_supports_op(). As we want to
> check for DTR operations as well as normal operations in a single
> helper, let's pull the necessary checks from spi_mem_dtr_supports_op()
> for now.
> 
> However, because no controller provide these extra capabilities, this
> change has no effect so far.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>

Reviewed-by: Pratyush Yadav <p.yadav@ti.com>

-- 
Regards,
Pratyush Yadav
Texas Instruments Inc.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
