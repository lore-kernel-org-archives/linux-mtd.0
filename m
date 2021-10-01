Return-Path: <SRS0=UGcd=OV=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 481E7C4332F
	for <linux-mtd@archiver.kernel.org>; Fri,  1 Oct 2021 17:08:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 164B161B3C
	for <linux-mtd@archiver.kernel.org>; Fri,  1 Oct 2021 17:08:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 164B161B3C
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZooNrxsyPjh3WLY43qNsbeXA8t867nf79JICoeN4RQ4=; b=CWeJplX5xPByaw
	x4HLp6qqil0ua4fsuhMF+w0kEWFeuHImGn+dsRdV4t0P51bcn9ucTbbl9Fgk4gII/ymfXRXiCyBHx
	isu1P2J52XciF+8z/suo54qROIdT+vjm2aQFLP+ZvuuFStR/Jesia86jViH3H0M6pnauz3vwu6eQ/
	dWuneeSJM4d9q3dN7UAT3JytT1MLQ9k5VwQjM0b00+HcLRN6QSDZBw5D1KCDGXZy2VnKrFsJnzWIG
	M8k0ENmo4Y6xKTpzxdsakHyvwFpdtbI0keZezo2FmIyPKgOJCSeha/lBA0XWrwGTYLaf9JqKJzUob
	M+dpth17q0RtXK9eSJTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mWM0V-000wVy-Eu; Fri, 01 Oct 2021 17:07:35 +0000
Received: from fllv0016.ext.ti.com ([198.47.19.142])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mWM0S-000wUP-N5; Fri, 01 Oct 2021 17:07:34 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 191H6rqG061157;
 Fri, 1 Oct 2021 12:06:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1633108013;
 bh=75/ZlFZWabhhUHcX+6tsrgMcaDfwtLbIN90enWzzYH0=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=anLqSUDVCQbprWfnKbHjGOB2KEoya4E9FtvVbsot8Jn+xMwjyJQIQtfNH/WNvOD6C
 ZJ3dc7Ijr901m8dTO1eAW4EPhW1h18APtdO7FUMMTZ0zabZs4VURdIFX2gwq9PhyP5
 8O/HeCzrYRY5N8z47v+u7571yEUhQ6k8ybyyvM7g=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 191H6rBf033530
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 1 Oct 2021 12:06:53 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Fri, 1
 Oct 2021 12:06:52 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Fri, 1 Oct 2021 12:06:52 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 191H6p9U037400;
 Fri, 1 Oct 2021 12:06:52 -0500
Date: Fri, 1 Oct 2021 22:36:50 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: <Tudor.Ambarus@microchip.com>
Subject: Re: [PATCH v2 16/35] mtd: spi-nor: core: Mark default_init() as
 deprecated
Message-ID: <20211001170648.s3fgb3jcyctqf35w@ti.com>
References: <20210727045222.905056-1-tudor.ambarus@microchip.com>
 <20210727045222.905056-17-tudor.ambarus@microchip.com>
 <20210816193602.ze2w6qczvtgpwwdi@ti.com>
 <33dad358-b6f7-292b-2f02-7b5c9f9c8b2a@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <33dad358-b6f7-292b-2f02-7b5c9f9c8b2a@microchip.com>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211001_100732_885092_29E007FD 
X-CRM114-Status: GOOD (  36.94  )
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

On 01/10/21 02:18PM, Tudor.Ambarus@microchip.com wrote:
> On 8/16/21 10:36 PM, Pratyush Yadav wrote:
> > EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> > 
> > On 27/07/21 07:52AM, Tudor Ambarus wrote:
> >> The goal is to remove the spagetti init of params. The flash should
> >> be initialized by the SFDP data, and when SFDP tables are not defined,
> >> by the flash_info flags. SFDP data can be corrected by the
> >> post_{bfpt, sfdp} when wrong, and in case of flash_info flags init,
> >> we'll use the late_init() hook, where checking for the
> >> SPI_NOR_SKIP_SFDP flag.
> > 
> > Why depreciate it? It is not like we have external callers that we need
> > to notify. We know and control all the users of this function. Just move
> > all users to late_init() and delete this. You have already done a large
> > part of that work in the previous patches. Why not convert all other
> > callers as well? Is there some complicated piece of code that stops you
> > from touching it for now?
> 
> Nothing complicated, but I don't have flashes to test. Let's take them one by one:
> 
> drivers/mtd/spi-nor/gigadevice.c:static void gd25q256_default_init(struct spi_nor *nor)
> sets nor->params->quad_enable method. Quad enable is SFDP discoverable, if I replace
> the default_init() with late_init() I'll risk to overwrite the method discovered by SFDP.
> 
> drivers/mtd/spi-nor/issi.c:     .default_init = issi_default_init,
> same for ISSI. Here it is a manufacturer default init, which is worse. All flashes
> have to be checked. This is another reason why I strongly prefer late_init() calls
> to set flags per flash and not at manufacturer level.
> 
> drivers/mtd/spi-nor/micron-st.c:static void mt35xu512aba_default_init(struct spi_nor *nor)
> you have this flash. If the octal_dtr_enable method is not SFDP discoverable, I can
> move if to late_init(). I'm waiting for your call. I'll need a tested-by after I'll
> make the patch.
> 
> drivers/mtd/spi-nor/micron-st.c:        .default_init = micron_st_default_init,
> This one is hard to get rid of. I won't be surprised if these fields are overwritten
> when parsing SFDP. Moving them in late_init() will nullify SFDP parsing.
> 
> drivers/mtd/spi-nor/spansion.c:static void s28hs512t_default_init(struct spi_nor *nor)
> you have this flash. I'll move it to late init if octal_dtr_enable method is not SFDP
> discoverable. I'll need a tested-by.
> 
> drivers/mtd/spi-nor/winbond.c:static void winbond_default_init(struct spi_nor *nor)
> 4byte addr mode is SFDP discoverable, if I move it in late_init() I'll overwrite what
> I get from SFDP.
> 
> So just mark the hook as deprecated should be enough for now (at least for this release).
> We'll probably never have all these flashes at hand, so maybe we'll agree for a time limit
> after which we'll switch to late_init() or post_bfpt/sfpd() solely based on datasheet info.
> If the datasheets will be wrong, we'll have bugs and people will scream, but nothing that
> we can't handle/fix.

Ok, makes sense to me.

> 
> Cheers,
> ta
> 
> > 
> >>
> >> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
> >> ---
> >>  drivers/mtd/spi-nor/core.h | 5 ++---
> >>  1 file changed, 2 insertions(+), 3 deletions(-)
> >>
> >> diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
> >> index 13d5c5edfd27..625f4eed75f1 100644
> >> --- a/drivers/mtd/spi-nor/core.h
> >> +++ b/drivers/mtd/spi-nor/core.h
> >> @@ -289,9 +289,8 @@ struct spi_nor_flash_parameter {
> >>
> >>  /**
> >>   * struct spi_nor_fixups - SPI NOR fixup hooks
> >> - * @default_init: called after default flash parameters init. Used to tweak
> >> - *                flash parameters when information provided by the flash_info
> >> - *                table is incomplete or wrong.
> >> + * @default_init: Deprecated. Use the post_{bfpt, sfdp}, or the late_init()
> >> + *                hooks instead.
> >>   * @post_bfpt: called after the BFPT table has been parsed
> >>   * @post_sfdp: called after SFDP has been parsed (is also called for SPI NORs
> >>   *             that do not support RDSFDP). Typically used to tweak various
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
