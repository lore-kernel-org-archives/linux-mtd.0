Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EC6CC433F5
	for <linux-mtd@archiver.kernel.org>; Mon, 31 Jan 2022 17:36:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zmCGHRsaIhD+dPwEelJ+d5alHo6lPD+r7JR6s0JUfN0=; b=LQXlStJeCGMuvo
	VClwM22eVFtwcXU+6cB8JdMYFIyNrXHAVQssJepyshME7HKC+Nf7lNg5iFKif6gu+mzSSofhizh2t
	FOrleJqFlwaz0DWqehwNJsVel4OU7E6ejlB7iNkeWw1Q3S7UBczhXlW1NiYnb8pM/8cZ3MkAlB5q9
	3sLiKiKAM8sSgmveI1w7BwmziF1F1kWfG9N8MYRcn3ax6TS16FOcM9kByiaEmBf+fP3WZa5AeoKDg
	d3Cdp4Dk+PQ1FCYzDaA7KwYQCGD9MD2Me7bXjEkaO9Ks28Os4QzE1/rJqOhJmIQ89EGbrYgqRS3/K
	ZoxObAnW6xKfQIyre+mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nEaaj-00A9zV-9O; Mon, 31 Jan 2022 17:35:49 +0000
Received: from lelv0143.ext.ti.com ([198.47.23.248])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nEaL2-00A3z8-EB
 for linux-mtd@lists.infradead.org; Mon, 31 Jan 2022 17:19:38 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 20VHJVPF029858;
 Mon, 31 Jan 2022 11:19:31 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1643649571;
 bh=QeEtQGYhhkgtmo7vgTLQpZJwW10aDSc+Qga0JWAvFHI=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=YyO7w5JZcy0w+ZTgIIjZOUp7MTFqLivSBTUGHyvjt9Hv964RaHKjskkIIFts0g/J5
 SjS6/UxTyQyBQ6v5fYHkgLI480iK4BWBZJhBhew9DVFqeilzfyiwcbltiREQOkrcTi
 FjlYhosEShna5KEifL16GmagHlRssrVMWbwTECNg=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 20VHJVnj051055
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 31 Jan 2022 11:19:31 -0600
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Mon, 31
 Jan 2022 11:19:30 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Mon, 31 Jan 2022 11:19:30 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 20VHJUJ4087859;
 Mon, 31 Jan 2022 11:19:30 -0600
Date: Mon, 31 Jan 2022 22:49:29 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: Chen-Tsung Hsieh <chentsung@chromium.org>
CC: Tudor Ambarus <tudor.ambarus@microchip.com>, Michael Walle
 <michael@walle.cc>, Miquel Raynal <miquel.raynal@bootlin.com>, Richard
 Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>, <linux-kernel@vger.kernel.org>,
 <linux-mtd@lists.infradead.org>
Subject: Re: [RESEND PATCH] mtd: spi-nor: core: Check written SR value in
 spi_nor_write_16bit_sr_and_check()
Message-ID: <20220131171929.uk3z5sr453c3eefp@ti.com>
References: <20220126073227.3401275-1-chentsung@chromium.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220126073227.3401275-1-chentsung@chromium.org>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220131_091936_585329_E7EDC489 
X-CRM114-Status: GOOD (  10.24  )
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

On 26/01/22 03:32PM, Chen-Tsung Hsieh wrote:
> Read back Status Register 1 to ensure that the written byte match the
> received value and return -EIO if read back test failed.
> 
> Without this patch, spi_nor_write_16bit_sr_and_check() only check the
> second half of the 16bit. It causes errors like spi_nor_sr_unlock()
> return success incorrectly when spi_nor_write_16bit_sr_and_check()
> doesn't write SR successfully.
> 
> Fixes: 39d1e3340c73 ("mtd: spi-nor: Fix clearing of QE bit on lock()/unlock()")
> Signed-off-by: Chen-Tsung Hsieh <chentsung@chromium.org>

I don't know much about this bit of code but this patch looks fine to me 
from the surface. Would be nice to hear from Tudor about this too since 
he added the function.

Acked-by: Pratyush Yadav <p.yadav@ti.com>

-- 
Regards,
Pratyush Yadav
Texas Instruments Inc.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
