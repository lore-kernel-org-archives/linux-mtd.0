Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55783C433F5
	for <linux-mtd@archiver.kernel.org>; Fri,  1 Apr 2022 19:55:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/cIlhz9I+6Oqn9vLrM5ujpLYWhJQZ9HZzBaW2E4j5W0=; b=xm6mUzAo0vanaV
	CsF4lSSRlPZPUYxdHGAlpXo2zA1tWN4NbVm3Z2QRFt5VpatAst3xL/pX/oCPWFiHSa1pU6M9Di+Pq
	MngoL1QR5GEz46w6KViyX0/ceEZlQgCPGG9s0FGc4pSGCgdKuAGi0qNHv0x9EbcqPbBI+nJR86TMV
	Qj2yE5sUlLQm/zEyaHe8rXn1cnKJgmW/twa1yZPsJcTJM5DUpuGZ4jgpODJ9rxuDwTe183AD1u0Ie
	tNWNqrb9vOh/XXwrp11tygB0GTojV9B3RzRxdCqpLPOEYhHngRHfircYIA9/VaY2IPvbX7wbK3/nN
	JGz1ZfjDjNQScTRpQEVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1naNMt-0071Ie-BG; Fri, 01 Apr 2022 19:55:35 +0000
Received: from fllv0016.ext.ti.com ([198.47.19.142])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1naNMo-0071IL-H5
 for linux-mtd@lists.infradead.org; Fri, 01 Apr 2022 19:55:31 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 231JtLNd078613;
 Fri, 1 Apr 2022 14:55:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1648842921;
 bh=PKlCkQuLNfKhUJdeMTsEMFy8vaBduxctt04jBNunlYs=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=y938O2KVxf78VOHFRyhYuy8I9mnmg8AUjedVrnmh1ddFAmKaRmDvALq+cWjn9T2np
 2sbgq8pQ3Bwh7TCMZf2YxuxO2efniPW5wBBJLeVDUYQzogQGN1OKk9x9Lkoo9gQSYJ
 0dGvcJy6DJAGriJiTlDh/89jioEx9u72FMigmkFc=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 231JtL7t098959
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 1 Apr 2022 14:55:21 -0500
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Fri, 1
 Apr 2022 14:55:20 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Fri, 1 Apr 2022 14:55:20 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 231JtKuQ041523;
 Fri, 1 Apr 2022 14:55:20 -0500
Date: Sat, 2 Apr 2022 01:25:19 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: Tudor Ambarus <tudor.ambarus@microchip.com>
CC: <michael@walle.cc>, <miquel.raynal@bootlin.com>, <richard@nod.at>,
 <vigneshr@ti.com>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <nicolas.ferre@microchip.com>
Subject: Re: [PATCH v2 3/4] mtd: spi-nor: Favor the BFPT-parsed
 set_4byte_addr_mode method
Message-ID: <20220401195519.chzdrnb6vdf6jlos@ti.com>
References: <20220309144215.179449-1-tudor.ambarus@microchip.com>
 <20220309144215.179449-4-tudor.ambarus@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220309144215.179449-4-tudor.ambarus@microchip.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220401_125530_729621_C6D1A51B 
X-CRM114-Status: UNSURE (   9.32  )
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

On 09/03/22 04:42PM, Tudor Ambarus wrote:
> JESD216 SFDP defines in the BFPT standard methods to enter and exit the
> 4-Byte Address Mode. The flash parameters and settings that are retrieved
> from SFDP have higher precedence than the static initialized ones, because
> they should be more accurate and less error prone than those initialized
> statically. Favor the BFPT-parsed set_4byte_addr_mode method and use the
> generic core methods where possible.
> This patch may introduce regressions in case BFPT contains wrong data. The
> fix is to introduce a post_bfpt() fixup hook and update the wrong BFPT
> data.
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
