Return-Path: <SRS0=UGcd=OV=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BD1EC433F5
	for <linux-mtd@archiver.kernel.org>; Fri,  1 Oct 2021 12:21:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4A7FB619F7
	for <linux-mtd@archiver.kernel.org>; Fri,  1 Oct 2021 12:21:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4A7FB619F7
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wcrWCFu7KhAVHziAN5FqDsw7z9tm0SIv9Zmb8NWoS3k=; b=2bUvnVSarW0GPJ
	/6fT3bGZ9Fn+t1bWOXp+xvGpKNAV7kASVdFmeNhqLOuP9AqAH1x8vm/Eqixn2ZcmUbXPwks0xKot+
	7mO+1/WxewTkcJ5jrd9Q87WyoHygr5xUZ60vYB34Ev+1nKVXJ3xgwKzhTmc+S8mfHJLZda/fIuEdf
	JLFgXYQurPowuebYOZl/3F4GT42B04ffzTI8T65ujuQC97cijKj9QR6CYCGRzdo3aq/PLsGe1uE38
	aRQ1x51v4izNZzA57BAUjK6aL+kfGAG5Ql79aWIs/JAD2LRCrUP+4Z5GAR8fP+ixd7dPiQARilSAP
	NwpTMczdsvbedkTHW+yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mWHWm-000Hhk-Sa; Fri, 01 Oct 2021 12:20:37 +0000
Received: from fllv0015.ext.ti.com ([198.47.19.141])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mWHWh-000Hfq-TR; Fri, 01 Oct 2021 12:20:33 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 191CJvEG026680;
 Fri, 1 Oct 2021 07:19:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1633090797;
 bh=AyCAAYXG9qJByNZhppoblu35ncP1GV6SYJrhG7NVfs0=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=m950R0c0XZ/FAoGoJVAKC9CNsovi8wnJbwVf1aOV6DWUkwhXTPyxupQEddL+XYeIf
 S2Dkb6Y37ExfekP9I1rhJCKn1io5wICwHC0iSzFHoYqN+7Q6775VsXFI3vncUH2ccJ
 Vsin1WrNcNc8gz+Huvk9oU6//wK0xJ4cjWaye8Dw=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 191CJvsI021674
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 1 Oct 2021 07:19:57 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Fri, 1
 Oct 2021 07:19:57 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Fri, 1 Oct 2021 07:19:56 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 191CJuCB101379;
 Fri, 1 Oct 2021 07:19:56 -0500
Date: Fri, 1 Oct 2021 17:49:55 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: <Tudor.Ambarus@microchip.com>
Subject: Re: [PATCH v2 10/35] mtd: spi-nor: sst: Use flash late_init() for
 locking
Message-ID: <20211001121953.yjzuqhbowg24jucz@ti.com>
References: <20210727045222.905056-1-tudor.ambarus@microchip.com>
 <20210727045222.905056-11-tudor.ambarus@microchip.com>
 <20210816190928.kvzex5r6ml77uigs@ti.com>
 <3bd6b85b-ddd9-327d-7236-cbc982f7e00c@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3bd6b85b-ddd9-327d-7236-cbc982f7e00c@microchip.com>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211001_052032_114406_3FD4D901 
X-CRM114-Status: GOOD (  25.86  )
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

On 01/10/21 11:43AM, Tudor.Ambarus@microchip.com wrote:
> On 8/16/21 10:09 PM, Pratyush Yadav wrote:
> > EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> > 
> > On 27/07/21 07:51AM, Tudor Ambarus wrote:
> >> Locking ops are not discoverable via SFDP, use late_init() call.
> >>
> >> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
> > 
> > Reviewed-by: Pratyush Yadav <p.yadav@ti.com>
> > 
> > One question though. Have you tested these flashes (this one and the
> > ones in the previous patch) to make sure you are not causing any
> > regressions? While I don't see anything wrong with the patches, it would
> > be good to have some test reports.
> 
> sst26vf064b was tested, I thought I specified it in the cover letter.

You did indeed. I missed that when reading the series. Sorry.

> I haven't tested locking, but will do. It's not a tragedy if we slip few
> bugs anyway, we're here to squash them.
> > 
> >> ---
> >>  drivers/mtd/spi-nor/sst.c | 8 ++------
> >>  1 file changed, 2 insertions(+), 6 deletions(-)
> >>
> >> diff --git a/drivers/mtd/spi-nor/sst.c b/drivers/mtd/spi-nor/sst.c
> >> index 980f4c09c91d..29d100febdbf 100644
> >> --- a/drivers/mtd/spi-nor/sst.c
> >> +++ b/drivers/mtd/spi-nor/sst.c
> >> @@ -46,15 +46,11 @@ static const struct spi_nor_locking_ops sst26vf_locking_ops = {
> >>       .is_locked = sst26vf_is_locked,
> >>  };
> >>
> >> -static void sst26vf_default_init(struct spi_nor *nor)
> >> +static void sst26vf_late_init(struct spi_nor *nor)
> >>  {
> >>       nor->params->locking_ops = &sst26vf_locking_ops;
> >>  }
> >>
> >> -static const struct spi_nor_fixups sst26vf_fixups = {
> >> -     .default_init = sst26vf_default_init,
> >> -};
> >> -
> >>  static const struct flash_info sst_parts[] = {
> >>       /* SST -- large erase sizes are "overlays", "sectors" are 4K */
> >>       { "sst25vf040b", INFO(0xbf258d, 0, 64 * 1024,  8,
> >> @@ -88,7 +84,7 @@ static const struct flash_info sst_parts[] = {
> >>       { "sst26vf064b", INFO(0xbf2643, 0, 64 * 1024, 128,
> >>                             SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
> >>                             SPI_NOR_HAS_LOCK | SPI_NOR_SWP_IS_VOLATILE)
> >> -             .fixups = &sst26vf_fixups },
> >> +             .late_init = sst26vf_late_init},
> >>  };
> >>
> >>  static int sst_write(struct mtd_info *mtd, loff_t to, size_t len,
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
