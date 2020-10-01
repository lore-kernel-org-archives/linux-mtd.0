Return-Path: <SRS0=+4Px=DI=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C2C6C4727E
	for <linux-mtd@archiver.kernel.org>; Thu,  1 Oct 2020 22:24:04 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D5E0120739
	for <linux-mtd@archiver.kernel.org>; Thu,  1 Oct 2020 22:24:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UrF7auO8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D5E0120739
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=biot.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=6rHJpxJQbatnE2PwU8UxydV25aO1xVtSUPX+pJFkiSk=; b=UrF7auO8sdHCIzbvrmeTMeAQR
	r0VDRN+8eN92GyiVGB3iG0zly3JDnuoAm68wVWUCl8mo4V4oCW+M3Oi0SJ5tn/LrNno3n3y7n69Bu
	EV0gTm3qALZIBlRicPaCwweQ3L8X0rV9P56srLktuJzX/AcAz4uCOJmYit6uyP2K3gcj7spZXhbPt
	iNUWUcQT0ssc8Djcp0c87lB0EnctrJhxmJpynbUam5eCKE7dQbGEKI+K77ZXLpRZ6SAOScPAPxDl1
	QidMtANOlsLsVzPyWvWTozwvSHi+N9oy1NP2nI4M2kTSMzYDwkOCeENAGWCP7+qNGZmF4Qs5jTeIu
	lIlRkDDAg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kO6yT-00069A-Hh; Thu, 01 Oct 2020 22:22:53 +0000
Received: from yawp.biot.com ([2a01:4f8:10a:8e::fce2])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kO6yQ-00068F-W1
 for linux-mtd@lists.infradead.org; Thu, 01 Oct 2020 22:22:52 +0000
Received: from debian-spamd by yawp.biot.com with sa-checked (Exim 4.93)
 (envelope-from <bert@biot.com>) id 1kO6yO-00DpSk-G9
 for linux-mtd@lists.infradead.org; Fri, 02 Oct 2020 00:22:48 +0200
Received: from [2a02:578:460c:1:1e1b:dff:fe91:1af5]
 by yawp.biot.com with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.93)
 (envelope-from <bert@biot.com>)
 id 1kO6yL-00DpSU-2d; Fri, 02 Oct 2020 00:22:45 +0200
Subject: Re: [PATCH] mtd: spi-nor: Fix 3-or-4 address byte mode logic
To: Pratyush Yadav <p.yadav@ti.com>
References: <20200930235611.6355-1-bert@biot.com>
 <20201001063421.qcjdikj2tje3jn6k@ti.com>
From: Bert Vermeulen <bert@biot.com>
Message-ID: <801445c9-4f59-5300-3a03-b48a3d631efe@biot.com>
Date: Fri, 2 Oct 2020 00:22:44 +0200
MIME-Version: 1.0
In-Reply-To: <20201001063421.qcjdikj2tje3jn6k@ti.com>
Content-Language: en-GB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201001_182251_052248_41AF42B7 
X-CRM114-Status: GOOD (  23.77  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: vigneshr@ti.com, tudor.ambarus@microchip.com, richard@nod.at,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 miquel.raynal@bootlin.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 10/1/20 8:34 AM, Pratyush Yadav wrote:
> So using an address width of 4 here is not necessarily the right thing
> to do. This change would break SMPT parsing for all flashes that use
> 3-byte addressing by default because SMPT parsing can involve register
> reads/writes. One such device is the Cypress S28HS flash. In fact, this
> was what prompted me to write the patch [0].
> 
> Before that patch, how did MX25L25635F decide to use 4-byte addressing?

The SoCs I'm dealing with have an SPI_ADDR_SEL pin, indicating whether it 
should be in 3 or 4-byte mode. The vendor's hacked-up U-Boot sets the mode 
accordingly, as does their BSP. It seems to me like a misfeature, and I want 
to just ignore it and do reasonable JEDEC things, but I have the problem 
that the flash chip can be in 4-byte mode by the time it gets to my spi-nor 
driver.

> Coming out of BFPT parsing addr_width would still be 0. My guess is that
> it would go into spi_nor_set_addr_width() with addr_width still 0 and
> then the check for (nor->mtd.size > 0x1000000) would set it to 4. Do I
> guess correctly?

No, it comes out of that with addr_width=3 because the chip publishes 3_OR_4 
and hence gets 3, even if that's nonsensical for a 32MB chip to publish.

Certainly that's the problem, I just want to solve it in a more general case 
than just a fixup for this chip.

> In that case maybe we can do a better job of deciding what gets priority
> in the if-else chain. For example, giving addr_width from nor->info
> precedence over the one configured by SFDP can solve this problem. Then
> all you have to do is set the addr_width in the info struct, which is
> certainly easier than adding a fixup hook. There may be a more elegant
> solution to this but I haven't given it much thought.

Since Tudor doesn't want the order of sfdp->info changed, how about 
something like this instead?

+++ b/drivers/mtd/spi-nor/core.c
@@ -3028,13 +3028,15 @@ static int spi_nor_set_addr_width(struct spi_nor *nor)
         /* already configured from SFDP */
     } else if (nor->info->addr_width) {
         nor->addr_width = nor->info->addr_width;
-   } else if (nor->mtd.size > 0x1000000) {
-       /* enable 4-byte addressing if the device exceeds 16MiB */
-       nor->addr_width = 4;
     } else {
         nor->addr_width = 3;
     }

+   if (nor->addr_width == 3 && nor->mtd.size > 0x1000000) {
+       /* enable 4-byte addressing if the device exceeds 16MiB */
+       nor->addr_width = 4;
+   }
+

Still fixes the general case, but I'm not sure what the SMPT parsing problem 
is -- would this still trigger it?


-- 
Bert Vermeulen
bert@biot.com

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
