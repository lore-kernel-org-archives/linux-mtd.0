Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60D53C433F5
	for <linux-mtd@archiver.kernel.org>; Fri, 17 Dec 2021 10:49:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SWmTkyJl5d/T3PHzswzw//nQHwlzbdt16lekDYoHZRo=; b=t8BQZOTRGHo9hB
	17sfaWl5XocsLgJeU3qF3/qZ30JU1UqbniZvXQyeQZon2MR4IcLjjDPcTtFUdhDHK8mOuA/F7oWw/
	GoZiJ76G44lhCtVs54wBAlLppvDUcxryH3lJKkR2QQKsnkv3lrVWDqeTRl4qShfw/Swxz7CMQLms1
	Ro8sGYZ8q8VR6/RGZ84w/oVqoYTOo17xVTGUG1V5jMBIiyZwqWh2rETb377GBbRiDJyQHkwfXBmvk
	OyFAti8kZ1GhCEPHV2QcOV5Uhjt+54ZPyXOcVB7hRxA9tHZ9p964HxEPn8SoY2P9mGbXwFfy7XLwo
	ZZVTNnh43dTZDIKlX9zA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1myAmn-009ak0-8U; Fri, 17 Dec 2021 10:48:26 +0000
Received: from lelv0143.ext.ti.com ([198.47.23.248])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1myAgt-009ZHP-3y
 for linux-mtd@lists.infradead.org; Fri, 17 Dec 2021 10:42:24 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 1BHAgF6S104426;
 Fri, 17 Dec 2021 04:42:15 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1639737735;
 bh=S6ZLgkIQ+Q0XPCetUL1bICQ1qsCCb6+pIL5oIjtesTs=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=lV632QdrOsQRlkyaqM2cUdBiRrVzfa0QSpJPZeWqv5owiKoUcW+dSJ3Hd7SuqkaEl
 wO3IplgGBsMasb3gkjpFByCUO4HeQJP9ffYW7hugovsdk3h7Oi+dbjwdp0EgNO8rB1
 s3occh+pM0vq8kIxBLkItuENFi3nzRpTfdV5uti0=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 1BHAgFiS062610
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 17 Dec 2021 04:42:15 -0600
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Fri, 17
 Dec 2021 04:42:15 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Fri, 17 Dec 2021 04:42:15 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 1BHAgEI9062172;
 Fri, 17 Dec 2021 04:42:15 -0600
Date: Fri, 17 Dec 2021 16:12:14 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: Tudor Ambarus <tudor.ambarus@microchip.com>
CC: <michael@walle.cc>, <vigneshr@ti.com>, <miquel.raynal@bootlin.com>,
 <richard@nod.at>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <nicolas.ferre@microchip.com>,
 <zhengxunli@mxic.com.tw>, <jaimeliao@mxic.com.tw>
Subject: Re: [PATCH v2 1/2] mtd: spi-nor: core: Introduce SPI_NOR_SOFT_RESET
 flash_info fixup_flag
Message-ID: <20211217104212.d37qeyomskjhdtvi@ti.com>
References: <20211209190436.401946-1-tudor.ambarus@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211209190436.401946-1-tudor.ambarus@microchip.com>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211217_024219_262672_361CC23E 
X-CRM114-Status: GOOD (  10.80  )
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

On 09/12/21 09:04PM, Tudor Ambarus wrote:
> The Soft Reset and Rescue Sequence Support is defined in BFPT_DWORD(16)
> starting with JESD216A. The first version of SFDP, JESD216 (April 2011),
> defines just the first 9 BFPT DWORDS, thus it does not contain information
> about the Software Reset and Rescue Support. Since this support can not
> be discovered by parsing the first SFDP version, introduce a flash_info
> fixup_flag that will be used either by flashes that define
> JESD216 (April 2011) or by flashes that do not define SFDP at all.
> In case a flash defines BFPT_DWORD(16) but with wrong values, one should
> instead use a post_bfpt() hook and set SNOR_F_SOFT_RESET.
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
