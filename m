Return-Path: <SRS0=sMU9=O7=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97EE0C433EF
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Oct 2021 06:56:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4CFC960E9C
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Oct 2021 06:56:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4CFC960E9C
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qq6IGEgQL0NWPzEGvsapfB5cB2d0BAIYyPXtj8RTZnE=; b=uV50bhHCOSZ3JJ
	rF9VqbAAKJguBtGVXbjxGEY3sGs//4s4d+RE0X7haTzrSfq1GofedJWZIVbuJlfJatFpSk2oUAYH4
	xmiscIb+JgAJ6a4WAj/bVDkYHegLBefJi1oDH+3D+mnAmJ1sNZAYvgzlSv4wpFrhP1hdH6j8ltmgC
	dtsRK0icKiQyv2Unp5r7Qtqfj8IbCoKo+A6UhkH1tnP9PJgU9cxNqJLJ9zONcU7CcrdKISnq+/qoi
	UZ166SaJ36vXBmmeog/+qTT2iiSrhNq7wuOncUHIS1zHNRuswPypHu4jdjDpSwbV8xvYHis/hCaHA
	J09KRP8JvDi/4zzsPXCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mZpDf-00808W-Bz; Mon, 11 Oct 2021 06:55:31 +0000
Received: from fllv0015.ext.ti.com ([198.47.19.141])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mZpDb-00807d-MK; Mon, 11 Oct 2021 06:55:30 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 19B6sw8f025992;
 Mon, 11 Oct 2021 01:54:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1633935298;
 bh=ghCPl3FTK2eH34QjYh+Jquxkpt37KlEaaN4LafPKfbM=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=E80Z+51BEhNr830mKiC7tjdqqOdpPMfFDkhyERMGZtsWbwk4tfSW9AWRiUo0GEbkA
 GGxtSg3Alf73M+dF5zaUTaIJh+wj/aQcVL6/wfd6F4Atw16oPOcSIpHpNojoYDhKv6
 GiQg43Yg1PfPlE/wxkbBtz9K7cZnjPblbgYIr8pw=
Received: from DLEE110.ent.ti.com (dlee110.ent.ti.com [157.170.170.21])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 19B6swlv018867
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 11 Oct 2021 01:54:58 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Mon, 11
 Oct 2021 01:54:57 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Mon, 11 Oct 2021 01:54:57 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 19B6suPX001523;
 Mon, 11 Oct 2021 01:54:56 -0500
Date: Mon, 11 Oct 2021 12:24:55 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: <Tudor.Ambarus@microchip.com>
Subject: Re: [PATCH v2 11/35] mtd: spi-nor: winbond: Use manufacturer
 late_init() for OTP ops
Message-ID: <20211011065453.h7mnxpm4ywbaubbe@ti.com>
References: <20210727045222.905056-1-tudor.ambarus@microchip.com>
 <20210727045222.905056-12-tudor.ambarus@microchip.com>
 <20210816191744.k6ufbgrrwh6whhnc@ti.com>
 <aaab30e5-9ea0-c103-0791-e565470ebbc0@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aaab30e5-9ea0-c103-0791-e565470ebbc0@microchip.com>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211010_235527_842795_4FFFF56D 
X-CRM114-Status: GOOD (  32.95  )
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
Cc: macromorgan@hotmail.com, vigneshr@ti.com, jaimeliao@mxic.com.tw,
 richard@nod.at, esben@geanix.com, linux@rasmusvillemoes.dk,
 knaerzche@gmail.com, Nicolas.Ferre@microchip.com, michael@walle.cc,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 code@reto-schneider.ch, miquel.raynal@bootlin.com, heiko.thiery@gmail.com,
 sr@denx.de, mail@david-bauer.net, zhengxunli@mxic.com.tw
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 01/10/21 11:54AM, Tudor.Ambarus@microchip.com wrote:
> On 8/16/21 10:17 PM, Pratyush Yadav wrote:
> > EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> > 
> > On 27/07/21 07:51AM, Tudor Ambarus wrote:
> >> OTP info is not yet discoverable via SFDP, use late_init() to init
> >> the OTP ops.
> > 
> > What do you mean by the "yet"? Does it mean that OTP info is planned to
> > be added to the next SFDP version? Or does it mean that it is possible
> > to discover it via SFDP but we just don't support it yet?
> > 
> > If it is neither and it just means "SFDP does not mention OTP at all",
> > like it is for locking, then you should just drop the "yet". I know this
> > is very nitpicky but it just caught my eye.
> 
> I will update according to your suggestion.
> 
> > 
> >>
> >> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
> >> ---
> >>  drivers/mtd/spi-nor/winbond.c | 9 +++++++--
> >>  1 file changed, 7 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/drivers/mtd/spi-nor/winbond.c b/drivers/mtd/spi-nor/winbond.c
> >> index 96573f61caf5..6be45d2291c6 100644
> >> --- a/drivers/mtd/spi-nor/winbond.c
> >> +++ b/drivers/mtd/spi-nor/winbond.c
> >> @@ -147,17 +147,22 @@ static const struct spi_nor_otp_ops winbond_otp_ops = {
> >>  static void winbond_default_init(struct spi_nor *nor)
> >>  {
> >>       nor->params->set_4byte_addr_mode = winbond_set_4byte_addr_mode;
> > 
> > Why not move this to late_init() as well?
> 
> 4byte mode is SFDP discoverable. Ideally we would get rid of the default_init()
> hook. Flashes that define SFDP will get the 4byte mode from SFDP, the others
> by explicitly setting the late_init() hook. All these should be done at flash
> level, not manufacturer level, otherwise it will be hard to guess who sets what,
> and we can end up with fixups for fixups.

Ok, makes sense.

> 
> I'll parse the 4byte mode from SFDP soon, I think I have some patches somewhere.
> But the series is getting big, so maybe I'll keep it after this patch set.

Which table has that information? BFPT DWORD 16? Anyway, I agree with 
keeping it after this patch set.

> 
> > 
> >> -     if (nor->params->otp.org->n_regions)
> >> -             nor->params->otp.ops = &winbond_otp_ops;
> >>  }
> >>
> >>  static const struct spi_nor_fixups winbond_fixups = {
> >>       .default_init = winbond_default_init,
> >>  };
> >>
> >> +static void winbond_late_init(struct spi_nor *nor)
> >> +{
> >> +     if (nor->params->otp.org->n_regions)
> >> +             nor->params->otp.ops = &winbond_otp_ops;
> >> +}
> >> +
> >>  const struct spi_nor_manufacturer spi_nor_winbond = {
> >>       .name = "winbond",
> >>       .parts = winbond_parts,
> >>       .nparts = ARRAY_SIZE(winbond_parts),
> >>       .fixups = &winbond_fixups,
> >> +     .late_init = winbond_late_init,
> >>  };
> >> --
> >> 2.25.1
> >>
> > 
> > --
> > Regards,
> > Pratyush Yadav
> > Texas Instruments Inc.
> > 
> 

-- 
Regards,
Pratyush Yadav
Texas Instruments Inc.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
