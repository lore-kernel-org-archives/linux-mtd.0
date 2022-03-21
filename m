Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 353A1C433EF
	for <linux-mtd@archiver.kernel.org>; Mon, 21 Mar 2022 11:56:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KBJ46vrq0wIyBSXDHmQeIhpNpF3Hibs8dwghICRAUik=; b=GO7bYimqOYtv7v
	UgezrTyPB4yBMQZSgQibHSdhWQyBViFbK/wQNQLZygnTdOFWECEkpDeukDBDvwv06uzORhSFG66Gp
	2FfIpDB1KpbUSchDyTYDNu2RR7jSr7+IKbrlzthc2YTL/1p4ji3swgN949ORDlOmRYp7xYB3DOP68
	2VEoKd9QCHsmKVY5Ig9S6O2RXKuynj2t0g1rH/hKCZRRO9IE2l0z2LKAy6WXd2rQBCaEP1ZaUrhpx
	4AIIiekStuKDu9jct4wULOYQfE5PyJv6MhgJUh8rALxfRoelvWFXYIj+9WJLFWo9h0alpVa63vjbS
	yIpU1FlHAam/5g41XBPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nWGdp-007Wtr-Gp; Mon, 21 Mar 2022 11:56:05 +0000
Received: from lelv0142.ext.ti.com ([198.47.23.249])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nWGdm-007WsN-NZ
 for linux-mtd@lists.infradead.org; Mon, 21 Mar 2022 11:56:04 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 22LBtxLC038930;
 Mon, 21 Mar 2022 06:55:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1647863759;
 bh=bCLwbYerWXAY3w9LHvGZnWCYT3HwaOCLE1h4UadxiVI=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=yAETlEfxM3VF/6vMyekL3sRohU1rrTfNW5NSN3S+EIfLsVsZk41hbMXHa44/P7r2M
 ofpwzpJMiPQE4jOUKeme0+l1i/h4mf7g7BNfaKZxyXBAuhPC2oUYn55Cs2HVGB40wV
 wHDW+dg9V0vk77YwXbwJuPhxF/5S0I9EBw25Siz8=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 22LBtxQG024843
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 21 Mar 2022 06:55:59 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Mon, 21
 Mar 2022 06:55:58 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Mon, 21 Mar 2022 06:55:58 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 22LBtwuF002242;
 Mon, 21 Mar 2022 06:55:58 -0500
Date: Mon, 21 Mar 2022 17:25:57 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: Tudor Ambarus <tudor.ambarus@microchip.com>
CC: <michael@walle.cc>, <miquel.raynal@bootlin.com>, <richard@nod.at>,
 <vigneshr@ti.com>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <nicolas.ferre@microchip.com>,
 <zhengxunli@mxic.com.tw>, <jaimeliao@mxic.com.tw>
Subject: Re: [PATCH v6 1/7] mtd: spi-nor: Rename method,
 s/spi_nor_match_id/spi_nor_match_name
Message-ID: <20220321115557.lup4hdafc4oxnjlj@ti.com>
References: <20220209133656.374903-1-tudor.ambarus@microchip.com>
 <20220209133656.374903-2-tudor.ambarus@microchip.com>
 <20220321115349.vffvanluf5b2wzhh@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220321115349.vffvanluf5b2wzhh@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220321_045602_893971_EA413B8C 
X-CRM114-Status: UNSURE (   8.27  )
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

On 21/03/22 05:23PM, Pratyush Yadav wrote:
> On 09/02/22 03:36PM, Tudor Ambarus wrote:
> > The method is matching a flash_info entry by searching by name. Rename
> > the method for better clarity.
> > 
> > Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
> 
> Reviewed-by: Pratyush Yadav <p.yadav@ti.com>

Looks like you have sent another series with these patches. Let me 
review that instead.

-- 
Regards,
Pratyush Yadav
Texas Instruments Inc.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
