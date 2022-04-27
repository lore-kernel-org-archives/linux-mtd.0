Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82439C433EF
	for <linux-mtd@archiver.kernel.org>; Wed, 27 Apr 2022 08:59:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=289k75ORRfNpus1ARiMG5T9NKpNHaqy3ucIwxPUbL5g=; b=eJzVGJThEBMToM
	yVz+gMejcWe/tSraMynxR0WaFb51+l5t0JrzEQOt0R88mwag6IYMSlrV6wQ17Qr0ii3Pe41jcam7w
	rEBL7R1JTQinmYdk1fLcCvtqpnBaFic7O3iY392FmNUnHWgzW6wMl5qacMErz5c3Bewvr8EHpAK+l
	Q/18IIBZN74w/KJfKozvJ7xO8seQ+am9RENJtzPXm6sCUDGexbJm1nRWtlBifmAKYlI8sJRNKwxjy
	9uC2pDmvUWPYpLrp8AXfwJknMjv+xzCLyctxAk8H01tRhHi3M3I0g15/nhQcfUg8NTIkMIlACQwgP
	X8ouLhsvu5IMrOugBrdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1njdWI-000dL7-Vy; Wed, 27 Apr 2022 08:59:35 +0000
Received: from fllv0015.ext.ti.com ([198.47.19.141])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1njdWF-000dK0-LA
 for linux-mtd@lists.infradead.org; Wed, 27 Apr 2022 08:59:33 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 23R8xRXh077668;
 Wed, 27 Apr 2022 03:59:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1651049967;
 bh=/JsFpmWyyIBVaFbOoYwRRqvXrsPjhVSVjKC+q6PG1vA=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=BtXaVlWbkMaAIOGrYeP2rLLGcbXDwZi1bNXRQyOU/Cw3LcZXW+/cxBzIyGd3R/8wK
 mK0GBPVVDDPfrvL6NoDiFxKLRUcThTSeluLC+f5wUvgfvwCDeNWHNdAowc4S8tx29t
 rA/0XtMYSp71XR2cNgRiO7fmgQSbBsUQ2LyOYA+4=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 23R8xROf025164
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 27 Apr 2022 03:59:27 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Wed, 27
 Apr 2022 03:59:26 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Wed, 27 Apr 2022 03:59:26 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 23R8xPad030273;
 Wed, 27 Apr 2022 03:59:26 -0500
Date: Wed, 27 Apr 2022 14:29:25 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: <Tudor.Ambarus@microchip.com>
CC: <chentsung@chromium.org>, <michael@walle.cc>, <miquel.raynal@bootlin.com>, 
 <richard@nod.at>, <vigneshr@ti.com>, <linux-kernel@vger.kernel.org>,
 <linux-mtd@lists.infradead.org>
Subject: Re: [RESEND PATCH] mtd: spi-nor: core: Check written SR value in
 spi_nor_write_16bit_sr_and_check()
Message-ID: <20220427085925.wlmsnr7qgi5wteod@ti.com>
References: <20220126073227.3401275-1-chentsung@chromium.org>
 <20220131171929.uk3z5sr453c3eefp@ti.com>
 <0e02112a-317c-e95b-e0d3-7ed2c74c3509@microchip.com>
 <c6b2956d-85f6-19c3-4282-23a72a1b5849@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c6b2956d-85f6-19c3-4282-23a72a1b5849@microchip.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220427_015931_811567_970E668E 
X-CRM114-Status: GOOD (  15.31  )
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

On 27/04/22 07:14AM, Tudor.Ambarus@microchip.com wrote:
> On 4/27/22 10:11, Tudor Ambarus wrote:
> > On 1/31/22 19:19, Pratyush Yadav wrote:
> >> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> >>
> >> On 26/01/22 03:32PM, Chen-Tsung Hsieh wrote:
> >>> Read back Status Register 1 to ensure that the written byte match the
> >>> received value and return -EIO if read back test failed.
> >>>
> >>> Without this patch, spi_nor_write_16bit_sr_and_check() only check the
> >>> second half of the 16bit. It causes errors like spi_nor_sr_unlock()
> >>> return success incorrectly when spi_nor_write_16bit_sr_and_check()
> >>> doesn't write SR successfully.
> >>>
> 
> cc to stable please

Since this has the Fixes tag, once the patch hits the MTD tree stable 
should pick it up right?

> 
> >>> Fixes: 39d1e3340c73 ("mtd: spi-nor: Fix clearing of QE bit on lock()/unlock()")
> >>> Signed-off-by: Chen-Tsung Hsieh <chentsung@chromium.org>
> >>
> >> I don't know much about this bit of code but this patch looks fine to me
> >> from the surface. Would be nice to hear from Tudor about this too since
> >> he added the function.
> > 
> > Reviewed-by: Tudor Ambarus <tudor.ambarus@microchip.com>
> >>
> >> Acked-by: Pratyush Yadav <p.yadav@ti.com>
> 

-- 
Regards,
Pratyush Yadav
Texas Instruments Inc.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
