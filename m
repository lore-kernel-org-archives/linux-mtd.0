Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BB84C433F5
	for <linux-mtd@archiver.kernel.org>; Mon, 21 Mar 2022 12:34:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Nftbi9z0aNr57p2Tz05z3AxlNuRGwAA7IKoPsF6OogE=; b=PTcloRN4pIUXfG
	efgA8sShmjC2YLmZgwP8He983Vm+FPxIGviUYI3njCn1J/1UKSK7vyQbfZXjvUeDtNedVhMmNtMKP
	ZWg29rnVXNy+5B0WZBlcgTi/AE6Ucm9ux3gEw+Dx/KQVpAh5w1GaH7V8Ek+QkiuIsnxayE3FrJEyM
	yUqcZWfVwAqG/PHtfjDNxyoj35fUHSS5XJLqQ7Mlov31K7auKD/gdCe6xDQBOEY0kelMfX8DYUFsn
	Tem+YXP3jhr/ontxPA1p9sDG4anoTexvyUV0FjlVb6PuzDgny4o6j0ea9iY79UcOSjlvtsCrlPyil
	BCLbQXPfR6aLzPNmkt0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nWHFH-007ifj-UV; Mon, 21 Mar 2022 12:34:47 +0000
Received: from fllv0015.ext.ti.com ([198.47.19.141])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nWHFF-007ied-45
 for linux-mtd@lists.infradead.org; Mon, 21 Mar 2022 12:34:46 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 22LCYgRG082999;
 Mon, 21 Mar 2022 07:34:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1647866082;
 bh=/FSvcrz0QymIRCi6RH71gwTjqKsvMqVR1lnXAd9SB4E=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=Im7k/IiXxRtqScsM9BWgoSnBTBm29KR8Cqm/ORmxH9GCx/2rdh7+TX3qG6ujSoc0P
 bklvB0xKPS9cbndfrAAm4hU98hE8PAOKn5TiLkarmqQP3RBjslJHLSKTK/nDPNwhWC
 qAd1RmaK+3gHEQaTP5dJpPuelPOK7aNPm2A7zPwc=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 22LCYgDE005898
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 21 Mar 2022 07:34:42 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Mon, 21
 Mar 2022 07:34:41 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Mon, 21 Mar 2022 07:34:41 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 22LCYf2i082341;
 Mon, 21 Mar 2022 07:34:41 -0500
Date: Mon, 21 Mar 2022 18:04:40 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: Tudor Ambarus <tudor.ambarus@microchip.com>
CC: <michael@walle.cc>, <miquel.raynal@bootlin.com>, <richard@nod.at>,
 <vigneshr@ti.com>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <nicolas.ferre@microchip.com>
Subject: Re: [PATCH v2 8/8] mtd: spi-nor: spansion: Rework
 spi_nor_cypress_octal_dtr_enable()
Message-ID: <20220321123440.prhhkzvgvgao2fqr@ti.com>
References: <20220228111712.111737-1-tudor.ambarus@microchip.com>
 <20220228111712.111737-9-tudor.ambarus@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220228111712.111737-9-tudor.ambarus@microchip.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220321_053445_231303_105CDE8A 
X-CRM114-Status: UNSURE (   7.75  )
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
> Introduce template operation to remove code duplication.
> Split spi_nor_cypress_octal_dtr_enable() in
> spi_nor_cypress_octal_dtr_ena() spi_nor_cypress_octal_dtr_dis() as it no
> longer made sense to try to keep everything alltogether: too many
> "if (enable)" throughout the code, which made the code difficult to read.
> 
> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>

Reviewed-by: Pratyush Yadav <p.yadav@ti.com>

Will send my tested-by separately once I get a chance to test this.

-- 
Regards,
Pratyush Yadav
Texas Instruments Inc.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
