Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BC1EC43334
	for <linux-mtd@archiver.kernel.org>; Tue, 26 Jul 2022 09:25:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cjTJtsNOW3QBgTF8+VLps9h+mXbZCbM83qA5EdrOyrk=; b=qQuYIIwfw9j8Fj
	Xk7oMhhFLmUukaEFpI5qCI2agckWY2oPUXi3W6FUgf0z7/elx8CX2T9edgGitb6JUuA85ZMdPyZLM
	znTdlMOpqXMRN8G5SYjoql1VY5QKJlTi2oX9Y9zkOBgyT5lVRl3kwqktcPYDEF6zH8LCXg21aJS/L
	ZmRmwmCEXtCnjqOhg9Gv19krfhTyEU1U4gruBtIK8HfHt/PlAAj0PlK05gHripYR8YqqPrTafKwBn
	zz7kGJB7L+O3KbJpHDgbafjZwgr5mqBGDwG5WebFoPf8r3EsJKGg+ewZKZsuilLPhKGP984weFwEu
	XQ4bm7338/1wJp0lCRvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGGoK-00BKYI-LQ; Tue, 26 Jul 2022 09:25:04 +0000
Received: from fllv0015.ext.ti.com ([198.47.19.141])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGGoI-00BKKw-N7
	for linux-mtd@lists.infradead.org; Tue, 26 Jul 2022 09:25:04 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 26Q9Oq2m055024;
	Tue, 26 Jul 2022 04:24:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1658827492;
	bh=ll/mahuvDD1cd2USjmpyYRSEjf1eVinmKz0DjIUWUAs=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=q64vlP7xedyghzr7qUAbKlpWv4DZaOi8RVQLA9cIJJh0dK/3tKB6nulyhnS2k24/Z
	 9JlSzQNgoHqgQMTiqtZyKfHEu25yyQWJI2BvVptdu620tIOWZoGCMIDQkPj4p0lBOO
	 R4HKSmEDkWXAkpRZQUXV3Wu83kzKnOTuSM5BFquk=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 26Q9OqtM019067
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 26 Jul 2022 04:24:52 -0500
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Tue, 26
 Jul 2022 04:24:52 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Tue, 26 Jul 2022 04:24:52 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 26Q9Opg0111976;
	Tue, 26 Jul 2022 04:24:51 -0500
Date: Tue, 26 Jul 2022 14:54:50 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: Tudor Ambarus <tudor.ambarus@microchip.com>
CC: <michael@walle.cc>, <tkuw584924@gmail.com>, <Takahiro.Kuwano@infineon.com>,
        <linux-mtd@lists.infradead.org>, <miquel.raynal@bootlin.com>,
        <richard@nod.at>, <vigneshr@ti.com>, <Bacem.Daassi@infineon.com>
Subject: Re: [PATCH v17 3/7] mtd: spi-nor: Do not change nor->addr_nbytes at
 SFDP parsing time
Message-ID: <20220726092450.lkmscszyl5tpzmp4@ti.com>
References: <20220725092505.446315-1-tudor.ambarus@microchip.com>
 <20220725092505.446315-4-tudor.ambarus@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220725092505.446315-4-tudor.ambarus@microchip.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220726_022502_857277_934806E2 
X-CRM114-Status: GOOD (  10.63  )
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

On 25/07/22 12:25PM, Tudor Ambarus wrote:
> At the SFDP parsing time we should not change members of struct spi_nor,
> but instead fill members of struct spi_nor_flash_parameters which could
> later on be used by callers. The caller will then decide if SFDP params
> should be used and more importantly when they should be used. Clean the
> code flow and don't initialize nor->addr_nbytes at SFDP parsing time.
> 
> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
> Tested-by: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
> Reviewed-by: Michael Walle <michael@walle.cc>

Reviewed-by: Pratyush Yadav <p.yadav@ti.com>

-- 
Regards,
Pratyush Yadav
Texas Instruments Inc.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
