Return-Path: <SRS0=VmK4=VX=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F146C7618F
	for <linux-mtd@archiver.kernel.org>; Fri, 26 Jul 2019 18:45:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 018D822BEF
	for <linux-mtd@archiver.kernel.org>; Fri, 26 Jul 2019 18:45:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="uQI3gvsG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 018D822BEF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ravnborg.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CvtTRJEuEP7dnQIcHIDHOlHzIKaCRUNVWG6bHGecOp0=; b=uQI3gvsGfqhdoo
	cX/JfltGSeLSAjbmTqrHdGx1KZb3LP5ecuKsy3L1ELHISVZTtbWIWRbwgxyOpqRbkpk2ctm8j8oM9
	Jh7luYArCRyx6MUdXDzSYjjy+8oJ9l5CSWG4kkXrIK7rssi8JDKf3uZ28VWKe5R1kF6ESX8u0zhD5
	tZ61cKzASHgqOB5qR4DoCz6L4HJ4mV84z8vyC1ARrsi8M4cnMbBvSoFzxgzbyyNHsHTthNvmJJ+Qt
	k7mMjIG0cUc2cYBjRRt4J40ULzoL0iHIHrih89PO4T9TSIdpWzYkz6pmtbEyytit0tB+0fRRIfnvr
	PIqIjeHEJQRX8vvCqyfQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hr5Df-0006gj-7J; Fri, 26 Jul 2019 18:45:31 +0000
Received: from asavdk3.altibox.net ([109.247.116.14])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hr5Dc-0006g8-Sq
 for linux-mtd@lists.infradead.org; Fri, 26 Jul 2019 18:45:30 +0000
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id 05C2720117;
 Fri, 26 Jul 2019 20:45:23 +0200 (CEST)
Date: Fri, 26 Jul 2019 20:45:22 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH 05/11] video/fbdev: Drop JZ4740 driver
Message-ID: <20190726184522.GB14981@ravnborg.org>
References: <20190725220215.460-1-paul@crapouillou.net>
 <20190725220215.460-6-paul@crapouillou.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190725220215.460-6-paul@crapouillou.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=dqr19Wo4 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=ER_8r6IbAAAA:8
 a=p6pI0oa4AAAA:8 a=7gkXJVJtAAAA:8 a=_OfsqKrkMx9ODVYiAzcA:9
 a=CjuIK1q_8ugA:10 a=9LHmKk7ezEChjTCyhBa9:22 a=9cw2y2bKwytFd151gpuR:22
 a=E9Po1WZjFZOl8hwRPBS3:22
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190726_114529_110033_FC2949F4 
X-CRM114-Status: GOOD (  10.29  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, linux-fbdev@vger.kernel.org,
 James Hogan <jhogan@kernel.org>, alsa-devel@alsa-project.org,
 dri-devel@lists.freedesktop.org, linux-mips@vger.kernel.org, od@zcrc.me,
 linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>,
 Lee Jones <lee.jones@linaro.org>, Artur Rojek <contact@artur-rojek.eu>,
 Richard Weinberger <richard@nod.at>, linux-pm@vger.kernel.org,
 Paul Burton <paul.burton@mips.com>, Guenter Roeck <linux@roeck-us.net>,
 devicetree@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Mark Brown <broonie@kernel.org>, linux-hwmon@vger.kernel.org,
 Liam Girdwood <lgirdwood@gmail.com>, Ralf Baechle <ralf@linux-mips.org>,
 linux-kernel@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Sebastian Reichel <sre@kernel.org>,
 dmaengine@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Paul.

On Thu, Jul 25, 2019 at 06:02:09PM -0400, Paul Cercueil wrote:
> The JZ4740 fbdev driver has been replaced with the ingenic-drm driver.
> 
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> Tested-by: Artur Rojek <contact@artur-rojek.eu>
> ---
>  drivers/video/fbdev/Kconfig     |   9 -
>  drivers/video/fbdev/Makefile    |   1 -
>  drivers/video/fbdev/jz4740_fb.c | 690 --------------------------------
>  3 files changed, 700 deletions(-)
>  delete mode 100644 drivers/video/fbdev/jz4740_fb.c
Nice work of you and others involved.

Acked-by: Sam Ravnborg <sam@ravnborg.org>

	Sam

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
