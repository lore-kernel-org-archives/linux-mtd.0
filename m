Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C216C433F5
	for <linux-mtd@archiver.kernel.org>; Mon, 31 Jan 2022 10:59:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6E9CuTec5ADASn1fc0AUiVdhOgTUbM72m3Shmmp6250=; b=NL0wLtrWTf0iRm
	SkmXg+civ4PMcBrUZn89LrT6ISnNpUkC4HYLq9LUVxm2AErSDCNc7fqiDkaq34g6F73SB3NdfG1qZ
	jebbqfcepoeytszcsJW5/GZED2NGnVb00AlGyiwlEI4/4QofYyEDTN12up0lGBcl6SbQT0IyMrV6T
	Ax2OANU50Kgb6zpqfLLXA8bBkr8hdR56eGBcDIdffNhc7bnWAXGJrTcVPrTwTY22e2sF/ZfhJQV6a
	364sIpWxOMvFgjSDDpqJcZGS9RSwDHv9DQ9+fs9HaDhSFvz4Da+uYZdcS/Y0NhBtEWt2ZHrDWq4df
	HKPGkGvjHcGccA/Astcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nEUNx-008yDg-BF; Mon, 31 Jan 2022 10:58:13 +0000
Received: from lelv0143.ext.ti.com ([198.47.23.248])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nEUNu-008yBF-Bq
 for linux-mtd@lists.infradead.org; Mon, 31 Jan 2022 10:58:11 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 20VAvu2v068925;
 Mon, 31 Jan 2022 04:57:56 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1643626676;
 bh=T48kQu730yvIMgF0UxePEqGQ+81CSKNEVv/Pqrm3F5o=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=RvADuu0XS9afU/16cBzlMhgnAJBxHDDieThqP8sNWtyb5vJqUmMpRFbOiHqU6rFBK
 ROaPgz4mITRbWjukUPd9oVuoyTTi/J5G9yUEFVrJzKYcoX3hkP7YJ1Op9qoVVoE+CR
 6NoXUwT7aHgFc46slqjMGFrISMHOr25Z+e4Y9+Kw=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 20VAvubw005900
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 31 Jan 2022 04:57:56 -0600
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Mon, 31
 Jan 2022 04:57:56 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Mon, 31 Jan 2022 04:57:55 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 20VAvsNq054646;
 Mon, 31 Jan 2022 04:57:55 -0600
Date: Mon, 31 Jan 2022 16:27:54 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
CC: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>, Michael Walle
 <michael@walle.cc>, <linux-mtd@lists.infradead.org>, Mark Brown
 <broonie@kernel.org>, Julien Su <juliensu@mxic.com.tw>, Jaime Liao
 <jaimeliao@mxic.com.tw>
Subject: Re: [PATCH] mtd: nand: ecc: Rework Kconfig dependencies
Message-ID: <20220131105754.pwxkhjiuwpgj7kxg@ti.com>
References: <20220128171013.1251796-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220128171013.1251796-1-miquel.raynal@bootlin.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220131_025810_534342_1FFD2BDB 
X-CRM114-Status: GOOD (  11.01  )
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

On 28/01/22 06:10PM, Miquel Raynal wrote:
> Unlike "depends on", "select" does not enforce any type (y or m), which
> can lead to the following situation:
> * SPI_MXIC=y expects the NAND symbols to be built statically
> * SPI_MXIC depends on MTD_NAND_ECC
> * MTD_NAND_ECC selects MTD_NAND_CORE
> In this case MTD_NAND_CORE=m is "valid" but will trigger link errors
> such as the one below.

Did you forget to paste the error log?

> 
> The cleanest way to handle the situation is to use a "depends on"
> between MTD_NAND_ECC and MTD_NAND_CORE to avoid such situations.
> 
> While at modifying the MTD_NAND_ECC symbol, fix the spacing.
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
