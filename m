Return-Path: <SRS0=KyYR=PJ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C19ABC433EF
	for <linux-mtd@archiver.kernel.org>; Thu, 21 Oct 2021 09:35:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8B73260FED
	for <linux-mtd@archiver.kernel.org>; Thu, 21 Oct 2021 09:35:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8B73260FED
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tVzsdMA/8IT0RtH+LGtt+8bkX1WeAWW+l5WO812WmS8=; b=w2B3jesMogf0WQ
	L9HWqS7jZTSuXaERIBVyhuvjG/T6rO9LSBR66NkMqhEQB6hABTLh2ENYz2z3dSinJzmswFGwcs6vr
	zWyre8IxwrxqnEYQAAXozZnSDtZaVE0Spt0LsF5nYB80B4UHcSPytNw6jnD9wG5sEKmX0Rp5N1BCN
	9ypYTEMu/ijdjMbEjIiZpnPhkkuah33Yht5KM9RFkqul/45KY9MA/nGW7du+dJ3SKVtmXRE6okfh1
	DWEBUhlybOZgiS3/3FdUAmy6hTlw2S5t2wyaeBhCT1mW7v3pOdc5nEZKNZUzEeCgSf1pFUKxpP0lr
	YRksBQWy8++4LD1xDZtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mdUTc-0074Dt-Kn; Thu, 21 Oct 2021 09:35:08 +0000
Received: from lelv0143.ext.ti.com ([198.47.23.248])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mdUTX-0074BX-E4; Thu, 21 Oct 2021 09:35:05 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 19L9YVx2046790;
 Thu, 21 Oct 2021 04:34:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1634808871;
 bh=PbfgccuNjfeDHBuFEE0535urKmD8sKVuOytrkYxjWos=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=UJnDAvvWCmKIUswhkktTDmaCT/1ogkYZpEvjBeuyOWd98oHeCDC64DUhiAT1BvSZs
 j/Mp9DyfHHsvhnKPeJ9zQvuRv9io5nOxGONRIKcq9iKa401A5yLLYXWumm2aSa8lSm
 FQMZtnvBdDfQNMbPg84nZh4ex5rd1KeXaGzqE3ks=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 19L9YTBC054608
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 21 Oct 2021 04:34:30 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Thu, 21
 Oct 2021 04:30:19 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Thu, 21 Oct 2021 04:30:19 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 19L9UDr6024437;
 Thu, 21 Oct 2021 04:30:14 -0500
Date: Thu, 21 Oct 2021 15:00:12 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: <Tudor.Ambarus@microchip.com>
Subject: Re: [PATCH v2 18/35] mtd: spi-nor: Get rid of SPI_NOR_4B_OPCODES flag
Message-ID: <20211021093010.fjqriexdvsjgihkr@ti.com>
References: <20210727045222.905056-1-tudor.ambarus@microchip.com>
 <20210727045222.905056-19-tudor.ambarus@microchip.com>
 <20210817121626.5vcwuluheqfqrqc3@ti.com>
 <d7d7b602-0c42-dc14-71f5-9b89303a0941@microchip.com>
 <20211019172623.hi5c4i274bv3lnqw@ti.com>
 <e3e5c59e-08c0-07c7-e77a-5edfc3502388@microchip.com>
 <208ed4a3-fd89-9efb-6dd6-6bddc5c1d818@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <208ed4a3-fd89-9efb-6dd6-6bddc5c1d818@microchip.com>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211021_023503_654495_641F4180 
X-CRM114-Status: GOOD (  53.03  )
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
Cc: code@reto-schneider.ch, vigneshr@ti.com, richard@nod.at, esben@geanix.com,
 linux@rasmusvillemoes.dk, knaerzche@gmail.com, michael@walle.cc,
 zhengxunli@mxic.com.tw, linux-mtd@lists.infradead.org, mail@david-bauer.net,
 macromorgan@hotmail.com, miquel.raynal@bootlin.com, heiko.thiery@gmail.com,
 sr@denx.de, linux-arm-kernel@lists.infradead.org, jaimeliao@mxic.com.tw
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 21/10/21 08:44AM, Tudor.Ambarus@microchip.com wrote:
> On 10/20/21 12:55 PM, Tudor.Ambarus@microchip.com wrote:
> > EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> > 
> > On 10/19/21 8:26 PM, Pratyush Yadav wrote:
> >>>> While we are on this topic, I find this a bit "ugly". Having to set
> >>>> late_init() for setting these flags for each flash is not exactly very
> >>>> clean or readable. I don't know how the future will look like, but if
> >>>> each flash/family needs its own late_init() to set some flags, it won't
> >>>> be very readable. We seem to be trading one type of complexity for
> >>>> another. I dunno which is the lesser evil though...
> >>> Your point is valid. This patch removes SPI_NOR_4B_OPCODES and sets
> >>> SNOR_F_4B_OPCODES in a late_init() hook, forcing the reader to go through
> >>> the late_init() function to see what's there. As you saw, late_init() can be
> >>> used for tweaking flash's parameters, settings and methods, not just NOR flags,
> >>> so I would expect that this hook to be present among flashes that don't define
> >>> the SFDP tables or for flashes that have parameters that are not SFDP discoverable,
> >>> the hook will be there anyway.
> >>>
> >>> This patch opens the door on how we could handle the flash_info flags. All flash_info
> >>> flags that can be determined when parsing SFDP can be removed and use for flashes that
> >>> skip SFDP, SNOR_F equivalents in late_init() methods. spi_nor_info_init_params()
> >>> should NOT be called for SFDP capable flashes anyway, because in case of SFDP flashes,
> >>> all the settings done in spi_nor_info_init_params() are overwritten when parsing SFDP.
> >>> 1/ flashes with SFDP will set the flags as:
> >>> SPI_NOR_PARSE_SFDP | non-sfdp-discoverable-flags
> >>> 2/ flashes without SFDP:
> >>> SPI_NOR_SKIP_SFDP | non-sfdp-discoverable-flags
> >>> and a late_init() for SNOR_F equivalents of flash_info flags from
> >>> spi_nor_info_init_params()
> >>> 3/ flashes that collide, one with SFDP and the other without:
> >>> SPI_NOR_PARSE_SFDP | non-sfdp-discoverable-flags
> >>> and a late_init() for SNOR_F equivalents of flash_info flags from
> >>> spi_nor_info_init_params(), that will be used for the flash without SFDP.
> >>> 4/ individual flash, no collisions, a flavor supports SFDP, the other not:
> >>> SPI_NOR_PARSE_SFDP | non-sfdp-discoverable-flags
> >>> and a late_init() for SNOR_F equivalents of flash_info flags from
> >>> spi_nor_info_init_params(), that will be used for the flash without SFDP.
> >> To me it looks like you can separate these flags into three classes:
> >>
> >>   1. Whether to parse SFDP or not.
> >>   2. Flags that can't be discovered via SFDP.
> >>   3. Flags that can be discovered by SFDP ideally but can't be
> >>      discovered for this particular flash because either SFDP is missing
> >>      or the table for this flag is missing.
> > 
> > These are the flash_info flags, indeed. Apart of these there are the SNOR_F flags
> > which are set either statically (one sets a flash_info flag equivalent when
> > declaring the flash), or dynamically when parsing SFDP. Check
> > SPI_NOR_4B_OPCODES and SNOR_F_4B_OPCODES for example.
> > 
> >>
> >> With your series, flags from 1 and 2 are populated via .flags in
> >> flash_info and the ones from 3 are populated via late_init().
> > 
> > My proposal was to get rid of the flash_info flags from the 3rd category that you
> > described, and set the SNOR_F equivalents in a late_init() hook. This way we also
> > control when the SNOR_F equivalents are set, late in the init call. But this can
> > be achieved with your proposal as well, let's see.
> > 
> >>
> >> Why can't we have 3 different fields for these 3 different flags? In
> >> flash_info, we can set .parse_sfdp to true/false to indicate SFDP
> >> support. We can set .nonsfdp_flags = X | Y | Z for non-sfdp-discoverable
> >> flags. And we can set .fixup_flags = A | B | C (can probably pick a
> >> better name) for the flags that your series sets through late_init().
> >>
> >> This way, you have a clear separation between the three and they are all
> >> clearly visible in the flash entry itself.
> > 
> > The downside that I see with this is that we extend the flash_info struct with new
> > fields and the spi-nor.o's size will increase whether the fields are used or not,
> > as we have lots of flash_info entries. This reminds me that probably I should have
> > put the late_init() hook inside const struct spi_nor_fixups. Anyway, we can avoid
> > increasing the size with some flash_info flags masks. We use the same flash_info flags
> > entry, but we introduce some masks, to separate the type of flags. Something like:
> > SPI_NOR_PARSE_SFDP |
> >         NON_SFDP_FLAGS(SPI_NOR_TB_SR_BIT6 | SPI_NOR_4BIT_BP | SPI_NOR_SWP_IS_VOLATILE)
> > these are for category 1 and 2 in your description
> > 
> > or
> > SPI_NOR_SKIP_SFDP | SFDP_FLAGS(SPI_NOR_OCTAL_DTR_READ | SPI_NOR_OCTAL_DTR_PP)
> > for categories 1 and 3 in your description
> > 
> > but you can end up with flags like:
> > SPI_NOR_SKIP_SFDP | SFDP_FLAGS() | NON_SFDP_FLAGS()
> > 
> > 
> >>
> >> The only case where this might run into trouble is when a SFDP flash has
> >> a collision with a non-SFDP flash and they both need different
> >> fixup_flags. But I supposed that is a problem even if you use
> > 
> > we can probably solve this by putting the minimum supported flags by both
> > and fill the rest in fixup hooks after we determine which flash is which.
> > 
> >> late_init() so it certainly doesn't make anything worse.
> > 
> > yes, this is a different topic.
> > 
> >>
> >> I have not given this extensive thought, but it seems to make sense to
> >> me, and I feel that it would make the flow easier to follow. Thoughts?
> > 
> > Both approaches are fine. Your method keeps all flags in one place but duplicates
> > the setting of flags, you'll have "if flash_info flag, set SNOR_F flag".
> > Mine gets rid of the SFDP flash_info flags and directly sets SNOR_F equivalents
> > with the detriment of introducing fixup hooks at flash declaration. Can we involve
> > Michael and Vignesh to get their preference so that we come to an agreement and move
> > forward?
> > 
> 
> I'll go with the flags mask idea.

Fine by me. I am worried about running out of flag bits but we should be 
able to bump up the flags field to 64 bits without much trouble when 
that happens.

-- 
Regards,
Pratyush Yadav
Texas Instruments Inc.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
